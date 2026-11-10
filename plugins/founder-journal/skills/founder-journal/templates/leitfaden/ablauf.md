# Ablauf: Phasen und Modi

> Kopie aus dem Plugin `founder-journal` {{VERSION}}. Bitte nicht hier bearbeiten.

Zwei Begriffe, die man leicht verwechselt:

- Eine **Phase** sagt dir, **wo du stehst**. Die fünf Phasen kommen nacheinander, und jede endet an einem Gate, also an einer Bedingung, die du in den Dateien prüfen kannst. Den aktuellen Stand zeigt die Navigation links: ✓ heißt erledigt, ● heißt jetzt.
- Ein **Modus** sagt, **was du gerade tust**. Er ist ein Werkzeug, das du mit einem Befehl (`/founder-journal:…`) oder mit eigenen Worten startest. Manche Modi gehören zu einer Phase, andere laufen immer mit.

## Die fünf Phasen

| # | Phase | Ziel | Gate am Ende | Modi (Befehle) | Ergebnis |
| --- | --- | --- | --- | --- | --- |
| 1 | **Zielgruppe & Problem** | ein ICP-Satz, ein Problem | **G0**: ICP und Problem in `state.md` | `triage` (nur bei mehreren Produkten), `init`, `icp` | `founder/icp-hypothesen.md`, `state.md` |
| 2 | **Landingpage** | eine Seite, die um ein Gespräch bittet | **G1**: Seite online, Review ohne offene Punkte | `landing`, `landing-review` | `founder/landing/`, `founder/reviews/*landing-review*` |
| 3 | **Kontakte & Gespräche** | 100 Kontakte, 10, dann 20 Problem-Interviews | **G2**: 10 geführte Gespräche | `watering-holes`, `anfragen`, `journal`, `asset` (z.B. Flyer) | `founder/outreach/`, `founder/interviews/`, `contacts.csv` |
| 4 | **Zusagen** | zahlende Zusagen (Commitment-Stufe 4–5) | – | `asset` (Angebot, Demo-Video), `anfragen`, `journal` | Angebote in `founder/assets/`, Zusagen in `contacts.csv` |
| 5 | **Entscheidung** | Go, Pivot oder Kill gegen die Schwellen | **G3**: alle Go-Schwellen erfüllt | `review` (in Woche 6 mit Go/No-Go) | `founder/reviews/`, Eintrag in `state.md` |

Bei einem **Pivot** änderst du genau eine Variable (Zielgruppe, Problem oder Kanal) und beginnst wieder bei Phase 1, diesmal mit 3 statt 6 Wochen. Bei **Kill** ist die Idee beendet. Beim **Go** baust du nur den Kern-Workflow, den die zahlenden Kunden brauchen.

## Was immer läuft

| Modus | Wann | Ergebnis |
| --- | --- | --- |
| `journal` | jeden Tag nach dem Kundenblock | `founder/journal/JJJJ-MM-TT.md` |
| `review` | jeden Freitag | `founder/reviews/JJJJ-Www.md` |
| `circle` | nach dem Review, wenn du einen Founder Circle hast | `founder/reviews/JJJJ-Www-circle.md` |
| Gate | von selbst, sobald du Produktcode bauen willst | Ausnahme im Journal |

## Zeitplan

| Woche | Phasen |
| --- | --- |
| 1 | 1 Zielgruppe & Problem, 2 Landingpage |
| 1–2 | 3 Kontakte: Liste mit 100 Personen |
| 2–4 | 3 Gespräche: 20 Problem-Interviews, nach 10 ist G2 erreicht |
| 4–6 | 4 Zusagen |
| Ende 6 | 5 Entscheidung |

Die Schwellen für das Go stehen in [`founder/state.md`](../state.md), die ganze Methode in [Methode](methode.md).
