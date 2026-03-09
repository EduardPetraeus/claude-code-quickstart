# Agentic Engineering Patterns

> Patterns for working effectively with AI coding agents. Applicable to Claude Code, Cursor, and similar tools.

---

## Philosophy

Automate as much of your work as possible. Make a plan, let the AI agent build. Walk away and come back when it's done. Your computer should be executing projects while you think about strategy.

**Key rule:** Never leave capacity on the table. Maximize every work window. All capacity should be used, always.

**The benefit:** You deliver products without being mentally drained. You build a system that catches things to improve. And you have a feedback loop that gives you other insights.

**The danger:** How do you prevent AI from steering you and the process instead of the other way around? It easily ends up that way.

## The Checklist

1. Write WHAT you want, not HOW it should be built
2. Write acceptance criteria BEFORE the agent starts — precise, not long
3. Read test results and reports — never the code itself
4. Tests must exist BEFORE code (true TDD)
5. The same AI that builds must NOT validate its own work
6. Rotate reviews between multiple AI models (Claude, Gemini, GPT, open source)
7. Feature branches always — never auto-merge to main
8. Destructive actions require explicit approval
9. Mutation testing (>80%) only for production deploys
10. New task = new chat. Max 20-30 messages per session
11. At session end: AI re-reads context files before handover
12. Run a short reflection after major tasks (what worked, what failed)
13. Experimental mode = isolated branch, never touch core code

## The 3 Levels

### Level 1 — Define "what", validate results

You write acceptance criteria in clear language. The agent converts to test cases. You approve test DESCRIPTIONS (not test code). The agent builds the code that fulfills tests. Pipeline runs: tests + mutation testing + static analysis. You read only: test results + report.

**Rule of thumb:** You touch the system three times — plan, test validation, and ship decision. Everything in between is autonomous.

### Level 2 — AI controls AI

The AI that builds does not review itself. Send acceptance criteria + output to a DIFFERENT AI model. Standard prompt: "Here are the requirements. Here is the output. Find everything that does not match. Find edge cases. Find what is missing."

Rotate between model families: Claude, Gemini, GPT, open source. Different architectures catch different errors.

Static analysis and security scanning run automatically in pipeline. AI validation has a ceiling: max 85% confidence. Always report what was NOT verified.

### Level 3 — Design so failures are reversible

You cannot guarantee that output is correct. Design the system so wrong output can be rolled back.

- Feature branches — never directly to main
- Destructive operations = explicit approval
- Every step has an exit condition: error = stop + log
- Watchdog: no progress in N minutes — restart from checkpoint
- All tasks are idempotent — can be re-run without side effects

**The goal:** Start the system, come back later, it is finished.

## When Things Go Wrong

| Situation | Response |
|---|---|
| Tests fail 3+ times | Agent stops and creates DEBUG_STATE.md |
| You disagree with the architecture | Your decision is final (ADR) |
| Mutation testing impossible | Agent writes logic-trace summary |
