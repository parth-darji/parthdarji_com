// POST /api/waitlist  {email, list, website(honeypot)}
// Stores an email in the D1 database bound as WAITLIST (table signups: email, list, created).
// Used only to send one email when the app on that list launches. Nothing else is stored (no IP, no cookies).
const LISTS = new Set(["1099-app", "warranty-app"]);
const json = (body, status = 200) =>
  new Response(JSON.stringify(body), { status, headers: { "content-type": "application/json", "cache-control": "no-store" } });

export async function onRequestPost({ request, env }) {
  const origin = request.headers.get("origin") || "";
  if (origin && !/^https:\/\/(www\.)?parthdarji\.com$|^https:\/\/[a-z0-9-]+\.parthdarji-com\.pages\.dev$|^http:\/\/localhost:\d+$/.test(origin)) {
    return json({ ok: false, error: "origin" }, 403);
  }
  let data;
  try { data = await request.json(); } catch { return json({ ok: false, error: "bad request" }, 400); }
  if (data.website) return json({ ok: true }); // honeypot: bots fill hidden field; pretend success
  const email = String(data.email || "").trim().toLowerCase();
  const list = String(data.list || "");
  if (!LISTS.has(list)) return json({ ok: false, error: "list" }, 400);
  if (email.length > 254 || !/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(email)) return json({ ok: false, error: "Please enter a valid email address." }, 400);
  if (!env.WAITLIST) return json({ ok: false, error: "Signup is not available right now." }, 503);
  await env.WAITLIST.prepare("INSERT OR IGNORE INTO signups (email, list, created) VALUES (?, ?, ?)")
    .bind(email, list, new Date().toISOString()).run();
  return json({ ok: true });
}

export const onRequest = () => json({ ok: false, error: "method" }, 405);
