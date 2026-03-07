# Session Discipline

## One Task Per Session

Focus on one task at a time. Finish it or write a handover. No half-states.

## Context Management

- Run `/compact` after completing a feature — don't wait for auto-compact
- Run `/clear` when switching to a different task
- Use `@` file references instead of pasting code — saves tokens, better context

## STATUS.md Handover

At the end of every non-trivial session, update STATUS.md:

```markdown
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

This ensures the next session (or a different person) can pick up exactly where you left off.

## Permission Modes — Use Them

| Mode | When to Use |
|---|---|
| **Plan** | Starting a task — review approach before coding |
| **Normal** | Standard work — Claude asks before each action |
| **Auto-Accept** | Trusted execution — Claude works autonomously |

**Workflow:** Start in Plan Mode to scope the work. Switch to Normal/Auto-Accept to execute.
Toggle with `Shift+Tab`.
