# Datenmodell

```
<gtm-repo>/
  CLAUDE.md                  # enthält den Block „Founder-Regel“ (templates/CLAUDE-block.md)
  index.html                 # Docsify zum Lesen (templates/docsify-index.html)
  _sidebar.md                # erzeugt von scripts/docs-sidebar.sh, nicht committet
  .claude/launch.json        # Startkonfiguration docs
  .gitignore                 # templates/gitignore
  founder/
    state.md                 # Phase, ICP, Problem, Schwellen, Zahlen, nächste Aktion
    icp-hypothesen.md        # Hypothesen mit Scoring
    befund-bestand.md        # nur wenn das Produkt schon existiert
    portfolio.md             # nur bei mehreren Produkten (Triage)
    contacts.csv             # Kontakte
    journal/JJJJ-MM-TT.md    # ein Eintrag pro Tag
    interviews/JJJJ-MM-TT-vorname-n.md
    outreach/JJJJ-MM-TT.md   # Entwürfe des Tages, nicht gesendet
    assets/                  # Video, Flyer, Ad-Motive, jeweils mit Testfrage
    reviews/JJJJ-Www.md, JJJJ-Www-circle.md
    private/                 # Rohnotizen, Transkripte (nie committen)
  landing/                   # statische Landingpage, oder nur README.md mit Verweis auf die Website des Produkts
  scripts/docs-sidebar.sh    # baut die Docsify-Navigation aus founder/ und landing/
```

## contacts.csv

Kopfzeile: `id,name,rolle,firma,quelle,kanal,aufhaenger,status,commitment,letzter_kontakt,naechster_schritt,faellig`

| Spalte | Werte |
| --- | --- |
| id | `k-001`, fortlaufend |
| quelle | netzwerk, intro, community, landing (auch Warteliste mit „offen für Gespräch“), flyer, event, ad |
| status | neu, angefragt, geantwortet, gespraech-geplant, gespraech-gefuehrt, pilot, zahlend, verloren |
| commitment | 0–5 laut Commitment-Leiter |
| letzter_kontakt, faellig | ISO-Datum; `faellig` = nächster Follow-up (3 Tage nach unbeantworteter Anfrage) |

Bei B2C steht in `firma` der Kontext (z.B. „Elternbeirat GS Musterstadt“) oder leer.

## Zählregeln

- **Anfragen gesendet:** Summe „Anfragen gesendet“ aus den Journal-Einträgen.
- **Antwortrate:** Kontakte mit Status ab `geantwortet` geteilt durch Kontakte mit Status ab `angefragt`.
- **Gespräche geführt:** Anzahl Dateien in `interviews/`.
- **Schmerz ≥ 4, Workaround mit Kosten:** Anteil der Interview-Dateien mit entsprechendem Feld.
- **Zahlende Zusagen:** Kontakte mit `commitment` ≥ 4.
- **Kunden- und Baustunden:** Summe aus den Journal-Einträgen.
- **Gate-Ausnahmen:** Zeilen im Abschnitt „Gate-Ausnahmen“ aller Journal-Einträge.

## Datenschutz

`contacts.csv`, `interviews/` und `private/` enthalten echte Personen. Standard: per `.gitignore` ausgeschlossen. Erst wenn der Founder bestätigt, dass das Repository privat ist, dürfen die Zeilen fallen. Gesprächsaufnahmen nur mit ausdrücklicher Zustimmung.
