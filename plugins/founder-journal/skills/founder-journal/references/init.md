# Modus Init

Legt im aktuellen Repository das Founder Journal an. Einmal pro Produkt-Zyklus.

## Schritte

1. **Ort klären.** Läuft die Session im GTM-Repository (empfohlen: eigenes Repository `<produkt>-gtm` neben dem Produkt) oder im Produkt-Repository selbst? Existiert `founder/state.md` schon, abbrechen und auf Review verweisen.
2. **Bestand erfassen**, falls das Produkt schon existiert: Pfad zum Produkt-Repository und URL der Live-Seite erfragen. Dann README, Marken- und Marketing-Dokumente und die Live-Seite lesen. Ergebnis in `founder/befund-bestand.md`: vorhandenes Material (Tabelle mit Ort und Nutzen) und Abweichungen der Live-Seite (Preis, CTA, Impressum, Datenschutz, Aussagen). Fertig, wenn jede Abweichung eine Folge für G1 hat.
3. **Struktur anlegen** laut [datenmodell.md](datenmodell.md): Ordner mit `.gitkeep`, `contacts.csv` mit Kopfzeile, `.gitignore` aus `templates/gitignore` (bestehende ergänzen, nicht ersetzen).
4. **CLAUDE.md** anlegen oder ergänzen mit `templates/CLAUDE-block.md`. Platzhalter füllen: Produktname, Pfad zum Produkt-Repository, Markenregeln des Produkts (falls vorhanden, als Verweis).
5. **state.md** aus `templates/state.md`. Startdatum = heute, Go/No-Go = Ende Woche 6. Schwellen unverändert aus [methode.md](methode.md) übernehmen; will der Founder andere, jetzt festschreiben.
6. **ICP vorbereiten:** Modus ICP ausführen ([icp.md](icp.md)), bis `icp-hypothesen.md` 3 bewertete Hypothesen und eine Empfehlung hat.
7. **Erster Journal-Eintrag** aus `templates/journal.md`.

## Fertig, wenn

- alle Dateien aus dem Datenmodell existieren,
- `state.md` Phase „G0 offen“ und die nächste Aktion „ICP festlegen“ zeigt,
- der Founder die Fragen aus `icp-hypothesen.md` vorgelegt bekommen hat.

Nicht committen; der Founder entscheidet über den ersten Commit und ob das Repository privat ist.
