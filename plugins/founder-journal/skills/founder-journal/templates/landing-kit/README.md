# Landing-Kit

Eine Landingpage für die Problem-Interview-Phase, ohne Build-Schritt: statisches HTML in `public/`, davor ein Cloudflare Worker mit einer einzigen Route (`POST /anfrage`), gespeichert in Cloudflare D1 (EU). Gebaut nach dem Vorbild von socrates-tutor.com.

**Was die Seite kann**

- **„15 Minuten mit mir sprechen“** als Formular mit nur einer E-Mail-Adresse. Die Anfrage wird gespeichert, der Founder bekommt eine Mail (Reply-To an den Absender).
- **„Die Ergebnisse per Mail“** als zweiter, kleiner Weg: E-Mail, Vorname optional, 1–2 Zusatzfragen (`f_<name>`), „offen für ein Gespräch“, Einwilligung.
- Spam-Falle (Honeypot), keine IP-Adresse gespeichert, keine Cookies, nichts von Dritten.
- Export als CSV und Löschen per Skript.

**Wann nehmen:** wenn das Produkt noch keine eigene Website hat. Hat es eine, dort dasselbe Muster einbauen (Worker-Route, D1, Formular) statt dieses Kit zu kopieren.

## Einrichten

Alle Befehle im Ordner `landing/` des GTM-Repositorys. Was der Founder selbst tun muss, ist markiert.

1. **Kopieren:** Inhalt dieses Ordners nach `landing/`.
2. **Texte:** Platzhalter `{{…}}` in `public/*.html` füllen: Überschrift = Problem in Worten der Zielgruppe, drei Situationen aus dem ICP, zwei Zusatzfragen nach Verhalten. Impressum und Datenschutz: Angaben beim Founder erfragen, nie erfinden. Farben in `public/styles.css`.
3. **Cloudflare** (*Founder*: Konto, Domain in Cloudflare): `npx wrangler login`, dann
   ```bash
   npx wrangler d1 create <produkt>-anfragen --jurisdiction eu
   ```
   Die ausgegebene `database_id` und den Namen in `wrangler.jsonc` eintragen, ebenso `{{WORKER_NAME}}`, `{{DOMAIN}}`, `{{PRODUKT}}`.
4. **Mail** (*Founder*): Im Dashboard der Domain **Email Routing** aktivieren, eine Adresse wie `hallo@<domain>` an das eigene Postfach weiterleiten und die Zieladresse bestätigen. Diese Zieladresse ist `{{NOTIFY_TO}}`. Ohne Email Routing den Block `send_email` und die Variablen `NOTIFY_*` löschen; die Anfragen landen dann nur in D1.
5. **Tabelle anlegen:**
   ```bash
   npx wrangler d1 migrations apply <produkt>-anfragen --remote
   ```
6. **Lokal testen:**
   ```bash
   npx wrangler d1 migrations apply <produkt>-anfragen --local && npx wrangler dev
   ```
   Beide Formulare abschicken; `wrangler dev` zeigt die simulierte Benachrichtigung.
7. **Veröffentlichen:**
   ```bash
   npx wrangler deploy
   ```
   Dann im Dashboard unter Workers → `<worker>` → Domains die eigene Domain verbinden (*Founder*).
8. **Live prüfen:** Gesprächsanfrage mit eigener Adresse abschicken, Benachrichtigung abwarten, Testmail an `hallo@` schicken, Testeintrag mit `scripts/anfragen-export.sh --loeschen …` entfernen. Danach Landing-Review.

## Auswerten

```bash
scripts/anfragen-export.sh
```

schreibt `founder/private/anfragen-<datum>.csv` (nicht im Git). Gesprächsanfragen (`art = gespraech`) und „offen für ein Gespräch“ kommen als Kontakte nach `founder/contacts.csv` (Quelle `landing`). Anmeldungen ohne Gespräch sind Commitment-Stufe 1 und zählen nicht für die Go-Schwellen.

## Recht in Kürze

- Ohne Double-Opt-in: Liste nur für die Ergebnisse und Gesprächsanfragen nutzen, nie als Newsletter.
- Impressum und Datenschutz müssen erreichbar sein, bevor Outreach oder Anzeigen auf die Seite zeigen.
- Neue Dienste (Buchungstool, Analyse, Schriften von Dritten) in der Datenschutzerklärung ergänzen, in derselben Änderung.
