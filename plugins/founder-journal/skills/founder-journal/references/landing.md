# Modus Landing und Landing-Review

Voraussetzung: G0 erreicht. Sonst zuerst ICP.

## Wo die Seite liegt

Immer eine **eigene Landingpage in `founder/landing/`**, aus dem Landing-Kit (`templates/landing-kit/`): statische Seiten, Gesprächsformular und Ergebnis-Formular, Cloudflare Worker mit D1 (EU), Benachrichtigung per Email Routing, Export-Skript. Kit kopieren und dessen `README.md` Schritt für Schritt folgen.

- **Hat das Produkt schon eine Website, bleibt sie unangetastet.** Sie ist für später, wenn es etwas zu verkaufen gibt. Die Landingpage läuft als eigener Worker, auf einer Subdomain (z.B. `start.<domain>`) oder einer eigenen Domain; soll sie die Hauptdomain übernehmen, hängt der Founder die Domain im Dashboard für die Dauer des Zyklus an den Landing-Worker und danach zurück. Marke (Farben, Schriften, Ton) und die geprüften Aussagen der Website übernehmen.
- **Fertig, wenn** `grep -r '{{' founder/landing/` leer ist und Schritt 8 der Kit-README (Live prüfen) erledigt ist.

Vor dem Deploy prüfen: Wohin geht der Deploy wirklich (Repository und Branch, die der Hoster baut), und empfängt die Kontaktadresse Mail (MX-Eintrag)?

## Landing bauen

Struktur auf den ICP ausrichten, nicht auf das Produkt.

Aufbau, von oben:

1. **Überschrift = Problem des ICP** in seinen Worten, nicht der Produktname.
2. Unterzeile: was sich ändert, ein Satz.
3. **Genau ein Call-to-Action**, passend zur Phase:
   - Phase 1–3: „15 Minuten mit mir sprechen“ als Formular mit nur einer E-Mail-Adresse (Benachrichtigung an den Founder) oder ein Kalender-Link. Ziel sind Gespräche, nicht stille Testkonten. Kein `mailto:` als Haupt-CTA: Auf dem Handy bricht es oft ab.
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
