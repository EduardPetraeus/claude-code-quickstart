#!/bin/bash
# PostToolUse Bash hook: hard-block if output contains secret patterns
INPUT=$(cat)
OUTPUT=$(echo "$INPUT" | jq -r '.tool_result.stdout // empty')
STDERR=$(echo "$INPUT" | jq -r '.tool_result.stderr // empty')
COMBINED="${OUTPUT}${STDERR}"

# Skip if no output
[ -z "$COMBINED" ] && exit 0

# Regex patterns for common secret formats
# sk- (OpenAI/Anthropic), AKIA (AWS), ghp_ (GitHub PAT), ghr_ (GitHub refresh),
# Bearer tokens, base64-ish long strings after known key patterns
if echo "$COMBINED" | grep -qE '(sk-[a-zA-Z0-9]{20,}|AKIA[A-Z0-9]{16}|ghp_[a-zA-Z0-9]{36}|ghr_[a-zA-Z0-9]{36}|glpat-[a-zA-Z0-9\-]{20,}|xox[bpras]-[a-zA-Z0-9\-]{10,})'; then
  echo "BLOCKED: Bash output contains what appears to be a secret/token. Review output before continuing." >&2
  exit 2
fi

# Check for Bearer token patterns (but not in curl commands themselves — only in output)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
if echo "$OUTPUT" | grep -qE 'Bearer [a-zA-Z0-9\-_.]{20,}'; then
  # Only flag if the Bearer token is in the output, not just the command
  if ! echo "$CMD" | grep -qE 'Bearer'; then
    echo "BLOCKED: Bash output contains a Bearer token. Review output before continuing." >&2
    exit 2
  fi
fi

exit 0
