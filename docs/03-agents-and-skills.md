# Agents and Skills

## Agents — Specialized AI Instructions

An agent is a markdown file in `.claude/agents/` with focused instructions for a specific task. When you invoke an agent, Claude follows those instructions instead of its general behavior.

### Why Agents?

- **Focus:** A code reviewer only reviews code. A test writer only writes tests.
- **Consistency:** The agent follows the same checklist every time.
- **Reusability:** Write the instructions once, use them across sessions.

### Anatomy of an Agent

```markdown
---
name: code-reviewer
description: "Review recent code changes against project conventions."
tools: Read, Grep, Glob, Bash
---

You are a code reviewer. Review the most recent changes
against the project's CLAUDE.md conventions.

## Steps

1. Run `git diff` to see recent changes
2. Read the project's CLAUDE.md for conventions
3. Review each changed file against the conventions

## Review Checklist

- Naming conventions followed
- No hardcoded secrets
- Code is readable
- Changes stay within scope

## Output Format

**Verdict:** PASS / WARN / FAIL
(findings listed by severity)
```

### The Frontmatter

| Field | Purpose |
|---|---|
| `name` | Agent identifier |
| `description` | When to use this agent (shown in help) |
| `tools` | Which tools the agent can access |

### Agent Ideas for Your Projects

| Agent | Purpose |
|---|---|
| `code-reviewer` | Review code against conventions (included in this repo) |
| `test-writer` | Generate tests for new code |
| `doc-writer` | Write documentation for new features |
| `security-checker` | Scan for common security issues |
| `migration-helper` | Assist with database migrations |

---

## Custom Commands — Reusable Prompts

Custom commands are markdown files that Claude treats as reusable prompt templates. You trigger them explicitly with a slash command.

### Where Commands Live

```
.claude/commands/          ← Project commands (shared with team)
~/.claude/commands/        ← Personal global commands
```

### Example Command

Create `.claude/commands/explain.md`:

```markdown
Explain the following code in simple terms, suitable for a junior developer.
Focus on what it does, not how it works internally.

$ARGUMENTS
```

Use it: `/project:explain src/auth.py`

`$ARGUMENTS` is replaced with whatever you type after the command name.

### When to Use Commands vs. Agents

| | Commands | Agents |
|---|---|---|
| **Triggered by** | You type `/project:<name>` | Claude uses them as subagents |
| **Best for** | Reusable prompts with arguments | Complex multi-step workflows |
| **Complexity** | Simple — just a markdown prompt | Richer — frontmatter, tool restrictions |

### Getting Started

Start with agents — they're included in this repo and give you the most control. Move to custom commands once you find yourself typing the same prompt repeatedly.

The `code-reviewer` agent in this repo (`.claude/agents/code-reviewer.md`) is a good starting point. Try it, then create your own.
