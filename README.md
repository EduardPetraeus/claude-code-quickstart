# Claude Code Quickstart

A battle-tested starter kit for [Claude Code](https://docs.anthropic.com/en/docs/claude-code). Clone it, customize it, and get productive in 60 seconds.

**This is not a link collection or a config dump.** It's an opinionated, progressive setup that teaches you the patterns that actually matter — from your first CLAUDE.md to automated guardrails and AI-powered code review.

## What's Inside

- **CLAUDE.md template** — Commented, ready to customize for your project
- **Rules (7)** — Git workflow, code style, session discipline, testing, Python conventions, web safety, session end protocol, security
- **Hooks (9)** — Auto-lint, branch protection, critical file protection, pre-push review gate, secret scanning, context monitoring, test reminders, session lifecycle
- **Agents (9)** — Code reviewer, security reviewer, explorer, quality gate, unit/integration/data/UAT/regression testers
- **Prompts** — Battle-tested templates including 5 divergent thinking frameworks
- **Guides** — Agentic engineering patterns, multi-AI adversarial review, parallel execution
- **Tools** — Gemini-powered external code review CLI
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

> **Not a programmer?** Start here → [IMPLEMENT.md](IMPLEMENT.md). Copy one prompt into Claude Code and it sets up everything for you.

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
QUICKSTART.md                    # 60-second setup guide
IMPLEMENT.md                     # Non-coder bootstrap — paste into Claude Code
.claude/
  settings.json                  # Full hooks configuration (9 hooks)
  rules/
    code-style.md                # Naming conventions, formatting
    git-workflow.md              # Branching, commits, PRs
    session-discipline.md        # One task per session, handover format
    testing.md                   # pytest patterns, AAA, naming
    python-conventions.md        # snake_case, type hints, Ruff
    web-safety.md                # WebFetch/WebSearch safety rules
    session-end.md               # Session persistence, confidence scoring
    security.md                  # Pre-push scanning, secret management
  hooks/
    protect-main.sh              # Block direct commits to main
    auto-lint.sh                 # Auto-format on file save
    protect-critical.sh          # Guard CLAUDE.md, workflows, pyproject.toml
    pre-push-gate.sh             # Require review before pushing to main
    bash-output-scan.sh          # Scan CLI output for leaked secrets
    context-monitor.sh           # Track tool usage, warn on context rot
    test-gate.sh                 # Remind to run tests before finishing
    session-start.sh             # Check governance freshness on startup
    session-end.sh               # Log session metadata
  agents/
    code-reviewer.md             # Convention compliance, bugs, readability
    security-reviewer.md         # Adversarial security scanning
    explorer.md                  # Divergent thinking advisor
    quality-gate.md              # Aggregate quality score (0-100)
    unit-tester.md               # Edge cases, boundaries, null handling
    integration-tester.md        # API, services, DB queries
    data-tester.md               # Schema, transforms, data quality
    uat-tester.md                # End-to-end user scenarios
    regression-tester.md         # Full suite, no new breakage
prompts/                         # Prompt templates for better AI conversations
  prompt-skeleton.md             # 5-field prompt framework
  stuck-template.md              # Structured format for when you're stuck
  autonomous-execution.md        # Hands-off autonomous workflow
  broad-thinking/                # 5 divergent thinking templates
guides/                          # Deep patterns and playbooks
  agentic-engineering-patterns.md  # 3-level framework for AI agents
  adversarial-review-playbook.md   # Multi-AI review with 5+ models
  parallel-execution-patterns.md   # Parallel agent coordination
tools/
  ai-review.py                   # Gemini-powered external code review
docs/                            # Why it works, how to use it
examples/                        # CLAUDE.md for different project types
exercises/                       # Learn by doing
```

## License

MIT
