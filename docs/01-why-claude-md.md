# Why CLAUDE.md Works

## The Problem

Every time you start a Claude Code session, Claude starts fresh. It doesn't know your coding style, your project's conventions, or what you've been working on. You end up repeating yourself constantly.

## The Solution

CLAUDE.md is a file in your project root that Claude reads automatically at the start of every session. It's persistent memory — your project's "brain."

## What Goes in CLAUDE.md

| Section | Purpose | Example |
|---|---|---|
| Project Context | Orient Claude quickly | "This is a FastAPI backend for..." |
| Code Style | Enforce consistency | "snake_case for functions" |
| Git Workflow | Prevent accidents | "Feature branches only" |
| Session Protocol | Standardize behavior | "Read STATUS.md first" |
| Security | Set hard boundaries | "Never commit API keys" |

## Why It Works

1. **Specificity beats repetition.** Instead of saying "use good naming" every session, you write it once: `snake_case for variables, PascalCase for classes`.

2. **Claude follows written rules better than verbal ones.** CLAUDE.md is loaded into context before your first message — it shapes every response.

3. **It compounds over time.** As you discover patterns and preferences, you add them. Each session gets better.

4. **It's shareable.** Commit CLAUDE.md to git and your entire team gets the same AI behavior.

## CLAUDE.md Hierarchy

Claude loads multiple CLAUDE.md files, from most general to most specific:

```
~/.claude/CLAUDE.md          ← Your global defaults (all projects)
./CLAUDE.md                  ← This project's rules
./src/CLAUDE.md              ← Subsystem overrides (optional)
```

More specific files override more general ones. Project CLAUDE.md overrides global CLAUDE.md.

## Common Mistakes

- **Too vague:** "Write good code" gives Claude nothing actionable
- **Too long:** Keep it under 200 lines — every line costs tokens
- **Outdated:** Review CLAUDE.md monthly — remove rules that no longer apply
- **Duplicated:** Don't copy rules inline — reference files in `.claude/rules/`

## Quick Start

1. Run `claude` in your project
2. Type `/init` to generate a starter CLAUDE.md
3. Edit it to match your conventions
4. Commit it to git

Or use the template in this repo's `CLAUDE.md` as a starting point.
