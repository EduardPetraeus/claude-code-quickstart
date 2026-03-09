---
paths:
  - "**/*.py"
---

# Python Conventions

- snake_case for variables, functions, modules
- PascalCase for classes
- UPPER_SNAKE_CASE for constants
- Use `from __future__ import annotations` for Python <3.10 compatibility
- Type hints on public functions
- Ruff for linting and formatting (auto-enforced by hook)
- `errors="ignore"` on file reads in analyzers to handle encoding issues
