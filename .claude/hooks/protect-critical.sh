#!/bin/bash
# PreToolUse hook: block edits to critical governance files without approval
INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty')
[ -z "$FILE" ] && exit 0

# Allow non-critical files
echo "$FILE" | grep -qE '(CLAUDE\.md|\.github/workflows/|pyproject\.toml|\.env)' || exit 0

echo "BLOCKED: Critical governance file — requires explicit approval: $(basename "$FILE")" >&2
echo "Tell your user which file and why, then ask permission." >&2
exit 1
