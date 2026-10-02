// Parth Darji Portfolio - Lightweight Offline-First Service Worker
const CACHE_NAME = "pd-portfolio-v1";

const PRECACHE_ASSETS = [
  "/",
  "/favicon.ico?v=4",
  "/favicon.png?v=4",
  "/apple-touch-icon.png?v=4",
  "/images/logo.png?v=4",
  "/images/apps/moneystreak.png",
  "/images/apps/shoeboxhsa.png",
  "/images/apps/punchmate.png",
  "/moneystreak-privacy-policy.html",
  "/shoeboxhsa-privacy-policy.html",
  "/punchmate-privacy-policy.html",
  "/manifest.json"
];

// Install: Cache critical core assets
self.addEventListener("install", (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(PRECACHE_ASSETS).catch((err) => {
        console.warn("Service worker precache partial failure:", err);
      });
    }).then(() => self.skipWaiting())
  );
});

// Activate: Clean up legacy caches
self.addEventListener("activate", (event) => {
  event.waitUntil(
    caches.keys().then((keys) => {
      return Promise.all(
        keys.map((key) => {
          if (key !== CACHE_NAME) {
            return caches.delete(key);
          }
        })
      );
    }).then(() => self.clients.claim())
  );
});

// Fetch: Network-First for HTML navigation; Cache-First with Network Revalidation for assets
self.addEventListener("fetch", (event) => {
  const req = event.request;

  // Only handle HTTP/HTTPS GET requests
  if (req.method !== "GET" || !req.url.startsWith("http")) {
    return;
  }

  // Navigation requests (HTML): Network first, falling back to cache
  if (req.mode === "navigate") {
    event.respondWith(
      fetch(req)
        .then((networkRes) => {
          if (networkRes && networkRes.status === 200) {
            const clone = networkRes.clone();
            caches.open(CACHE_NAME).then((cache) => cache.put(req, clone));
          }
          return networkRes;
        })
        .catch(async () => {
          const cached = await caches.match(req);
          if (cached) return cached;
          return caches.match("/");
        })
    );
    return;
  }

  // Static Assets (CSS, JS, Images, Icons, Fonts): Stale-While-Revalidate
  event.respondWith(
    caches.match(req).then((cachedRes) => {
      const fetchPromise = fetch(req)
        .then((networkRes) => {
          if (networkRes && networkRes.status === 200) {
            const clone = networkRes.clone();
            caches.open(CACHE_NAME).then((cache) => cache.put(req, clone));
          }
          return networkRes;
        })
        .catch(() => null);

      return cachedRes || fetchPromise;
    })
  );
});
