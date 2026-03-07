#!/bin/bash
# Hook: Blocks direct push/merge to main branch.
# Configured in .claude/settings.json as a PreToolUse hook on Bash.

INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
[ -z "$CMD" ] && exit 0

if echo "$CMD" | grep -qE 'git (push|merge).*(main|master)|git checkout (main|master).*&&.*git merge'; then
  echo "BLOCKED: Direct push/merge to main is not allowed. Use feature branches." >&2
  exit 1
fi
exit 0
