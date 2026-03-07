# Exercise 4: Run the Code Reviewer Agent

**Time:** 10 minutes
**Goal:** Use the code-reviewer agent to review code changes.

---

## Steps

### 1. Create some code to review

In a Claude Code session, ask:

> Create a Python file called calculator.py with functions for add, subtract, multiply, and divide

Let Claude create the file.

### 2. Introduce a deliberate issue

Ask Claude to edit the file with a problem:

> Edit calculator.py: rename the `add` function to `Add` and remove the docstring from `divide`

This violates the code style rules (should be `snake_case`, should have docstrings).

### 3. Run the code-reviewer agent

In the same session, ask:

> Run the code-reviewer agent on the recent changes

Claude will use the agent defined in `.claude/agents/code-reviewer.md`.

### 4. Review the output

The agent should:
- Run `git diff` to see what changed
- Check against CLAUDE.md conventions
- Report findings with severity levels
- Give a verdict: PASS, WARN, or FAIL

### 5. Fix the issues

Ask Claude to fix the issues the reviewer found:

> Fix the issues found by the code reviewer

### 6. Clean up

> Delete calculator.py

---

## What You Learned

- Agents are markdown files with specialized instructions
- The code-reviewer checks your work against project conventions
- Agents give consistent, repeatable reviews
- You can create agents for any recurring task

## Bonus: Create Your Own Agent

Try creating a simple agent. Add a file `.claude/agents/doc-writer.md`:

```markdown
---
name: doc-writer
description: "Generate documentation for code files."
tools: Read, Grep, Glob
---

You are a documentation writer. When asked to document a file:

1. Read the file
2. Identify all public functions and classes
3. Generate clear, concise documentation

## Output Format

For each function:
- **Name:** function_name
- **Purpose:** What it does (one sentence)
- **Parameters:** name, type, description
- **Returns:** type, description
- **Example:** Simple usage example
```

Then test it: "Run the doc-writer agent on calculator.py"

---

## What's Next?

You've now used all four building blocks of Claude Code:

1. **CLAUDE.md** — Project memory
2. **Rules** — Organized instructions
3. **Hooks** — Automated guardrails
4. **Agents** — Specialized reviewers

See `docs/05-next-steps.md` for where to go from here.
