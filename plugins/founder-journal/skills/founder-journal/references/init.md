# Modus Init

Legt im aktuellen Repository das Founder Journal an. Einmal pro Produkt-Zyklus.

## Schritte

1. **Ort klären.** Läuft die Session im GTM-Repository (empfohlen: eigenes Repository `<produkt>-gtm` neben dem Produkt) oder im Produkt-Repository selbst? Existiert `founder/state.md` schon, abbrechen und auf Review verweisen.
2. **Bestand erfassen**, falls das Produkt schon existiert: Pfad zum Produkt-Repository und URL der Live-Seite erfragen. Dann README, Marken- und Marketing-Dokumente und die Live-Seite lesen. Ergebnis in `founder/befund-bestand.md`: vorhandenes Material (Tabelle mit Ort und Nutzen) und Abweichungen der Live-Seite (Preis, CTA, Impressum, Datenschutz, Aussagen). Fertig, wenn jede Abweichung eine Folge für G1 hat.
3. **Struktur anlegen** laut [datenmodell.md](datenmodell.md): Ordner mit `.gitkeep`, `contacts.csv` mit Kopfzeile, `.gitignore` aus `templates/gitignore` (bestehende ergänzen, nicht ersetzen).
4. **CLAUDE.md** anlegen oder ergänzen mit `templates/CLAUDE-block.md`. Platzhalter füllen: Produktname, Pfad zum Produkt-Repository, Markenregeln des Produkts (falls vorhanden, als Verweis), Website-Ausnahme (z.B. „ausgenommen `site/`, die Website ist die Landingpage“, sonst „keine Ausnahme“).
5. **state.md** aus `templates/state.md`. Startdatum = heute, Go/No-Go = Ende Woche 6. Schwellen unverändert aus [methode.md](methode.md) übernehmen; will der Founder andere, jetzt festschreiben.
6. **ICP vorbereiten:** Modus ICP ausführen ([icp.md](icp.md)), bis `icp-hypothesen.md` 3 bewertete Hypothesen und eine Empfehlung hat.
7. **Erster Journal-Eintrag** aus `templates/journal.md`.
8. **Lesen einrichten (Docsify):** `templates/docsify-index.html` als `index.html` ins Repository-Root (Platzhalter `{{PRODUKT}}`), `templates/docs-sidebar.sh` nach `scripts/` (ausführbar), `templates/launch.json` nach `.claude/launch.json` mit einem freien Port (Standard 4333; belegt → nächster). Gibt es `.claude/launch.json` schon, die Konfiguration `docs` ergänzen. Außerdem `templates/settings.json` als `.claude/settings.json` (vorhandene Datei zusammenführen), damit das Plugin in diesem Repository immer aktiv ist, auch auf anderen Rechnern. Dann `scripts/docs-sidebar.sh` einmal laufen lassen. Fertig, wenn `index.html`, `scripts/docs-sidebar.sh` und die Startkonfiguration existieren und `_sidebar.md` alle Dateien aus `founder/` listet.

9. **Leitfaden kopieren:** `templates/leitfaden/README.md`, `ablauf.md` und `interviews.md` nach `leitfaden/`, dazu [methode.md](methode.md) als `leitfaden/methode.md` mit der Zeile `> Kopie aus dem Plugin founder-journal <Version>. Bitte nicht hier bearbeiten.` unter der Überschrift. Platzhalter: `{{PRODUKT}}`, `{{PORT}}` (aus Schritt 8), `{{VERSION}}` (aus `plugin.json` des Plugins). Dann `scripts/docs-sidebar.sh` erneut laufen lassen.

## Leitfaden aktualisieren

Auslöser „Leitfaden aktualisieren“ oder ein neues Plugin: Schritt 9 erneut ausführen und `leitfaden/` vollständig überschreiben. Der Leitfaden ist eine Kopie aus dem Plugin, nie eine eigene Quelle; projektspezifische Notizen gehören nach `founder/`. `scripts/docs-sidebar.sh` immer durch `templates/docs-sidebar.sh` ersetzen: Es ordnet die Navigation nach den fünf Phasen und liest den Status aus `state.md`. Journal-Zeile mit der Version.

## Fertig, wenn

- alle Dateien aus dem Datenmodell existieren, einschließlich Docsify und `leitfaden/`,
- `state.md` Phase „G0 offen“ und die nächste Aktion „ICP festlegen“ zeigt,
- der Founder die Fragen aus `icp-hypothesen.md` vorgelegt bekommen hat und weiß, wie er die Unterlagen liest (Konfiguration `docs` in der Claude-App oder `scripts/docs-sidebar.sh && python3 -m http.server <Port>`).

Nicht committen; der Founder entscheidet über den ersten Commit und ob das Repository privat ist.
