#!/bin/bash
# SessionStart hook: check freshness of backups and governance, inject context warnings
INPUT=$(cat)
SOURCE=$(echo "$INPUT" | jq -r '.source // "unknown"')

# Only run on fresh starts, not resumes/compacts
[ "$SOURCE" != "startup" ] && exit 0

CONTEXT=""
TODAY=$(date +%s)

# Check governance freshness (customize path as needed)
GOV_FILE="$HOME/.claude/.last-governance-check"
if [ -f "$GOV_FILE" ]; then
  LAST_DATE=$(cat "$GOV_FILE" | tr -d '[:space:]')
  LAST_TS=$(date -j -f "%Y-%m-%d" "$LAST_DATE" +%s 2>/dev/null || echo 0)
  DAYS_AGO=$(( (TODAY - LAST_TS) / 86400 ))
  if [ "$DAYS_AGO" -gt 14 ]; then
    CONTEXT="${CONTEXT}WARNING: Governance check is ${DAYS_AGO} days old. Consider reviewing your setup.\n"
  fi
fi

# Check pre-commit installation in current repo
if [ -f ".pre-commit-config.yaml" ] && [ ! -f ".git/hooks/pre-commit" ]; then
  CONTEXT="${CONTEXT}WARNING: .pre-commit-config.yaml exists but pre-commit hooks not installed. Run: pre-commit install\n"
fi

# Output context for Claude if any warnings
if [ -n "$CONTEXT" ]; then
  printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}' "$(echo -e "$CONTEXT" | sed 's/"/\\"/g')"
fi

exit 0
