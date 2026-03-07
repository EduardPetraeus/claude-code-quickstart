# Git Workflow Rules

## Branching

- ALWAYS work in feature branches — never commit directly to main
- Branch naming: `feature/<description>`, `fix/<description>`, `docs/<description>`
- Never merge to main without code review
- Never push to main without explicit permission

## Commits

- Conventional Commits format: `type: description`
  - `feat:` — new feature
  - `fix:` — bug fix
  - `docs:` — documentation only
  - `refactor:` — code change that neither fixes a bug nor adds a feature
  - `test:` — adding or updating tests
  - `chore:` — maintenance tasks
- Keep commits small and focused — one logical change per commit
- Write descriptive messages that explain WHY, not just WHAT
- Never skip pre-commit hooks (`--no-verify`)
- Prefer `git add <specific-file>` over `git add -A`

## Pull Requests

- One feature/fix per PR
- PR description should include: what changed, why, and how to test
- All checks must pass before merging
