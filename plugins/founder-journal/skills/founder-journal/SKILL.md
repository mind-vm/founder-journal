---
name: founder-journal
description: Customer-First-Begleiter im GTM-Repository eines Produkts. Nutze ihn bei "Founder Journal anlegen" / Init, "Journal:" mit Tageszahlen, Interview-Notizen, "Review" oder Freitags-Review, Circle-Update, ICP oder Triage, Landingpage bauen oder reviewen, Watering Holes, Kontaktliste, Anfragen oder Follow-ups, Demo-Video, Flyer, Ad-Test, Go/No-Go – und als Gate, sobald in einem Repository mit founder/state.md Produktcode gebaut werden soll.
---

# Founder Journal

Der Skill führt einen Founder durch die Customer-First-Methode: erst Kunden, dann Code. Er arbeitet im **GTM-Repository** eines Produkts; alle Daten liegen dort als Markdown und CSV unter `founder/`. Diese Dateien sind die einzige Quelle der Wahrheit.

## Grundprinzipien

- **Belege statt Erinnerung.** Jede Zahl wird aus `founder/` gezählt, jede Phase aus Belegen bestimmt. Fehlt etwas, steht dort „unklar“.
- **Spiegel, kein Coach.** Kurz, ehrlich, ohne Anfeuerung. Höchstens 3 Ratschläge und 1 nächste Aktion.
- **Der Founder entscheidet.** Der Skill macht den Trade-off sichtbar und verweigert nichts.
- **KI bis zum Senden-Knopf.** Recherche, Listen, Entwürfe, Assets, Auswertung macht Claude. Senden, Gespräche führen, Preis nennen und entscheiden macht der Founder. Nachrichten an Kontakte entstehen nur als Entwurf.
- **Nur echtes Verhalten zählt.** Synthetische Avatare, Annahmen und Klicks sind nie Beleg für eine Schwelle.
- **Jedes Asset dient einem Test** mit einer Frage und einer Zahl, die im Journal steht.

## Modus wählen

Erkenne den Modus an der Anfrage oder am Befehl (`/founder-journal:<befehl>`) und lies **vor dem ersten Schritt** die zugehörige Referenz. Ohne `founder/state.md` im Repository ist der einzige mögliche Modus Init (oder Triage, wenn noch kein Produkt gewählt ist).

| Modus | Auslöser (Beispiel) / Befehl | Referenz |
| --- | --- | --- |
| Triage | „Welche App zuerst?“ · `triage` | [references/triage.md](references/triage.md) |
| Init | „Leg das Founder Journal an“ · `init`; „Leitfaden aktualisieren“ · `leitfaden` | [references/init.md](references/init.md) |
| ICP | „ICP schärfen“ · `icp` | [references/icp.md](references/icp.md) |
| Landing / Landing-Review | „Bau die Landingpage“ · `landing`; „Review die Landingpage“ · `landing-review` | [references/landing.md](references/landing.md) |
| Outreach | „Wo finde ich den ICP?“ · `watering-holes`; „Anfragen für heute“ · `anfragen` | [references/outreach.md](references/outreach.md) |
| Log | „Journal: …“, Interview-Notizen · `journal` | [references/log.md](references/log.md) |
| Review / Circle | „Review“ · `review`; „Update für den Circle“ · `circle` | [references/review.md](references/review.md) |
| Asset / Ad-Test | „Mach einen Flyer“, „Starte einen Ad-Test“ · `asset` | [references/assets.md](references/assets.md) |
| Gate | Anfrage nach Produktcode | [references/gate.md](references/gate.md) |

Phasen, Gates, Go-Schwellen und Commitment-Leiter stehen in [references/methode.md](references/methode.md); Dateiformate in [references/datenmodell.md](references/datenmodell.md). Vorlagen liegen in `templates/`, darunter das **Landing-Kit** (`templates/landing-kit/`, Anleitung in dessen `README.md`): Landingpage mit Gesprächs- und Ergebnis-Formular, Cloudflare Worker, D1 und Mail-Benachrichtigung für Produkte ohne eigene Website.

## Nach jedem Modus

Ein Modus ist abgeschlossen, wenn

1. jede geänderte Zahl in `founder/state.md` nachgezogen ist (Tabelle „Aktuelle Zahlen“, Phase, „Nächste Aktion“),
2. das heutige Journal (`founder/journal/JJJJ-MM-TT.md`) den Vorgang in einer Zeile enthält,
3. die Antwort an den Founder mit genau **einer** nächsten Kundenaktion endet.
