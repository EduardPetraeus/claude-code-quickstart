# Claude Code — Cheat Sheet

Quick reference for daily use. Print it, bookmark it, keep it handy.

---

## Key Principles

1. **Iteration beats ambition** — ship v0.1, iterate 3+ times before calling it v1.0
2. **Context is everything** — CLAUDE.md loads every request; keep it under 200 lines
3. **Plan first, build once** — spend 60% planning, 25% reviewing, 10% directing, 5% manual
4. **Validate AI work** — the same AI that builds should NOT validate its own work
5. **Parallel over serial** — launch multiple agents when tasks are independent

---

## Session Flow

1. **Start** → read STATUS.md, understand where last session left off
2. **Plan mode** (`Shift+Tab`) → scope the work before coding
3. **Approve** → confirm the plan
4. **Execute** → work in waves with parallel subagents
5. **Test** → run tests on changed code
6. **Review** → code review + security scan
7. **Commit** → small, focused commits on feature branches
8. **Handover** → update STATUS.md for next session

---

## Keyboard Shortcuts

| Shortcut | Action |
|---|---|
| `Enter` | Send message |
| `Shift+Tab` | Toggle Plan/Normal/Auto-Accept mode |
| `Ctrl+C` | Cancel current generation |
| `Esc` | Interrupt and give feedback |
| `Esc, Esc` | Hard interrupt — clear pending actions |
| `Ctrl+L` | Clear terminal display |
| `Up arrow` | Edit last message |

---

## Slash Commands

| Command | Purpose |
|---|---|
| `/init` | Generate CLAUDE.md for current project |
| `/compact` | Compress conversation to free context |
| `/clear` | Start fresh (new conversation) |
| `/memory` | Edit persistent memory |
| `/terminal_setup` | Optimize shell integration |
| `/help` | Show all available commands |

---

## CLI Flags

| Flag | Purpose |
|---|---|
| `--print` | One-shot mode (no interactive session) |
| `--allowedTools` | Restrict which tools Claude can use |
| `--model` | Choose a different model |
| `--resume` | Resume a previous conversation |
| `--verbose` | Show debug output |

---

## Context Management

- **`/compact`** — compress context when it gets heavy (75+ tool calls)
- **`/clear`** — full reset when switching tasks
- **After 2 failed corrections** → `/clear` and rewrite from scratch
- **`@filename`** — reference files without pasting (saves tokens)
- **Drag-and-drop** — drop files/images directly into the prompt
- **Paste screenshots** — Claude can read images

---

## Permission Modes

| Mode | When to Use |
|---|---|
| **Plan** | Starting a task — review approach before coding |
| **Normal** | Standard work — Claude asks before each action |
| **Auto-Accept** | Trusted execution — Claude works autonomously |

Toggle with `Shift+Tab`. Start in Plan, switch to Normal/Auto-Accept to execute.

---

## Prompting Well

**The golden rule:** Start with a one-sentence goal. Add constraints only if needed.

### Quick Ask
```
[project]: Fix [problem]. [one line of context].
```

### Complex Ask (5-field framework)
```
CONTEXT: [what exists, what's the situation]
GOAL: [what you want to achieve]
CONSTRAINTS: [limitations, requirements]
FORMAT: [how you want the output]
PERSPECTIVE: [what role should Claude take]
```

---

## Wave Execution Pattern

Split work into independent waves. Execute each wave with parallel subagents (fresh context each). Verify between waves.

```
Wave 1: [independent foundation tasks] → verify all green
Wave 2: [tasks depending on Wave 1]   → verify all green
Wave 3: [final integration tasks]     → verify all green
```

---

## Agents

### Review Agents
| Agent | Purpose | When |
|---|---|---|
| `code-reviewer` | Convention compliance, bugs, readability | After code changes |
| `security-reviewer` | Adversarial security scanning | Before every push |
| `quality-gate` | Aggregate quality score (0-100) | After big features (5+ files) |

### Test Agents
| Agent | Purpose | When |
|---|---|---|
| `unit-tester` | Edge cases, boundaries, null handling | Always |
| `regression-tester` | Full existing suite, no new breakage | Always |
| `integration-tester` | API, services, DB queries | If API/service files changed |
| `data-tester` | Schema, transforms, data quality | If data/pipeline/SQL changed |
| `uat-tester` | End-to-end user scenarios | If CLI/UI/output changed |

### Thinking Agent
| Agent | Purpose | When |
|---|---|---|
| `explorer` | Divergent thinking, broad ideation | Before planning new features |

---

## Hooks

| Hook | Event | Purpose |
|---|---|---|
| `protect-main.sh` | PreToolUse | Block direct commits to main |
| `protect-critical.sh` | PreToolUse | Guard CLAUDE.md, workflows, pyproject.toml |
| `pre-push-gate.sh` | PreToolUse | Require review before pushing to main |
| `auto-lint.sh` | PostToolUse | Auto-format on file save |
| `bash-output-scan.sh` | PostToolUse | Scan CLI output for leaked secrets |
| `context-monitor.sh` | PostToolUse | Track tool usage, warn on context rot |
| `test-gate.sh` | Stop | Remind to run tests before finishing |
| `session-start.sh` | SessionStart | Check setup freshness on startup |
| `session-end.sh` | SessionEnd | Log session metadata |
| `file-suggestion.sh` | UserPromptSubmit | Project file autocomplete |

Hooks are **enforced**, not advisory. They run automatically on every matching event.

---

## Kill Switch Triggers

Stop ALL work immediately if ANY of these occur:
- About to commit secrets, API keys, tokens, passwords, or PII
- Confidence below 30% on 3 consecutive tasks
- Modified more than 15 files without explicit scope expansion
- Error → fix → error loop (3+ cycles on same issue)
- Referencing files or functions that don't exist (hallucination risk)

---

## File Structure

```
CLAUDE.md                    # Project brain — loaded every request
STATUS.md                    # Session handover notes
.claude/
  settings.json              # Hooks configuration
  rules/                     # Convention files (auto-loaded)
  hooks/                     # Shell scripts (auto-executed)
  agents/                    # Specialized AI agents
```

---

## Anti-Patterns → Built-in Defenses

| Anti-Pattern | Defense |
|---|---|
| Push secrets to GitHub | `bash-output-scan.sh` + `security-reviewer` agent |
| Commit directly to main | `protect-main.sh` hook |
| Edit CLAUDE.md accidentally | `protect-critical.sh` hook |
| Session runs too long | `context-monitor.sh` warns at 75/120/180 calls |
| Forget to run tests | `test-gate.sh` reminds at session end |
| Push without review | `pre-push-gate.sh` requires review touchfile |

---

## CLAUDE.md Tips

- Keep it under **200 lines** — it loads every request
- Extract details into `.claude/rules/` files
- Be specific: "Use pytest with fixtures" beats "Write good tests"
- Include the stack, conventions, and non-obvious rules
- Use `**bold**` for emphasis — Claude pays attention to formatting
- Update it as your project evolves — it's a living document
