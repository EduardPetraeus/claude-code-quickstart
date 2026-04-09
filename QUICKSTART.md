# Quickstart — 60 Seconds to a Better Claude Code Setup

## Prerequisites

**Install Claude Code** — pick one method:

> ⚠️ NPM installation is deprecated. Use the native installer or Homebrew.

```bash
# Recommended (standalone installer)
curl -fsSL https://claude.ai/install.sh | bash

# macOS (Homebrew)
brew install --cask claude-code
```

**Subscription required:** Claude Pro, Max, Team, or Enterprise — or an [Anthropic Console](https://console.anthropic.com/) account with API credits.

> Full install docs: [code.claude.com](https://code.claude.com)

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

## Personal Preferences — CLAUDE.local.md

Create `CLAUDE.local.md` in your project root for settings that shouldn't be committed:

```markdown
# CLAUDE.local.md — Personal preferences (auto-gitignored)

- Respond in Danish
- Python: /opt/homebrew/bin/python3.12
- Prefer parallel subagents for multi-file tasks
```

Claude reads this automatically alongside `CLAUDE.md`. It's gitignored by default — safe for local paths, language preferences, and personal workflows.

## What's Included

| File | What It Does |
|---|---|
| `CLAUDE.md` | Project memory template with commented sections |
| `.claude/rules/` | Git workflow, code style, security, testing, session discipline |
| `.claude/hooks/` | Branch protection, auto-lint, secret scanning, context monitoring |
| `.claude/agents/` | Code reviewer, security reviewer, quality gate, 5 test specialists |
| `prompts/` | Prompt templates and divergent thinking frameworks |
| `guides/` | Agentic engineering patterns, adversarial review, parallel execution |
| `tools/` | Gemini-powered external code review CLI |
| `docs/` | Full documentation, cheat sheet, and workshop guide |
| `examples/` | CLAUDE.md templates for Python, TypeScript, and non-coders |
| `exercises/` | 4 hands-on exercises to learn the setup |

## Non-Coder Quick Start

Don't code? No problem. You can set up a project without touching any config files:

1. Create a folder for your project (e.g., `mkdir my-project`)
2. Open a terminal and navigate there (`cd my-project`)
3. Start Claude Code (`claude`)
4. Open [IMPLEMENT.md](IMPLEMENT.md) and copy everything below the `---` line
5. Paste it into Claude Code and answer the questions
6. Done — Claude sets up everything for you

## Troubleshooting

**Hooks aren't running?**
Make sure they're executable: `chmod +x .claude/hooks/*.sh`

**Claude doesn't know the conventions?**
Verify `CLAUDE.md` exists in the project root. Claude reads it automatically on startup.

**Permission denied on tool calls?**
Check `.claude/settings.json` — hooks may be blocking actions. Run `claude` with `--verbose` to see which hooks fire.

## Next Steps

- Run `/compact` after completing a feature to reclaim context
- Run `/clear` when switching tasks
- Use `Shift+Tab` to toggle plan mode (scope work before coding)
- Read the docs in `docs/` for full explanations
- Try the exercises in `exercises/` to learn hands-on
- Check `examples/` for CLAUDE.md templates for your stack
- Browse `prompts/` for templates that improve your AI conversations
