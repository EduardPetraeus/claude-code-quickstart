# Claude Code Cheat Sheet

## Keyboard Shortcuts

| Shortcut | Action |
|---|---|
| `Enter` | Send message |
| `Esc` | Stop generation |
| `Shift+Tab` | Cycle modes: Normal > Auto-Accept > Plan |
| `Ctrl+L` | Hard stop current operation |
| `Ctrl+R` | Search command history |
| `Ctrl+E` | Open external editor (long prompts) |
| `Ctrl+C` | Exit Claude Code |

## Slash Commands

| Command | What It Does |
|---|---|
| `/init` | Generate a starter CLAUDE.md |
| `/clear` | Reset conversation (fresh start) |
| `/compact` | Compress context to save tokens |
| `/undo` | Undo last code change |
| `/config` | Open settings |
| `/cost` | Show token usage |
| `/review` | Code review analysis |

## CLI Flags

| Flag | What It Does |
|---|---|
| `claude` | Start interactive session |
| `claude "prompt"` | Start with a prompt |
| `claude -c` | Continue last conversation |
| `claude -p "query"` | Print mode (answer and exit) |
| `claude --model <id>` | Use a specific model |

## Permission Modes

| Mode | Behavior | Use When |
|---|---|---|
| **Plan** | Think only, no code changes | Starting a task, reviewing approach |
| **Normal** | Asks permission for each action | Standard work |
| **Auto-Accept** | Runs freely without asking | Trusted execution, large tasks |

Toggle with `Shift+Tab`.

## File Structure

```
your-project/
  CLAUDE.md                  # Project memory (loaded every session)
  .claude/
    settings.json            # Hooks, permissions, config
    rules/                   # Topic-specific instructions
      git-workflow.md
      code-style.md
    hooks/                   # Automated scripts on events
      protect-main.sh
      auto-lint.sh
    agents/                  # Specialized AI instructions
      code-reviewer.md
```

## Hook Events

| Event | When | Example Use |
|---|---|---|
| `PreToolUse` | Before a tool runs | Block dangerous commands |
| `PostToolUse` | After a tool completes | Auto-format files |
| `Stop` | Claude finishes responding | Run checks |

## Input Tricks

| Input | Effect |
|---|---|
| `@filename` | Reference a file (Claude reads it) |
| Drag & drop | Add files to context |
| Paste screenshot | Claude sees and analyzes images |

## Workflow Quick Reference

```
1. Start in Plan Mode (Shift+Tab)
2. Describe what you want
3. Review Claude's plan
4. Switch to Normal/Auto (Shift+Tab)
5. "Execute the plan"
6. /compact after the feature is done
7. /clear before switching tasks
```
