# Next Steps

You've completed the workshop. Here's how to keep building.

## Immediate (This Week)

1. **Clone this repo into your real project**
   ```bash
   # Copy the .claude/ directory and CLAUDE.md to your project
   cp -r claude-code-quickstart/.claude your-project/
   cp claude-code-quickstart/CLAUDE.md your-project/
   ```

2. **Customize CLAUDE.md** for your project — fill in the `<!-- CUSTOMIZE -->` sections

3. **Use Plan Mode by default** — start every task with `Shift+Tab` to Plan Mode

4. **Try the code-reviewer agent** on your own code

## Next Month

- **Create your own rules** for patterns you notice yourself repeating
- **Write a custom hook** for something specific to your workflow
- **Build a project-specific agent** (e.g., a migration helper, a doc writer)
- **Share your CLAUDE.md** with your team — commit it to git

## Advanced Topics to Explore

| Topic | What It Does | When You Need It |
|---|---|---|
| Custom commands | Reusable prompts in `.claude/commands/` | When you type the same prompt repeatedly |
| Skills | Auto-triggered instructions | When patterns should always apply |
| MCP servers | Connect Claude to external tools | When you need Slack, databases, APIs |
| Multi-file workflows | Claude works across many files | For larger features and refactors |
| Subagents | Parallel task execution | For complex, multi-step tasks |

## Resources

- [Claude Code documentation](https://docs.anthropic.com/en/docs/claude-code)
- [CLAUDE.md best practices](https://docs.anthropic.com/en/docs/claude-code/memory)
- [Hooks documentation](https://docs.anthropic.com/en/docs/claude-code/hooks)

## Keep Learning

The best way to learn Claude Code is to use it daily. Start with small tasks, build confidence, then tackle larger projects. The setup in this repo will grow with you.

Every time you discover a new convention or preference, add it to CLAUDE.md. Every time you catch a recurring mistake, write a rule or hook. Your setup compounds over time.
