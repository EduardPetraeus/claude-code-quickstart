# Exercise 1: Your First Claude Code Session

**Time:** 10 minutes
**Goal:** Start Claude Code and see CLAUDE.md in action.

---

## Steps

### 1. Open your terminal and navigate to this repo

```bash
cd claude-code-quickstart
```

### 2. Start Claude Code

```bash
claude
```

Claude automatically reads the CLAUDE.md file. You should see it reference the project's conventions.

### 3. Ask Claude about the project

Type this prompt:

> What conventions does this project follow?

Claude should respond with information from CLAUDE.md — code style, git workflow, session protocol, etc.

### 4. Ask Claude to create a small file

> Create a Python file called hello.py with a function that greets the user by name.

Watch how Claude:
- Uses `snake_case` for the function name (from code style rules)
- Asks for permission before creating the file (Normal mode)
- The auto-lint hook formats the file after creation

### 5. Check the result

Look at the generated file. Does it follow the conventions in CLAUDE.md?

### 6. Clean up

> Delete hello.py

---

## What You Learned

- Claude Code reads CLAUDE.md automatically at session start
- Conventions in CLAUDE.md shape Claude's output
- Hooks run automatically (auto-lint formatted your Python file)
- Permission modes control what Claude can do without asking

## Bonus

Try switching to Plan Mode:
1. Press `Shift+Tab` until you see "Plan" mode
2. Ask: "How would you add a test for the greeting function?"
3. Claude plans but doesn't write code — you review first
