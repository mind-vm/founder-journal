#!/usr/bin/env bash
# Exportiert die Anfragen der Landingpage (D1) als CSV nach founder/private/
# (nicht im Git) oder löscht eine Adresse.
#
#   scripts/anfragen-export.sh
#   scripts/anfragen-export.sh --loeschen adresse@example.de
#
# Liegt in founder/landing/scripts/; braucht `npx wrangler login`.
set -euo pipefail
cd "$(dirname "$0")/.."
DB=$(python3 -c 'import json,re,sys; s=open("wrangler.jsonc").read(); s=re.sub(r"^\s*//.*$","",s,flags=re.M); print(json.loads(s)["d1_databases"][0]["database_name"])')
OUT="../private/anfragen-$(date +%F).csv"

if [[ "${1:-}" == "--loeschen" ]]; then
  email="${2:?Adresse fehlt}"
  [[ "$email" =~ ^[^\'[:space:]]+@[^\'[:space:]]+$ ]] || { echo "Ungültige Adresse" >&2; exit 1; }
  npx wrangler d1 execute "$DB" --remote --command "DELETE FROM anfragen WHERE email = '$(tr '[:upper:]' '[:lower:]' <<<"$email")'"
  echo "Gelöscht: $email (im Journal vermerken)"
  exit 0
fi

mkdir -p "$(dirname "$OUT")"
npx wrangler d1 execute "$DB" --remote --json \
  --command "SELECT substr(created_at,1,10) AS datum, art, email, vorname, gespraech, antworten, quelle FROM anfragen ORDER BY created_at" 2>/dev/null |
python3 -c '
import csv, json, sys
d = json.load(sys.stdin); d = d[0] if isinstance(d, list) else d
rows = d["results"]
keys = sorted({k for r in rows for k in json.loads(r["antworten"] or "{}")})
w = csv.writer(sys.stdout)
w.writerow(["datum", "art", "email", "vorname", "gespraech", "quelle"] + keys)
for r in rows:
    a = json.loads(r["antworten"] or "{}")
    w.writerow([r["datum"], r["art"], r["email"], r["vorname"], "ja" if r["gespraech"] else "nein", r["quelle"]] + [a.get(k, "") for k in keys])
print(f"{len(rows)} Einträge", file=sys.stderr)
' > "$OUT"
echo "Gespeichert: $OUT"
