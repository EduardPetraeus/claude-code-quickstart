#!/bin/bash
# PostToolUse hook: tracks tool calls per session and warns about context rot
INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // "unknown"')
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // "default"')

# Session-scoped counter file
COUNTER_FILE="/tmp/claude-context-monitor-${SESSION_ID}.txt"

# Initialize or increment
if [ -f "$COUNTER_FILE" ]; then
  COUNT=$(cat "$COUNTER_FILE")
  COUNT=$((COUNT + 1))
else
  COUNT=1
  echo "$TOOL_NAME" > "/tmp/claude-context-tools-${SESSION_ID}.log"
fi
echo "$COUNT" > "$COUNTER_FILE"

# Log tool name for pattern detection
echo "$TOOL_NAME" >> "/tmp/claude-context-tools-${SESSION_ID}.log"

# --- Warning thresholds ---
WARNING=""

# High tool count = context is getting heavy
if [ "$COUNT" -eq 75 ]; then
  WARNING="Context monitor: 75 tool calls in this session. Consider running /compact to free context."
elif [ "$COUNT" -eq 120 ]; then
  WARNING="Context monitor: 120 tool calls. Strongly recommend /compact now — context rot risk is high."
elif [ "$COUNT" -eq 180 ]; then
  WARNING="Context monitor: 180 tool calls. Session is very long. Consider /compact or /clear + handover."
fi

# Detect repetition loops (same tool called 5+ times in last 8 calls)
if [ "$COUNT" -gt 10 ] && [ -z "$WARNING" ]; then
  RECENT=$(tail -8 "/tmp/claude-context-tools-${SESSION_ID}.log")
  MOST_COMMON=$(echo "$RECENT" | sort | uniq -c | sort -rn | head -1 | awk '{print $1}')
  if [ "$MOST_COMMON" -ge 5 ]; then
    REPEATED_TOOL=$(echo "$RECENT" | sort | uniq -c | sort -rn | head -1 | awk '{print $2}')
    WARNING="Context monitor: ${REPEATED_TOOL} called ${MOST_COMMON}/8 times — possible loop or confusion. Step back and reassess."
  fi
fi

# Output warning if any
if [ -n "$WARNING" ]; then
  printf '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"%s"}}' "$(echo "$WARNING" | sed 's/"/\\"/g')"
fi

exit 0
