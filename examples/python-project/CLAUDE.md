# CLAUDE.md — Python Data Project

## Project Context

- **Repo:** data-pipeline
- **Purpose:** ETL pipeline that ingests CSV/JSON data, transforms it, and loads into PostgreSQL
- **Stack:** Python 3.12, pandas, SQLAlchemy, pytest
- **Status:** v0.2 — MVP with basic pipeline

## Language

- All code, comments, and docs in English

## Code Style

- `snake_case` for variables, functions, modules
- `PascalCase` for classes
- `snake_case` for file names (Python modules must be importable)
- `kebab-case` for non-Python directories
- Type hints on all public function signatures
- Docstrings on all public functions (Google style)
- No `print()` — use `logging` module
- f-strings for string formatting
- `ruff` for formatting and linting

## Git Workflow

- Feature branches only — never commit to main directly
- Conventional Commits: `feat:`, `fix:`, `refactor:`, `test:`
- Run `pytest` before every commit

## Architecture

- Medallion pattern: `bronze/` (raw) → `silver/` (cleaned) → `gold/` (aggregated)
- Config in YAML files (`config/`)
- One module per pipeline stage
- SQL for transformations where possible, Python for orchestration

## Testing

- pytest with fixtures in `conftest.py`
- Test naming: `test_<function_name>_<scenario>`
- Minimum: one test per public function
- Use `tmp_path` fixture for file operations

## Security

- Never commit `.env` files or credentials
- Database connection strings via environment variables only
- No hardcoded file paths — use `pathlib.Path` relative to project root
