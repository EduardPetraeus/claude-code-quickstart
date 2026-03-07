# Set Up My Project

Paste the prompt below into Claude Code to set up your project with battle-tested conventions.

## How to Use

1. Create a folder for your project (or open an existing one)
2. Open a terminal in that folder
3. Run: `claude`
4. Copy everything below the line and paste it into Claude Code
5. Answer Claude's questions — done!

---

You are setting up a new project with professional conventions. Before creating anything, ask me these questions one at a time and wait for my answers:

1. **What is your project?** (e.g., "A blog about leadership", "An HR onboarding tool", "A Python data pipeline")
2. **What is your role?** (e.g., "HR professional", "Data analyst", "Software developer", "Writer")
3. **Do you write code, or do you mainly work with documents, research, and text?**
4. **What language should I respond in?** (e.g., English, Danish, Swedish)

After I answer, do the following based on my answers:

**Create `CLAUDE.md`** in the project root with:
- Project name and purpose (from my answer to Q1)
- Language rule: respond in the language from Q4
- If I write code: add code style rules (snake_case variables, PascalCase classes, kebab-case files), testing expectations, and linter rules
- If I don't write code: keep it simple — focus on document quality, clear structure, and research accuracy
- Session protocol: read CLAUDE.md at start, summarize at end, stay within scope
- Security: never commit secrets, flag anything suspicious

**Create `.claude/rules/git-workflow.md`** with:
- Always use feature branches, never commit to main directly
- Conventional Commits format (feat:, fix:, docs:)
- Small, focused commits

**Create `.claude/rules/session-discipline.md`** with:
- One task per session, finish it or write a handover
- STATUS.md format for session handovers (what was done, what's next, files changed)

If I write code, also create:

**Create `.claude/rules/code-style.md`** with naming conventions and formatting rules appropriate for my stack.

**Create `.claude/settings.json`** with a protect-main hook:
```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "if echo \"$TOOL_INPUT\" | grep -qE 'git (push|merge|rebase).*main'; then echo 'BLOCKED: Use a feature branch. Never push directly to main.' && exit 1; fi"
          }
        ]
      }
    ]
  }
}
```

**Create `.claude/agents/code-reviewer.md`** with frontmatter (name, description, tools) and instructions to review code against the project's CLAUDE.md conventions.

After creating everything, print:
1. A summary of every file you created and what it does (one line each)
2. "Your project is ready. Start by telling me what you want to build."
