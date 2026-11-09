# Modus Log

Auslöser: „Journal: …“, Gesprächsnotizen, ein Transkript in `founder/private/`.

## Schritte

1. **Tageseintrag** `founder/journal/JJJJ-MM-TT.md` aus `templates/journal.md` anlegen oder ergänzen. Zahlen nur übernehmen, was der Founder nennt; fehlende Felder „unklar“ (Baustunden ausdrücklich nachfragen, wenn gebaut wurde).
2. **Pro geführtem Gespräch** eine Datei `founder/interviews/JJJJ-MM-TT-vorname-n.md` aus `templates/interview.md`. Schmerz 1–5 nur mit Begründung aus **Verhalten** (was die Person getan oder bezahlt hat). Zitat wörtlich, sonst „kein wörtliches Zitat“. Bewertungen, die nicht aus den Notizen folgen, als „unklar“ lassen und nachfragen.
3. **contacts.csv** aktualisieren: Status, Commitment, letzter_kontakt, naechster_schritt, faellig (+3 Tage bei unbeantworteter Anfrage). Neue Personen mit nächster id anlegen.
4. **state.md** Zahlen nachziehen laut Zählregeln in [datenmodell.md](datenmodell.md). Gate-Wechsel (z.B. 10. Interview → G2) ausdrücklich melden.

## Fertig, wenn

jedes genannte Gespräch eine Interview-Datei hat, jede genannte Person in `contacts.csv` steht und die Antwort an den Founder enthält: die neuen Zahlen in einer Zeile, offene „unklar“-Felder als Frage, die wichtigste Kundenaktion für morgen.
