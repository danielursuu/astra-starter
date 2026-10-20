# Astra Starter

Un dosar de pornire pentru echipele de la **Astra Hack** (24 de ore, 6–7 noiembrie 2026, Sibiu; teme: AI, securitate cibernetică, sustenabilitate).

Scopul: în 24 de ore să ajungeți la un **MVP** (prima versiune care chiar merge și poate fi arătată unui utilizator) pe care juriul să îl vadă funcționând.

Lucrați cu un **agent AI** (Claude Code, Codex, Cursor, Antigravity, OpenCode). Un agent seamănă cu un coleg nou, foarte rapid, care nu știe nimic despre proiect până nu îi explicați. Dosarul de față îi explică: ce construiți, pentru cine și ce **nu** construiți.

Aici găsiți varianta „80/20” a unui mod de lucru real: puține fișiere, ușor de pornit, rezolvă cea mai mare parte a problemei. Nu e nevoie ca toată echipa să programeze.

## Ce găsiți aici

| Fișier | La ce folosește |
|---|---|
| `docs/01-context.md` | Ideea, schița, utilizatorii, problema, date reale |
| `docs/02-spec.md` | Planul pe o pagină: ce construim acum și ce lăsăm pe mai târziu |
| `docs/03-business.md` | Cine plătește sau câștigă, de ce acum, ce impact are |
| `docs/PROGRESS.md` | Jurnalul de progres, cu ora și o captură de ecran |
| `docs/PITCH.md` | Prezentarea de 60 de secunde și lista pentru demo |
| `prompts/` | Mesaje gata de copiat pentru agent, câte unul pentru fiecare pas |
| `AGENTS.md` | Memoria proiectului: regulile pe care agentul le citește la fiecare pornire |
| `.claude/skills/` | Trei „rețete” pentru agent (vezi mai jos) |
| `.mcp.json` | Două unelte în plus pentru agent (vezi mai jos) |
| `scripts/parallel.sh` + `tasks/` | Doi sau trei agenți care lucrează în același timp, fiecare pe o sarcină |
| `docs/ieftin.md` | Cum lucrați cu modele mai ieftine |
| `docs/stack-mvp.md` | Tehnologii recomandate pentru un MVP rapid |

## Metoda în 4 pași

Codul a devenit ieftin. Claritatea e scumpă. Fiecare pas răspunde la o întrebare de business.

| Pas | Întrebarea | Ce faceți | Când (din 24h) |
|---|---|---|---|
| 1. Context | De ce? | Schiță, brainstorming, utilizatori, date reale | 0–2h (împreună cu pasul 2) |
| 2. Specs | Ce anume? | O pagină: problemă, utilizator, 3 funcții, ce lăsăm pe mai târziu | 0–2h |
| 3. Prototip | Merge? | Testați **partea riscantă** pe date reale | 2–6h |
| 4. MVP | Contează pentru cineva? | Construiți drumul principal, cap-coadă | 6–18h |
| — | — | Finisare, demo, pitch | 18–24h |

- **Context** (briefing-ul pentru colegul nou). Agentul e la fel de bun ca briefing-ul vostru. Nu îi cereți cod; cereți-i întrebări.
- **Specs** (planul casei înainte de cărămizi). O singură pagină. Tot ce nu intră în „Acum” merge la „Mai târziu”.
- **Prototip** (macheta arhitectului). Răspunde la o singură întrebare: merge partea grea? Datele „de decor” pot fi scrise de mână, dar partea riscantă se testează pe date reale.
- **MVP** (food truck înainte de restaurant). Folosiți piese gata făcute, ca LEGO: componente open-source și shadcn/ui. Nu reinventați butoane și formulare.

## Pornire în 3 comenzi

Instalați o singură unealtă, apoi:

```bash
git clone https://github.com/danielursuu/astra-starter.git echipa-mea
cd echipa-mea
claude        # sau: codex · agent · agy · opencode
```

| Unealta | Instalare | Pornire |
|---|---|---|
| Claude Code | [code.claude.com/docs](https://code.claude.com/docs) | `claude` |
| Codex (OpenAI) | `npm install -g @openai/codex` | `codex` |
| Cursor | aplicația de pe [cursor.com](https://cursor.com) sau `curl https://cursor.com/install -fsS \| bash` | deschideți dosarul în Cursor sau rulați `agent` |
| Antigravity (Google) | `curl -fsSL https://antigravity.google/cli/install.sh \| bash` | `agy` |
| OpenCode | `curl -fsSL https://opencode.ai/install \| bash` | `opencode` |

Pe GitHub puteți apăsa și **Use this template** ca să aveți propria copie a dosarului, fără istoricul nostru.

Primul mesaj către agent: deschideți `prompts/01-intervieveaza-ma.md`, copiați textul și lipiți-l.

## Obiceiul care contează: jurnalul de progres

La fiecare 2–3 ore, sau ori de câte ori ceva nou merge, adăugați un rând în `docs/PROGRESS.md`: ora, ce funcționează, link la o captură de ecran din `docs/screenshots/`. Agentul e instruit să facă asta singur, dar verificați.

De ce: la final aveți povestea proiectului gata scrisă pentru pitch, iar juriul vede progresul real, nu promisiuni.

## Skills și MCP, pe scurt

**Skills** sunt rețete: o procedură scrisă o singură dată, pe care agentul o urmează când e nevoie. Fiecare e un dosar cu un fișier `SKILL.md`. Aveți trei:

- `interview` pune echipei întrebări până când ideea e clară.
- `spec-writer` transformă contextul în `docs/02-spec.md`.
- `prototype-check` verifică dacă partea riscantă merge pe date reale și dacă ați respectat ce ați lăsat pe mai târziu.

Rețetele stau în `.claude/skills/`. `.agents/skills/` e o scurtătură (symlink) către același dosar, ca să le găsească și Codex, Cursor, Antigravity și OpenCode. Pe Windows, dacă scurtătura nu funcționează, copiați dosarul `.claude/skills` în `.agents/skills`.

**MCP** e o priză universală: conectează agentul la o unealtă externă. `.mcp.json` conține doar două (fișierele JSON nu acceptă comentarii, de aceea explicația e aici):

- `playwright` (pachetul `@playwright/mcp`) deschide un browser, dă click, face capturi de ecran. Agentul își verifică singur aplicația „cu ochii”.
- `context7` (pachetul `@upstash/context7-mcp`) aduce documentația la zi a bibliotecilor, ca agentul să nu scrie cod după versiuni vechi. Merge și fără cont; cu o cheie gratuită de pe context7.com primiți limite mai mari.

Claude Code citește `.mcp.json` direct și vă cere aprobarea la prima pornire. Pentru celelalte unelte, adăugați aceleași două servere:

| Unealta | Cum |
|---|---|
| Codex | `codex mcp add playwright -- npx @playwright/mcp@latest` și `codex mcp add context7 -- npx -y @upstash/context7-mcp` |
| Cursor | copiați conținutul `.mcp.json` în `.cursor/mcp.json` |
| Antigravity | copiați conținutul `.mcp.json` în `.agents/mcp_config.json` |
| OpenCode | secțiunea `mcp` din `opencode.json` ([documentație](https://opencode.ai/docs/mcp-servers/)) |

Mai multe servere nu înseamnă un agent mai bun: fiecare ocupă loc în atenția lui. Două ajung.

## Mai mulți agenți în paralel

Când specs sunt clare, puteți împărți munca: fiecare sarcină într-un fișier din `tasks/`, apoi

```bash
scripts/parallel.sh --tool claude tasks/ecran-principal.md tasks/import-date.md
```

Scriptul creează câte o copie de lucru separată (**git worktree**, ca niște birouri separate în aceeași clădire) și pornește câte un agent în fiecare. Rulați `scripts/parallel.sh --help` pentru detalii. Începeți cu un singur agent; treceți la paralel doar după ce prototipul merge.

## Modele mai ieftine

Nu aveți abonament? Vedeți `docs/ieftin.md`: GLM și Kimi în Claude Code, OpenRouter în OpenCode, Google AI Plus gratuit pentru studenți. O metodă bună cu un plan ieftin bate un model scump folosit fără plan.

## Reguli scurte pentru echipă

1. Nu cereți cod înainte ca `docs/02-spec.md` să fie completat.
2. Arătați prototipul la 5 oameni care nu sunt colegii voștri.
3. Salvați des: commit-uri mici (un commit e un punct de salvare, ca într-un joc).
4. Nu puneți niciodată chei API în cod sau în git. Ele stau în `.env`, care e ignorat de git.
5. Demo-ul se repetă de 3 ori înainte de prezentare și are un plan B.

## Linkuri

- Astra Hack (6–7 noiembrie 2026, Sibiu Innovation Week): https://innovationweek.ro/hackathon · înscrieri: https://forms.gle/mmnhKAbYMUZDKAcL9
- Claude Code: https://code.claude.com/docs
- Codex: https://developers.openai.com/codex
- Cursor: https://cursor.com/docs
- Antigravity: https://antigravity.google/docs
- OpenCode: https://opencode.ai/docs
- Standardul AGENTS.md: https://agents.md
- Standardul Agent Skills: https://agentskills.io
- shadcn/ui: https://ui.shadcn.com
- Playwright MCP: https://github.com/microsoft/playwright-mcp
- Context7: https://github.com/upstash/context7

## Licență

MIT, © 2026 Daniel Ursu. Folosiți, copiați, modificați liber.
