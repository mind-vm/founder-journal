# Founder Journal

**Erst Kunden, dann Code.** Ein Plugin für Claude Code, das Founder durch die Kundenfindung führt, bevor sie weiterbauen: direkt im Repository des Produkts.

📖 Dokumentation: **https://mind-vm.github.io/founder-journal/**

## Das Problem

Mit Coding Agents kostet Bauen fast nichts mehr. Eine SaaS-App entsteht in Wochen, und genau deshalb fällt der Schritt weg, der eigentlich zuerst kommt: herausfinden, wer welches Problem so dringend hat, dass er dafür bezahlt.

Das Muster ist immer gleich:

- **Bauen fühlt sich produktiv an, Vertrieb nicht.** Code liefert jeden Tag sichtbaren Fortschritt. Eine Anfrage, auf die niemand antwortet, fühlt sich nach nichts an.
- **Das Wissen ist da, die Disziplin fehlt.** *The Mom Test*, Y Combinator und Customer Development erklären seit Jahren, wie es geht. Was fehlt, ist jemand, der jeden Tag nachfragt, ob es auch passiert.
- **Die Flucht ins Bauen passiert im Repository.** Genau dort, wo Claude Code läuft und auf „bau mir Feature X“ wartet.
- **Programmieren unterscheidet niemanden mehr.** Wenn jeder bauen kann, gewinnt, wer seine Kunden am besten versteht.

Das Ergebnis sind fertige Apps ohne einen einzigen zahlenden Kunden.

## Die Idee

Founder Journal setzt dort an, wo das Problem entsteht: im Repository des Produkts. Es bekommt einen eigenen Bereich `founder/`, und ab dann gilt:

1. **Ein Gate vor dem Produktcode.** Alles außerhalb von `founder/` ist Produktcode. Bevor dort etwas entsteht, nennt Claude die Phase und den Trade-off („G2 offen: 4 von 10 Gesprächen. Das ist Bauen vor Kunden. Trotzdem?“) und fragt nach. Verboten wird nichts, aber jede Ausnahme wird gezählt.
2. **Phase aus Belegen, nicht aus dem Gefühl.** Gespräche, Zitate, Zusagen und Baustunden stehen als Markdown und CSV in `founder/`. Claude zählt aus den Dateien, nicht aus der Erinnerung.
3. **KI bis zum Senden-Knopf.** Claude recherchiert, wo die Zielgruppe zu finden ist, schreibt Anfragen, baut Landingpage und Flyer und wertet Gespräche aus. Senden, sprechen, den Preis nennen und entscheiden bleibt beim Founder, denn im Gespräch lernt man, was man eigentlich bauen sollte.
4. **Feste Schwellen statt Hoffnung.** Nach 6 Wochen entscheiden 20 Gespräche, der Anteil mit echtem Schmerz und 3 zahlende Zusagen über Go, Pivot oder Kill. Die Schwellen werden am Anfang festgeschrieben.

## Der Ablauf

| # | Phase | Ende (Gate) |
| --- | --- | --- |
| 1 | Zielgruppe & Problem | **G0**: ein ICP-Satz, ein Problem |
| 2 | Landingpage | **G1**: Seite online, bittet um ein Gespräch |
| 3 | Kontakte & Gespräche | **G2**: 10 geführte Problem-Interviews |
| 4 | Zusagen | zahlende Zusagen einholen |
| 5 | Entscheidung | **G3**: Go, Pivot oder Kill gegen die Schwellen |

Daneben läuft jeden Tag das Journal und jeden Freitag ein Review. Die ganze Methode steht im [Customer-First Playbook](docs/customer-first-playbook.md).

## Schnellstart

Einmal pro Rechner, in einer `claude`-Session:

```
/plugin marketplace add mind-vm/founder-journal
/plugin install founder-journal@founder-journal
```

Dann im Repository des Produkts, egal ob leer oder seit Monaten gebaut:

```
/founder-journal:init https://meinprodukt.de
```

Init erfasst den Bestand, legt `founder/` an, hängt den Founder-Block an `CLAUDE.md` und entwirft drei Hypothesen für die Zielgruppe. Eine vorhandene Website oder App fasst es nicht an. Danach geht es mit `/founder-journal:landing` weiter.

## Befehle

Jeder Befehl startet einen **Modus** des Skills. Eigene Worte gehen genauso, z.B. „Journal: 10 angeschrieben, 2 Gespräche …“.

| Befehl | Wofür |
| --- | --- |
| `/founder-journal:triage` | aus mehreren Produkten eines wählen |
| `/founder-journal:init` | Founder Journal im Repository anlegen |
| `/founder-journal:icp` | Zielgruppe und Problem schärfen |
| `/founder-journal:landing` | eigene Landingpage bauen (Landing-Kit) |
| `/founder-journal:landing-review` | Landingpage prüfen: 5-Sekunden-Test, ein CTA, Recht |
| `/founder-journal:watering-holes` | Orte finden, an denen die Zielgruppe über das Problem spricht |
| `/founder-journal:anfragen` | Entwürfe für heutige Anfragen und Follow-ups |
| `/founder-journal:journal` | den Tag eintragen: Anfragen, Gespräche, Zitate, Baustunden |
| `/founder-journal:review` | Wochen-Review: Zahlen, Phase, höchstens 3 Ratschläge |
| `/founder-journal:circle` | Update für den Founder Circle |
| `/founder-journal:asset` | Flyer, Demo-Video, Onepager, Ad-Test, jeweils mit Testfrage |
| `/founder-journal:leitfaden` | Leitfaden auf den Stand des Plugins bringen |

Das Gate hat keinen Befehl; es greift von selbst.

## Was im Repository entsteht

```
mein-produkt/
  CLAUDE.md          + Founder-Block: alles außerhalb von founder/ steht hinter dem Gate
  src/, docs/, …     das Produkt
  founder/
    state.md         Phase, Zielgruppe, Schwellen, Zahlen, nächste Aktion
    journal/         ein Eintrag pro Tag
    interviews/      ein Gespräch pro Datei (bleibt lokal)
    contacts.csv     Kontakte mit Status und Commitment (bleibt lokal)
    outreach/        Vorlagen und Entwürfe für Anfragen
    assets/          Flyer, Videos, Angebote, jeweils mit Testfrage
    reviews/         Wochen-Reviews, Landing-Reviews
    leitfaden/       So arbeitest du hier, Ablauf, Interviews, Methode
    landing/         eigene Landingpage
    index.html       Docsify: founder/ als Website lesen
```

Das **Landing-Kit** ist eine Landingpage ohne Build-Schritt. Sie bittet um ein 15-Minuten-Gespräch (nur E-Mail-Adresse, der Founder bekommt sofort eine Mail) und bietet als zweiten Weg „Ergebnisse per Mail“ mit zwei Fragen. Dahinter stehen ein Cloudflare Worker und D1 in der EU, mit Vorlagen für Impressum und Datenschutz und einem Export-Skript.

## In diesem Repository

| Pfad | Inhalt |
| --- | --- |
| `plugins/founder-journal/` | das Plugin: Skill, Modi (`references/`), Vorlagen, Landing-Kit, Befehle |
| `docs/` | Konzepte: Playbook, Fachkonzept, Lösungskonzept |
| `.claude-plugin/marketplace.json` | macht das Repository zu einem Marketplace |
| `index.html`, `scripts/docs-sidebar.sh` | die Dokumentation als Website (Docsify, auf GitHub Pages) |

Die Doku lokal lesen:

```bash
scripts/docs-sidebar.sh && python3 -m http.server 4334 --bind 127.0.0.1
```

## Stand und Grenzen

- **Version 0.x.** Der erste Pilot läuft gerade mit einer echten App; das Plugin ändert sich mit dem, was der Pilot zeigt.
- **Das Gate ist weich.** Es wirkt, solange Claude die Regel aus `CLAUDE.md` beachtet. Ein hartes Gate per Hook ist geplant.
- **Auf Deutsch und für Deutschland geschrieben:** Texte, Rechtsvorlagen (Impressum, DSGVO, UWG) und Beispiele. Die Rechtsvorlagen ersetzen keine Prüfung.
- **Geplant:** ein Dashboard für einen dauerhaft laufenden Bildschirm, sobald es echte Zahlen gibt.

## Lizenz

[MIT](https://github.com/mind-vm/founder-journal/blob/main/LICENSE) · Jürgen Ryannel
