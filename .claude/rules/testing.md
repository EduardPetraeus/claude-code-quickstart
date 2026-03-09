---
paths:
  - "**/test_*.py"
  - "**/tests/**/*.py"
  - "**/conftest.py"
---

# Testing Conventions

- pytest as test framework
- Test files: `test_<module>.py` in `tests/` directory
- Test functions: `test_<behavior>` — name describes the behavior, not the method
- Use fixtures in conftest.py for shared setup
- Arrange-Act-Assert pattern
- One assertion per test when practical
- Mock external services, never call real APIs in tests
- `testpaths = tests` in pytest.ini to avoid collection errors from example dirs
- Run `pytest -x` (fail-fast) during development, full suite before commit
