#!/bin/bash
# PreToolUse hook: require review before pushing to main/master
INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
[ -z "$CMD" ] && exit 0

# Only intercept git push commands
echo "$CMD" | grep -qE '^git push|; git push|&& git push' || exit 0

# Only gate pushes to main/master — feature branches pass freely
echo "$CMD" | grep -qE '\b(main|master)\b' || exit 0

# Use persistent cache dir instead of /tmp (survives reboots, no collisions)
CACHE_DIR="${HOME}/.cache/claude"
mkdir -p "$CACHE_DIR"

# Check for review touchfile (created by your review process)
TOUCHFILE="$CACHE_DIR/review-passed"
if [ ! -f "$TOUCHFILE" ]; then
  echo "Push to main/master requires code review first. No review touchfile found." >&2
  exit 1
fi

# Check touchfile age (must be <60 minutes old) — cross-platform stat
if stat --version &>/dev/null; then
  FILE_AGE=$(( $(date +%s) - $(stat -c %Y "$TOUCHFILE") ))
else
  FILE_AGE=$(( $(date +%s) - $(stat -f %m "$TOUCHFILE") ))
fi
if [ "$FILE_AGE" -gt 3600 ]; then
  echo "Push to main/master: review touchfile is $(( FILE_AGE / 60 )) minutes old (max 60). Run review again." >&2
  exit 1
fi

exit 0
