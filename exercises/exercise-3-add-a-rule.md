# Exercise 3: Add Your Own Rule

**Time:** 10 minutes
**Goal:** Create a custom rule file in `.claude/rules/`.

---

## Steps

### 1. Choose a topic for your rule

Pick something relevant to how you work. Examples:
- Testing conventions
- Documentation standards
- API design patterns
- Error handling
- Logging practices

### 2. Create the rule file

Create a new file in `.claude/rules/`. For example, `testing.md`:

```bash
# You can do this manually or ask Claude:
# "Create a file .claude/rules/testing.md with testing rules for Python projects"
```

### 3. Write your rules

Here's an example:

```markdown
# Testing Rules

## Conventions

- Use pytest for all tests
- Test file naming: `test_<module>.py`
- Test function naming: `test_<function>_<scenario>`
- Group related tests in classes: `class TestUserCreation:`

## What to Test

- Every public function needs at least one test
- Test the happy path AND at least one error case
- Use fixtures for shared setup (in conftest.py)

## What NOT to Test

- Private helper functions (test them through public interfaces)
- Third-party library behavior
- Exact log messages (they change too often)
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
