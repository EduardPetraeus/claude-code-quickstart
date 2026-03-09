# Claude Code Quickstart

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A battle-tested starter kit for [Claude Code](https://docs.anthropic.com/en/docs/claude-code). Clone it, customize it, and get productive in 60 seconds.

**This is not a link collection or a config dump.** It's an opinionated, progressive setup that teaches you the patterns that actually matter — from your first CLAUDE.md to automated guardrails and AI-powered code review.

## Prerequisites

- **Claude Code** installed — pick one method:
  - `curl -fsSL https://claude.ai/install.sh | bash` (recommended)
  - `brew install --cask claude-code` (macOS)
  - `npm install -g @anthropic-ai/claude-code` (cross-platform)
- **Active subscription** — Claude Pro, Max, Team, or Enterprise — or an [Anthropic Console](https://console.anthropic.com/) account with API credits
- **Git** installed
- **A terminal** — macOS, Linux, or Windows (WSL recommended)

> Full install docs: [docs.anthropic.com/en/docs/claude-code/overview](https://docs.anthropic.com/en/docs/claude-code/overview)

## Quick Start

```bash
# 1. Install Claude Code (if you haven't already)
curl -fsSL https://claude.ai/install.sh | bash

# 2. Clone and enter
git clone https://github.com/EduardPetraeus/claude-code-quickstart.git
cd claude-code-quickstart

# 3. Start Claude Code
claude

# 4. Verify — ask Claude:
#    "What conventions does this project follow?"
```

See [QUICKSTART.md](QUICKSTART.md) for detailed setup, verification steps, and troubleshooting.

> **Not a programmer?** Start here → [IMPLEMENT.md](IMPLEMENT.md). Copy one prompt into Claude Code and it sets up everything for you.

## How It Works

Claude Code reads your project configuration in layers — each layer adds structure:

```
CLAUDE.md                  → Project brain. Loaded every request. Conventions, rules, context.
.claude/rules/*.md         → Topic files. Git workflow, code style, security, testing.
.claude/hooks/*.sh         → Automation. Enforced on every tool call (lint, protect, scan).
.claude/agents/*.md        → Specialists. Code review, security audit, testing, exploration.
```

**CLAUDE.md** is the entry point — Claude reads it automatically. Rules add depth without bloating the main file. Hooks enforce guardrails you don't have to think about. Agents handle tasks that need focused expertise.

## What's Inside

- **CLAUDE.md template** — Commented, ready to customize for your project
- **Rules (8)** — Git workflow, code style, session discipline, testing, Python conventions, web safety, session end protocol, security
- **Hooks (10)** — Auto-lint, branch protection, critical file protection, pre-push review gate, secret scanning, context monitoring, test reminders, session lifecycle, file suggestions
- **Agents (9)** — Code reviewer, security reviewer, explorer, quality gate, unit/integration/data/UAT/regression testers
- **Commands (2)** — Session handover (`/project:handover`) and reflection (`/project:reflect`)
- **Prompts (8)** — Battle-tested templates including 5 divergent thinking frameworks
- **Guides (3)** — Agentic engineering patterns, multi-AI adversarial review, parallel execution
- **Tools (1)** — Gemini-powered external code review CLI
- **Docs (7)** — Why each piece matters, with examples and a cheat sheet
- **Exercises (4)** — Hands-on exercises from beginner to advanced
- **Examples (3)** — CLAUDE.md templates for Python, TypeScript, and non-coders

## Use It in Your Own Project

```bash
# 1. Copy the setup to your project
cp CLAUDE.md /path/to/your-project/
cp -r .claude/ /path/to/your-project/

# 2. Edit CLAUDE.md — fill in the <!-- CUSTOMIZE --> sections
#    (project name, stack, language preferences, project-specific rules)

# 3. Start Claude Code in your project
cd /path/to/your-project && claude
```

Create a `CLAUDE.local.md` for personal preferences (editor, language, local paths) — it's auto-gitignored and never committed.

## Who This Is For

- **Developers** who want Claude Code to follow their conventions from day one
- **Teams** who want consistent AI behavior across projects
- **Non-coders** (HR professionals, analysts, writers, economists) who want a structured AI workflow — see [IMPLEMENT.md](IMPLEMENT.md)
- **Workshop participants** who want a ready-to-go learning environment

## Workshop

This repo powers a 2.5-hour hands-on workshop. See [docs/workshop-guide.md](docs/workshop-guide.md) for the full presenter guide with timed blocks, demo scripts, and exercises.

## Structure

```
CLAUDE.md                        # The template — start here
QUICKSTART.md                    # Setup guide with verification
IMPLEMENT.md                     # Non-coder bootstrap — paste into Claude Code
.claude/
  settings.json                  # Full hooks + file suggestion config
  commands/                      # 2 custom slash commands (handover, reflect)
  rules/                         # 8 topic-specific rule files
  hooks/                         # 10 automation scripts
  agents/                        # 9 specialist agent definitions
prompts/                         # 8 prompt templates + divergent thinking
guides/                          # 3 deep pattern guides
tools/                           # External review CLI
docs/                            # 7 docs + cheat sheet
examples/                        # CLAUDE.md for Python, TypeScript, non-coders
exercises/                       # 4 hands-on exercises
```

## Resources

- [Claude Code Overview](https://docs.anthropic.com/en/docs/claude-code/overview) — official docs
- [Claude Code Best Practices](https://docs.anthropic.com/en/docs/claude-code/best-practices) — Anthropic's recommended patterns
- [Hooks Documentation](https://docs.anthropic.com/en/docs/claude-code/hooks) — event-driven automation
- [Settings Reference](https://docs.anthropic.com/en/docs/claude-code/settings) — permissions and configuration
- [Cheat Sheet](docs/cheat-sheet.md) — keyboard shortcuts, commands, tips

## Contributing

Issues and PRs are welcome. If you've built a useful rule, hook, or agent — share it.

## License

MIT
