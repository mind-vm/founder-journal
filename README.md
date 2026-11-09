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

## Ein Repository für ein Produkt anlegen

1. Neuen Ordner neben dem Produkt anlegen und Git starten:
   ```bash
   mkdir ~/dev/tmp/meinprodukt-gtm && cd ~/dev/tmp/meinprodukt-gtm && git init
   ```
2. Dort Claude starten (Terminal: `claude`, oder in der Claude-App den Ordner öffnen).
3. Eingeben:
   ```
   /founder-journal:init ~/dev/github.com/…/meinprodukt https://meinprodukt.de
   ```
   Pfad zum Produkt-Repository und Website sind optional; ohne fragt Init danach.
4. Init liest den Bestand, legt `founder/`, `leitfaden/`, Docsify und die Founder-Regel in `CLAUDE.md` an, aktiviert das Plugin für dieses Repository (`.claude/settings.json`) und entwirft drei ICP-Hypothesen.
5. Du wählst eine Hypothese. Weiter geht es mit `/founder-journal:landing`.

Hast du mehrere Produkte und weißt nicht, welches zuerst: vorher `/founder-journal:triage`.

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
