#!/usr/bin/env python3
from __future__ import annotations

"""Multi-AI code review tool.

Sends code or diffs to external AI APIs (Gemini) for independent review.
Uses environment variables or macOS Keychain for API key storage.

Usage:
    # Review a file
    ai-review.py src/main.py

    # Review multiple files
    ai-review.py src/main.py src/utils.py

    # Review a git diff
    git diff | ai-review.py --stdin

    # Review staged changes
    git diff --cached | ai-review.py --stdin

    # Custom review prompt
    ai-review.py src/main.py --focus "security"
"""

import argparse
import json
import os
import subprocess
import sys
import textwrap
import urllib.error
import urllib.request


def get_api_key(service_name: str, env_var: str | None = None) -> str | None:
    """Read a secret from env var (preferred) or macOS Keychain (fallback).

    Using env var avoids Keychain password prompts during autonomous execution.
    """
    # Prefer environment variable (no interactive prompt)
    if env_var:
        value = os.environ.get(env_var)
        if value:
            return value.strip()

    # Fallback: macOS Keychain (may prompt for password)
    try:
        result = subprocess.run(
            ["security", "find-generic-password", "-s", service_name, "-w"],
            capture_output=True,
            text=True,
            check=True,
        )
        return result.stdout.strip()
    except (subprocess.CalledProcessError, FileNotFoundError):
        return None


def call_gemini(prompt: str, api_key: str, model: str = "gemini-2.5-flash") -> str:
    """Call Gemini API and return response text."""
    url = f"https://generativelanguage.googleapis.com/v1beta/models/{model}:generateContent?key={api_key}"
    payload = json.dumps({"contents": [{"parts": [{"text": prompt}]}]}).encode("utf-8")

    req = urllib.request.Request(
        url,
        data=payload,
        headers={"Content-Type": "application/json"},
        method="POST",
    )

    try:
        with urllib.request.urlopen(req, timeout=120) as resp:
            data = json.loads(resp.read().decode("utf-8"))
            parts = data.get("candidates", [{}])[0].get("content", {}).get("parts", [])
            # Gemini 2.5+ models may return thinking parts — skip those
            text_parts = [
                p.get("text", "")
                for p in parts
                if not p.get("thought", False) and p.get("text")
            ]
            return "\n".join(text_parts) if text_parts else "No response text"
    except urllib.error.HTTPError as e:
        body = e.read().decode("utf-8")
        error_data = json.loads(body)
        error_msg = error_data.get("error", {}).get("message", body)
        return f"GEMINI API ERROR ({e.code}): {error_msg}"


def build_review_prompt(code: str, focus: str | None = None) -> str:
    """Build the review prompt."""
    focus_instruction = ""
    if focus:
        focus_instruction = f"\n\nFocus especially on: {focus}"

    return textwrap.dedent(f"""\
        You are a senior software engineer doing a thorough code review.
        Review the following code/diff and provide:

        1. **Critical issues** — bugs, security vulnerabilities, data leaks, logic errors
        2. **Design concerns** — architecture, naming, patterns, maintainability
        3. **Suggestions** — improvements, simplifications, missing edge cases
        4. **Verdict** — APPROVE, REQUEST_CHANGES, or NEEDS_DISCUSSION

        Be specific: reference exact lines/functions. Be honest and critical.
        If the code is good, say so briefly — don't invent problems.{focus_instruction}

        ---

        {code}
    """)


def main():
    parser = argparse.ArgumentParser(description="Multi-AI code review")
    parser.add_argument("files", nargs="*", help="Files to review")
    parser.add_argument(
        "--stdin", action="store_true", help="Read from stdin (pipe a diff)"
    )
    parser.add_argument(
        "--focus",
        type=str,
        default=None,
        help="Review focus (e.g. 'security', 'performance', 'architecture')",
    )
    parser.add_argument(
        "--model",
        type=str,
        default="gemini-2.5-flash",
        help="Gemini model to use (default: gemini-2.5-flash)",
    )
    args = parser.parse_args()

    # Collect code to review
    if args.stdin:
        code = sys.stdin.read()
        if not code.strip():
            print("ERROR: No input received on stdin")
            sys.exit(1)
    elif args.files:
        parts = []
        for filepath in args.files:
            try:
                with open(filepath) as f:
                    content = f.read()
                parts.append(f"### {filepath}\n```\n{content}\n```")
            except FileNotFoundError:
                print(f"ERROR: File not found: {filepath}")
                sys.exit(1)
        code = "\n\n".join(parts)
    else:
        print("ERROR: Provide files or use --stdin")
        parser.print_help()
        sys.exit(1)

    # Truncate if too large (Gemini free tier: ~1M tokens/day)
    max_chars = 100_000
    if len(code) > max_chars:
        code = code[:max_chars] + "\n\n... [TRUNCATED — too large for review]"
        print(f"WARNING: Input truncated to {max_chars} chars", file=sys.stderr)

    # Get API key
    api_key = get_api_key("Gemini_API_KEY", env_var="GEMINI_API_KEY")
    if not api_key:
        print("ERROR: Gemini API key not found")
        print("Set env var: export GEMINI_API_KEY='your-key'")
        print(
            "Or add to macOS Keychain: security add-generic-password -s Gemini_API_KEY -a claude -w 'YOUR_KEY'"
        )
        sys.exit(1)

    # Run review
    print("=" * 60)
    print(f"GEMINI REVIEW ({args.model})")
    print("=" * 60)

    prompt = build_review_prompt(code, args.focus)
    result = call_gemini(prompt, api_key, model=args.model)
    print(result)
    print("=" * 60)


if __name__ == "__main__":
    main()
