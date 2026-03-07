# Rules and Hooks

## Rules — What Claude Should Do

Rules are markdown files in `.claude/rules/` that Claude loads alongside CLAUDE.md. They're instructions organized by topic.

### Why Use Rules Instead of Putting Everything in CLAUDE.md?

- **Organization:** Separate concerns into focused files
- **Reusability:** Copy a rule file between projects
- **Readability:** CLAUDE.md stays concise, rules hold the details

### This Repo's Rules

| File | Purpose |
|---|---|
| `git-workflow.md` | Feature branches, conventional commits, PR process |
| `code-style.md` | Naming conventions, formatting, language-specific patterns |
| `session-discipline.md` | STATUS.md handover, `/compact`, `/clear` usage |

### Creating a New Rule

1. Create a file in `.claude/rules/`: e.g., `testing.md`
2. Write your instructions in plain markdown
3. Claude will automatically load it next session

```markdown
# Testing Rules

- Every new function needs at least one test
- Use pytest for Python, vitest for TypeScript
- Test file naming: test_<module>.py or <module>.test.ts
- Run tests before every commit
```

---

## Hooks — What Happens Automatically

Hooks are shell scripts that run when specific events occur in Claude Code. They automate guardrails so you don't have to remember them.

### Available Hook Events

| Event | When It Fires | Use Case |
|---|---|---|
| `PreToolUse` | Before Claude uses a tool | Block dangerous commands |
| `PostToolUse` | After a tool completes | Auto-format files, validate output |
| `UserPromptSubmit` | Before your message is processed | Add context, validate input |
| `Stop` | When Claude finishes responding | Run checks, update status |
| `SessionStart` | When a session begins | Load context, check environment |

### This Repo's Hooks

#### protect-main.sh (PreToolUse on Bash)

Blocks any `git push` or `git merge` to `main` or `master`. This prevents accidental pushes to the main branch.

```bash
# What it does:
# 1. Reads the command Claude is about to run
# 2. Checks if it targets main/master
# 3. Blocks with a clear error message if so
```

#### auto-lint.sh (PostToolUse on Edit|Write)

Automatically formats Python files after Claude edits them using `ruff`.

```bash
# What it does:
# 1. Reads which file was just edited
# 2. If it's a .py file and ruff is installed
# 3. Runs ruff format + ruff check --fix
```

### How Hooks Are Configured

Hooks are registered in `.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [{ "type": "command", "command": "bash .claude/hooks/protect-main.sh" }]
      }
    ]
  }
}
```

- **matcher**: Which tool triggers the hook (e.g., `Bash`, `Edit|Write`)
- **type**: Always `"command"` for shell scripts
- **command**: The script to run

### Creating Your Own Hook

1. Write a shell script in `.claude/hooks/`
2. The script receives JSON on stdin with the tool's input
3. Exit 0 = allow, Exit 1 = block (with stderr message)
4. Register it in `.claude/settings.json`

Example: a hook that blocks deletion of important files:

```bash
#!/bin/bash
INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
[ -z "$CMD" ] && exit 0

if echo "$CMD" | grep -qE 'rm.*CLAUDE.md|rm.*settings.json'; then
  echo "BLOCKED: Cannot delete critical config files." >&2
  exit 1
fi
exit 0
```
