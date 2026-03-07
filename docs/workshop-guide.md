# Workshop Guide — Claude Code Quickstart

A 2.5-hour hands-on workshop for getting productive with Claude Code.

**Audience:** Developers, analysts, and knowledge workers who want to use AI-assisted coding effectively.

**Prerequisites:** Participants must have Claude Code installed and a Claude subscription active before the workshop.

---

## Schedule

| Time | Block | Activity | Key Takeaway |
|---|---|---|---|
| 0:00–0:25 | Why Claude Code? | Live demo, no slides | "It reads your project" |
| 0:25–0:50 | CLAUDE.md | Template walkthrough + Exercise 1 | "5 min config = 10x better output" |
| 0:50–1:00 | Break | | |
| 1:00–1:25 | Rules & Hooks | Demo protect-main + auto-lint + Exercise 2-3 | "Guardrails, not handcuffs" |
| 1:25–1:50 | Workflow | Plan Mode demo | "Plan 60%, code 5%" |
| 1:50–2:00 | Break | | |
| 2:00–2:20 | Agents + Advanced | Code reviewer demo + Exercise 4 | "Agents = specialized instructions" |
| 2:20–2:30 | Wrap-up & Q&A | Cheat sheet, next steps, CTA | "You have everything you need" |

---

## Block 1: Why Claude Code? (30 min)

### Presenter Notes

- Open a real project (or this repo) in the terminal
- Run `claude` — show that it automatically reads CLAUDE.md
- Ask Claude to explain the project structure
- Ask Claude to make a small change — show the permission flow
- Show `Shift+Tab` to toggle between Plan/Normal/Auto-Accept modes

### Key Points

- Claude Code is a CLI tool that lives in your terminal
- It reads your project files, understands your codebase, runs commands
- CLAUDE.md is the "brain" — it tells Claude how YOUR project works
- Three permission modes give you full control over what Claude can do

### Demo Script

```bash
cd claude-code-quickstart
claude
# "Explain the structure of this project"
# "What conventions does this project follow?"
# Show Shift+Tab mode switching
```

---

## Block 2: CLAUDE.md Deep Dive (30 min)

### Presenter Notes

- Open `CLAUDE.md` and walk through each section
- Highlight `<!-- CUSTOMIZE -->` markers
- Show how specific instructions produce better results
- Run Exercise 1

### Key Points

- CLAUDE.md is loaded every session — it's persistent memory
- Specific > vague: "snake_case for functions" beats "write good code"
- Keep it under 200 lines — every line costs tokens
- Hierarchy: global (`~/.claude/CLAUDE.md`) < project (`./CLAUDE.md`)

### Comparison Demo

Show the same prompt with and without CLAUDE.md:
1. Empty project: "Write a Python function to parse CSV" → generic output
2. With CLAUDE.md: Same prompt → follows your conventions, style, and patterns

---

## Block 3: Rules & Hooks (25 min)

### Presenter Notes

- Explain rules: markdown files in `.claude/rules/` that Claude always follows
- Show the three rules in this repo (git-workflow, code-style, session-discipline)
- Demo hooks: try `git push origin main` → blocked by protect-main hook
- Demo auto-lint: write a poorly formatted Python file → auto-fixed on save
- Run Exercise 2 and 3

### Key Points

- Rules = instructions Claude follows (like CLAUDE.md, but organized by topic)
- Hooks = automated scripts that run on events (before/after tool use)
- Together they create guardrails that prevent mistakes automatically
- You don't need to remember the rules — the system enforces them

### Hook Demo

```bash
# In Claude Code session:
# "Try to push to main"
# → Hook blocks it with clear error message

# "Create a file called ugly.py with messy formatting"
# → Auto-lint hook formats it immediately after creation
```

---

## Block 4: Workflow Philosophy (25 min)

### Presenter Notes

- This is the most important section for productivity
- Live demo: start in Plan Mode, scope a task, then switch to execute
- Show the time allocation chart: Plan 60%, Review 25%, Direct 10%, Manual 5%

### Key Points

- The #1 mistake: jumping straight into coding
- Your job is to THINK and PLAN. Claude's job is to EXECUTE.
- Start every task in Plan Mode (`Shift+Tab`)
- Only switch to Normal/Auto-Accept when the plan is solid
- `/compact` after features, `/clear` between tasks

### Demo: Plan-First Workflow

```
1. Start in Plan Mode
2. "I want to add input validation to the user registration form"
3. Review Claude's plan — ask questions, refine
4. Switch to Normal mode (Shift+Tab)
5. "Execute the plan"
6. Review the output
```

---

## Block 5: Agents (20 min)

### Presenter Notes

- Explain agents: markdown files with specialized instructions
- Show the code-reviewer agent in `.claude/agents/`
- Run the agent on the repo's own code
- Run Exercise 4

### Key Points

- Agents are just markdown files with focused instructions
- They're like hiring a specialist for a specific job
- The code-reviewer checks your work against CLAUDE.md conventions
- You can create agents for any recurring task: testing, documentation, security review

### Agent Demo

```bash
# In Claude Code session:
# Make a deliberate code style violation
# Run the code-reviewer agent
# Show how it catches the issue and suggests a fix
```

---

## Block 6: Wrap-up (10 min)

### Presenter Notes

- Hand out (or point to) `docs/cheat-sheet.md`
- Recap the 4 key concepts: CLAUDE.md, Rules, Hooks, Agents
- Point to `docs/05-next-steps.md` for continued learning
- Open for Q&A

### Key Message

> You now have a battle-tested Claude Code setup. Clone this repo into any new project, customize CLAUDE.md, and you're productive in 60 seconds.

---

## Preparation Checklist (for the presenter)

- [ ] Verify Claude Code is installed and working on the demo machine
- [ ] Clone this repo fresh to ensure clean state
- [ ] Test all hooks work (protect-main, auto-lint)
- [ ] Have a backup plan if internet is slow (pre-recorded demos)
- [ ] Print or share the cheat sheet link
- [ ] Prepare a simple project for live demos (or use this repo)
