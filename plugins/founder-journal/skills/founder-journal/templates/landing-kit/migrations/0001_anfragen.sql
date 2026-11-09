-- Anfragen von der Landingpage: Gesprächsanfragen (art = 'gespraech') und
-- Anmeldungen für die Ergebnisse (art = 'ergebnisse'). Eine Zeile pro Adresse;
-- eine zweite Anmeldung ergänzt die erste. Keine IP-Adresse, kein User-Agent.
CREATE TABLE anfragen (
  id          INTEGER PRIMARY KEY,
  created_at  TEXT NOT NULL,
  updated_at  TEXT NOT NULL,
  email       TEXT NOT NULL UNIQUE COLLATE NOCASE,
  vorname     TEXT NOT NULL DEFAULT '',
  art         TEXT NOT NULL DEFAULT 'ergebnisse',
  gespraech   INTEGER NOT NULL DEFAULT 0,
  antworten   TEXT NOT NULL DEFAULT '{}',
  quelle      TEXT NOT NULL DEFAULT ''
);
