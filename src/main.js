// Case Study Data
const projectData = {
    dukadirect: {
        title: "DukaDirect Super App",
        overline: "Featured Case Study",
        problem: "The Tanzanian market faced high fragmentation in essential services. Users had to navigate multiple apps for groceries, electricity bills, and flight bookings, leading to friction and low retention.",
        solution: "I architected a single, high-performance Flutter Super App that unified these services. By implementing a modular micro-frontend-like architecture in Flutter, we enabled fast service discovery and a seamless checkout experience.",
        challenges: "Ensuring ultra-fast performance on budget Android devices across Tanzania. I optimized the state management using GetX and reduced app size by 40% through clever asset management and SVG-first design.",
        impact: [
            { label: "Active Users", value: "250K+" },
            { label: "Checkouts/Day", value: "2,000+" },
            { label: "App Rating", value: "4.8/5" }
        ],
        images: [
            "images/project/duka_direct.png",
            "images/project/project-image01.png",
            "images/project/project-image02.png"
        ],
        videoUrl: "https://assets.mixkit.co/videos/preview/mixkit-software-developer-working-on-his-laptop-34448-small.mp4",
        isPortrait: false
    },
    selcompay: {
        title: "Selcom Pay",
        overline: "Fintech Showcase",
        problem: "Small and medium merchants in Tanzania lacked a unified way to track QR payments, check wallet balances, and reconcile daily sales, often relying on paper ledgers.",
        solution: "Designed and built Selcom Pay—a merchant ecosystem app. I implemented real-time push notifications for payment alerts and a dashboard with complex charting to visualize revenue trends.",
        challenges: "Security was paramount. I implemented end-to-end encryption for payment data and a secure biometric login flow that worked across all supported Android and iOS devices.",
        impact: [
            { label: "Merchants", value: "15,000+" },
            { label: "Monthly Vol", value: "$4M+" },
            { label: "Sync Speed", value: "< 2s" }
        ],
        images: [
            "images/project/selcom_bank.png",
            "images/project/project-image03.png",
            "images/project/project-image04.png"
        ],
        videoUrl: "https://assets.mixkit.co/videos/preview/mixkit-business-man-using-his-mobile-phone-while-walking-34456-small.mp4",
        isPortrait: true
    },
    otapp: {
        title: "Otapp Ticketing",
        overline: "Entertainment Solution",
        problem: "Manual ticketing for movies and events led to long queues and double-booked seats. No platform existed for real-time seat selection in the region.",
        solution: "Created an interactive seat selection engine in Flutter. Users can view movie house layouts, select specific seats, and receive a digital QR ticket instantly.",
        challenges: "Real-time seat locking was the main hurdle. I utilized Firebase Realtime Database with transactional logic to ensure seat availability was updated within milliseconds across all users.",
        impact: [
            { label: "Booking Time", value: "-70%" },
            { label: "Tickets Sold", value: "500K+" },
            { label: "Retention", value: "45%" }
        ],
        images: [
            "images/project/loba.png",
            "images/project/project-image05.png"
        ]
    },
    selcomcard: {
        title: "Selcom Card App",
        overline: "Banking Extension",
        problem: "Mastercard holders needed a way to manage their physical and virtual cards—blocking, PIN resets, and balance transfers—without visiting a branch.",
        solution: "Built a secure Flutter portal that integrated directly with banking core APIs. Added virtual card generation features with dynamic CVV security.",
        challenges: "Integrating with legacy SOAP banking services while maintaining a modern, reactive UI. I built a middleware layer that transformed legacy data into clean JSON for the mobile app.",
        impact: [
            { label: "Branch visits", value: "-60%" },
            { label: "Active Cards", value: "20,000+" },
            { label: "Support load", value: "-35%" }
        ],
        images: [
            "images/project/selcom_bank.png",
            "images/project/oneclick_buzz.png"
        ]
    }
};

// Cursor logic
const cursor = document.querySelector('.cursor');
let mouseX = 0, mouseY = 0;
let cursorX = 0, cursorY = 0;
let hasMoved = false;

window.addEventListener('mousemove', (e) => {
    mouseX = e.clientX;
    mouseY = e.clientY;
    if (!hasMoved) {
        hasMoved = true;
        document.body.classList.add('mouse-active');
    }
});

function animateCursor() {
    cursorX += (mouseX - cursorX) * 0.2;
    cursorY += (mouseY - cursorY) * 0.2;
    cursor.style.transform = `translate3d(${cursorX - 10}px, ${cursorY - 10}px, 0)`;
    requestAnimationFrame(animateCursor);
}
animateCursor();

// Magnetic Button Effect
const magneticButtons = document.querySelectorAll('.btn');
magneticButtons.forEach(btn => {
    btn.addEventListener('mousemove', (e) => {
        const rect = btn.getBoundingClientRect();
        const x = e.clientX - rect.left - rect.width / 2;
        const y = e.clientY - rect.top - rect.height / 2;
        btn.style.transform = `translate(${x * 0.3}px, ${y * 0.3}px)`;
    });
    btn.addEventListener('mouseleave', () => {
        btn.style.transform = `translate(0px, 0px)`;
    });
});

// Subtle 3D Card Tilt
const tiltElements = document.querySelectorAll('.card, .project-description, .skill-category');
tiltElements.forEach(el => {
    el.addEventListener('mousemove', (e) => {
        const rect = el.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;
        const centerX = rect.width / 2;
        const centerY = rect.height / 2;
        const rotateX = (y - centerY) / 20;
        const rotateY = (centerX - x) / 20;
        el.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) translateY(-5px)`;
    });
    el.addEventListener('mouseleave', () => {
        el.style.transform = `perspective(1000px) rotateX(0deg) rotateY(0deg) translateY(0px)`;
    });
});

// Modal & Gallery & Lightbox Logic
const modal = document.getElementById('project-modal');
const modalClose = document.querySelector('.modal-close');
const triggers = document.querySelectorAll('.project-details-trigger');
const gallery = document.getElementById('modal-gallery');
const videoContainer = document.getElementById('modal-video-container');
const lightbox = document.getElementById('lightbox');
const lightboxImg = document.getElementById('lightbox-img');
const lightboxClose = document.querySelector('.lightbox-close');

function openModal(projectId) {
    const data = projectData[projectId];
    if (!data) return;

    document.getElementById('modal-title').textContent = data.title;
    document.getElementById('modal-overline').textContent = data.overline;
    document.getElementById('modal-problem').textContent = data.problem;
    document.getElementById('modal-solution').textContent = data.solution;
    document.getElementById('modal-challenges').textContent = data.challenges;

    // Impact
    const impactList = document.getElementById('modal-impact-list');
    impactList.innerHTML = data.impact.map(item => `
        <div class="impact-item">
            <span class="impact-value">${item.value}</span>
            <span class="impact-label">${item.label}</span>
        </div>
    `).join('');

    // Video
    if (data.videoUrl) {
        videoContainer.style.display = 'block';
        videoContainer.className = `modal-video-container ${data.isPortrait ? 'portrait' : ''}`;
        videoContainer.innerHTML = `
            <video class="video-frame" autoplay loop muted playsinline>
                <source src="${data.videoUrl}" type="video/mp4">
            </video>
        `;
    } else {
        videoContainer.style.display = 'none';
        videoContainer.innerHTML = '';
    }

    // Gallery population
    gallery.innerHTML = (data.images || []).map(imgSrc => `
        <div class="gallery-item" onclick="openLightbox('${imgSrc}')">
            <img src="${imgSrc}" alt="Project screenshot">
        </div>
    `).join('');

    modal.classList.add('active');
    document.body.style.overflow = 'hidden';
}

function closeModal() {
    modal.classList.remove('active');
    document.body.style.overflow = 'auto';
    // Clear video to stop playback
    videoContainer.innerHTML = '';
}

// Global Lightbox Functions
window.openLightbox = function(src) {
    lightboxImg.src = src;
    lightbox.classList.add('active');
};

function closeLightbox() {
    lightbox.classList.remove('active');
}

triggers.forEach(trigger => {
    trigger.addEventListener('click', (e) => {
        e.stopPropagation();
        const projectId = trigger.getAttribute('data-project') || trigger.closest('[data-project]').getAttribute('data-project');
        openModal(projectId);
    });
});

modalClose.addEventListener('click', closeModal);
lightboxClose.addEventListener('click', closeLightbox);

window.addEventListener('click', (e) => {
    if (e.target === modal) closeModal();
    if (e.target === lightbox) closeLightbox();
});

// Magnetic Pull for Project Images
const projectImageContainers = document.querySelectorAll('.project-image-container');
projectImageContainers.forEach(cont => {
    cont.addEventListener('mousemove', (e) => {
        const rect = cont.getBoundingClientRect();
        const x = e.clientX - rect.left - rect.width / 2;
        const y = e.clientY - rect.top - rect.height / 2;
        cont.style.transform = `translate(${x * 0.15}px, ${y * 0.15}px)`;
    });
    cont.addEventListener('mouseleave', () => {
        cont.style.transform = `translate(0px, 0px)`;
    });
});

// Cursor Hover Effects
function updateHoverLinks() {
    const interactiveElements = document.querySelectorAll('a, button, .card, .project-description, .skill-category, .menu-toggle, .project-details-trigger, .project-image, .tech-badge, .gallery-item');
    interactiveElements.forEach(el => {
        el.addEventListener('mouseenter', () => document.body.classList.add('hovering-link'));
        el.addEventListener('mouseleave', () => document.body.classList.remove('hovering-link'));
    });
}
updateHoverLinks();

// Intersection Observer for Reveal Animations
const revealElements = document.querySelectorAll('.reveal');
const revealObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            setTimeout(() => {
                entry.target.classList.add('active');
            }, 100);
        }
    });
}, { threshold: 0.1 });
revealElements.forEach(el => revealObserver.observe(el));

// Scroll effect for Navbar
const nav = document.querySelector('nav');
function handleScroll() {
    if (window.scrollY > 50) {
        nav.classList.add('scrolled');
    } else {
        nav.classList.remove('scrolled');
    }
}
window.addEventListener('scroll', handleScroll);
handleScroll();

// Mobile Menu Toggle
const menuToggle = document.querySelector('.menu-toggle');
const navLinks = document.querySelector('.nav-links');
const navItems = document.querySelectorAll('.nav-links a');

menuToggle.addEventListener('click', () => {
    navLinks.classList.toggle('active');
    document.body.style.overflow = navLinks.classList.contains('active') ? 'hidden' : 'auto';
});

navItems.forEach(item => {
    item.addEventListener('click', () => {
        navLinks.classList.remove('active');
        document.body.style.overflow = 'auto';
    });
});

// Dynamic Year
const yearSpan = document.getElementById('current-year');
if (yearSpan) {
    yearSpan.textContent = new Date().getFullYear();
}

// Copy Email
const copyBtn = document.getElementById('copy-email');
const notification = document.getElementById('copy-notification');
if (copyBtn) {
    copyBtn.addEventListener('click', () => {
        const email = 'parthdarji2961@gmail.com';
        navigator.clipboard.writeText(email).then(() => {
            notification.style.opacity = '1';
            setTimeout(() => {
                notification.style.opacity = '0';
            }, 2000);
        });
    });
}

// Back to Top
const backToTop = document.getElementById('back-to-top');
window.addEventListener('scroll', () => {
    if (window.scrollY > 500) {
        backToTop.style.opacity = '1';
        backToTop.style.pointerEvents = 'auto';
    } else {
        backToTop.style.opacity = '0';
        backToTop.style.pointerEvents = 'none';
    }
});

backToTop.addEventListener('click', () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
});
