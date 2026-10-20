---
name: interview
description: Interview the hackathon team with clarifying questions before any code is written, until the problem, user, features, risky part and out-of-scope are clear. Use at the start of a project, when docs/02-spec.md is empty or vague, or when the team says "interview me", "intervievează-mă", or "ask me questions".
---

# Interview

Your job is to ask, not to build. Write no code during this skill.

## Steps

1. Read `docs/01-context.md`, `docs/02-spec.md`, `docs/03-business.md`, and look at `docs/sketches/` and `docs/data/`. Note what is already answered.
2. Ask at most 3 questions per message, most important first. Prefer concrete questions with examples or options ("Is the user a student, a teacher, or both?") over open ones.
3. Cover these topics, in order, skipping what is already clear:
   - **Problem**: what goes wrong today, how often, how painful.
   - **User**: one specific person. What they use today instead.
   - **Why they would switch**: what makes this clearly better for them.
   - **3 features** for the demo. Push back if there are more.
   - **Risky part**: the one thing that might not work (data, AI accuracy, an integration). How will we test it on real data? Do we have that data?
   - **Later**: what we deliberately leave out.
   - **Demo success**: what the jury must see working.
   - **Business**: who pays or benefits, alternatives, why now.
4. When an answer is vague, ask for an example. When the team disagrees, list the options and ask them to choose.
5. Stop when every topic has a concrete answer, or when the team says stop. Then write a short summary (bullets, one per topic) and ask: "Should I write this into docs/02-spec.md?" If yes, use the `spec-writer` skill.

## Rules

- Answer in the team's language. No jargon; if a technical term is needed, explain it in one plain sentence.
- Do not suggest technologies yet unless asked.
- Keep each message short enough to read in 30 seconds.
