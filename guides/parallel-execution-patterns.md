# Parallel Execution Patterns

> Strategies for running multiple AI agents concurrently on independent tasks.

---

## Pattern: Parallel Cross-Repo Agent Execution

**When:** Multiple independent tasks across different repos or directories with no cross-dependencies.

**Setup:**
1. Read mandatory context files (CLAUDE.md, STATUS.md, relevant configs)
2. Verify repo state: `git branch`, `git status`, key files
3. Pre-read critical files that agents will need (APIs, configs, test structure)
4. Launch N agents with `run_in_background: true` in a single message (parallel dispatch)
5. Each agent gets: repo path, branch name, step-by-step instructions, acceptance criteria, validation commands
6. Wait for completion notifications — don't poll
7. Review results, fix issues, merge

**Prompt template for agents:**
- "You are Agent X working in REPO at: /full/path"
- "ALL content MUST be in English" (public repo rule)
- Branch name, exact steps, file content/snippets, validation commands
- "Do NOT merge to main — just create the PR"

## Pattern: Wave Execution

**When:** Tasks have dependencies between groups but independence within groups.

**Setup:**
1. Group tasks into waves based on dependencies
2. Wave 1: all independent foundation tasks (parallel)
3. Verify Wave 1 results — all green before proceeding
4. Wave 2: tasks that depend on Wave 1 (parallel within wave)
5. Repeat until all waves complete

**Key insight:** Never mix waves. Verify between each wave. A failed Wave 1 task blocks its dependent Wave 2 tasks.

## Pattern: Test Pipeline

**When:** Running multiple test types after code changes.

**Setup:**
1. Detect what changed: `git diff --name-only`
2. Launch appropriate test agents based on changed file types:
   - **unit-tester** — always (functions in isolation)
   - **regression-tester** — always (full existing suite)
   - **data-tester** — if data/pipeline/SQL files changed
   - **integration-tester** — if API/service files changed
   - **uat-tester** — if CLI/UI/output files changed
3. All agents run in parallel — no dependencies between test types
4. Collect results, fix failures, re-run if needed

## Learnings

- 4-6 parallel agents complete in ~3-4 min wall clock — massive speedup
- Always pre-read files the agents will reference (don't trust agents to find them)
- Review results by reading diffs, checking test output, then fix issues before merge
- Lint/format fixes are often needed when agents write code without your linter running
- Keep agent prompts self-contained — include all context in the prompt itself
