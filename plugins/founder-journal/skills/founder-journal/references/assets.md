# Modus Asset und Ad-Test

Jedes Asset beantwortet eine Testfrage mit einer Zahl. Vor dem Erzeugen Testfrage, Zahl und Phase im Journal festhalten; ohne Testfrage nachfragen, wofür das Asset gebraucht wird.

| Asset | ab Phase | Testfrage |
| --- | --- | --- |
| Landingpage | 1 | Bucht jemand ein Gespräch? → [landing.md](landing.md) |
| Onepager / Angebots-PDF | 4 | Unterschreibt jemand einen LOI? |
| Demo-Video 60–90 s | 4 | Hilft es im Commitment-Gespräch? |
| Flyer | 2 | Bringt er Gespräche über einen lokalen Kanal (Schule, Verein, Event)? |
| Ad-Motive | 4 | Reagiert der ICP auf die Botschaft, was kostet ein Kontakt? |

Erzeugung: Video mit dem Skill `hyperframes` (falls installiert), Flyer und PDF als HTML → PDF, Motive als HTML/SVG → PNG. Marke und Aussageregeln des Produkts gelten (aus `befund-bestand.md`). Keine echten Personen oder Kinder ohne Einwilligung; Demo-Daten verwenden. Ablage in `founder/assets/<datum>-<name>/` mit einer `README.md` (Testfrage, Zahl, Ergebnis).

## Ad-Test

Ads sind vor dem Product-Market-Fit ein Messinstrument, kein Wachstumskanal.

1. Voraussetzung: G1 erreicht und ICP aus Interviews bestätigt (in der Regel Phase 4). Sonst Trade-off nennen und nachfragen.
2. Plan: eine Zielgruppe, 2–3 Botschaftsvarianten aus Interview-Zitaten, Budgetdeckel (Vorschlag 200–300 €), 7–10 Tage, Ziel-Handlung = Gespräch gebucht oder Founding-Platz reserviert.
3. Claude erstellt Plan, Texte, Motive, UTM-Links. Konto, Budget und Start macht der Founder.
4. Auswertung: Kosten pro Ziel-Handlung je Variante. Klicks und E-Mail-Adressen sind Stufe 0–1 und zählen nicht für Schwellen. Ergebnis ins Review.

Plattformregeln beachten: keine Zielgruppen unter 18, keine Gesundheits- oder Notenversprechen.
