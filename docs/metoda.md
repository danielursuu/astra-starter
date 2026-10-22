# Metoda în 4 pași

Agentul scrie codul repede. Partea grea a devenit să știți exact ce să-i cereți. Cei patru pași vă duc acolo, iar fiecare răspunde la o întrebare de business. Nu săriți pași: cele mai multe proiecte de hackathon cad pentru că încep direct cu codul.

| Pas | Întrebarea | Pe scurt |
|---|---|---|
| 1. Context | **De ce?** | De ce ar exista produsul și pentru cine. |
| 2. Specs | **Ce anume?** | Ce face, concret, și ce nu face. |
| 3. Prototip | **Merge?** | Partea cea mai riscantă funcționează pe bune? |
| 4. MVP | **Contează pentru cineva?** | Îl folosește cineva care nu e prietenul vostru? |

## 1. Context: de ce?

Analogie: un coleg nou, foarte deștept, vine azi în echipă. Dacă îi spuneți doar „fă-mi o aplicație”, face ceva generic. Dacă îi explicați cine e clientul, ce problemă are și ce ați încercat, face exact ce trebuie.

Ce îi dați (în `docs/01-context.md`):

- **o schiță**, pe hârtie, pozată, sau o primă schiță cerută agentului (`prompts/02-schita.md`), pe care o modificați până vă place;
- **notițele echipei** din brainstorming, chiar dacă sunt dezordonate;
- **date reale** în `docs/data/`, nu inventate;
- **răspunsurile la întrebările de business:** cine e utilizatorul, ce problemă are, ce folosește azi.

Apoi nu îi cereți cod, ci întrebări (`prompts/01-intervieveaza-ma.md`).

## 2. Specs: ce anume?

Analogie: planul casei înainte de cărămizi. O singură pagină (`docs/02-spec.md`): problema, utilizatorul, de ce l-ar folosi, 3 funcții. Dacă nu încape pe o pagină, nu e încă clar.

Sortați ideile în **Acum** și **Mai târziu**. Lista „Mai târziu” îi spune agentului ce să nu construiască; fără ea, adaugă funcții pe care nu le-a cerut nimeni.

**Plan mode.** Înainte să lucreze, agentul citește tot ce îi trebuie, nu schimbă nimic și vă propune un plan: ce face, în ce ordine, ce fișiere atinge. Voi îl citiți și îl aprobați sau îi spuneți ce să schimbe. Analogie: semnați planul arhitectului înainte să înceapă șantierul. Dacă e greșit, schimbați o foaie, nu un zid.

- Claude Code: `Shift+Tab` de două ori (normal → acceptă editările → plan) sau `claude --permission-mode plan`.
- Codex: `/plan` în sesiune.

## 3. Prototip: merge?

Analogie: macheta arhitectului. Nu puteți locui în ea, dar vedeți dacă încape pe teren. Un prototip răspunde la o singură întrebare, de obicei „merge partea riscantă?”.

**Ce puteți simplifica la un prototip:**

- interfața, simplă ca o schiță (nu pierdeți timp pe culori);
- datele, fixe, scrise direct în cod, ca decorul de film (fațada fără casă în spate);
- uneori nici nu vă trebuie interfață: doar terminalul, dacă întrebarea e „merge calculul?”.

**Ce nu falsificați niciodată:** partea riscantă. Dacă produsul citește bonuri din poze, testați citirea pe 20 de bonuri reale, nu pe un exemplu ales să meargă.

Skill-ul `prototype` (de la Matt Pocock) ajută aici: construiește un prototip de aruncat, fie pentru logică (o pagină HTML în care apăsați butoane și vedeți ce se întâmplă), fie pentru interfață (mai multe variante ale aceluiași ecran, între care comutați). Apoi `prototype-check` verifică cinstit rezultatul.

**Arătați-l la 5 oameni care nu sunt colegii voștri.** Colegii și prietenii sunt politicoși. Cinci străini vă arată în 10 minute unde se blochează. Nu explicați nimic, doar uitați-vă unde dau click. Până pe 29 oct., la Idea Jam: un prototip arătat la 5 oameni.

## 4. MVP: contează pentru cineva?

Analogie: înainte să deschideți un restaurant, porniți cu un food truck. Meniu mic, aceeași bucătărie, clienți reali. Aflați ce se vinde, apoi construiți restaurantul. MVP-ul e drumul principal, cap-coadă, plus un link pe care îl poate deschide oricine.

**Refolosiți, nu reinventați.** Componentele gata făcute sunt piese LEGO; codul vostru e doar piesa de sus, cea unică.

- **shadcn/ui** pentru interfață: butoane, formulare, tabele. Skill-ul `shadcn` îl ajută pe agent să le adauge corect.
- **Componente open-source** pentru hărți, grafice, autentificare, plăți.
- **Licențe:** MIT și Apache vă lasă să folosiți liber, inclusiv comercial. GPL vă poate obliga să publicați tot codul: verificați de două ori sau evitați-o la un produs comercial. Detalii în `docs/stack-mvp.md`.

Când drumul principal merge, skill-ul `impeccable` face interfața să arate bine: ierarhie, spațiere, culori, stări goale și de eroare.
