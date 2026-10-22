# Astra Starter

Un dosar de pornire pentru echipele de la **Astra Hack** (24 de ore, 6–7 noiembrie 2026, Sibiu; teme: AI, securitate cibernetică, sustenabilitate).

Scopul: în 24 de ore să ajungeți la un **MVP** (prima versiune care chiar merge și poate fi arătată unui utilizator) pe care juriul să îl vadă funcționând.

Lucrați cu un **agent AI** (Claude Code, Codex, Cursor, Antigravity, OpenCode, GitHub Copilot, Devin, Pi). Un agent seamănă cu un coleg nou, foarte rapid, care nu știe nimic despre proiect până nu îi explicați. Dosarul de față îi explică: ce construiți, pentru cine și ce **nu** construiți.

Aici găsiți varianta „80/20” a unui mod de lucru real: puține fișiere, ușor de pornit, rezolvă cea mai mare parte a problemei. Nu e nevoie ca toată echipa să programeze.

**Drumul până la hackathon:** 22 oct., prototipare (prezentarea de azi) → până pe 29 oct.: brainstorming și un prototip pe partea riscantă, arătat la 5 oameni → **29 oct., Idea Jam** (trierea ideilor) → 30 oct.–5 nov.: specs pentru MVP → **6–7 nov., Astra Hack**: construiți MVP-ul. Detalii în `docs/hackathon.md`.

## Ce găsiți aici

| Fișier | La ce folosește |
|---|---|
| `docs/01-context.md` | Ideea, schița, utilizatorii, problema, date reale |
| `docs/02-spec.md` | Planul pe o pagină: ce construim acum și ce lăsăm pe mai târziu |
| `docs/03-business.md` | Cine plătește sau câștigă, de ce acum, ce impact are |
| `docs/PROGRESS.md` | Jurnalul de progres, cu ora și o captură de ecran |
| `docs/PITCH.md` | Prezentarea de 60 de secunde și lista pentru demo |
| `docs/metoda.md` | Cei 4 pași pe larg: ce simplificați la prototip, ce refolosiți la MVP |
| `docs/hackathon.md` | Calendarul, cele 24 de ore, ce vede juriul, 4 greșeli de evitat |
| `prompts/` | Mesaje gata de copiat pentru agent, câte unul pentru fiecare pas |
| `AGENTS.md` | Memoria proiectului: regulile pe care agentul le citește la fiecare pornire |
| `.claude/skills/` | Șase „rețete” pentru agent: trei ale noastre, trei externe (vezi mai jos) |
| `skills-lock.json` + `licenses/` | De unde vin rețetele externe și licențele lor |
| `.mcp.json` | Două unelte în plus pentru agent (vezi mai jos) |
| `scripts/parallel.sh` + `tasks/` | Doi sau trei agenți care lucrează în același timp, fiecare pe o sarcină |
| `docs/ieftin.md` | Cum lucrați cu modele mai ieftine |
| `docs/stack-mvp.md` | Tehnologii recomandate pentru un MVP rapid |

## Metoda în 4 pași

Codul a devenit ieftin. Claritatea e scumpă. Fiecare pas răspunde la o întrebare de business.

| Pas | Întrebarea | Ce faceți | Când (din 24h) |
|---|---|---|---|
| 1. Context | De ce? | Schiță, brainstorming, utilizatori, date reale | 0–2h (împreună cu pasul 2) |
| 2. Specs | Ce anume? | O pagină: problemă, utilizator, de ce l-ar folosi, 3 funcții, ce lăsăm pe mai târziu | 0–2h |
| 3. Prototip | Merge? | Testați **partea riscantă** pe date reale | 2–6h |
| 4. MVP | Contează pentru cineva? | Construiți drumul principal, cap-coadă | 6–18h |
| — | — | Finisare, demo, pitch | 18–24h |

- **Context** (briefing-ul pentru colegul nou). Agentul e la fel de bun ca briefing-ul vostru. Nu îi cereți cod; cereți-i întrebări.
- **Specs** (planul casei înainte de cărămizi). O singură pagină. Tot ce nu intră în „Acum” merge la „Mai târziu”.
- **Prototip** (macheta arhitectului). Răspunde la o singură întrebare: merge partea grea? Puteți simplifica interfața, folosi date fixe sau lucra doar în terminal. Partea riscantă nu o falsificați niciodată. Apoi **arătați-l la 5 oameni care nu sunt colegii voștri**.
- **MVP** (food truck înainte de restaurant). Refolosiți piese gata făcute, ca LEGO: shadcn/ui și componente open-source. Licențele MIT și Apache sunt în regulă; la GPL verificați de două ori.

Pe larg, cu exemple: `docs/metoda.md`.

## Pornire în 3 comenzi

Instalați o singură unealtă, apoi:

```bash
git clone https://github.com/danielursuu/astra-starter.git echipa-mea
cd echipa-mea
claude        # sau: codex · agent · agy · opencode · copilot · pi
```

| Unealta | Instalare | Pornire |
|---|---|---|
| Claude Code | [code.claude.com/docs](https://code.claude.com/docs) | `claude` |
| Codex (OpenAI) | `npm install -g @openai/codex` | `codex` |
| Cursor | aplicația de pe [cursor.com](https://cursor.com) sau `curl https://cursor.com/install -fsS \| bash` | deschideți dosarul în Cursor sau rulați `agent` |
| Antigravity (Google) | `curl -fsSL https://antigravity.google/cli/install.sh \| bash` | `agy` |
| OpenCode | `curl -fsSL https://opencode.ai/install \| bash` | `opencode` |
| GitHub Copilot | `npm install -g @github/copilot` ([documentație](https://docs.github.com/en/copilot/how-tos/set-up/install-copilot-cli)) | `copilot` |
| Devin (fostul Windsurf) | aplicația de pe [devin.ai](https://devin.ai) | deschideți dosarul în aplicație |
| Pi | `npm install -g --ignore-scripts @earendil-works/pi-coding-agent` ([pi.dev](https://pi.dev)) | `pi` |

Pe GitHub puteți apăsa și **Use this template** ca să aveți propria copie a dosarului, fără istoricul nostru.

## Primii pași cu agentul

1. **Porniți în plan mode.** Agentul citește și propune un plan, dar nu schimbă nimic până nu îl aprobați. Fără surprize și fără tokeni arși pe ceva greșit: un plan greșit îl corectați în 30 de secunde, un cod greșit în 30 de minute.
   - Claude Code: `Shift+Tab` de două ori (normal → acceptă editările → plan) sau `claude --permission-mode plan`.
   - Codex: `/plan` în sesiune.
2. **Lăsați-l să vă intervieveze.** Copiați promptul din `prompts/01-intervieveaza-ma.md`. Claude Code vă arată întrebările cu variante de răspuns, pe care le alegeți cu săgețile; celelalte unelte întreabă în chat.
3. **Cereți specs pe o pagină** (`prompts/03-spec.md`) și citiți-le împreună.
4. **Pentru orice e mai mare decât o reparație mică**, citiți planul agentului și aprobați-l înainte să lucreze.

## Obiceiul care contează: jurnalul de progres

La fiecare 2–3 ore, sau ori de câte ori ceva nou merge, adăugați un rând în `docs/PROGRESS.md`: ora, ce funcționează, link la o captură de ecran din `docs/screenshots/`. Agentul e instruit să facă asta singur, dar verificați.

De ce: la final aveți povestea proiectului gata scrisă pentru pitch, iar juriul vede progresul real, nu promisiuni. Progresul vizibil e punctat.

## Skills și MCP, pe scurt

**Skills** sunt rețete: o procedură scrisă o singură dată, pe care agentul o urmează când e nevoie. Fiecare e un dosar cu un fișier `SKILL.md`.

Trei sunt scrise pentru metoda de aici:

- `interview` pune echipei întrebări, una câte una, până când ideea e clară.
- `spec-writer` transformă contextul în `docs/02-spec.md`.
- `prototype-check` verifică dacă partea riscantă merge pe date reale și dacă ați respectat ce ați lăsat pe mai târziu.

Trei vin din proiecte open-source, copiate fără modificări:

| Skill | Când îl folosiți | Sursa | Licență |
|---|---|---|---|
| `prototype` | Un prototip de aruncat, care răspunde la o singură întrebare (merge logica? cum ar trebui să arate ecranul?) | [mattpocock/skills](https://github.com/mattpocock/skills/tree/main/skills/engineering/prototype) | MIT |
| `impeccable` | Interfața merge, dar arată generic: o faceți să arate bine și o finisați | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | Apache-2.0 |
| `shadcn` | Interfața MVP-ului din componente gata făcute (shadcn/ui) | [shadcn-ui/ui](https://github.com/shadcn-ui/ui/tree/main/skills/shadcn) | MIT |

Rețetele stau în `.claude/skills/`. `.agents/skills/` e o scurtătură (symlink) către același dosar, ca să le găsească și celelalte unelte. Pe Windows, dacă scurtătura nu funcționează, copiați dosarul `.claude/skills` în `.agents/skills`.

Cele trei externe sunt fixate în `skills-lock.json`. Dacă le ștergeți sau vreți să le aduceți din nou de la sursă:

```bash
npx skills experimental_install     # le reface din skills-lock.json
npx skills update -p                # le aduce la ultima versiune
```

Una câte una, într-un proiect nou: `npx skills add mattpocock/skills --skill prototype`, `npx skills add pbakaus/impeccable --skill impeccable`, `npx skills add shadcn/ui --skill shadcn`. Licențele originale sunt în `licenses/`.

Citiți un skill înainte să îl instalați: poate rula scripturi pe calculatorul vostru. (`impeccable` descarcă la prima folosire un program de pe pagina lui de GitHub.)

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

## Un orchestrator, mai mulți agenți

Tiparul din prezentare, bun pe orice proiect:

1. Dați sarcina mare unui singur agent, **orchestratorul**. Nu vorbiți cu zece agenți deodată.
2. Orchestratorul împarte munca. Fiecare **subagent** primește o sarcină mică și clară și propriul context, doar cu ce îi trebuie.
3. Rezultatele se întorc la orchestrator, apoi la voi. **Un om verifică** ce a ieșit și decide ce intră.

`scripts/parallel.sh` face asta cu fișiere: voi (sau orchestratorul) scrieți câte o sarcină în `tasks/`, scriptul pornește câte un agent pentru fiecare, iar voi verificați rezultatul înainte să îl păstrați.

```bash
scripts/parallel.sh --tool claude tasks/ecran-principal.md tasks/import-date.md
```

Fiecare agent lucrează într-o copie separată a proiectului (**git worktree**, ca niște birouri separate în aceeași clădire), pe ramura lui. Rulați `scripts/parallel.sh --help` pentru detalii. Începeți cu un singur agent; treceți la paralel doar după ce prototipul merge.

## Modele mai ieftine

Cât costă pe lună: gratuit (Google AI Plus, cu Gemini, pentru studenți) → 18 $ (GLM, merge și în Claude Code) → 20 $ (Claude Pro sau ChatGPT Plus) → 200 $ (planurile mari). Pașii exacți sunt în `docs/ieftin.md`. O metodă bună cu un plan ieftin bate un model scump folosit fără plan.

## Reguli scurte pentru echipă

1. Nu cereți cod înainte ca `docs/02-spec.md` să fie completat.
2. Citiți planul agentului și aprobați-l înainte să lucreze.
3. Arătați prototipul la 5 oameni care nu sunt colegii voștri.
4. Salvați des: commit-uri mici (un commit e un punct de salvare, ca într-un joc).
5. Nu puneți niciodată chei API în cod sau în git. Ele stau în `.env`, care e ignorat de git.
6. Demo-ul se repetă de 3 ori înainte de prezentare și are un plan B.

## Linkuri

- Astra Hack (6–7 noiembrie 2026, Sibiu Innovation Week): https://innovationweek.ro/hackathon · înscrieri: https://forms.gle/mmnhKAbYMUZDKAcL9
- Claude Code: https://code.claude.com/docs
- Codex: https://developers.openai.com/codex
- Cursor: https://cursor.com/docs
- Antigravity: https://antigravity.google/docs
- OpenCode: https://opencode.ai/docs
- GitHub Copilot CLI: https://docs.github.com/en/copilot/how-tos/set-up/install-copilot-cli
- Devin: https://devin.ai
- Pi: https://pi.dev
- Standardul AGENTS.md: https://agents.md
- Standardul Agent Skills: https://agentskills.io
- Skills CLI (`npx skills`): https://github.com/vercel-labs/skills
- shadcn/ui: https://ui.shadcn.com
- Playwright MCP: https://github.com/microsoft/playwright-mcp
- Context7: https://github.com/upstash/context7

## Licență

MIT, © 2026 Daniel Ursu. Folosiți, copiați, modificați liber. Skill-urile `prototype`, `impeccable` și `shadcn` își păstrează licențele originale (vezi `licenses/`).
