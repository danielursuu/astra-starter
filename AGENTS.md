# AGENTS.md

Project memory for any coding agent (Claude Code, Codex, Cursor, Antigravity, OpenCode, GitHub Copilot, Devin, Pi). Read it fully before acting.

## Situation

- This is a 24-hour hackathon project (Astra Hack). The goal is an MVP a jury can see working.
- The team is mixed: some members do not program. Explain choices in plain words.
- Method: Context → Specs → Prototype → MVP. Know which step the team is in (check `docs/PROGRESS.md`); if unclear, ask.

## Language

- Answer the team in the language they write to you in (often Romanian, with correct diacritics: ă â î ș ț).
- The first time you use a technical term, add a short plain explanation or analogy.
- Code, identifiers and commit messages stay in English. Docs in `docs/` stay in the team's language.

## Before writing any code

1. Read `docs/` first: `01-context.md`, `02-spec.md`, `03-business.md`, `PROGRESS.md`. Look at `docs/sketches/` and `docs/data/`.
2. If `docs/02-spec.md` is empty, vague, or contradicts the context, run the `interview` skill. Ask questions; do not code. Ask one question at a time with answer options. If your tool has a question tool (Claude Code: `AskUserQuestion`), use it; otherwise ask in chat with numbered options.
3. For anything bigger than a small fix, propose a plan and wait for approval before changing files. The plan says what you will do, in what order, and which files you will touch. If the tool is in plan mode (Claude Code: Shift+Tab twice or `--permission-mode plan`; Codex: `/plan`), stay in it until the team approves.

## Scope

- Build only what is listed under "Acum" (Now) in `docs/02-spec.md`.
- "Mai târziu" (Later) is out of scope. Do not build it, even if it is easy.
- If the team asks for something new, ask whether it replaces an existing "Acum" item or goes to "Mai târziu". Update the spec accordingly.

## Prototype rules

- A prototype answers one question: does the risky part (named in the spec) work?
- Allowed: plain UI, hardcoded data for the non-risky parts, terminal-only output.
- Keep prototype code throwaway and clearly named as a prototype. The `prototype` skill helps when the question is "does this logic work?" or "what should this screen look like?".
- Not allowed: faking the risky part. Run it on the real samples in `docs/data/`. If there are none, ask the team for real data before building.
- Report honestly what worked and what failed, with concrete input → output examples. Use the `prototype-check` skill.

## MVP rules

- Reuse before building: shadcn/ui for interface components (use the `shadcn` skill), well-known libraries, official templates. See `docs/stack-mvp.md`.
- Polish the UI only after the main path works end to end; use the `impeccable` skill for that.
- Licenses: MIT, Apache-2.0, BSD, ISC are fine. GPL, AGPL, LGPL, SSPL, "non-commercial", or no license: stop and flag it to the team before adding.
- Get one main path working end to end before adding a second feature.
- Before using a library API you are unsure about, check current docs (Context7 MCP if available).

## Working habits

- Commit small: one logical change per commit, clear message, commit whenever something works. Never push unless the team asks.
- Verify by running and looking, not just compiling: start the app, open it (Playwright MCP if available), click through the main path, check the console, and save a screenshot to `docs/screenshots/`.
- After each working milestone, append a row to `docs/PROGRESS.md` (time, what works, screenshot link).
- If the same error happens twice, stop, explain it simply, and offer 2–3 options.
- When you split work across subagents or parallel agents (`scripts/parallel.sh`), act as the orchestrator: give each one a small, clear task and only the context it needs, collect the results, and show them to the team for review before merging.

## Secrets and data

- API keys live only in `.env` (ignored by git). Never write keys into code, docs, logs, or commits. Never print them.
- `docs/data/` must not contain personal data of real people unless the team confirms it is anonymized.

## Available helpers

- Skills in `.claude/skills/` (mirrored at `.agents/skills/`):
  - `interview`, `spec-writer`, `prototype-check`: written for this method.
  - `prototype` (mattpocock/skills): a throwaway prototype that answers one question.
  - `impeccable` (pbakaus/impeccable): make the UI look good and polish it.
  - `shadcn` (shadcn-ui/ui): build the MVP interface from ready-made shadcn/ui components.
- Do not edit the three external skills; they are pinned in `skills-lock.json` and restored with `npx skills experimental_install`.
- MCP servers: `playwright` (browser testing, screenshots), `context7` (up-to-date library docs).
