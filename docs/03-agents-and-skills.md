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

## Skills — Claude's Auto-Triggered Abilities

Skills are like agents, but Claude decides when to use them automatically based on context.

### Where Skills Live

```
.claude/skills/
  my-skill/
    SKILL.md    ← The instructions
```

### When to Use Skills vs. Agents

| | Agents | Skills |
|---|---|---|
| **Triggered by** | You invoke them explicitly | Claude detects when relevant |
| **Best for** | Specific tasks on demand | Recurring patterns |
| **Control** | High — you decide when | Lower — Claude decides when |

### Example Skill: Auto-Test

```markdown
# Auto-Test Skill

When I create or modify a function, also create or update
the corresponding test file.

- Python: test file in tests/test_<module>.py
- TypeScript: test file alongside as <module>.test.ts
- Use existing test patterns in the project
```

### Getting Started

Start with agents — they're simpler and give you more control. Move to skills once you have patterns that should always apply.

The `code-reviewer` agent in this repo (`.claude/agents/code-reviewer.md`) is a good starting point. Try it, then create your own.
