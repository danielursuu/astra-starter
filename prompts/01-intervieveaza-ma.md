# 1. Intervievează-mă (Context)

Când: la început, înainte de orice cod. Porniți agentul în plan mode (Claude Code: `Shift+Tab` de două ori; Codex: `/plan`).

Promptul din prezentare:

```text
Înainte să scrii cod, pune-mi întrebări despre idee, una câte una, cu variante de răspuns. Continuă până înțelegi ce construim acum și ce lăsăm pe mai târziu.
```

Claude Code vă arată fiecare întrebare cu 3–4 variante (unealta lui de întrebări, `AskUserQuestion`): alegeți cu săgețile și Enter sau apăsați cifra. Ultima variantă vă lasă să scrieți alt răspuns. Celelalte unelte pun întrebările în chat; răspundeți cu numărul variantei sau cu cuvintele voastre.

Varianta lungă, care folosește și fișierele din dosar:

```text
Citește AGENTS.md și tot ce e în docs/. Nu scrie cod.
Folosește skill-ul interview: pune-ne întrebări despre idee, una câte una,
cu variante de răspuns, până când sunt clare problema, utilizatorul, de ce
l-ar folosi, 3 funcții, partea riscantă și ce lăsăm pe mai târziu.
Ideea noastră, pe scurt: <scrieți aici 2–3 propoziții>
Completează docs/01-context.md cu ce afli pe parcurs.
```

După 10–15 întrebări, treceți la `prompts/03-spec.md`: agentul scrie specs pe o pagină.
