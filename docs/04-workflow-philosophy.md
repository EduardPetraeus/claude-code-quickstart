# Workflow Philosophy — Plan First, Build Once

## The Core Principle

As a human working with Claude Code, you should be in **plan mode** most of the time. Your job is to think, plan, and decide. Claude's job is to execute.

## The #1 Mistake

Jumping straight into coding. Saying "just build it" without a clear plan leads to:

- Fragmented code from back-and-forth micro-edits
- Wasted tokens on vague instructions that produce vague results
- Rework when the approach turns out to be wrong

## The Correct Workflow

### 1. Think About What You Want

What's the architecture? What are the edge cases? What could go wrong? Do this before opening Claude Code.

### 2. Plan With Claude (Plan Mode)

Switch to Plan Mode (`Shift+Tab`). Describe what you want to build. Let Claude propose an approach. Poke holes. Iterate until the plan is solid.

### 3. Execute in One Shot

Once the plan is clear, switch to Normal or Auto-Accept mode. Give Claude the full context and let it build. No micromanaging.

### 4. Review the Output

Check the results. Run tests. If something needs adjustment, go back to planning — don't start editing line by line.

## Your Time Allocation

```
Planning & thinking:      60%
Reviewing & deciding:     25%
Directing execution:      10%
Manual intervention:       5%
```

The less you touch the keyboard during execution, the better Claude performs. Your value is in the thinking, not the typing.

## Anti-Patterns to Avoid

| Anti-Pattern | Why It's Bad | Do This Instead |
|---|---|---|
| Coding by conversation | Burns tokens, fragmented results | Plan first, then execute in one shot |
| Skipping the plan | Leads to rework | Always plan, even for "simple" tasks |
| Micro-editing | Slow, context-destroying | Step back, re-plan, re-execute |
| Over-directing during execution | Slows Claude down | Trust the plan. Intervene only if it's going wrong |

## Permission Modes Map to the Workflow

| Phase | Mode | What Claude Does |
|---|---|---|
| Planning | Plan Mode | Thinks and proposes, but doesn't write code |
| Execution | Normal / Auto-Accept | Writes code, runs commands, makes changes |
| Review | Plan Mode | Analyzes results, suggests improvements |

## Connection to the Development Cycle

```
Plan → Build (test-gated) → Ship → Review → Iterate
```

- **Plan:** Where you spend most of your time (Plan Mode)
- **Build:** Where Claude spends most of its time (Normal/Auto-Accept)
- **Ship:** Commit, push, PR
- **Review:** Check the work (run the code-reviewer agent)
- **Iterate:** Back to planning with lessons learned

## The Key Insight

Claude Code is not a typing assistant — it's a **building partner**. You bring the judgment. Claude brings the speed. The best results come from clear thinking, not fast typing.
