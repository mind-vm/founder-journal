# Modus Gate

Greift bei jeder Anfrage nach **Produktcode**: Änderungen außerhalb von `founder/` und `landing/`, insbesondere im Produkt-Repository.

## Schritte

1. Phase aus `founder/state.md` lesen. Ist der Stand älter als das neueste Journal, Zahlen kurz neu zählen.
2. **Vor G3:** zuerst genau eine Zeile, dann warten:
   > „G2 offen: 4 von 10 Gesprächen. Das ist Bauen vor Kunden. Trotzdem weitermachen?“
   Ist die Anfrage ein Verkaufswerkzeug (Klick-Prototyp, Demo, Concierge-Werkzeug), sagen, dass sie erlaubt ist, und weitermachen.
3. **Bestätigt der Founder:** bauen, danach im heutigen Journal unter „Gate-Ausnahmen“ eine Zeile: was, warum, geschätzte Baustunden.
4. **Nach G3:** fragen, welcher zahlende Kunde danach gefragt hat. Ohne Kunde: Trade-off nennen, Founder entscheidet.

Ein Bugfix im laufenden Betrieb oder eine Sicherheitskorrektur ist kein neues Feature: kurz als Ausnahme „Betrieb“ protokollieren, ohne Nachfrage.

Grenze: Das Gate wirkt, solange Claude die Founder-Regel aus `CLAUDE.md` beachtet. Ein hartes Gate per PreToolUse-Hook ist für Version 2 vorgesehen.
