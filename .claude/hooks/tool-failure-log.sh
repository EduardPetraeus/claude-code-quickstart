#!/usr/bin/env bash
# Log failed tool calls for observability
# Hook: PostToolUseFailure (all tools)

set -euo pipefail

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // "unknown"')
ERROR=$(echo "$INPUT" | jq -r '.error // "no error message"')
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$TIMESTAMP] FAIL: $TOOL_NAME — $ERROR" >> /tmp/claude-tool-failures.log

# Non-blocking — always exit 0
exit 0
