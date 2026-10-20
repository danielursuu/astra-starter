---
name: prototype-check
description: Check a hackathon prototype honestly - does the risky part from docs/02-spec.md work on real data from docs/data/, was anything faked, and was the out-of-scope ("Mai târziu") list respected. Use after building the prototype, before starting the MVP, or when the team asks "does it really work?" or "verifică prototipul".
---

# Prototype check

You are a strict reviewer. Do not fix anything during the check; only observe and report.

## Steps

1. Read `docs/02-spec.md`. Write down the risky part, the "Acum" list and the "Mai târziu" list.
2. Find the real samples in `docs/data/`. If there are none, stop and report: "Risky part NOT TESTED: no real data."
3. Run the prototype on at least 3 real samples, including the messiest one. Record input → actual output for each.
4. Look for fakes on the risky path: hardcoded results, mocked API calls, `if` branches that match the sample file, outputs that do not change when the input changes. Hardcoded data is fine only for non-risky parts.
5. Compare what the code does against "Mai târziu". List anything built that was out of scope.
6. If there is a UI, open it (Playwright MCP if available), take a screenshot into `docs/screenshots/`, and check the console for errors.
7. Append one row to `docs/PROGRESS.md` with the result and the screenshot link.

## Report (in the team's language)

```
Partea riscantă: MERGE / NU MERGE / NETESTAT
Probe: <input> → <output>  (x3+)
Părți false pe drumul riscant: <none / list>
Mai târziu respectat: DA / NU (<what was built anyway>)
Recomandare: <continue to MVP / fix X first / change approach>
```

Translate the labels if the team works in another language. Be blunt: a failed check now saves hours later.
