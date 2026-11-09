# Fachkonzept: Founder-Journal-Skill

Nov 9, 2026 · @Jürgen Ryannel

Ein Claude-Code-Skill, der im Repository eines Produkts ein Founder Journal führt, Kundenarbeit misst und Produktcode erst freigibt, wenn Kunden zugesagt haben. Erster Pilot: Sokrates.

## Ziel & Problem

Der Skill soll verhindern, dass ein Founder monatelang baut, ohne mit Kunden gesprochen zu haben. Er setzt dort an, wo diese Flucht ins Bauen passiert: im Code-Repository, mit Claude Code.

**Problem:** Mit Coding Agents kostet Bauen kaum noch etwas, deshalb wird die Validierung übersprungen. Wissen darüber, wie es richtig ginge, ist vorhanden (z.B. YC Startup School, The Mom Test). Woran es fehlt, ist die tägliche Disziplin, es auch umzusetzen.

**Was der Skill leistet:**

1. Er führt ein Journal über Kundenarbeit, als Markdown im Repository und versioniert mit Git.
2. Er bestimmt die Phase anhand von Belegen, nicht anhand der Selbsteinschätzung.
3. Er macht Bauen vor Kunden sichtbar, indem er vor Produktcode nachfragt. Verboten wird nichts.
4. Er zeigt den Stand auf einem Dashboard, das auch auf einem Display dauerhaft laufen kann.

**Erfolgskriterien (für den Skill selbst)**

| Kriterium | Ziel nach 6 Wochen Pilot |
| --- | --- |
| Journal-Einträge | an ≥ 4 von 5 Werktagen |
| Kundengespräche | ≥ 10 bis Woche 3, ≥ 20 bis Woche 6 |
| Verhältnis Kundenstunden zu Baustunden | ≥ 1:1 vor dem Go |
| Go/No-Go-Entscheidung | dokumentiert am Ende von Woche 6 |

## Nutzer & Einsatzszenario

Der Skill richtet sich an Solo-Founder und kleine Teams, die technisch stark sind, mit Claude Code bauen und noch keine zahlenden Kunden haben. Er kommt dabei ohne neues Tool aus: Der Founder spricht mit Claude im Terminal, und alle Daten liegen als Dateien im Repository.

**Typischer Tag**

1. **Morgens:** Das Dashboard auf dem Mini-PC zeigt die nächste Aktion, z.B. „3 Follow-ups fällig“.
2. **Kundenblock (60–90 Min.):** Anfragen senden und Gespräche führen.
3. **Danach in Claude Code:** *„Journal: 10 angeschrieben, 2 Gespräche, Zitat …“*. Claude schreibt den Eintrag, legt die Interview-Dateien an und aktualisiert die Kontakte.
4. **Bauen:** Fragt der Founder nach einem Feature, prüft das Gate zuerst die Phase.
5. **Freitags:** *„Review“*. Das ergibt Zahlen, Phase, höchstens 3 Ratschläge und das Update für den Founder Circle.

**Repository-Varianten**

| Variante | Wann | Beispiel |
| --- | --- | --- |
| Eigenes GTM-Repository | Produkt existiert schon, Validierung soll getrennt laufen | `sokrates-gtm` neben `sokrates` |
| Im Produkt-Repository | neue Idee, noch kein Code | `founder/` + `landing/`, `app/` erst nach Go |

## Ablauf

&#91;embedded content: Ablauf · 4 Gates, 1 Entscheidung\]

Jedes Gate wird anhand der Dateien in `founder/` geprüft. Wird eine Go-Schwelle verfehlt, ändert der Founder genau eine Variable und startet neu bei G0. Bei einem Kill wird die Idee beendet.

## Funktionen

Der Skill hat 7 Modi. Welcher davon läuft, erkennt Claude an der Anfrage. Feste Befehle braucht der Founder nicht.

| Modus | Auslöser (Beispiel) | Was passiert | Ergebnis |
| --- | --- | --- | --- |
| Init | „Leg das Founder Journal an“ | fragt ICP-Satz und Problem ab, legt die Ordner an, ergänzt die `CLAUDE.md`, klärt `.gitignore` | `founder/`, `landing/`, Founder-Regel |
| Landing | „Bau die Landingpage“ | statische Seite mit Problem-Überschrift, einem Call-to-Action (Gespräch buchen oder Founding-Platz), E-Mail als Alternative, Impressum, Datenschutz | `landing/index.html` |
| Landing-Review | „Review die Landingpage“ | prüft 5-Sekunden-Test, einen einzigen CTA, Kundensprache, Preis/Angebot, rechtliche Pflichtangaben | Befund + Korrekturvorschläge |
| Log | „Journal: …“ | schreibt den Tageseintrag, legt pro Gespräch eine Interview-Datei an, aktualisiert `contacts.csv` | `journal/`, `interviews/` |
| Review | „Review“ / freitags | zählt, bestimmt die Phase aus Belegen, findet Muster, gibt höchstens 3 Ratschläge und 1 nächste Aktion | `reviews/JJJJ-Www.md`, `state.md` |
| Gate | Feature-Anfrage an Claude | prüft Phase und Schwellen, nennt den Trade-off, fragt nach, protokolliert Ausnahmen | Hinweis + Journal-Eintrag |
| Circle-Update | „Update für den Circle“ | erzeugt das Wochen-Update im Startup-School-Stil: Hauptkennzahl, Fortschritt, Blocker, Bitte an die Gruppe | `reviews/JJJJ-Www-circle.md` |

**Grundprinzipien**

- Claude erfindet keine Fakten. Fehlt etwas, schreibt er „unklar“.
- Der Founder entscheidet. Der Skill verweigert nichts, er macht den Trade-off sichtbar.
- Zahlen kommen aus den Dateien, nicht aus der Erinnerung von Claude.
- Der Ton ist ein ehrlicher Spiegel: kurz, ohne Anfeuerung.

## Datenmodell

Alles liegt als Markdown und CSV im Repository. Diese Dateien sind die einzige Quelle der Wahrheit, das Dashboard ist nur eine Ansicht darauf. Eine Datenbank braucht es erst, wenn mehrere Founder oder Programme das System gemeinsam nutzen.

```
sokrates-gtm/
  CLAUDE.md                # Founder-Regel: Gate vor Produktcode
  .claude/skills/founder-journal/SKILL.md
  founder/
    state.md               # Phase, ICP, Problem, Go-Schwellen, aktuelle Zahlen
    contacts.csv           # Kundendatenbank
    journal/2026-11-10.md  # ein Eintrag pro Tag
    interviews/2026-11-12-anna-m.md
    reviews/2026-W46.md    # Wochen-Review
    reviews/2026-W46-circle.md
    dashboard.html         # erzeugt, nicht von Hand bearbeiten
  landing/
    index.html, impressum.html, datenschutz.html
  scripts/
    render_dashboard.py    # baut dashboard.html aus founder/
```

**contacts.csv**

| Spalte | Werte / Beispiel |
| --- | --- |
| id | k-001 |
| name, rolle, firma | Anna M., Geschäftsführerin, Beispiel GmbH |
| quelle | landing, netzwerk, community, intro, event |
| status | neu, angefragt, gespraech-geplant, gespraech-gefuehrt, pilot, zahlend, verloren |
| commitment | 0 keins, 1 Zeit, 2 Intro, 3 Daten/Aufwand, 4 LOI mit Preis, 5 bezahlt |
| letzter\_kontakt, naechster\_schritt | 2026-11-12, Pilot-Angebot schicken |

**Interview-Datei:** Person, Rolle, Datum, Schmerz 1–5 (begründet mit Verhalten), aktueller Workaround, bereits ausgegebenes Geld oder Zeit, Entscheider, Intro ja/nein, wörtliches Zitat, Commitment-Stufe, nächster Schritt.

**Tageseintrag:** Anfragen gesendet, Gespräche geführt, Commitments, Gelerntes, Baustunden, die wichtigste Kundenaktion für morgen.

**Datenschutz:** In `contacts.csv` und `interviews/` stehen echte Personen. Das Repository muss deshalb privat sein, oder `founder/` steht in der `.gitignore`. Die Anmeldungen über die Landingpage laufen über einen Formular-Dienst mit Double-Opt-in und werden von dort exportiert.

## Gate-Regeln & Schwellen

Produktcode wird erst normal gebaut, wenn alle Go-Schwellen erfüllt sind. Vorher fragt das Gate bei jeder Anfrage nach Produktcode nach. Erlaubt ist vor dem Go nur, was dem Verkaufen dient: Landingpage, Klick-Prototyp, Demo-Video, Werkzeuge für einen Concierge-Service.

**Zwischen-Gates**

| Gate | Bedingung | Danach erlaubt |
| --- | --- | --- |
| G0 Setup | ICP-Satz und Problem in `state.md` | Landingpage bauen |
| G1 Landing live | Seite online, Landing-Review ohne offene Punkte | Outreach starten |
| G2 Erste Signale | ≥ 10 geführte Gespräche | Muster-Analyse, Commitment-Angebote |
| G3 Go | alle Go-Schwellen unten erfüllt | Produktcode für den Kern-Workflow |

**Go-Schwellen** (bei Init festgelegt, danach nicht mehr änderbar ohne Journal-Eintrag mit Begründung)

| Kriterium | Go | Pivot | Kill |
| --- | --- | --- | --- |
| Geführte Gespräche | ≥ 20 | ≥ 20 | < 10 trotz 100 Anfragen |
| Schmerz ≥ 4 von 5 | ≥ 60 % | 30–60 % | < 30 % |
| Aktiver Workaround mit Kosten | ≥ 50 % | 25–50 % | < 25 % |
| Zahlende Zusagen (Stufe 4–5) | ≥ 3 | 1–2 | 0 |
| Antwortrate auf Anfragen | ≥ 15 % | 5–15 % | < 5 % |

**Verhalten des Gates**

1. Es erkennt, ob die Anfrage Produktcode betrifft, also etwas außerhalb von `landing/` und `founder/`.
2. Ist G3 nicht erreicht, antwortet Claude zuerst mit einer Zeile, z.B.: *„G2 offen: 4 von 10 Gesprächen. Das ist Bauen vor Kunden. Trotzdem weitermachen?“*
3. Bestätigt der Founder, baut Claude und trägt Ausnahme und Baustunden ins Journal ein. Das Review zählt diese Ausnahmen.
4. Nach dem Go fragt Claude bei jedem Feature, ob ein zahlender Kunde danach gefragt hat.

**Grenze:** Ein Skill wirkt nur, solange Claude die Regel aus der `CLAUDE.md` beachtet. Ein hartes Gate wäre erst als Plugin mit einem PreToolUse-Hook möglich. Das ist für Version 2 vorgesehen.

## Dashboard & Mini-PC

Das Dashboard ist eine einzelne statische HTML-Seite, die ohne Server auskommt. Ein Skript erzeugt sie aus `founder/`. Auf einem Mini-PC mit Display läuft sie dauerhaft im Vollbild, damit der Stand sichtbar ist, ohne dass der Founder eine Seite öffnen muss.

**Inhalt, von oben nach unten (ein Bildschirm, ohne Scrollen)**

1. **Nächste Aktion:** groß, aus dem letzten Review oder aus fälligen Follow-ups.
2. **Phasen-Leiste:** G0 → G1 → G2 → G3, danach MVP → Produkt → Skalierung. Die aktuelle Stufe ist hervorgehoben.
3. **Go-Ampel:** jede Schwelle als Ampel mit aktuellem Wert, z.B. „Gespräche 8/20“.
4. **Funnel:** Kontakte → angefragt → Gespräch → Commitment ab Stufe 3 → zahlend.
5. **Wochenverlauf:** Gespräche und Anfragen gegen das Ziel, dazu Kundenstunden gegen Baustunden.
6. **Zitate:** die 3 stärksten der letzten 14 Tage.
7. **Stiller Mahner:** Bleibt das Journal 2 Werktage leer, wird der Rand orange.

**Technik**

| Baustein | Lösung |
| --- | --- |
| Render-Skript | `scripts/render_dashboard.py`, nur Python-Standardbibliothek, liest Markdown und CSV und schreibt `founder/dashboard.html` |
| Aktualisierung | Cronjob auf dem Mini-PC: alle 5 Minuten `git pull` und Render-Skript |
| Anzeige | Browser im Kiosk-Modus, Seite lädt alle 5 Minuten neu |
| Design | dunkler Hintergrund, aus 2–3 m lesbar, große Zahlen |
| Rat und Bewertung | kommen nur aus dem Review mit Claude; das Skript rechnet nur Zahlen |

**Trade-off:** Die Zahlen sind immer aktuell, die Ratschläge aber nur so frisch wie das letzte Review. Ein tägliches automatisches Review wäre möglich, kostet aber API-Nutzung und einen Claude-Zugang auf dem Mini-PC.

## Pilot: Sokrates

Sokrates ist der erste Testfall. Die App existiert bereits (Repository `mind-vm/sokrates`), hat aber noch keine Kunden. Der Pilot läuft deshalb in einem eigenen Repository `sokrates-gtm`. Die Startseite der App dient als Ausgangspunkt für die Landingpage. Das ist ein Sonderfall: Hier wurde schon gebaut, bevor Kunden da waren. Der Pilot prüft also nachträglich, ob und für wen sich das Gebaute verkaufen lässt.

**6-Wochen-Plan**

| Woche | Fokus | Ergebnis |
| --- | --- | --- |
| 1 | Init, ICP und Problem für Sokrates festlegen; Landingpage aus der App-Startseite ableiten, reviewen, live stellen | G0 + G1 erreicht |
| 1–2 | Kontaktliste mit 100 Personen aus dem ICP; erster eigener Founder Circle startet | `contacts.csv` gefüllt |
| 2–3 | 10 Problem-Interviews, an der App vorbei: erst das Problem verstehen, nicht die App zeigen | G2 erreicht |
| 4–5 | Commitment-Test mit Founding-Member-Angebot oder bezahltem Pilot, Demo der bestehenden App | erste Zusagen ab Stufe 3 |
| 6 | Go/No-Go anhand der Schwellen; Lessons Learned zum Skill selbst | Entscheidung + Skill v2 |

**Was der Pilot über den Skill zeigen soll**

- Nutzt der Founder das Journal täglich, oder schläft es nach 2 Wochen ein?
- Löst das Gate echte Nachfragen aus, und wie oft wird es übergangen?
- Ist das Dashboard auf dem Mini-PC hilfreich oder nur Dekoration?
- Welche Teile würden andere Founder, etwa im Circle oder bei AI Nation und BayStartUP, übernehmen?

**Noch offen für Sokrates**

- [ ] Was macht Sokrates, und für wen? Daraus entsteht der ICP-Satz.
- [ ] Zugriff auf die Startseite in `mind-vm/sokrates`, um die Landingpage abzuleiten
- [ ] Preisidee für das Founding-Member-Angebot
- [ ] Formular-Dienst für die Anmeldungen auswählen (mit Double-Opt-in)

## Abgrenzung, Risiken & offene Fragen

**Nicht in Version 1**

- Kein CRM und keine Datenbank. Bis etwa 100 Kontakte reicht `contacts.csv`.
- Kein automatischer Outreach. Der Skill schreibt Entwürfe, senden muss der Founder selbst.
- Kein hartes Gate per Hook. Das kommt erst in Version 2 als Plugin.
- Keine Mehrbenutzer-Ansicht für Founder Circles oder Programme. Das ist eine mögliche Produktstufe nach dem Pilot.

**Risiken**

| Risiko | Gegenmaßnahme |
| --- | --- |
| Journal schläft nach 2 Wochen ein | Mahner auf dem Dashboard, Update als Eintrittskarte im Founder Circle |
| Gate wird routinemäßig übergangen | jede Ausnahme wird gezählt und im Review gezeigt |
| Schwellen werden nachträglich geschönt | Änderung nur mit Journal-Eintrag und Begründung |
| Personenbezogene Daten im Repository | privates Repository oder `.gitignore`, Formular-Dienst mit Double-Opt-in |
| Bei Sokrates verzerrt die bestehende App die Interviews | in Woche 2–3 nur über das Problem sprechen, die App erst ab Woche 4 zeigen |

**Offene Fragen**

- Bleibt der Skill ein Werkzeug für dich, oder wird er Teil eines Produkts für Founder Circles und Programme? Das entscheidet sich nach dem Pilot.
- Welches Betriebssystem läuft auf dem Mini-PC? Davon hängt das Setup für den Kiosk-Modus ab.
- Wird `founder/` committet, oder liegt es außerhalb von Git?

## Quellen

- [The Mom Test, Rob Fitzpatrick](https://www.momtestbook.com/)
- Customer-First Playbook (Schwellen und Phasen): eigenes Dokument in diesem Projekt
