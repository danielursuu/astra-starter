# Cum lucrați cu modele mai ieftine

**Modelul** e creierul, **unealta** (Claude Code, OpenCode) e biroul cu unelte. Puteți păstra biroul și schimba creierul cu unul mai ieftin. Pentru un hackathon, modelele deschise chinezești (GLM, Kimi) sunt suficient de bune, la o fracțiune din preț.

> **Atenție la confidențialitate.** Codul și datele voastre ajung pe serverele furnizorului (Z.ai, Moonshot, OpenRouter). E în regulă pentru un proiect de hackathon. Nu folosiți aceste variante pentru codul firmei unde lucrați sau pentru date personale reale.

> **Cheile API** (parola prin care plătiți modelul) nu intră niciodată în git, în cod sau în chat. Stau într-un fișier `.env`, pe care `.gitignore` îl exclude deja. Mai jos, `cheia_ta_aici` e doar un exemplu; înlocuiți-l doar în `.env`.

Valorile de mai jos sunt verificate în documentația oficială pe 20 octombrie 2026. Numele modelelor se schimbă des; dacă ceva nu merge, verificați linkul de la fiecare secțiune.

## GLM (Z.ai) în Claude Code

Documentație: https://docs.z.ai/devpack/tool/claude

Creați `.env` în dosarul proiectului:

```bash
ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic
ANTHROPIC_AUTH_TOKEN=cheia_ta_aici
ANTHROPIC_DEFAULT_OPUS_MODEL="glm-5.3[1m]"
ANTHROPIC_DEFAULT_SONNET_MODEL="glm-5.3[1m]"
ANTHROPIC_DEFAULT_HAIKU_MODEL="glm-5.3-flash[1m]"
```

Porniți Claude Code cu aceste setări (doar în terminalul curent):

```bash
set -a; source .env; set +a; claude
```

## Kimi (Moonshot) în Claude Code

Documentație: https://platform.kimi.ai/docs/guide/claude-code-kimi

```bash
ANTHROPIC_BASE_URL=https://api.moonshot.ai/anthropic
ANTHROPIC_AUTH_TOKEN=cheia_ta_aici
ANTHROPIC_MODEL="kimi-k3[1m]"
ANTHROPIC_DEFAULT_OPUS_MODEL="kimi-k3[1m]"
ANTHROPIC_DEFAULT_SONNET_MODEL="kimi-k3[1m]"
ANTHROPIC_DEFAULT_HAIKU_MODEL=kimi-k2.7-code
```

Porniți la fel: `set -a; source .env; set +a; claude`. Folosiți `ANTHROPIC_AUTH_TOKEN`, nu `ANTHROPIC_API_KEY`, ca să nu intre în conflict cu un cont Anthropic existent.

Puneți în `.env` un singur furnizor odată. Sufixul `[1m]` cere varianta cu memorie de lucru mare (1 milion de tokeni, adică textul din câteva cărți întregi).

## OpenCode cu OpenRouter, Z.ai sau Kimi

OpenCode lucrează cu zeci de furnizori. **OpenRouter** e un singur cont prin care ajungeți la multe modele, ca un adaptor universal.

```bash
opencode
```

În OpenCode scrieți `/connect`, alegeți furnizorul (OpenRouter, Z.AI sau Moonshot AI), lipiți cheia când vă cere, apoi `/models` ca să alegeți modelul. Cheia e salvată de OpenCode în afara proiectului, deci nu ajunge în git.

Documentație: https://opencode.ai/docs/providers/

## Gratuit pentru studenți: Google AI Plus

Studenții din România primesc 12 luni gratuite de Google AI Plus (limite duble pentru Gemini, 400 GB stocare). Activare pe https://one.google.com/ai-student, cu verificarea statutului de student. Oferta trebuie activată până la 31 decembrie 2026 (conform presei; verificați condițiile pe pagina Google). La înscriere vi se cere un card; după cele 12 luni costă aproximativ 5 $ pe lună dacă nu anulați.

<!-- TODO: verify whether Google AI Plus raises Antigravity / agy usage limits; the Google RO announcement does not mention coding tools. -->

## Pe scurt: cât costă pe lună

| Cost pe lună | Varianta | Potrivită pentru |
|---|---|---|
| gratuit | Google AI Plus, 12 luni pentru studenți (include Gemini) | schițe, documentare, întrebări |
| 18 $ | GLM Coding Plan Lite (Z.ai), merge în Claude Code | lucrul zilnic cu agentul |
| 20 $ | Claude Pro (include Claude Code) sau ChatGPT Plus (include Codex) | cele mai bune rezultate la un preț mic |
| 100–200 $ | Claude Max (100 $ sau 200 $), ChatGPT Pro (200 $) | lucru intens, toată ziua |
| cât folosiți | OpenCode + OpenRouter, sau API-ul Kimi | testarea mai multor modele |

Kimi Code are și abonament, de la aproximativ 99 de yuani pe lună (cam 14 $). Prețurile sunt cele din prezentarea din 22 octombrie 2026; verificați-le pe site-ul fiecărui furnizor.

O metodă bună cu un plan ieftin bate un model scump folosit fără plan.
