# Multi-AI Adversarial Review — Playbook

> Send your code to multiple AI models for independent, critical review. Different architectures catch different bugs.

---

## The Approach

No single AI should both build and review. Send your code or framework to 5 different AI models, each with a different review focus. Collect findings, prioritize, and fix.

## Recommended AI Models

| AI | Best For | Access |
|----|----------|--------|
| Claude | Architecture, nuance, long context | claude.ai / API |
| Gemini | Structural analysis, inconsistency detection | gemini.google.com / API |
| ChatGPT | Alternative architectures, concrete suggestions | chat.openai.com |
| Grok | Contrarian takes, hype detection | grok.com |
| DeepSeek | Code-level bugs, security review | chat.deepseek.com |
| Perplexity | Research gaps, competitive analysis | perplexity.ai |

## Review Prompts by Focus Area

### 1. Logical Holes and Contradictions (Gemini)

```
You are a senior systems architect reviewing [YOUR PROJECT]. Your job is to DESTROY the arguments. Find every logical hole, every internal contradiction, every claim that doesn't hold up.

I need you to attack these areas:
1. INTERNAL CONTRADICTIONS — where do claims conflict with each other?
2. UNSUPPORTED CLAIMS — what assertions lack evidence?
3. MISSING CONSIDERATIONS — what blind spots exist?

Format: CRITICAL FLAWS, LOGICAL CONTRADICTIONS, UNSUPPORTED CLAIMS, MISSING CONSIDERATIONS, WHAT ACTUALLY WORKS
```

### 2. Architectural Alternatives (ChatGPT)

```
You are a principal engineer evaluating [YOUR PROJECT]. Provide a brutally honest architectural review.

Cover:
1. ARCHITECTURE CRITIQUE — is each component necessary? What would you do differently?
2. ADOPTION BARRIER — is it too complex? What's the minimum viable version?
3. COMPETITIVE POSITIONING — what value does this add over simpler alternatives?
4. WHAT I WOULD STEAL — what ideas are genuinely original and worth copying?

End with: "If I had 1 week to make this 10x better"
```

### 3. Hype Detection (Grok)

```
I built [YOUR PROJECT] and I need you to tell me what's bullshit. Not polite feedback — find what's overhyped, what's buzzword soup, what would make a senior engineer roll their eyes.

1. BUZZWORD AUDIT — is each concept genuinely useful or just a fancy name for something obvious?
2. OVER-ENGINEERING TEST — what percentage would a real team actually use?
3. THE "WHO ASKED FOR THIS" TEST — who is the actual user?
4. THE REAL VALUE — what's the 10% that delivers 90% of the value?
```

### 4. Code Review and Bugs (DeepSeek)

```
You are a senior developer. Review the code quality of [YOUR PROJECT]. Focus exclusively on executable code.

For each file:
A. BUGS — logic errors, unhandled exceptions, race conditions
B. SECURITY ISSUES — injection risks, secret exposure, input validation
C. CODE QUALITY — best practices, type hints, error handling
D. TEST COVERAGE — are tests meaningful? What's NOT tested that should be?

Format: file-by-file findings with severity (CRITICAL/HIGH/MEDIUM/LOW)
```

### 5. Research Gaps (Perplexity)

```
I've built [YOUR PROJECT]. Before the next release, I need to know what I've missed.

Research:
1. ACADEMIC RESEARCH — what papers exist on this topic?
2. INDUSTRY FRAMEWORKS — what have major companies published?
3. COMPETING PROJECTS — what similar projects exist on GitHub?
4. KNOWN FAILURE MODES — any published post-mortems?
5. EMERGING STANDARDS — what new standards are forming?

For each finding: what it is, why it matters, what action to take.
```

## Workflow

1. Open all AI platforms in separate browser tabs
2. Post all prompts — they run in parallel
3. Collect results in a single findings document
4. Prioritize: CRITICAL → HIGH → MEDIUM → LOW
5. Create issues or tasks from actionable findings
6. Fix critical items before next release

**Estimated time:** ~30 min to post, ~1-2 hours to read and synthesize results.
