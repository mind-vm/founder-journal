# FounderJournal

Plugin-Repository für Customer-First-Werkzeuge in Claude Code: erst Kunden, dann Code.

## Inhalt

| Pfad | Was |
| --- | --- |
| `docs/` | Methode und Konzepte: [Playbook](docs/customer-first-playbook.md), [Fachkonzept](docs/fachkonzept-founder-journal-skill.md), [Lösungskonzept](docs/loesungskonzept-customer-first-mit-ki.md) |
| `plugins/founder-journal/` | Plugin mit dem Skill `founder-journal` (Modi: Triage, Init, ICP, Landing, Outreach, Log, Review, Asset/Ad-Test, Gate) |
| `.claude-plugin/marketplace.json` | macht dieses Repository zu einem Marketplace |

## Lesen

Alle Dokumente als Website mit Navigation und Suche (Docsify):

```bash
scripts/docs-sidebar.sh && python3 -m http.server 4334 --bind 127.0.0.1
```

Dann http://localhost:4334 öffnen. In der Claude-App startet die Konfiguration `docs` aus `.claude/launch.json` dasselbe.

## Installieren (einmal pro Rechner)

In einer `claude`-Session:

```
/plugin marketplace add mind-vm/founder-journal
/plugin install founder-journal@founder-journal
```

Ohne Angabe wird das Plugin global installiert („user“). Damit gibt es die Befehle `/founder-journal:…` in jedem Ordner, auch in einem neuen, leeren Repository. Updates holst du mit `/plugin marketplace update founder-journal`.

## Im Repository eines Produkts starten

Das Founder Journal lebt **im Repository des Produkts**, als eigener Bereich `founder/` neben Code und Docs. Das geht für ein neues, leeres Repository genauso wie für eines, in dem schon monatelang gebaut wurde: Dann ist es der Neustart vom Kunden her.

1. Im Repository des Produkts Claude starten (Terminal: `claude`, oder den Ordner in der Claude-App öffnen).
2. Eingeben:
   ```
   /founder-journal:init https://meinprodukt.de
   ```
   Die Website ist optional; gibt es eine, liest Init sie mit.
3. Init legt `founder/` an (Stand, Journal, Kontakte, Leitfaden, Docsify), hängt den Founder-Block an `CLAUDE.md`, ergänzt `.gitignore` und `.claude/` und entwirft drei ICP-Hypothesen. Sonst ändert Init nichts; eine vorhandene Website oder App bleibt, wie sie ist.
4. Du wählst eine Hypothese. Dann `/founder-journal:landing`: Es legt eine **eigene Landingpage** in `founder/landing/` an (Landing-Kit: Gesprächs- und Ergebnis-Formular, Cloudflare Worker, D1, Benachrichtigung per Mail) und führt durch die Einrichtung.

**Ab dann gilt:** Alles außerhalb von `founder/` ist Produktcode. Bevor dort etwas entsteht, fragt Claude nach (Gate), bis Kunden zugesagt haben. Bugfixes laufen als „Betrieb“ ohne Nachfrage.

```
mein-produkt/
  CLAUDE.md          + Founder-Block
  src/, docs/, …     das Produkt (hinter dem Gate)
  founder/
    state.md         Stand, Phase, nächste Aktion
    journal/ …       Journal, Interviews, Kontakte, Reviews, Assets
    leitfaden/       So arbeitest du hier, Ablauf, Interviews, Methode
    landing/         eigene Landingpage
    index.html       Docsify: founder/ als Website lesen
```

Mehrere Produkte und unklar, welches zuerst: vorher `/founder-journal:triage`.

## Befehle

| Befehl | Wofür |
| --- | --- |
| `/founder-journal:triage` | aus mehreren Produkten eines wählen |
| `/founder-journal:init` | Repository für ein Produkt anlegen |
| `/founder-journal:icp` | Zielgruppe und Problem schärfen |
| `/founder-journal:landing` | Landingpage bauen oder ändern |
| `/founder-journal:landing-review` | Landingpage prüfen |
| `/founder-journal:watering-holes` | Orte finden, an denen die Zielgruppe spricht |
| `/founder-journal:anfragen` | Entwürfe für heutige Anfragen und Follow-ups |
| `/founder-journal:journal` | den Tag eintragen: Anfragen, Gespräche, Zitate |
| `/founder-journal:review` | Wochen-Review |
| `/founder-journal:circle` | Update für den Founder Circle |
| `/founder-journal:asset` | Flyer, Video, Onepager, Ad-Test |
| `/founder-journal:leitfaden` | Leitfaden auf den Stand des Plugins bringen |

Jeder Befehl startet einen **Modus** des Skills: einen Abschnitt mit eigenen Schritten (`skills/founder-journal/references/`). Freie Sprache geht genauso: „Journal: 10 angeschrieben …“ oder „Review“ wählt denselben Modus. Das Gate vor Produktcode hat keinen Befehl; es greift von selbst, wenn du im Repository Produktcode bauen willst.

## Version 2 (geplant)

- `scripts/render_dashboard.py` und Kiosk-Setup für den Mini-PC
- hartes Gate per PreToolUse-Hook

## Lizenz

[MIT](LICENSE) · Jürgen Ryannel
