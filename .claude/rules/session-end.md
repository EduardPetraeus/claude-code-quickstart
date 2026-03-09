---
paths:
  - "**/*.md"
  - "**/STATUS.md"
  - "**/PROGRESS.md"
---

# Session End Protocol

## Persist Status (every non-trivial session)
- Deep research projects: update PROGRESS.md with what was done, iteration status, next steps
- Repo work: update STATUS.md or commit message with summary and open questions
- Research/analysis: write findings to a build-logs directory (mandatory output rule)
- Goal: next session can pick up where this one left off

## Confidence Scoring

Report confidence after non-trivial tasks:
- **0-50%:** Low — flag explicitly, explain uncertainty, recommend human review
- **51-70%:** Medium — note assumptions, list unverified items
- **71-90%:** High — standard delivery, list caveats
- **91-100%:** Very high — fully verified, tests pass, no assumptions

Only for: features, architecture changes, security work, multi-file changes.
Not for every small edit.

## Test Rule

For sessions with code changes: write at least one test before session ends.
Exceptions: config changes, governance updates, pure refactors with existing test coverage.

## Handover (agent writes this, not the human)

At session end, write to STATUS.md (or PROGRESS.md for deep research):

```
## Session Handover — YYYY-MM-DD

### Done
- [bullet list of completed work]

### Next Step
- [single most important next action]

### Files Changed
- [list of modified files]

### Decisions Made
- [key decisions with brief rationale]

### Blockers / Open Questions
- [anything unresolved]
```
