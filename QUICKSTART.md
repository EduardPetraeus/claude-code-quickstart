# Quickstart — 60 Seconds to a Better Claude Code Setup

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed (`npm install -g @anthropic-ai/claude-code`)
- A Claude subscription (Pro, Team, or Enterprise)

## Setup

```bash
# 1. Clone this repo
git clone https://github.com/EduardPetraeus/claude-code-quickstart.git

# 2. Enter the directory
cd claude-code-quickstart

# 3. Start Claude Code
claude
```

That's it. Claude automatically reads `CLAUDE.md` and loads the rules, hooks, and agents.

## Verify It Works

In the Claude Code session, try these:

> What conventions does this project follow?

Claude should list the code style, git workflow, and session protocol from CLAUDE.md.

> Try to push to main

The `protect-main` hook should block it with an error message. This proves hooks are working.

## Use It in Your Own Project

```bash
# Copy the setup to your project
cp CLAUDE.md /path/to/your-project/
cp -r .claude/ /path/to/your-project/

# Edit CLAUDE.md — fill in the <!-- CUSTOMIZE --> sections
# Start Claude Code in your project
cd /path/to/your-project && claude
```

## What's Included

| File | What It Does |
|---|---|
| `CLAUDE.md` | Project memory template with commented sections |
| `.claude/rules/` | Git workflow, code style, session discipline |
| `.claude/hooks/` | Block push to main, auto-format Python |
| `.claude/agents/` | Code reviewer agent |
| `docs/` | Full documentation and workshop guide |
| `examples/` | CLAUDE.md templates for Python, TypeScript, and non-coders |
| `exercises/` | 4 hands-on exercises to learn the setup |

## Next

- Read the docs in `docs/` for full explanations
- Try the exercises in `exercises/` to learn hands-on
- Check `examples/` for CLAUDE.md templates for your stack
