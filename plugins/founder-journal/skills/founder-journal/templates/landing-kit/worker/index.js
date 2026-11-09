// Landing-Kit des Plugins founder-journal: der Worker vor der statischen Seite.
// Alles aus public/ liefert env.ASSETS aus, nur POST /anfrage läuft durch
// diesen Code und landet in D1 (env.DB, Tabelle anfragen).
//
//   art=gespraech   "15 Minuten mit mir sprechen": nur eine Adresse. Der
//                   Founder bekommt eine Mail (env.NOTIFY), Reply-To = Absender.
//   art=ergebnisse  "Die Ergebnisse per Mail": Adresse, Zusatzfragen (Felder
//                   f_<name>), "offen für ein Gespräch", Einwilligung nötig.
//
// Beide Formulare antworten mit einer Weiterleitung, sie brauchen kein JavaScript.

import { EmailMessage } from "cloudflare:email";

const EMAIL = /^[^\s@<>()",;:]+@[^\s@<>()",;:]+\.[^\s@<>()",;:]{2,}$/;
const MAX_ANTWORTEN = 6;

export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    if (url.pathname === "/anfrage") {
      if (request.method !== "POST") return to(url, "/");
      return anfrage(request, env, ctx, url);
    }
    return env.ASSETS.fetch(request);
  },
};

async function anfrage(request, env, ctx, url) {
  let form;
  try {
    form = await request.formData();
  } catch {
    return back(url, "ergebnisse");
  }
  const art = form.get("art") === "gespraech" ? "gespraech" : "ergebnisse";
  // Honeypot: Menschen sehen das Feld nicht, Bots füllen es. Antwort wie Erfolg.
  if (String(form.get("website") ?? "").trim() !== "") return done(url, art);

  const e = parse(form, request.headers.get("referer"));
  if (!e) return back(url, art);

  const now = new Date().toISOString();
  try {
    await env.DB.prepare(
      `INSERT INTO anfragen (created_at, updated_at, email, vorname, art, gespraech, antworten, quelle)
       VALUES (?1, ?1, ?2, ?3, ?4, ?5, ?6, ?7)
       ON CONFLICT(email) DO UPDATE SET
         updated_at = excluded.updated_at,
         vorname    = CASE WHEN excluded.vorname <> '' THEN excluded.vorname ELSE anfragen.vorname END,
         art        = CASE WHEN 'gespraech' IN (anfragen.art, excluded.art) THEN 'gespraech' ELSE excluded.art END,
         gespraech  = MAX(anfragen.gespraech, excluded.gespraech),
         antworten  = json_patch(anfragen.antworten, excluded.antworten)`,
    )
      .bind(now, e.email, e.vorname, e.art, e.gespraech ? 1 : 0, JSON.stringify(e.antworten), e.quelle)
      .run();
  } catch (err) {
    console.error("anfrage", err);
    return new Response("Das hat leider nicht geklappt. Bitte schreiben Sie mir eine E-Mail.", {
      status: 500,
      headers: { "content-type": "text/plain; charset=utf-8" },
    });
  }
  if (e.gespraech && env.NOTIFY && env.NOTIFY_TO) ctx.waitUntil(notify(env, e));
  return done(url, art);
}

export function parse(form, referer) {
  const art = form.get("art") === "gespraech" ? "gespraech" : "ergebnisse";
  const email = String(form.get("email") ?? "").trim().toLowerCase();
  if (email.length > 254 || !EMAIL.test(email)) return null;
  if (art === "ergebnisse" && form.get("einwilligung") !== "ja") return null;

  const antworten = {};
  for (const [key, value] of form.entries()) {
    const m = /^f_([a-z0-9_]{1,24})$/.exec(key);
    if (!m || typeof value !== "string" || !value.trim()) continue;
    if (Object.keys(antworten).length >= MAX_ANTWORTEN) break;
    antworten[m[1]] = value.replace(/[\r\n]+/g, " ").trim().slice(0, 200);
  }
  return {
    art,
    email,
    vorname: [...String(form.get("vorname") ?? "").replace(/[\r\n]/g, " ").trim()].slice(0, 60).join(""),
    gespraech: art === "gespraech" || form.get("gespraech") === "ja",
    antworten,
    quelle: source(form.get("quelle"), referer),
  };
}

// Der Kanal: verstecktes Feld "quelle", sonst utm_source der Seite, von der das
// Formular kam.
function source(field, referer) {
  let s = String(field ?? "");
  if (!s && referer) {
    try {
      s = new URL(referer).searchParams.get("utm_source") ?? "";
    } catch {}
  }
  s = s.trim().toLowerCase().slice(0, 32);
  return /^[a-z0-9_-]*$/.test(s) ? s : "";
}

async function notify(env, e) {
  const name = e.vorname || e.email;
  const subject = e.art === "gespraech" ? `Gesprächsanfrage: ${name}` : `Offen für ein Gespräch: ${name}`;
  const lines = [
    e.art === "gespraech"
      ? `Jemand möchte über ${env.PRODUKT || "dein Produkt"} mit dir sprechen.`
      : "Jemand hat sich für die Ergebnisse eingetragen und ist offen für ein Gespräch.",
    "",
    `E-Mail:  ${e.email}`,
    `Vorname: ${e.vorname || "–"}`,
    `Quelle:  ${e.quelle || "–"}`,
    ...Object.entries(e.antworten).map(([k, v]) => `${k}: ${v}`),
    "",
    "Antworten geht direkt an die Person (Reply-To).",
  ];
  const raw = [
    `From: Website <${env.NOTIFY_FROM}>`,
    `To: ${env.NOTIFY_TO}`,
    `Reply-To: ${e.email}`,
    `Subject: ${encodeHeader(subject)}`,
    `Date: ${new Date().toUTCString()}`,
    `Message-ID: <${crypto.randomUUID()}@${env.NOTIFY_FROM.split("@")[1]}>`,
    "MIME-Version: 1.0",
    "Content-Type: text/plain; charset=utf-8",
    "Content-Transfer-Encoding: 8bit",
    "",
    lines.join("\r\n"),
  ].join("\r\n");
  try {
    await env.NOTIFY.send(new EmailMessage(env.NOTIFY_FROM, env.NOTIFY_TO, raw));
  } catch (err) {
    console.error("notify", err);
  }
}

function encodeHeader(s) {
  let bin = "";
  for (const b of new TextEncoder().encode(s)) bin += String.fromCharCode(b);
  return `=?UTF-8?B?${btoa(bin)}?=`;
}

function to(url, path) {
  return Response.redirect(new URL(path, url), 303);
}

function done(url, art) {
  return to(url, art === "gespraech" ? "/danke-gespraech" : "/danke");
}

function back(url, art) {
  return to(url, art === "gespraech" ? "/?fehler=gespraech#top" : "/?fehler=formular#ergebnisse");
}
