#!/usr/bin/env bash
# Erzeugt founder/_sidebar.md für Docsify (Root = founder/), geordnet nach dem
# Ablauf: fünf Phasen mit Status aus state.md (✓ erledigt, ● jetzt), darunter
# die Unterlagen der Phase; danach was immer läuft (Journal, Reviews, Assets)
# und der Leitfaden. Titel = erste "# "-Überschrift, sonst Dateiname.
# Liegt in founder/scripts/. Aus dem Plugin founder-journal.
set -euo pipefail
cd "$(dirname "$0")/.."

python3 - > _sidebar.md <<'PY'
import glob, os, re

def title(p):
    try:
        for line in open(p, encoding="utf-8"):
            if line.startswith("# "):
                return line[2:].strip()
    except OSError:
        pass
    return os.path.splitext(os.path.basename(p))[0]

def link(p, label=None):
    return f"[{label or title(p)}](/{p})"

def files(pattern, newest_first=False):
    return sorted(glob.glob(pattern, recursive=True), reverse=newest_first)

# Status der Gates aus der Tabelle in state.md: | G0 … | Bedingung | Stand |
gates = {}
if os.path.exists("state.md"):
    for line in open("state.md", encoding="utf-8"):
        m = re.match(r"\|\s*(G[0-3])\b[^|]*\|[^|]*\|([^|]*)\|", line)
        if m:
            gates[m.group(1)] = "erreicht" in m.group(2).lower()

landing_reviews = files("reviews/*landing*.md", True)
week_reviews = [f for f in files("reviews/*.md", True) if f not in landing_reviews]

phases = [
    ("Zielgruppe & Problem", "G0", [
        "icp-hypothesen.md", "befund-bestand.md", "portfolio.md"]),
    ("Landingpage", "G1", ["landing/README.md"] + landing_reviews),
    ("Kontakte & Gespräche", "G2",
        files("outreach/*.md") + files("interviews/*.md", True)),
    ("Zusagen", None, files("angebote/*.md", True)),
    ("Entscheidung", "G3", files("entscheidung*.md")),
]

done = []
for _, gate, _ in phases:
    if gate is None:            # Zusagen: erledigt, wenn G3 erreicht ist
        gate = "G3"
    done.append(gates.get(gate, False))
current = next((i for i, d in enumerate(done) if not d), None)

out = [f"- {link('state.md', 'Stand')}"]
if os.path.exists("leitfaden/ablauf.md"):
    out.append(f"- {link('leitfaden/ablauf.md', 'Ablauf')}")
for i, (name, gate, paths) in enumerate(phases):
    mark = "✓" if done[i] else ("●" if i == current else "○")
    suffix = f" · {gate}" if gate else ""
    out.append(f"- {mark} {i + 1} {name}{suffix}")
    shown = [p for p in paths if os.path.exists(p)]
    for p in shown:
        out.append(f"  - {link(p)}")
    if not shown:
        out.append("  - noch nichts")

out.append("- Laufend")
journals = files("journal/*.md", True)
if journals:
    out.append(f"  - Journal: {link(journals[0], 'neuester Eintrag')}")
    for p in journals[1:]:
        out.append(f"  - {link(p)}")
for p in week_reviews:
    out.append(f"  - {link(p)}")
for p in files("assets/*/README.md", True):
    out.append(f"  - {link(p)}")

if os.path.exists("leitfaden/README.md"):
    out.append("- Leitfaden")
    out.append(f"  - {link('leitfaden/README.md', 'So arbeitest du hier')}")
    for p in ["leitfaden/interviews.md", "leitfaden/methode.md"]:
        if os.path.exists(p):
            out.append(f"  - {link(p)}")
print("\n".join(out))
PY
