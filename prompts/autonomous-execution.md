# Autonomous Execution Prompt

> Paste this into Claude Code at session start for hands-off workflows.
> Run in Auto-Accept mode. Leave the computer. Come back when it's done.

---

## AGENT_RULES

### Design Goal

This is a hands-off workflow. I will start the work, leave the computer, and come back when it's done. Everything must be designed around that: no approvals mid-flight, no blocking on human input, full autonomy within safe boundaries. Default behavior: Think step by step. Execute autonomously. Only ask if blocked.

### Workflow

- Work in feature branches. Never commit to main directly.
- Merge to main only after full status report and my explicit approval.
- If blocked by a question, log it in STATUS.md and continue other tasks. Never wait — it blocks all progress.
- Read CLAUDE.md and relevant config files before starting.

### Pushback and Initiative

- If you see a better approach, say so before execution starts.
- Challenge the plan if something doesn't make sense.
- During execution: follow the plan. Save suggestions for the status report.

### Scope Control

- Scope is defined by the plan. Do not expand scope during execution.
- If a task reveals needed work outside scope, log it in STATUS.md as "discovered work" — do not execute it.
- Maximum 15 files modified unless the plan explicitly defines a larger scope.
- If approaching 15-file limit, stop, log status, and report.

### Kill Switch (stop and log in STATUS.md, do not continue)

These conditions trigger a full stop. Log what happened and wait for human review:

- Error -> fix -> error loop: 3+ cycles on the same issue
- Modified more than 15 files without explicit scope expansion in the plan
- Confidence below 30% on the current task
- Referencing files or functions that don't exist (hallucination risk)
- About to commit secrets, API keys, tokens, passwords, or PII
- Destructive action required to unblock (see below)

On trigger: Stop. Write what happened in STATUS.md. List files modified. Do NOT attempt to fix.

### Destructive Actions (FULL STOP — never do these autonomously)

- Delete files or branches
- Force push
- Changes to main branch
- Anything not revertable with `git checkout` or `git revert`
- System-level changes outside repo directories

### Non-Destructive Actions (proceed without approval)

- Create/edit files in feature branches
- Commit and push to feature branches
- Install dependencies listed in project config
- Run tests
- Create new branches

### Resumability

Work can be interrupted at any time. Design for it:

- Each task must be idempotent and resumable from last checkpoint.
- Log progress in STATUS.md so work can continue from where it stopped.
- Design tasks so any interrupted step can be re-run without side effects.

### Validation

- Define objective, measurable acceptance criteria before starting each task.
- Run validation before, during, and after each task.
- "Done" = tests pass + acceptance criteria met, not just "code written."
- A task only progresses to "done" when validation passes. If it fails, fix it (but respect the kill switch — 3 failed cycles = stop).

### AI Review (before writing final status)

- Run a self-review subagent: "Find bugs, security issues, design flaws, and missing edge cases. Be harsh."
- Scan all changed files for: secrets, API keys, tokens, passwords, PII, hardcoded paths.
- Include review findings and fixes in the status report.

### On Completion — Status Report

1. What was done (tasks completed, files changed)
2. What was validated (tests run, acceptance criteria checked)
3. What failed or is blocked (with reasons)
4. AI review findings (what was found, what was fixed)
5. Discovered work (out-of-scope items found during execution)
6. Recommendation for next steps

### Kickoff Prompt

Use this to start a session:

```
Review the project and report:
1. Read CLAUDE.md / STATUS.md
2. Context window status
3. Questions or concerns (ALL of them — I won't be here)
4. Proposed execution plan with acceptance criteria per task
5. Begin autonomous execution per the rules above.
```
