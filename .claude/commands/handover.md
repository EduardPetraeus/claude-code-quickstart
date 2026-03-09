Write a structured session handover for the current repo.

## Instructions

1. Detect which repo we're in based on the current working directory.

2. Write the handover to `STATUS.md` in the project root.

3. Use this template:

   ```
   ## Session Handover — YYYY-MM-DD

   ### Done
   - [bullet list of completed work this session]

   ### Next Step
   - [single most important next action]

   ### Files Changed
   - [list of modified files with brief description]

   ### Decisions Made
   - [key decisions with brief rationale]

   ### Blockers / Open Questions
   - [anything unresolved, or "None"]
   ```

4. If STATUS.md already exists, append the new handover at the top of the file (after any frontmatter). If it doesn't exist, create it.

5. Confirm: print which file was written and a one-line summary.

## Rules
- This is the agent's job — do not ask the human to fill in the template.
- Review the session context (files changed, git diff, conversation) to populate the template.
- Keep each section to 1-5 bullets. Brevity over completeness.
- All content in English (it goes into the repo).
- If there's nothing meaningful to hand over, say so and skip writing.
