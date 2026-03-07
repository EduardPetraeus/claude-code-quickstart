# Claude Code Quickstart

A battle-tested starter kit for [Claude Code](https://docs.anthropic.com/en/docs/claude-code). Clone it, customize it, and get productive in 60 seconds.

**This is not a link collection or a config dump.** It's an opinionated, progressive setup that teaches you the patterns that actually matter — from your first CLAUDE.md to automated guardrails and AI-powered code review.

## What's Inside

- **CLAUDE.md template** — Commented, ready to customize for your project
- **Rules** — Git workflow, code style, and session discipline
- **Hooks** — Auto-format Python files, block pushes to main
- **Agents** — Code reviewer, security reviewer, and explorer for divergent thinking
- **Prompts** — Battle-tested templates for better AI conversations
- **Docs** — Why each piece matters, with examples
- **Exercises** — 4 hands-on exercises from beginner to advanced
- **Examples** — CLAUDE.md templates for Python, TypeScript, and non-coders

## Quick Start

```bash
git clone https://github.com/EduardPetraeus/claude-code-quickstart.git
cd claude-code-quickstart
claude
```

See [QUICKSTART.md](QUICKSTART.md) for full setup instructions.

> **Not a programmer?** Start here → [IMPLEMENT.md](IMPLEMENT.md). Copy one prompt into Claude Code and it sets up everything for you.

## Who This Is For

- **Developers** who want Claude Code to follow their conventions from day one
- **Teams** who want consistent AI behavior across projects
- **Non-coders** (HR professionals, analysts, writers, economists) who want a structured AI workflow — see [IMPLEMENT.md](IMPLEMENT.md)
- **Workshop participants** who want a ready-to-go learning environment

## Workshop

This repo powers a 2.5-hour hands-on workshop. See [docs/workshop-guide.md](docs/workshop-guide.md) for the full presenter guide with timed blocks, demo scripts, and exercises.

## Structure

```
CLAUDE.md                        # The template — start here
QUICKSTART.md                    # 60-second setup guide
IMPLEMENT.md                     # Non-coder bootstrap — paste into Claude Code
.claude/
  settings.json                  # Hooks configuration
  rules/                         # git-workflow, code-style, session-discipline
  hooks/                         # protect-main, auto-lint
  agents/                        # code-reviewer, security-reviewer, explorer
prompts/                         # Prompt templates for better AI conversations
  prompt-skeleton.md             # 5-field prompt framework
  stuck-template.md              # Structured format for when you're stuck
  autonomous-execution.md        # Hands-off autonomous workflow
  broad-thinking/                # Divergent thinking templates
docs/                            # Why it works, how to use it
examples/                        # CLAUDE.md for different project types
exercises/                       # Learn by doing
```

## License

MIT
