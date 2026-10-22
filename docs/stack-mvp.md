# Tehnologii pentru un MVP rapid

Regula: **refolosiți înainte să construiți**. Componentele gata făcute sunt piese LEGO: le asamblați, nu le turnați voi. Alegeți o singură variantă din fiecare rând și nu o schimbați în timpul hackathonului.

| Ce | Recomandare | De ce, într-un rând |
|---|---|---|
| Aplicație web completă | **Next.js** | Interfață și server în același proiect; se publică ușor pe Vercel. |
| Doar interfață (fără server propriu) | **Vite + React** | Pornește instant, mai puține lucruri de înțeles. |
| Componente de interfață | **shadcn/ui** | Butoane, formulare, tabele frumoase, copiate în proiect; agenții le cunosc bine. |
| Bază de date + conturi | **Supabase** | Bază de date, autentificare și stocare de fișiere, cu plan gratuit. |
| Publicare online | **Vercel** (Next.js, Vite) sau **Railway** (orice server, Python inclus) | Un link public pentru juriu în câteva minute. |
| Procesare de date / AI în Python | **FastAPI** sau un script simplu | Când partea riscantă e în Python, nu o rescrieți în JavaScript. |

## Pornire

Next.js cu shadcn/ui:

```bash
npx shadcn@latest init -t next
```

Vite cu shadcn/ui:

```bash
npx shadcn@latest init -t vite
```

Adăugați componente pe măsură ce aveți nevoie:

```bash
npx shadcn@latest add button card input table
```

(Documentația oficială arată comenzile cu `pnpm dlx`; `npx` face același lucru cu npm.)

Skill-ul `shadcn` din `.claude/skills/` îi arată agentului cum să caute, să adauge și să combine componentele. Când drumul principal merge, skill-ul `impeccable` face interfața să arate îngrijit.

## Licențe

Codul altora e liber doar în limitele licenței lui.

- **MIT, Apache-2.0, BSD, ISC**: în regulă, le puteți folosi.
- **GPL, AGPL, LGPL**: verificați de două ori și întrebați un mentor; pot obliga la publicarea codului vostru.
- **Fără licență** sau „doar uz necomercial”: nu le folosiți.

## Ce să nu faceți la un hackathon

- Microservicii, Kubernetes, cozi de mesaje.
- Autentificare scrisă de mână (folosiți Supabase Auth sau lăsați-o la „Mai târziu”).
- Trei limbaje de programare în același proiect.
- Schimbarea tehnologiei după ora 6.
