# Exercise 3: Add Your Own Rule

**Time:** 10 minutes
**Goal:** Create a custom rule file in `.claude/rules/`.

---

## Steps

### 1. Choose a topic for your rule

Pick something relevant to how you work. Examples:
- Error handling conventions
- Documentation standards
- API design patterns
- Logging practices

### 2. Create the rule file

Create a new file in `.claude/rules/`. For example, `error-handling.md`:

```bash
# You can do this manually or ask Claude:
# "Create a file .claude/rules/error-handling.md with error handling rules for Python projects"
```

### 3. Write your rules

Here's an example:

```markdown
# Error Handling Rules

## Conventions

- Use custom exception classes for domain errors
- Exception naming: `<Domain>Error` (e.g., `ValidationError`, `NotFoundError`)
- Always include a meaningful error message
- Log errors at the boundary, not deep in the call stack

## What to Handle

- All external I/O (files, network, database) must have error handling
- Validate user input at the entry point — fail fast with clear messages
- Use context managers (`with` statements) for resource cleanup

## What NOT to Do

- Never use bare `except:` — always catch specific exceptions
- Never silently swallow errors (`except: pass`)
- Don't log and re-raise the same error (pick one)
```

### 4. Verify Claude loads it

Start a new session:

```bash
claude
```

Ask:

> What testing conventions should I follow?

Claude should reference your new rule.

### 5. Try it in action

Ask Claude:

> Write a test for a function called `calculate_total(items: list[float]) -> float` that sums prices

Watch how Claude follows YOUR testing rules.

---

## What You Learned

- Rules are just markdown files in `.claude/rules/`
- Claude loads them automatically — no configuration needed
- Rules keep CLAUDE.md concise while adding detailed instructions
- You can have as many rule files as you need

## Bonus

Look at the existing rules in this repo:
- `.claude/rules/git-workflow.md`
- `.claude/rules/code-style.md`
- `.claude/rules/session-discipline.md`

Use them as templates for your own.
