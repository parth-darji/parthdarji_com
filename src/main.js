// Parth Darji - Minimalist Icon-First Product Showcase
document.addEventListener("DOMContentLoaded", () => {
  // Theme Management
  const themeToggle = document.getElementById("theme-toggle");
  const currentTheme = localStorage.getItem("theme") || "dark";
  document.documentElement.setAttribute("data-theme", currentTheme);
  updateThemeIcon(currentTheme);

  if (themeToggle) {
    themeToggle.addEventListener("click", () => {
      const active = document.documentElement.getAttribute("data-theme") || "dark";
      const next = active === "dark" ? "light" : "dark";
      document.documentElement.setAttribute("data-theme", next);
      localStorage.setItem("theme", next);
      updateThemeIcon(next);
    });
  }

  function updateThemeIcon(theme) {
    if (!themeToggle) return;
    themeToggle.innerHTML = theme === "dark"
      ? `<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="5"/><path d="M12 1v2M12 21v2M4.2 4.2l1.4 1.4M18.4 18.4l1.4 1.4M1 12h2M21 12h2M4.2 19.8l1.4-1.4M18.4 5.6l1.4-1.4"/></svg>`
      : `<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>`;
  }

  // 3 Core Native Apps Dataset (MoneyStreak, ShoeboxHSA, PunchMate)
  const apps = [
    {
      id: "moneystreak",
      name: "MoneyStreak",
      tagline: "Gamified Streak-Based Savings & Habit Tracker",
      platform: "iOS",
      category: "ios",
      genre: "Finance & Wealth",
      rating: "5.0 ★",
      badgeType: "progress",
      pillLabel: "In Progress",
      icon: "/images/apps/moneystreak.png",
      description: "Transform personal finance into an empowering daily streak. MoneyStreak turns saving money into a winning habit using visual milestones, progress rings, and biometric security — with zero cloud surveillance or bank login scraping.",
      features: [
        "Daily micro-saving streaks & momentum multipliers",
        "Interactive iOS Home & Lock Screen Widgets",
        "Biometric protection with Face ID / Touch ID",
        "Visual compound interest & milestone targets",
        "Pay Once, Own Forever: Zero recurring subscriptions"
      ],
      progressText: "In Progress · iOS App Store",
      privacyUrl: "/moneystreak-privacy-policy.html",
      actionType: "progress"
    },
    {
      id: "shoeboxhsa",
      name: "ShoeboxHSA",
      tagline: "Smart HSA Receipt Organizer & Tax Vault",
      platform: "iOS",
      category: "ios",
      genre: "Medical & Finance",
      rating: "4.9 ★",
      badgeType: "progress",
      pillLabel: "iOS Preview",
      icon: "/images/apps/shoeboxhsa.png",
      description: "The ultimate healthcare savings strategy tool. Scan and catalog eligible medical receipts today so your HSA investment portfolio can compound tax-free for decades before reimbursement.",
      features: [
        "On-device OCR receipt scanning & metadata parsing",
        "IRS-compliant lifetime digital audit vault",
        "Compound growth trajectory calculator",
        "One-tap PDF report generation for tax filing",
        "Pay Once, Own Forever: Zero recurring subscriptions"
      ],
      progressText: "Coming to App Store",
      privacyUrl: "/shoeboxhsa-privacy-policy.html",
      actionType: "progress"
    },
    {
      id: "punchmate",
      name: "PunchMate",
      tagline: "Menu Bar Punch Clock & Project Time Tracker",
      platform: "macOS",
      category: "macos",
      genre: "Productivity",
      rating: "4.9 ★",
      badgeType: "progress",
      pillLabel: "In Progress",
      icon: "/images/apps/punchmate.png",
      description: "A lightning-fast native macOS menu bar companion designed for freelancers, developers, and consultants to track billable hours, client milestones, and task sessions without cumbersome web SaaS apps.",
      features: [
        "Always-accessible Menu Bar resident widget",
        "Global keyboard shortcuts for instant punching",
        "One-click CSV & PDF export for client invoicing",
        "Built-in Pomodoro & healthy break reminder engine",
        "Pay Once, Own Forever: 100% on-device local database"
      ],
      progressText: "In Progress · Mac App Store",
      privacyUrl: "/punchmate-privacy-policy.html",
      actionType: "progress"
    }
  ];

  // Action Buttons Renderer
  function renderActionButtons(app) {
    if (app.actionType === "dual_store") {
      return `
        <a href="${app.appStoreUrl}" target="_blank" rel="noopener noreferrer" class="btn-primary-store" aria-label="Download ${app.name} on Apple App Store">
          <svg width="13" height="13" viewBox="0 0 24 24" fill="currentColor"><path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.81-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M15.97 7.17c.61-.75 1.04-1.8 1.01-2.87-.96.04-2.09.65-2.73 1.4-.56.64-1.05 1.7-1.01 2.74 1.08.08 2.12-.52 2.73-1.27z"/></svg>
          App Store
        </a>
        <a href="${app.playStoreUrl}" target="_blank" rel="noopener noreferrer" class="btn-primary-store" style="background:#01875f;" aria-label="Download ${app.name} on Google Play Store">
          <svg width="13" height="13" viewBox="0 0 24 24" fill="currentColor"><path d="M3 20.5v-17c0-.83.67-1.5 1.5-1.5.35 0 .68.12.95.34l12.7 7.33-3.65 3.65L3.45 2.34C3.17 2.56 3 2.9 3 3.5zm0 0l11.05-11.05 3.65 3.65L5.45 20.66c-.27.22-.6.34-.95.34-.83 0-1.5-.67-1.5-1.5zm16.5-8.5l-3.3-1.9-3.15 3.15 3.15 3.15 3.3-1.9c.75-.43 1.2-1.22 1.2-2.1s-.45-1.67-1.2-2.1z"/></svg>
          Google Play
        </a>
      `;
    } else if (app.actionType === "dmg") {
      return `
        <div class="dmg-action-wrap">
          <a href="${app.dmgUrl}" download class="btn-dmg-download" aria-label="Download ${app.name} for macOS as DMG">
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4M7 10l5 5 5-5M12 15V3"/></svg>
            Get App (.dmg)
          </a>
          <span class="dmg-trust-footnote">✓ Apple Silicon & Intel Universal · 100% Offline</span>
        </div>
      `;
    } else {
      return `
        <span class="btn-status-pill">
          ${app.progressText || "In Progress"}
        </span>
      `;
    }
  }

  // Render Minimalist Icon Grid
  const gridContainer = document.getElementById("app-icon-grid");
  const filterBtns = document.querySelectorAll(".filter-btn");

  let currentCategoryList = apps;
  let currentActiveApp = null;

  function updateFilterPills() {
    const allCount = apps.length;
    const macCount = apps.filter(a => a.category === "macos" || a.platform.toLowerCase().includes("mac")).length;
    const iosCount = apps.filter(a => a.category === "ios" || a.platform.toLowerCase().includes("ios")).length;

    const btnAll = document.querySelector('.filter-btn[data-cat="all"]');
    const btnMac = document.querySelector('.filter-btn[data-cat="macos"]');
    const btnIos = document.querySelector('.filter-btn[data-cat="ios"]');

    if (btnAll) btnAll.textContent = `All (${allCount})`;
    if (btnMac) btnMac.textContent = `macOS (${macCount})`;
    if (btnIos) btnIos.textContent = `iOS (${iosCount})`;
  }

  function renderIcons(category = "all") {
    if (!gridContainer) return;
    gridContainer.innerHTML = "";

    updateFilterPills();

    currentCategoryList = category === "all" 
      ? apps 
      : apps.filter(a => {
          if (category === "macos") {
            return a.category === "macos" || a.platform.toLowerCase().includes("mac");
          }
          if (category === "ios") {
            return a.category === "ios" || a.platform.toLowerCase().includes("ios");
          }
          return a.category === category;
        });

    currentCategoryList.forEach(a => {
      const item = document.createElement("a");
      item.className = "app-icon-item";
      item.href = `#${a.id}`;
      item.setAttribute("aria-label", `${a.name} — ${a.tagline}`);

      item.innerHTML = `
        <div class="icon-squircle-wrap">
          <img src="${a.icon}" alt="${a.name} App Icon" class="icon-img" width="88" height="88" loading="lazy" decoding="async" />
        </div>
        <div class="app-name">${a.name}</div>
        <p class="app-tagline">${a.tagline}</p>
        <div class="app-pill">
          <span class="badge-dot ${a.badgeType}"></span>
          ${a.pillLabel}
        </div>
      `;

      item.addEventListener("click", (e) => {
        e.preventDefault();
        openModal(a);
      });

      gridContainer.appendChild(item);
    });
  }

  // Delegated click handling on gridContainer (supports prerendered & dynamic cards)
  if (gridContainer) {
    gridContainer.addEventListener("click", (e) => {
      const item = e.target.closest(".app-icon-item");
      if (!item) return;
      e.preventDefault();
      const href = item.getAttribute("href") || "";
      const id = href.replace("#", "").trim();
      const app = apps.find(a => a.id === id);
      if (app) openModal(app);
    });
  }

  // Filter Buttons
  filterBtns.forEach(btn => {
    btn.addEventListener("click", () => {
      filterBtns.forEach(b => {
        b.classList.remove("active");
        b.setAttribute("aria-selected", "false");
      });
      btn.classList.add("active");
      btn.setAttribute("aria-selected", "true");
      const cat = btn.getAttribute("data-cat");
      renderIcons(cat);
    });
  });

  // Modal Logic
  const modalBackdrop = document.getElementById("app-modal");
  const modalCloseBtn = document.getElementById("modal-close-btn");
  const modalButtonsRight = document.getElementById("modal-buttons-right");
  const modalPrevBtn = document.getElementById("modal-prev-btn");
  const modalNextBtn = document.getElementById("modal-next-btn");
  const modalCopyBtn = document.getElementById("modal-copy-link-btn");
  const toast = document.getElementById("toast");

  function showToast(msg) {
    if (!toast) return;
    toast.textContent = msg;
    toast.classList.add("active");
    setTimeout(() => {
      toast.classList.remove("active");
    }, 2200);
  }

  function openModal(a) {
    if (!modalBackdrop) return;
    currentActiveApp = a;

    // Update URL hash smoothly for shareable deep-linking
    if (window.location.hash !== `#${a.id}`) {
      window.history.replaceState(null, null, `#${a.id}`);
    }

    const modalIcon = document.getElementById("modal-icon");
    modalIcon.src = a.icon;
    modalIcon.alt = `${a.name} App Icon`;
    document.getElementById("modal-title").textContent = a.name;
    document.getElementById("modal-tagline").textContent = a.tagline;
    document.getElementById("modal-meta-row").innerHTML = `
      <span>${a.platform}</span>
      <span>•</span>
      <span>${a.genre}</span>
      <span>•</span>
      <span style="color:#ffb800;">${a.rating}</span>
    `;
    document.getElementById("modal-desc").textContent = a.description;

    const privacyCallout = document.querySelector(".modal-privacy-callout");
    if (privacyCallout) {
      privacyCallout.style.background = "rgba(48, 209, 88, 0.08)";
      privacyCallout.style.borderColor = "rgba(48, 209, 88, 0.22)";
      privacyCallout.innerHTML = `
        <span class="shield" style="color:var(--apple-green);">🛡️</span>
        <span class="text"><strong>100% On-Device & Anti-Subscription:</strong> This app operates locally on your hardware. Zero telemetry, zero analytics tracking, and zero recurring subscriptions.</span>
      `;
    }

    const featList = document.getElementById("modal-features-list");
    featList.innerHTML = "";
    a.features.forEach(f => {
      const li = document.createElement("li");
      li.innerHTML = `<span class="check-glyph">✓</span><span>${f}</span>`;
      featList.appendChild(li);
    });

    const privLink = document.getElementById("modal-privacy-link");
    if (privLink && a.privacyUrl) {
      privLink.href = a.privacyUrl;
      privLink.style.display = "inline-flex";
    }

    if (modalButtonsRight) {
      modalButtonsRight.innerHTML = renderActionButtons(a);
    }

    modalBackdrop.classList.add("active");
    document.body.style.overflow = "hidden";
  }

  function closeModal() {
    if (!modalBackdrop) return;
    modalBackdrop.classList.remove("active");
    document.body.style.overflow = "";
    currentActiveApp = null;
    if (window.location.hash) {
      window.history.replaceState(null, null, window.location.pathname + window.location.search);
    }
  }

  // Quick Look Navigation (Arrow Keys & Buttons)
  function navigateModal(direction) {
    if (!currentActiveApp || !modalBackdrop.classList.contains("active")) return;
    const idx = currentCategoryList.findIndex(x => x.id === currentActiveApp.id);
    if (idx === -1) return;
    let nextIdx = idx + direction;
    if (nextIdx < 0) nextIdx = currentCategoryList.length - 1;
    if (nextIdx >= currentCategoryList.length) nextIdx = 0;
    openModal(currentCategoryList[nextIdx]);
  }

  if (modalPrevBtn) modalPrevBtn.addEventListener("click", () => navigateModal(-1));
  if (modalNextBtn) modalNextBtn.addEventListener("click", () => navigateModal(1));

  if (modalCopyBtn) {
    modalCopyBtn.addEventListener("click", () => {
      if (!currentActiveApp) return;
      const url = `${window.location.origin}/#${currentActiveApp.id}`;
      if (navigator.clipboard && navigator.clipboard.writeText) {
        navigator.clipboard.writeText(url).then(() => {
          showToast("✓ Direct link copied to clipboard");
        }).catch(() => {
          showToast("✓ " + url);
        });
      } else {
        showToast("✓ " + url);
      }
    });
  }

  if (modalCloseBtn) modalCloseBtn.addEventListener("click", closeModal);
  if (modalBackdrop) {
    modalBackdrop.addEventListener("click", (e) => {
      if (e.target === modalBackdrop) closeModal();
    });
  }

  // Global Keyboard Navigation (Esc to close, Arrow keys to browse)
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") {
      if (contactModal && contactModal.classList.contains("active")) {
        closeContactModal();
        return;
      }
      if (modalBackdrop && modalBackdrop.classList.contains("active")) {
        closeModal();
        return;
      }
    }

    if (!modalBackdrop || !modalBackdrop.classList.contains("active")) return;

    if (e.key === "ArrowLeft") {
      e.preventDefault();
      navigateModal(-1);
    } else if (e.key === "ArrowRight") {
      e.preventDefault();
      navigateModal(1);
    }
  });

  // Mobile Touch Swipe Gesture Support
  let touchStartX = 0;
  let touchStartY = 0;
  const modalSheet = document.querySelector(".modal-sheet");

  if (modalSheet) {
    modalSheet.addEventListener("touchstart", (e) => {
      if (e.touches && e.touches.length > 0) {
        touchStartX = e.touches[0].clientX;
        touchStartY = e.touches[0].clientY;
      }
    }, { passive: true });

    modalSheet.addEventListener("touchend", (e) => {
      if (e.changedTouches && e.changedTouches.length > 0) {
        const touchEndX = e.changedTouches[0].clientX;
        const touchEndY = e.changedTouches[0].clientY;
        const diffX = touchEndX - touchStartX;
        const diffY = touchEndY - touchStartY;
        // Require at least 45px swipe horizontally and more horizontal than vertical
        if (Math.abs(diffX) > 45 && Math.abs(diffX) > Math.abs(diffY) * 1.4) {
          if (diffX < 0) {
            navigateModal(1); // Swipe left -> Next app
          } else {
            navigateModal(-1); // Swipe right -> Previous app
          }
        }
      }
    }, { passive: true });
  }

  // Contact Dialog & Anti-Scraping Assembly
  const contactTriggerBtn = document.getElementById("contact-trigger-btn");
  const contactModal = document.getElementById("contact-modal");
  const contactCloseBtn = document.getElementById("contact-close-btn");
  const btnOpenMail = document.getElementById("btn-open-mail");
  const btnCopyEmail = document.getElementById("btn-copy-email");

  // Assembled dynamically in memory — never exposed in static HTML
  const getContactEmail = () => ["parthdarji2961", "gmail.com"].join("@");

  function openContactModal() {
    if (!contactModal) return;
    contactModal.classList.add("active");
    document.body.style.overflow = "hidden";
  }

  function closeContactModal() {
    if (!contactModal) return;
    contactModal.classList.remove("active");
    document.body.style.overflow = "";
  }

  if (contactTriggerBtn) contactTriggerBtn.addEventListener("click", openContactModal);
  if (contactCloseBtn) contactCloseBtn.addEventListener("click", closeContactModal);
  if (contactModal) {
    contactModal.addEventListener("click", (e) => {
      if (e.target === contactModal) closeContactModal();
    });
  }

  if (btnOpenMail) {
    btnOpenMail.addEventListener("click", () => {
      window.location.href = `mailto:${getContactEmail()}?subject=${encodeURIComponent("Inquiry via parthdarji.com")}`;
    });
  }

  if (btnCopyEmail) {
    btnCopyEmail.addEventListener("click", () => {
      const email = getContactEmail();
      if (navigator.clipboard && navigator.clipboard.writeText) {
        navigator.clipboard.writeText(email).then(() => {
          showToast("✓ Email address copied to clipboard");
        }).catch(() => {
          showToast("✓ " + email);
        });
      } else {
        showToast("✓ " + email);
      }
    });
  }

  // Deep-Linking Hash Support
  function checkHashRouting() {
    const hash = window.location.hash.replace("#", "").trim().toLowerCase();
    if (!hash) return;
    const found = apps.find(a => a.id.toLowerCase() === hash);
    if (found) {
      openModal(found);
    }
  }

  window.addEventListener("hashchange", checkHashRouting);

  // Initial Render
  renderIcons("all");
  checkHashRouting();

  // Service Worker Registration for Offline-First PWA Support
  if ("serviceWorker" in navigator && (window.location.protocol === "https:" || window.location.hostname === "localhost")) {
    window.addEventListener("load", () => {
      navigator.serviceWorker.register("/sw.js").catch(() => {
        // Silently catch registration errors if unsupported or blocked in dev sandbox
      });
    });
  }
});
