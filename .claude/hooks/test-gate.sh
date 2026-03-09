#!/bin/bash
# Stop hook: remind Claude to run tests if code was changed but tests weren't run.
# Non-blocking — injects a reminder, does not prevent stop.

TOUCHFILE="/tmp/claude-tests-passed"

# Check if we're in a git repo with code changes
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    exit 0
fi

# Check if there are code changes (not just docs/config)
CODE_CHANGES=$(git diff --name-only 2>/dev/null | grep -vE '\.(md|yml|yaml|json|toml|cfg|ini|txt)$' | head -1)
if [ -z "$CODE_CHANGES" ]; then
    exit 0
fi

# Check if tests were run this session (touchfile < 60 min old)
if [ -f "$TOUCHFILE" ]; then
    TOUCHFILE_AGE=$(( $(date +%s) - $(cat "$TOUCHFILE") ))
    if [ "$TOUCHFILE_AGE" -lt 3600 ]; then
        exit 0
    fi
fi

# Code changes exist but no recent test run
echo "WARNING: Code changes detected but tests were not run this session. Consider running tests before finishing."
exit 0
