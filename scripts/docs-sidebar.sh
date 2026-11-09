#!/usr/bin/env bash
# Erzeugt _sidebar.md für Docsify: Konzepte in docs/, dann der Skill
# (SKILL.md, Referenzen, Vorlagen). Titel = erste "# "-Überschrift, sonst Dateiname.
set -euo pipefail
cd "$(dirname "$0")/.."

SKILL=plugins/founder-journal/skills/founder-journal

title() {
  local t
  t=$(grep -m1 '^# ' "$1" 2>/dev/null | sed 's/^# //') || true
  echo "${t:-$(basename "$1" .md)}"
}

{
  echo "- [Übersicht](/README.md)"
  echo "- Konzepte"
  for f in docs/*.md; do
    echo "  - [$(title "$f")](/$f)"
  done
  echo "- Skill founder-journal"
  echo "  - [SKILL.md](/$SKILL/SKILL.md)"
  for f in "$SKILL"/references/*.md; do
    echo "  - [$(title "$f")](/$f)"
  done
  echo "- Vorlagen"
  for f in "$SKILL"/templates/*.md; do
    echo "  - [$(basename "$f" .md)](/$f)"
  done
} > _sidebar.md
