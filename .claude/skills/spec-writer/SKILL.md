---
name: spec-writer
description: Turn the team's context (docs/01-context.md, sketches, data samples, interview answers) into a one-page spec in docs/02-spec.md, and fill gaps in docs/03-business.md. Use after the interview, when the team asks to "write the spec", "scrie specs", or before starting the prototype.
---

# Spec writer

## Steps

1. Read `docs/01-context.md`, `docs/03-business.md`, the current `docs/02-spec.md`, `docs/sketches/`, `docs/data/`, and the interview summary in this conversation.
2. Fill `docs/02-spec.md`, keeping its headings. Write in the team's language.
3. Fill only the empty parts of `docs/03-business.md` that the context answers. Leave the rest empty; do not invent numbers.
4. Show the team a 5-line summary and list every assumption you made. Ask them to confirm or correct.
5. Commit: `docs: write spec`.

## Rules

- One page. If it does not fit, it is not a spec yet; move things to "Mai târziu".
- Exactly 3 features under "Acum", each written as what the user can do ("The user uploads a photo and sees ..."), not as technology.
- The risky part is one sentence, plus how it will be tested and on which file in `docs/data/`.
- Success criteria must be visible in a 3-minute demo ("the jury sees X happen in under Y seconds").
- Mark anything you inferred rather than heard with "(presupunere)" or the equivalent in the team's language.
- No technology choices in the spec unless the team already decided them.
