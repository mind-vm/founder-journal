#!/usr/bin/env bash
# Erzeugt _sidebar.md für Docsify aus allen Markdown-Dateien in founder/ und landing/.
# Titel = erste "# "-Überschrift, sonst Dateiname. Journal und Reviews: neueste zuerst.
set -euo pipefail
cd "$(dirname "$0")/.."

title() {
  local t
  t=$(grep -m1 '^# ' "$1" 2>/dev/null | sed 's/^# //') || true
  echo "${t:-$(basename "$1" .md)}"
}

{
  echo "- [Stand](/founder/state.md)"
  for f in founder/*.md; do
    [ "$f" = founder/state.md ] && continue
    echo "- [$(title "$f")](/$f)"
  done
  for dir in founder/*/; do
    name=$(basename "$dir")
    files=$(find "$dir" -name '*.md' | sort -r)
    [ -z "$files" ] && continue
    echo "- $(echo "${name:0:1}" | tr '[:lower:]' '[:upper:]')${name:1}"
    while IFS= read -r f; do
      echo "  - [$(title "$f")](/$f)"
    done <<< "$files"
  done
  echo "- Repo"
  echo "  - [Landing](/landing/README.md)"
  echo "  - [CLAUDE.md](/CLAUDE.md)"
} > _sidebar.md
