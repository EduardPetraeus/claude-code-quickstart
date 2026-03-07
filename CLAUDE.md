# CLAUDE.md — Your Project

<!-- This file is loaded automatically every time Claude Code starts a session.
     It is your project's "brain" — conventions, rules, and context that make
     Claude work better for YOUR specific project.

     Keep it under 200 lines. If it grows beyond that, extract details into
     .claude/rules/ files and reference them here.

     CUSTOMIZE: Replace everything in < angle brackets > with your values. -->

## Project Context

<!-- CUSTOMIZE: What is this project? 3-5 lines max. -->

- **Repo:** <your-project-name>
- **Purpose:** <one-line description of what this project does>
- **Stack:** <e.g., Python 3.12, FastAPI, PostgreSQL>
- **Status:** <e.g., v0.1, MVP, production>

## Language

- All code, comments, docstrings, and variable names in English
- All documentation and markdown in English
<!-- CUSTOMIZE: Add your spoken language preference for conversations, e.g.: -->
<!-- - Respond in Danish / Swedish / German in conversations -->

## Code Style

<!-- CUSTOMIZE: Adjust these to match your team's conventions. -->

- `snake_case` for variables, functions, and modules
- `PascalCase` for classes
- `kebab-case` for file and directory names
- Prefer explicit over implicit — no magic abbreviations
- See `.claude/rules/code-style.md` for full details

## Git Workflow

- Feature branches only — never commit directly to main
- Conventional Commits format: `feat:`, `fix:`, `docs:`, `refactor:`, `test:`
- Small, focused commits with descriptive messages
- See `.claude/rules/git-workflow.md` for full details

## Session Protocol

### Start

1. Read this CLAUDE.md
2. Read STATUS.md if it exists (picks up where last session left off)
3. Confirm scope before making changes

### During

- Stay within agreed scope — do not refactor unrelated code
- Prefer editing existing files over creating new ones
- Run tests before committing
- Ask before installing new dependencies

### End

- Summarize what was done and what remains
- Update STATUS.md with handover notes
- See `.claude/rules/session-discipline.md` for format

## Security

- Never commit secrets, API keys, tokens, or passwords
- Never run destructive commands (force push, reset --hard) without approval
- Flag any file that looks like it contains PII or credentials

## Quality

<!-- CUSTOMIZE: Set your quality bar. Remove what doesn't apply. -->

- New code should have tests
- Linter must pass before committing
- No TODO comments without a linked issue
- Documentation updated alongside code changes

## Project-Specific Rules

<!-- CUSTOMIZE: Add rules unique to your project. Examples: -->
<!-- - Database migrations require manual review before applying -->
<!-- - API endpoints must follow REST conventions in docs/api-guide.md -->
<!-- - All new components need Storybook stories -->
