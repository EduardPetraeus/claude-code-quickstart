#!/bin/bash
# Custom @ file suggestion: prioritize project files, config, and docs
# Returns JSON array of file suggestions for the @ autocomplete
INPUT=$(cat)
CWD=$(echo "$INPUT" | jq -r '.cwd // "."')

SUGGESTIONS=()

# Project config files
[ -f "$CWD/CLAUDE.md" ] && SUGGESTIONS+=("$CWD/CLAUDE.md")
[ -f "$CWD/CLAUDE.local.md" ] && SUGGESTIONS+=("$CWD/CLAUDE.local.md")
[ -f "$CWD/STATUS.md" ] && SUGGESTIONS+=("$CWD/STATUS.md")
[ -f "$CWD/.claude/settings.json" ] && SUGGESTIONS+=("$CWD/.claude/settings.json")

# Rules and agents
for f in "$CWD/.claude/rules/"*.md; do
  [ -f "$f" ] && SUGGESTIONS+=("$f")
done
for f in "$CWD/.claude/agents/"*.md; do
  [ -f "$f" ] && SUGGESTIONS+=("$f")
done

# Output as JSON array
printf '['
first=true
for s in "${SUGGESTIONS[@]}"; do
  if [ "$first" = true ]; then
    first=false
  else
    printf ','
  fi
  printf '"%s"' "$s"
done
printf ']'

exit 0
