# Lösungskonzept: Customer-First mit KI

Nov 9, 2026 · Jürgen Ryannel · Diskussionsgrundlage

Dieses Dokument führt das [Customer-First Playbook](customer-first-playbook.md) (die Methode) und das [Fachkonzept Founder-Journal-Skill](fachkonzept-founder-journal-skill.md) (das Werkzeug) zusammen. Es legt fest, wie beide zusammen das eigentliche Problem lösen, und klärt die Widersprüche zwischen ihnen.

## 1. Ausgangslage

- Es gibt mehrere fertig programmierte SaaS-Apps, aber noch bei keiner einen Kunden.
- Bauen ist mit Coding Agents billig geworden und unterscheidet niemanden mehr. Was dagegen knapp bleibt, ist Wissen darüber, wer welches Problem so dringend hat, dass er dafür zahlt.
- Deshalb soll ab jetzt gelten: Vor jeder Weiterentwicklung kommt die Kundengewinnung. Das heißt, den normalen Startup-Weg sauber zu gehen und dabei alles, was sich automatisieren lässt, mit KI zu erledigen.

**Kernthese:** Der Vorsprung entsteht nicht durch mehr Code, sondern durch mehr Kundenkontakt pro Woche. KI soll deshalb die Fleißarbeit rund um den Kundenkontakt übernehmen, damit der Founder mehr Zeit im Gespräch verbringt und weniger mit Vorbereitung und Nacharbeit.

## 2. Welche Probleme das löst

| Problem | Ursache | Lösung in diesem Konzept |
| --- | --- | --- |
| Bauen statt Verkaufen | Bauen fühlt sich produktiv an und ist sofort belohnt, Vertrieb nicht | Gate vor Produktcode, Journal und Dashboard machen Kundenarbeit messbar und sichtbar |
| Mehrere Apps, kein Fokus | Jede App bekommt ein bisschen Aufmerksamkeit, keine genug | **Neue Phase 0:** Portfolio-Triage, danach eine App gleichzeitig, die anderen werden eingefroren |
| Vertrieb kostet zu viel Zeit | Recherche, Listen, Texte, Auswertung sind mühsam | KI erledigt alles bis zum Senden-Knopf und alles nach dem Gespräch |
| Marketing-Material fehlt | Video, Flyer, Landingpage, Ads sind Handwerk außerhalb der Komfortzone | KI erzeugt Assets, aber nur, wenn sie einem Test dienen |
| Bestehende Apps verzerren den Blick | Man will die App zeigen statt zuhören | Problem-Interviews ohne App, die App erst in Phase 4 als Demo |

## 3. Arbeitsteilung: Was KI macht, was der Founder macht

**Grundregel:** KI macht alles bis zum Senden-Knopf und alles ab dem Ende des Gesprächs. Der Founder macht das, was Vertrauen braucht: senden, sprechen, nach Geld fragen, entscheiden.

| Aufgabe | KI | Founder |
| --- | --- | --- |
| Portfolio-Triage (welche App zuerst) | Bewertung vorbereiten, Problem-Scoring je App | entscheiden |
| ICP und Problemhypothesen | Entwürfe, Wettbewerber- und Alternativen-Recherche | schärfen, festlegen |
| Watering Holes finden | Websuche: Foren, Communities, Verbände, Newsletter, mit Link und Aufhänger | auswählen |
| Kontaktliste mit 100 Personen | recherchieren, anreichern, in `contacts.csv` pflegen | prüfen |
| Anfragen und Follow-ups | personalisierte Entwürfe, Erinnerung an Fälligkeiten | **selbst senden** |
| Landingpage | bauen, aus der bestehenden App-Startseite ableiten, reviewen | freigeben, live stellen |
| Demo-Video, Flyer, Ad-Motive | erzeugen (z.B. HyperFrames für Video) | freigeben |
| Problem-Interviews | Skript, Vorbereitung je Person | **selbst führen** |
| Auswertung | Transkript oder Notizen zu Interview-Datei, Zitate, Muster | korrigieren |
| Commitment-Angebot | Founding-Member-Angebot, LOI-Vorlage, Stripe-Link | **Preis nennen, schweigen** |
| Ad-Test | Kampagne aufsetzen, Varianten, Auswertung | Budget freigeben, starten |
| Wochen-Review, Circle-Update | Zahlen, Phase aus Belegen, max. 3 Ratschläge | lesen, eine Annahme ändern |
| Go/No-Go | Kriterien gegen Schwellen prüfen | **entscheiden** |

**Warum der Founder selbst sprechen muss:** Das Gespräch ist nicht nur Datenerhebung, sondern der Ort, an dem man versteht, was man eigentlich bauen sollte. Das lässt sich nicht delegieren. Synthetische Kunden-Avatare (z.B. das Plugin `customer-avatars`) taugen zur Vorbereitung von Interviews und zum Durchspielen von Fragen, zählen aber nie als Beleg für eine Schwelle.

## 4. Ablauf

Das Playbook bleibt die Methode. Neu ist Phase 0, und jede Phase bekommt ihren KI-Anteil.

### Phase 0: Portfolio-Triage (2–3 Tage, einmalig)

Ziel: aus den vorhandenen Apps genau eine auswählen, mit der der 6-Wochen-Zyklus startet.

1. Pro App eine Seite: Für wen ist sie, welches Problem löst sie, wie würde man diese Menschen erreichen?
2. Problem-Scoring aus dem Playbook (Häufigkeit, Schmerz, Budget, Erreichbarkeit, je 1–5). Unter 14 von 20 Punkten scheidet die App vorerst aus.
3. Zusatzfrage: Wo hat der Founder schon Zugang (Netzwerk, Branchenwissen)? Bei Gleichstand gewinnt die App mit den kürzesten Wegen zu 10 Gesprächen.
4. Ergebnis in `portfolio.md`: Rangfolge, gewählte App, die anderen eingefroren. Für eingefrorene Apps gilt: nur Betrieb, keine Features.

Der bisher geplante Pilot Sokrates ist damit nicht gesetzt, sondern muss die Triage gewinnen.

### Phase 1–5: wie im Playbook

| Phase | Woche | KI liefert | Founder liefert | Gate |
| --- | --- | --- | --- | --- |
| 1 Problem & ICP | 1 | ICP-Entwurf, 3 Hypothesen mit Scoring, Landingpage | ICP-Satz festlegen | G0 → G1 |
| 2 Kanäle & Liste | 1–2 | Watering Holes, 100 Kontakte, Anfrage-Entwürfe | 10 Anfragen pro Tag senden | – |
| 3 Problem-Interviews | 2–4 | Vorbereitung, Debrief, Muster nach 10 Gesprächen | 20 Gespräche ohne Pitch | G2 |
| 4 Commitment | 4–6 | Angebot, LOI, Stripe-Link, Demo-Video, ggf. Ad-Test | Preis nennen, Zusagen einholen | – |
| 5 Go/No-Go | 6 | Auswertung gegen Schwellen | entscheiden | G3 |

Bei einem Pivot wird genau eine Variable geändert (ICP, Problem oder Kanal), und es geht mit 3 Wochen statt 6 zurück zu Phase 1. Bei einem Kill wird die nächste App aus `portfolio.md` gezogen.

## 5. Werbung, Videos und Ads: Rolle vor dem Product-Market-Fit

Werbemittel zu erzeugen ist mit KI günstig geworden, und genau deshalb liegt hier dieselbe Falle wie beim Code: Man produziert, statt zu lernen. Deshalb gilt: **Jedes Asset dient einem Test mit einer Frage und einer Zahl.**

| Asset | Wann | Welche Frage es beantwortet |
| --- | --- | --- |
| Landingpage mit einem CTA | ab Phase 1 | Versteht man in 5 Sekunden, worum es geht? Bucht jemand ein Gespräch? |
| Demo-Video (60–90 s) | ab Phase 4 | Hilft es beim Commitment-Gespräch, oder ist es nur Dekoration? |
| Flyer / Onepager / Angebots-PDF | Phase 4 | Unterschreibt jemand einen LOI? |
| Bezahlter Ad-Test | frühestens Phase 4, wenn der ICP steht | Reagiert der ICP auf diese Botschaft, und was kostet ein Kontakt? |

**Regeln für Ad-Tests:**

- Ads sind vor dem Product-Market-Fit ein Messinstrument, kein Wachstumskanal.
- Fester Budgetdeckel pro Test (Vorschlag: 200–300 €), eine Zielgruppe, 2–3 Botschaftsvarianten, 7–10 Tage.
- Gemessen wird bis zur Handlung: Gespräch gebucht oder Founding-Platz reserviert. Klicks und E-Mail-Adressen sind Commitment-Stufe 0–1 und zählen nicht für die Go-Schwellen.
- KI baut Kampagne, Motive und Auswertung. Starten und Budget freigeben macht der Founder.

## 6. Entscheidungen zu den Widersprüchen der beiden Dokumente

Diese Vorschläge gelten, bis sie in der Diskussion geändert werden.

| Thema | Playbook | Fachkonzept | Vorschlag |
| --- | --- | --- | --- |
| Go-Kriterien | 6 (inkl. „Kanal skaliert“) | 5 | **6 Kriterien.** Ohne skalierbaren Kanal gibt es nach dem Go keinen Weg zu Kunden 4–50. |
| Gate | blockiert | fragt nach, verbietet nichts | **Weiches Gate in v1**, jede Ausnahme wird gezählt. Hartes Gate per Hook in v2, falls die Ausnahmen im Pilot überhandnehmen. |
| Skills | 3 eigene Skills | 1 Skill mit 7 Modi | **1 Skill** mit erweiterten Modi (siehe unten). Ein Einstieg, ein Datenmodell. |
| Pivot | Phase 1, 3 Wochen | G0, ohne Zeitbox | **G0 mit 3 Wochen.** |
| Startpunkt | Phase 1 | Init | **Phase 0 Triage** vor Init. |

**Erweiterte Modi des Skills** (zusätzlich zu den 7 aus dem Fachkonzept):

| Modus | Auslöser (Beispiel) | Ergebnis |
| --- | --- | --- |
| Triage | „Welche App zuerst?“ | `portfolio.md` mit Scoring und Rangfolge |
| Watering Holes | „Wo finde ich den ICP?“ | Fundstellen mit Link und Aufhänger, neue Zeilen in `contacts.csv` |
| Outreach | „Anfragen für heute“ | 10 personalisierte Entwürfe plus fällige Follow-ups, nicht gesendet |
| Asset | „Mach ein Demo-Video / einen Onepager“ | Asset plus Testfrage im Journal |
| Ad-Test | „Starte einen Ad-Test“ | Kampagnenplan, Motive, später Auswertung in `reviews/` |

## 7. Rechtliches (Deutschland, kurz)

- **Kalte E-Mails** an Unternehmen sind nach § 7 UWG nur mit mutmaßlicher Einwilligung zulässig, das ist eng auszulegen. Deshalb gehen die Anfragen über Intros, Communities und LinkedIn-Nachrichten mit konkretem Aufhänger, nicht über Massen-Mails.
- **Personenbezogene Daten:** `contacts.csv` und `interviews/` gehören in ein privates Repository. Formulare auf der Landingpage brauchen Double-Opt-in, Impressum und Datenschutzerklärung.
- **Gesprächsaufnahmen** nur mit ausdrücklicher Zustimmung, sonst Notizen.

## 8. Die ersten 2 Wochen konkret

| Tag | Was | Wer |
| --- | --- | --- |
| 1–2 | Liste aller Apps mit je einer Seite, Scoring | KI bereitet vor, Founder entscheidet |
| 3 | Triage abschließen, eine App wählen, Rest einfrieren | Founder |
| 3 | Init: GTM-Repository, `state.md` mit ICP-Satz und Schwellen | KI |
| 4–5 | Landingpage aus App-Startseite ableiten, Review, live | KI baut, Founder stellt live |
| 6–7 | Watering Holes und Kontaktliste mit 100 Personen | KI recherchiert, Founder prüft |
| ab 8 | täglich 60–90 Min.: 10 Anfragen, Follow-ups, 1–2 Gespräche, Journal | Founder, KI bereitet vor und wertet aus |
| 10 | erstes Freitags-Review | KI |

Parallel dazu: Dashboard-Skript und Mini-PC erst ab Woche 2, wenn echte Zahlen da sind. Auch das Werkzeug wird nicht vor den Kunden gebaut.

## 9. Offene Fragen für die Diskussion

1. **Welche Apps** stehen zur Auswahl? Eine kurze Liste mit Name, Zielgruppe in einem Satz und Link reicht für die Triage.
2. **B2B oder B2C?** Davon hängen Kanäle, Preise und der Ad-Test stark ab.
3. **Zeitbudget:** Sind 60–90 Min. Kundenarbeit pro Tag realistisch, und an wie vielen Tagen?
4. **Werbebudget** für Ad-Tests in Phase 4: Passt der Deckel von 200–300 € pro Test?
5. **Repository-Struktur:** Ein GTM-Repository pro App, oder ein gemeinsames mit `portfolio.md` und je einem Ordner pro App?
6. **Founder Circle:** Gibt es schon Leute, mit denen das Wochen-Update geteilt wird, oder muss der Circle erst entstehen?
7. **Gate-Härte:** Reicht das weiche Gate, oder soll gleich ein Hook dazu, weil die Versuchung zu bauen bei mehreren fertigen Apps besonders groß ist?

## Quellen

- [Customer-First Playbook](customer-first-playbook.md)
- [Fachkonzept Founder-Journal-Skill](fachkonzept-founder-journal-skill.md)
- [The Mom Test, Rob Fitzpatrick](https://www.momtestbook.com/)
