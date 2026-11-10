# Datenmodell

```
<produkt-repo>/
  CLAUDE.md                  # + Block „Founder-Regel“ (templates/CLAUDE-block.md)
  .gitignore                 # + Zeilen aus templates/gitignore
  .claude/launch.json        # + Startkonfiguration docs
  .claude/settings.json      # Plugin aktiv in diesem Repository
  docs/, src/, …             # das Produkt: alles außerhalb von founder/ ist Produktcode
  founder/
    index.html               # Docsify (templates/docsify-index.html)
    _sidebar.md              # erzeugt, nicht committet
    state.md                 # Phase, ICP, Problem, Schwellen, Zahlen, nächste Aktion
    icp-hypothesen.md        # Hypothesen mit Scoring
    befund-bestand.md        # wenn schon Code oder eine Website existiert
    portfolio.md             # nur bei mehreren Produkten (Triage)
    contacts.csv             # Kontakte (nicht committet)
    journal/JJJJ-MM-TT.md    # ein Eintrag pro Tag
    interviews/JJJJ-MM-TT-vorname-n.md   # nicht committet
    outreach/                # Vorlagen, Watering Holes, Entwürfe des Tages
    assets/                  # Flyer, Video, Ad-Motive, jeweils mit Testfrage
    reviews/                 # JJJJ-Www.md, JJJJ-Www-circle.md, JJJJ-MM-TT-landing-review.md
    angebote/                # Phase 4: Angebote, LOIs
    entscheidung.md          # Phase 5: Go/Pivot/Kill mit Begründung
    private/                 # Rohnotizen, Transkripte, Exporte (nie committet)
    leitfaden/               # Kopie aus dem Plugin: README, ablauf, methode, interviews
    landing/                 # eigene Landingpage (Landing-Kit), unabhängig von der Website des Produkts
    scripts/docs-sidebar.sh  # Docsify-Navigation nach Phasen, Status aus state.md
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

`founder/contacts.csv`, `founder/interviews/` und `founder/private/` enthalten echte Personen und sind immer per `.gitignore` ausgeschlossen, auch in privaten Repositorys (Teams, Forks, CI). Journal und Reviews enthalten Zitate ohne Nachnamen; ist das Repository öffentlich, entscheidet der Founder, ob `founder/` überhaupt committet wird. Gesprächsaufnahmen nur mit ausdrücklicher Zustimmung.
