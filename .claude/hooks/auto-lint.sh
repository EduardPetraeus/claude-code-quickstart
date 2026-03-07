#!/bin/bash
# Hook: Auto-formats Python files after Claude edits them.
# Configured in .claude/settings.json as a PostToolUse hook on Edit|Write.
# Requires: pip install ruff

INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
[ -z "$FILE" ] && exit 0

# Only lint Python files
if [[ "$FILE" == *.py ]]; then
  if command -v ruff &> /dev/null; then
    ruff format "$FILE" 2>/dev/null
    ruff check --fix "$FILE" 2>/dev/null
  fi
fi
exit 0
