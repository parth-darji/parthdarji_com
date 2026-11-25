// POST /api/contact  {name, email, type, budget, timeline, message, website(honeypot)}
// Stores a project inquiry in the D1 database bound as WAITLIST (table inquiries, created on first use).
// GET /api/contact?key=...  lists inquiries; the key's SHA-256 must match READ_KEY_SHA256 (key kept off the repo).
// No IP addresses or cookies are stored.
const READ_KEY_SHA256 = "ccb4f89565b810989a2794f06749d4549d315d4b59ab4b429a9fb63269d5b62c";
const TYPES = new Set(["iPhone / iPad app", "Android app", "Mac / Windows app", "Website or web app", "Backend / API", "AI / automation", "Something else"]);
const json = (body, status = 200) =>
  new Response(JSON.stringify(body), { status, headers: { "content-type": "application/json", "cache-control": "no-store" } });
const clip = (v, n) => String(v || "").trim().slice(0, n);

async function table(db) {
  await db.prepare("CREATE TABLE IF NOT EXISTS inquiries (id INTEGER PRIMARY KEY AUTOINCREMENT, created TEXT, name TEXT, email TEXT, type TEXT, budget TEXT, timeline TEXT, message TEXT)").run();
}

export async function onRequestPost({ request, env }) {
  const origin = request.headers.get("origin") || "";
  if (origin && !/^https:\/\/(www\.)?parthdarji\.com$|^https:\/\/[a-z0-9-]+\.parthdarji-com\.pages\.dev$|^http:\/\/localhost:\d+$/.test(origin)) {
    return json({ ok: false, error: "origin" }, 403);
  }
  let d;
  try { d = await request.json(); } catch { return json({ ok: false, error: "bad request" }, 400); }
  if (d.website) return json({ ok: true }); // honeypot
  const email = clip(d.email, 254).toLowerCase();
  const message = clip(d.message, 5000);
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(email)) return json({ ok: false, error: "Please enter a valid email address." }, 400);
  if (message.length < 20) return json({ ok: false, error: "Please describe your project in a few sentences." }, 400);
  const type = TYPES.has(d.type) ? d.type : "Something else";
  if (!env.WAITLIST) return json({ ok: false, error: "The form is not available right now. Please email hello@parthdarji.com." }, 503);
  await table(env.WAITLIST);
  await env.WAITLIST.prepare("INSERT INTO inquiries (created, name, email, type, budget, timeline, message) VALUES (?, ?, ?, ?, ?, ?, ?)")
    .bind(new Date().toISOString(), clip(d.name, 120), email, type, clip(d.budget, 60), clip(d.timeline, 60), message).run();
  return json({ ok: true });
}

export async function onRequestGet({ request, env }) {
  const key = new URL(request.url).searchParams.get("key") || "";
  const h = [...new Uint8Array(await crypto.subtle.digest("SHA-256", new TextEncoder().encode(key)))].map((b) => b.toString(16).padStart(2, "0")).join("");
  if (h !== READ_KEY_SHA256) return json({ ok: false }, 404);
  if (!env.WAITLIST) return json({ ok: false, error: "db" }, 503);
  await table(env.WAITLIST);
  const { results } = await env.WAITLIST.prepare("SELECT * FROM inquiries ORDER BY id DESC LIMIT 100").all();
  return json({ ok: true, inquiries: results });
}

export const onRequest = () => json({ ok: false, error: "method" }, 405);
