#!/bin/bash
# SessionEnd hook: log session timestamp and duration
INPUT=$(cat)
REASON=$(echo "$INPUT" | jq -r '.reason // "unknown"')
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // "unknown"')
LOG_DIR="$TMPDIR"
[ -z "$LOG_DIR" ] && LOG_DIR="/tmp"

echo "$(date '+%Y-%m-%d %H:%M:%S') | session=$SESSION_ID | reason=$REASON" >> "${LOG_DIR}/claude-session-log.txt"

exit 0
