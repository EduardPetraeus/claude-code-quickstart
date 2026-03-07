# Code Style Rules

## Naming Conventions

| Element | Convention | Example |
|---|---|---|
| Variables | `snake_case` | `user_name`, `total_count` |
| Functions | `snake_case` | `get_user()`, `calculate_total()` |
| Classes | `PascalCase` | `UserAccount`, `DataProcessor` |
| Constants | `UPPER_SNAKE_CASE` | `MAX_RETRIES`, `API_BASE_URL` |
| Files/dirs | `kebab-case` | `data-loader.py`, `test-utils/` |
| Modules | `snake_case` | `data_loader`, `test_utils` |

## General Principles

- Explicit over implicit — avoid magic abbreviations
- Readable code over clever code
- Consistent formatting — use your language's standard formatter
  - Python: `ruff format` (or `black`)
  - JavaScript/TypeScript: `prettier`
  - Go: `gofmt`
- One responsibility per function — if it needs "and" in the name, split it
- Comments explain WHY, not WHAT — the code should explain what it does

## Python Specific

- Type hints on public function signatures
- Docstrings on public functions and classes
- No `print()` in library code — use `logging`
- f-strings over `.format()` or `%` formatting

## TypeScript Specific

- Prefer `const` over `let`, never use `var`
- Use strict TypeScript (`strict: true` in tsconfig)
- Prefer interfaces over type aliases for object shapes
- Use named exports over default exports
