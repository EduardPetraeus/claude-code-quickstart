# Prompt Skeleton

Fill in the 5 fields. Skip any that aren't relevant. The order matters — context before ask.

---

## The Template

```
CONTEXT: [What's the situation? 1-2 sentences. What exists today, what triggered this.]

GOAL: [What do you want to walk away with? Be specific. Not "help me with X" but "give me a concrete plan for X".]

CONSTRAINTS: [What's off the table? Budget, time, tech, scope limits. Also: what must NOT change.]

FORMAT: [How do you want the answer? Bullet list, table, code, plan with steps, pros/cons, one clear recommendation.]

PERSPECTIVE: [Optional. What hat should the AI wear? "Think as a growth hacker" / "Answer as a senior data engineer" / "Be brutally honest".]
```

---

## Example — Good vs Bad

**Bad:**
"I want to make a new SaaS. What do you think?"

**Good:**
```
CONTEXT: I'm a solo developer with a data engineering background. I have 10 hours/week for side projects. I already have an AI governance CLI tool with 38 tests.

GOAL: Give me 3 concrete micro-SaaS ideas that leverage my existing skills and codebase. For each: target customer, pricing model, and what I could ship in 2 weeks.

CONSTRAINTS: No mobile apps. No ideas requiring paid ads to acquire customers. Must be possible as a solo dev.

FORMAT: Table with columns: Idea | Customer | Price | 2-week MVP scope | Why it could work.

PERSPECTIVE: Think as an indie hacker who has shipped 5+ profitable products.
```

---

## Techniques

Six ways to get better output — use alongside the template when relevant.

1. **Show examples.** If you want a specific style/format, include a sample. One good example beats a paragraph of explanation.
2. **Ask for step-by-step thinking.** For complex reasoning, add "think through this step-by-step" or structure the steps yourself. Reduces missed logic.
3. **Iterate with precision.** Don't say "make it better." Say what to change: "make the tone more casual, shorten paragraph 2, add a customer example."
4. **Specify audience and tone.** "For non-technical small business owners, casual and actionable" gives the AI guardrails that generic prompts lack.
5. **Define structure upfront.** Provide an outline, list sections, or name the columns you want. The AI follows your structure instead of inventing one.
6. **Allow uncertainty.** Add "if you're unsure, say so" to reduce hallucination. Better an honest gap than a confident fabrication.

---

## Quick Version (for small asks)

When the full template is overkill, just nail these two:

```
I want [SPECIFIC OUTPUT] because [WHY / WHAT IT'S FOR].
```

"Give me a migration script for the users table — we're adding a status column, and it needs to be backwards compatible with the current API."

vs.

"Help me with a database migration."

---

## The One Rule

**Specificity beats length.** A 2-line prompt with a clear goal beats a 20-line prompt with vague intent. If you can't state the goal in one sentence, you haven't thought enough yet — and that's the real signal to slow down.
