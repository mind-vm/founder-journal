# Modus Landing und Landing-Review

Voraussetzung: G0 erreicht. Sonst zuerst ICP.

## Wo die Seite liegt

Eine Seite, eine Quelle. Erst klären, dann bauen:

- **Das Produkt hat schon eine Website** (eigener Ordner im Produkt-Repository, eigene Domain): Die Landingpage wird dort gebaut, meist als neue Startseite für die Dauer des Zyklus. Die alte Produktseite bleibt als Komponente oder Unterseite erhalten. `landing/` im GTM-Repository enthält dann nur eine `README.md` mit Verweis (Domain, Dateien, Deploy-Weg). Die Website ist vom Gate ausgenommen; in die Founder-Regel der `CLAUDE.md` gehört der Pfad als Ausnahme.
- **Keine Website:** statische Seite in `landing/` (`index.html`, `impressum.html`, `datenschutz.html`), ohne Build-Schritt.

Vor dem Deploy prüfen: Wohin geht der Deploy wirklich (Repository und Branch, die der Hoster baut), und empfängt die Kontaktadresse Mail (MX-Eintrag)?

## Landing bauen

Gibt es eine Produktseite, deren Marke (Farben, Schriften, Ton) und Aussagen übernehmen, aber die Struktur neu auf den ICP ausrichten.

Aufbau, von oben:

1. **Überschrift = Problem des ICP** in seinen Worten, nicht der Produktname.
2. Unterzeile: was sich ändert, ein Satz.
3. **Genau ein Call-to-Action**, passend zur Phase:
   - Phase 1–3: „15-Minuten-Gespräch buchen“ (Kalender-Link) — Ziel sind Gespräche, nicht stille Testkonten.
   - Phase 4: „Founding-Platz reservieren“ mit Preis.
   - E-Mail-Adresse als Alternative, klein.
4. 3 Punkte, wie es funktioniert. Ein Bild oder kurzer Dialog statt Feature-Liste.
5. Preis bzw. Founding-Angebot, sobald Phase 4.
6. Footer: Impressum, Datenschutz (echte Seiten, Anbieter mit Anschrift — Angaben beim Founder erfragen, nie erfinden).

Zweiter Weg für alle, die nicht sprechen wollen: eine kleine Warteliste („Ergebnisse per Mail“) mit 2–3 Verhaltensfragen und „offen für ein Gespräch“, klar unter dem Haupt-CTA. Einfachste Form: eigenes Formular in die Datenbank des Hosters (z.B. Cloudflare D1), ohne Newsletter-Dienst. Ohne Double-Opt-in nur für Ergebnisse und Gesprächsanfragen nutzen, nie als Newsletter; für Newsletter einen Dienst mit Double-Opt-in. Keine Tracker ohne Einwilligung; Messung über serverseitige Zählung oder einwilligungsfreie Analyse.

## Landing-Review

Prüfe jeden Punkt, Ergebnis als Liste „erfüllt / offen + Korrektur“:

| Prüfpunkt | Erfüllt, wenn |
| --- | --- |
| 5-Sekunden-Test | Überschrift und Unterzeile sagen allein, für wen und welches Problem |
| Ein CTA | jeder Button führt zur selben Handlung |
| Kundensprache | Wörter stammen aus Interviews oder ICP-Satz, nicht aus dem Code |
| Angebot | Preis und Angebot eindeutig, kein Widerspruch (z.B. „kostenlos“ neben Preis) |
| Recht | Impressum und Datenschutz erreichbar und vollständig, Double-Opt-in |
| Marke | keine Aussage verletzt die Markenregeln des Produkts |
| Mobil | lesbar und bedienbar auf 375 px Breite |

G1 ist erreicht, wenn die Seite online ist und das Review keine offenen Punkte hat. Live stellen macht der Founder.
