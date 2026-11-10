# Modus Init

Legt das Founder Journal im **Repository des Produkts** an, als eigener Bereich `founder/` neben Code und Docs. Einmal pro Produkt-Zyklus. Das funktioniert auch und gerade, wenn dort schon Code liegt: Dann ist es ein Neustart vom Kunden her.

**Grundsatz:** Alles fürs Founder Journal liegt in `founder/` – Stand, Journal, Kontakte, Leitfaden, Docsify, eine eigene Landingpage, Skripte. Außerhalb von `founder/` ändert Init nur den Founder-Block in `CLAUDE.md`, ergänzt `.gitignore` und `.claude/`. Eine vorhandene Website oder App des Produkts wird nicht angefasst; sie ist für später.

Struktur und Dateien: [datenmodell.md](datenmodell.md). Platzhalter in den Vorlagen: `{{PRODUKT}}`, `{{PORT}}`, `{{VERSION}}` (aus `plugin.json` des Plugins).

## Schritte

1. **Prüfen.** Root des Git-Repositorys des Produkts? Sonst den Founder fragen (Init gehört ins Produkt-Repository; ein leeres neues Repository ist in Ordnung). Existiert `founder/state.md` schon: abbrechen, auf Review verweisen.
2. **Sichtbarkeit klären.** `gh repo view --json visibility` oder fragen. Ist das Repository öffentlich: deutlich sagen, dass Journal und Reviews dann öffentlich sind; Kontakte und Interviews bleiben per `.gitignore` lokal. Der Founder entscheidet, ob er trotzdem weitermacht oder `founder/` ganz ausschließt.
3. **Bestand erfassen**, wenn schon Code oder eine Website existiert: README, Docs, Marken- und Marketing-Dokumente, Website-Ordner und Live-Seite lesen (URL erfragen). Ergebnis in `founder/befund-bestand.md`: was gebaut ist, was die Live-Seite verspricht (Preis, CTA, Impressum, Datenschutz), welches Material für Landingpage und Demo taugt. Fertig, wenn jede Abweichung eine Folge hat.
4. **Struktur anlegen** laut Datenmodell: Ordner mit `.gitkeep`, `founder/contacts.csv` aus `templates/contacts.csv`. Die Zeilen aus `templates/gitignore` an die `.gitignore` des Repositorys anhängen (nie ersetzen).
5. **CLAUDE.md:** Block aus `templates/CLAUDE-block.md` an die vorhandene `CLAUDE.md` anhängen (oder sie anlegen). Platzhalter: Produkt, Markenregeln (Verweis auf vorhandene Dokumente oder „keine“). Der Block macht alles außerhalb von `founder/` zu Produktcode, vor dem das Gate nachfragt.
6. **state.md** aus `templates/state.md`: Startdatum heute, Go/No-Go Ende Woche 6, Schwellen aus [methode.md](methode.md). Gab es schon Code: unter „Sonderfall“ eintragen, dass gebaut wurde, bevor es Kunden gab, und dass die App bis Woche 4 in Gesprächen nicht gezeigt wird.
7. **ICP vorbereiten:** Modus ICP ([icp.md](icp.md)), bis `founder/icp-hypothesen.md` 3 bewertete Hypothesen und eine Empfehlung hat.
8. **Erster Journal-Eintrag** aus `templates/journal.md`.
9. **Lesen einrichten (Docsify):**
   - `templates/docsify-index.html` → `founder/index.html`
   - `templates/docs-sidebar.sh` → `founder/scripts/docs-sidebar.sh` (ausführbar)
   - `templates/launch.json` → `.claude/launch.json`, Konfiguration `docs` mit freiem Port (Standard 4333); eine vorhandene Datei ergänzen
   - `templates/settings.json` → `.claude/settings.json` (zusammenführen), damit das Plugin hier immer aktiv ist
10. **Leitfaden kopieren:** `templates/leitfaden/README.md`, `ablauf.md`, `interviews.md` → `founder/leitfaden/`; [methode.md](methode.md) → `founder/leitfaden/methode.md` mit der Zeile `> Kopie aus dem Plugin founder-journal <Version>. Bitte nicht hier bearbeiten.` unter der Überschrift. Dann `founder/scripts/docs-sidebar.sh` laufen lassen.

Die Landingpage legt Init nicht an; das ist der Modus Landing nach G0 (Landing-Kit nach `founder/landing/`).

## Leitfaden aktualisieren

Auslöser „Leitfaden aktualisieren“ oder ein neues Plugin: Schritt 10 erneut ausführen, `founder/leitfaden/` vollständig überschreiben und `founder/scripts/docs-sidebar.sh` durch `templates/docs-sidebar.sh` ersetzen. Der Leitfaden ist eine Kopie, nie eine eigene Quelle; eigene Notizen gehören in die übrigen Dateien unter `founder/`. Journal-Zeile mit der Version.

## Fertig, wenn

- alle Dateien aus dem Datenmodell existieren und `grep -r '{{' founder/` leer ist,
- außerhalb von `founder/` nur `CLAUDE.md`, `.gitignore` und `.claude/` geändert sind (`git status`),
- `founder/state.md` „G0 offen“ und die nächste Aktion „ICP festlegen“ zeigt,
- der Founder die Fragen aus `icp-hypothesen.md` hat und weiß, wie er liest (Konfiguration `docs` in der Claude-App oder `founder/scripts/docs-sidebar.sh && python3 -m http.server <Port> --directory founder`).

Nicht committen; der Founder entscheidet über den ersten Commit.

## Altes Setup: eigenes GTM-Repository

Frühere Zyklen legten alles in ein eigenes Repository `<produkt>-gtm`. Umziehen: dessen `founder/` in den Bereich `founder/` des Produkt-Repositorys kopieren, `leitfaden/` nach `founder/leitfaden/`, `landing/` nach `founder/landing/`, Schritte 4, 5 und 9 ausführen, das GTM-Repository archivieren.
