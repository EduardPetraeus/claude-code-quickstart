#!/usr/bin/env bash
# Log failed tool calls for observability
# Hook: PostToolUseFailure (all tools)
# Requires: jq (gracefully skips if missing)

INPUT=$(cat)

command -v jq >/dev/null 2>&1 || exit 0

TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // "unknown"' 2>/dev/null) || TOOL_NAME="unknown"
ERROR=$(echo "$INPUT" | jq -r '.error // "no error message"' 2>/dev/null) || ERROR="no error message"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
LOG_FILE="${TMPDIR:-/tmp}/claude-tool-failures.log"

echo "[$TIMESTAMP] FAIL: $TOOL_NAME — $ERROR" >> "$LOG_FILE"

exit 0
