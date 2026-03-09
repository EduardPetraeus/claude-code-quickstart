#!/bin/bash
# SessionEnd hook: log session timestamp and duration
INPUT=$(cat)
REASON=$(echo "$INPUT" | jq -r '.reason // "unknown"')
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // "unknown"')

# Use persistent cache dir instead of /tmp
CACHE_DIR="${HOME}/.cache/claude"
mkdir -p "$CACHE_DIR"

echo "$(date '+%Y-%m-%d %H:%M:%S') | session=$SESSION_ID | reason=$REASON" >> "$CACHE_DIR/session-log.txt"

exit 0
