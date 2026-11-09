# Leitfaden: Arbeiten mit dem Founder Journal

> Kopie aus dem Plugin `founder-journal` {{VERSION}}. Bitte nicht hier bearbeiten: Eine neue Fassung holt „Leitfaden aktualisieren“.

Dieses Repository führt die Kundengewinnung für **{{PRODUKT}}**. Die Regel ist einfach: **erst Kunden, dann Code.** Produktcode entsteht erst, wenn die Go-Schwellen erfüllt sind, also 20 Gespräche geführt sind und 3 Kunden zugesagt haben, dass sie zahlen. Bis dahin baust du nur, was dem Verkaufen dient.

Claude hilft dabei im Terminal. Alle Daten liegen als Markdown und CSV in `founder/`. Der Stand, den du hier liest, ist der Stand in den Dateien, nicht der in Claudes Erinnerung.

## Dein Tag

1. **Kundenblock, 60–90 Minuten, vor dem Bauen:** 10 neue Anfragen, Follow-ups auf alles, was seit 3 Tagen offen ist, 1–2 Gespräche.
2. **Danach kurz berichten:** *„Journal: 10 angeschrieben, 2 Gespräche, Zitat: …“*. Claude schreibt den Tageseintrag, legt Interview-Dateien an und pflegt die Kontakte.
3. **Bauen ist die Belohnung, nicht die Flucht.** Fragst du nach Produktcode, nennt Claude zuerst die Phase und fragt nach.
4. **Freitags:** *„Review“*. Du bekommst Zahlen, Phase, höchstens 3 Ratschläge und eine nächste Aktion.

## Was du sagst, was passiert

| Du sagst | Claude macht | Ergebnis |
| --- | --- | --- |
| „Journal: …“ | Tageseintrag, Interview-Dateien, Kontakte, Zahlen | `founder/journal/`, `founder/interviews/`, `contacts.csv` |
| „Anfragen für heute“ | Entwürfe für fällige Follow-ups und bis zu 10 neue Anfragen | `founder/outreach/JJJJ-MM-TT.md` |
| „Wo finde ich den ICP?“ | Websuche nach Orten, an denen deine Zielgruppe über das Problem spricht | `founder/outreach/watering-holes.md` |
| „Bereite das Gespräch mit … vor“ | Fragen für genau diese Person | Antwort im Chat |
| „Review“ | Zählen, Phase bestimmen, Muster, max. 3 Ratschläge | `founder/reviews/JJJJ-Www.md` |
| „Update für den Circle“ | Wochen-Update zum Teilen | `founder/reviews/JJJJ-Www-circle.md` |
| „Review die Landingpage“ | Prüfung gegen 5-Sekunden-Test, ein CTA, Recht | Befund im Chat oder in `reviews/` |
| „Mach einen Flyer / ein Demo-Video“ | Asset mit Testfrage | `founder/assets/` |
| „Leitfaden aktualisieren“ | neue Fassung dieses Leitfadens aus dem Plugin | `leitfaden/` |
| eine Anfrage nach Produktcode | eine Zeile mit Phase und Trade-off, dann Nachfrage | Ausnahme im Journal, wenn du trotzdem baust |

## Wer was macht

**Claude** recherchiert, schreibt Listen und Entwürfe, baut Landingpage und Assets, wertet Gespräche aus und zählt.

**Du** sendest die Nachrichten, führst die Gespräche, nennst den Preis und entscheidest. Diese Teile lassen sich nicht abgeben: Im Gespräch verstehst du, was du eigentlich bauen solltest.

## Phasen und Gates

| Gate | Bedingung | Danach |
| --- | --- | --- |
| G0 Setup | ICP-Satz und Problem in `state.md` | Landingpage bauen |
| G1 Landing live | Seite online, Review ohne offene Punkte | Anfragen senden |
| G2 Erste Signale | 10 geführte Gespräche | Muster auswerten, Zusagen anfragen |
| G3 Go | alle Go-Schwellen erfüllt | Produktcode für den Kern-Workflow |

Die Go-Schwellen sind beim Start festgeschrieben und stehen in [`founder/state.md`](../founder/state.md). Die ganze Methode mit Commitment-Leiter steht in [Methode](methode.md), die Regeln für Gespräche in [Interviews](interviews.md).

## Wo was liegt

| Ort | Inhalt |
| --- | --- |
| `founder/state.md` | Phase, ICP, Schwellen, aktuelle Zahlen, nächste Aktion: **hier anfangen** |
| `founder/journal/` | ein Eintrag pro Tag |
| `founder/interviews/` | eine Datei pro Gespräch (bleibt lokal, nicht im Git) |
| `founder/contacts.csv` | alle Kontakte mit Status und Commitment (bleibt lokal) |
| `founder/outreach/` | Vorlagen und Entwürfe für Anfragen |
| `founder/assets/` | Flyer, Videos, Anzeigen, jeweils mit Testfrage |
| `founder/reviews/` | Wochen-Reviews, Circle-Updates, Landing-Reviews |
| `founder/private/` | Rohnotizen, Exporte (nie im Git) |
| `landing/` | die Landingpage oder ein Verweis auf die Website |
| `leitfaden/` | dieser Leitfaden |

## Lesen

Diese Seite ist Docsify: In der Claude-App die Startkonfiguration `docs` starten, oder im Terminal:

```bash
scripts/docs-sidebar.sh && python3 -m http.server {{PORT}} --bind 127.0.0.1
```

Die Navigation links baut das Skript bei jedem Start neu aus `founder/`, `landing/` und `leitfaden/`.
