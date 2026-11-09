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

## Installieren

In einer `claude`-Session:

```
/plugin marketplace add /Users/jryannel/dev/tmp/FounderJournal
/plugin install founder-journal@founder-journal
```

Nach Änderungen am Skill: `/plugin marketplace update founder-journal`.

## Ein GTM-Repository starten

Im leeren GTM-Repository (z.B. `sokrates-gtm`) eine Claude-Session öffnen und sagen: *„Leg das Founder Journal an“*. Der Skill fragt nach Produkt-Repository und Live-Seite, legt `founder/` an, ergänzt `CLAUDE.md` um die Founder-Regel und entwirft drei ICP-Hypothesen.

## Version 2 (geplant)

- `scripts/render_dashboard.py` und Kiosk-Setup für den Mini-PC
- hartes Gate per PreToolUse-Hook
