# Claude Code Quickstart

A battle-tested starter kit for [Claude Code](https://docs.anthropic.com/en/docs/claude-code). Clone it, customize it, and get productive in 60 seconds.

**This is not a link collection or a config dump.** It's an opinionated, progressive setup that teaches you the patterns that actually matter — from your first CLAUDE.md to automated guardrails and AI-powered code review.

## What's Inside

- **CLAUDE.md template** — Commented, ready to customize for your project
- **Rules** — Git workflow, code style, and session discipline
- **Hooks** — Auto-format Python files, block pushes to main
- **Agent** — Code reviewer that checks against your conventions
- **Docs** — Why each piece matters, with examples
- **Exercises** — 4 hands-on exercises from beginner to advanced
- **Examples** — CLAUDE.md templates for Python, TypeScript, and non-coders

## Quick Start

```bash
git clone https://github.com/EduardPetraeus/claude-code-quickstart.git
cd claude-code-quickstart
claude
```

See [QUICKSTART.md](QUICKSTART.md) for full setup instructions.

## Who This Is For

- **Developers** who want Claude Code to follow their conventions from day one
- **Teams** who want consistent AI behavior across projects
- **Non-coders** (analysts, writers, economists) who want a structured AI workflow
- **Workshop participants** who want a ready-to-go learning environment

## Workshop

This repo powers a 2.5-hour hands-on workshop. See [docs/workshop-guide.md](docs/workshop-guide.md) for the full presenter guide with timed blocks, demo scripts, and exercises.

## Structure

```
CLAUDE.md                        # The template — start here
QUICKSTART.md                    # 60-second setup guide
.claude/
  settings.json                  # Hooks configuration
  rules/                         # git-workflow, code-style, session-discipline
  hooks/                         # protect-main, auto-lint
  agents/                        # code-reviewer
docs/                            # Why it works, how to use it
  01-why-claude-md.md
  02-rules-and-hooks.md
  03-agents-and-skills.md
  04-workflow-philosophy.md
  05-next-steps.md
  cheat-sheet.md
  workshop-guide.md
examples/                        # CLAUDE.md for different project types
  python-project/CLAUDE.md
  typescript-project/CLAUDE.md
  non-coder/CLAUDE.md
exercises/                       # Learn by doing
  exercise-1-first-session.md
  exercise-2-customize-claude-md.md
  exercise-3-add-a-rule.md
  exercise-4-try-an-agent.md
```

## License

MIT
