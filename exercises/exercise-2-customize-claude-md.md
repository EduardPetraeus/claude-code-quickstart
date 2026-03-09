# Exercise 2: Customize CLAUDE.md

**Time:** 10 minutes
**Goal:** Edit CLAUDE.md to match your personal preferences.

---

## Steps

### 1. Open CLAUDE.md in the repo

Read through the file. Notice the `<!-- CUSTOMIZE -->` comments — these are the sections you'll change.

### 2. Edit the Project Context section

> **Note:** If the `protect-critical.sh` hook is active, you'll get a permission prompt when editing CLAUDE.md. This is by design — the hook guards critical files. Approve the edit to continue.


Replace the placeholder values with something real (or made up for practice):

```markdown
## Project Context

- **Repo:** my-first-project
- **Purpose:** A CLI tool that tracks my daily tasks
- **Stack:** Python 3.12, Click, SQLite
- **Status:** v0.1 — Just starting
```

### 3. Add a language preference

Uncomment and edit the language line:

```markdown
## Language

- All code, comments, docstrings, and variable names in English
- Respond in Danish in conversations
```

### 4. Add a project-specific rule

In the "Project-Specific Rules" section at the bottom, add something:

```markdown
## Project-Specific Rules

- All CLI commands must have a --help flag
- Database schema changes require a migration file
- User-facing text goes in a separate constants file
```

### 5. Test your changes

Start a new Claude Code session:

```bash
claude
```

Ask:

> What are the conventions for this project?

Claude should now reflect YOUR customizations.

---

## What You Learned

- CLAUDE.md is just a markdown file — edit it like any other
- Specific instructions produce better Claude output
- The `<!-- CUSTOMIZE -->` markers show you what to change
- Changes take effect immediately on the next session

## Tip

Keep CLAUDE.md under 200 lines. If it gets longer, move details into `.claude/rules/` files and reference them from CLAUDE.md.
