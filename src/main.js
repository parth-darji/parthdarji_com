// Case Study Data
const projectData = {
    "duka-direct": {
        title: "duka.direct (E-commerce Super App)",
        overline: "Selcom Tanzania",
        problem: "A multi-service super app offering grocery, food delivery, stores, fuel, courier, Jumla (B2B), bill payments, travel bookings, cinema tickets, and wallet payments used widely in Tanzania.",
        solution: "<ul>" +
            "<li>Rewrote core modules (grocery, bill pay, stores) during migration from Flutter 1.22 to GetX architecture.</li>" +
            "<li>Optimized performance and resolved crashes, including heavy screens with 1,500+ items.</li>" +
            "<li>Implemented Firebase Analytics and push notifications resulting in 12K+ new installs within 90 days.</li>" +
            "<li>Led a team of 2 developers and became Project Lead in Feb 2025.</li>" +
            "<li>Contributed to a full redesign in Oct 2025 improving UI/UX and engagement.</li>" +
            "<li>Helped scale platform revenue from $30K/month to $100K/month.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter, Dart, GetX, Firebase Analytics, AWS, Node.js, Android, iOS",
        impact: [
            { label: "Revenue/Mo", value: "$100K" },
            { label: "New Installs", value: "12K+" },
            { label: "Role", value: "Lead" }
        ]
    },
    "duka-microsite": {
        title: "duka.direct Microsite (Web App)",
        overline: "Selcom Tanzania",
        problem: "A ReactJS web version of duka.direct designed for users browsing via desktop or laptop, supporting Google login and guest checkout.",
        solution: "<ul>" +
            "<li>Led frontend improvements fixing UI inconsistencies and major bugs.</li>" +
            "<li>Guided a junior developer and improved responsiveness and design consistency.</li>" +
            "<li>Ensured smooth integration with Rider and Admin systems.</li>" +
            "<li>Improved product listing, cart, and checkout user experience.</li>" +
            "</ul>",
        challenges: "Tech Stack: ReactJS, JavaScript, UI/UX Design",
        impact: [
            { label: "Platform", value: "Web" },
            { label: "Stack", value: "React" }
        ]
    },
    "duka-rider-admin": {
        title: "duka.direct Rider Admin App",
        overline: "Selcom Tanzania",
        problem: "A mobile admin app enabling supervisors to assign orders, track rider activity, monitor real-time locations, and manage delivery operations.",
        solution: "<ul>" +
            "<li>Improved UI/UX and resolved key issues in rider assignment workflows.</li>" +
            "<li>Ensured mobile admin functionality matched the web admin portal.</li>" +
            "<li>Reduced manual assignment errors through workflow improvements.</li>" +
            "<li>Implemented reliable real-time location and order tracking.</li>" +
            "<li>Improved coordination between admin teams and riders.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter, Dart",
        impact: [
            { label: "Ops Speed", value: "+40%" },
            { label: "Errors", value: "-25%" }
        ]
    },
    "duka-rider-app": {
        title: "duka.direct Rider App (Delivery Agents)",
        overline: "Selcom Tanzania",
        problem: "A delivery rider app used for managing orders, tracking earnings, receiving notifications, and completing deliveries with OTP, photo proof, and signatures.",
        solution: "<ul>" +
            "<li>Led migration from Tookan platform to an in-house rider management system.</li>" +
            "<li>Fixed backend payload issues reducing data usage from 450MB/37 minutes to under 6MB/day.</li>" +
            "<li>Resolved syncing issues between rider, merchant, and admin systems.</li>" +
            "<li>Managed rollout from 5 riders to full production deployment.</li>" +
            "<li>Eliminated Tookan licensing saving approximately $1,000/month.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter, Dart",
        impact: [
            { label: "Data Usage", value: "-98%" },
            { label: "Licensing", value: "-$1K/mo" }
        ]
    },
    "selcom-id": {
        title: "Selcom ID (User Verification & Authentication)",
        overline: "Selcom Tanzania",
        problem: "A unified identity platform enabling mobile verification, passport verification, and TOTP authentication across Selcom products.",
        solution: "<ul>" +
            "<li>Built the complete Flutter frontend from Figma designs.</li>" +
            "<li>Implemented secure authentication and animated navigation flows.</li>" +
            "<li>Integrated APIs for verification, registration, and product identity linking.</li>" +
            "<li>Delivered a seamless and secure user experience.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter, Dart",
        impact: [
            { label: "Security", value: "High" },
            { label: "UI", value: "Custom" }
        ]
    },
    "selcom-kazi": {
        title: "Selcom Kazi (Internal HRMS)",
        overline: "Selcom Tanzania",
        problem: "Internal HR management platform used for employee records, leave requests, and workflow automation.",
        solution: "<ul>" +
            "<li>Implemented Google authentication for employees.</li>" +
            "<li>Added document upload functionality for leave requests.</li>" +
            "<li>Fixed permission-related bugs and improved UI consistency.</li>" +
            "<li>Improved system stability for daily internal operations.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter, Dart",
        impact: [
            { label: "Users", value: "Staff" },
            { label: "Uptime", value: "99.9%" }
        ]
    },
    "access-bank": {
        title: "Access Bank Tanzania Mobile Banking Support",
        overline: "Selcom Tanzania",
        problem: "Mobile banking app support ensuring stable operations and resolving production issues.",
        solution: "<ul>" +
            "<li>Monitored live app performance and handled escalated issues.</li>" +
            "<li>Fixed critical production bugs.</li>" +
            "<li>Coordinated with backend and QA teams to ensure smooth banking operations.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter, Dart",
        impact: [
            { label: "Availability", value: "24/7" },
            { label: "Bugs Fixed", value: "Critical" }
        ]
    },
    "baroda-bank": {
        title: "Bank of Baroda Tanzania Mobile Banking Support",
        overline: "Selcom Tanzania",
        problem: "Banking app used in the Tanzania region requiring production monitoring and issue resolution.",
        solution: "<ul>" +
            "<li>Took temporary ownership during primary developer’s leave.</li>" +
            "<li>Debugged issues and resolved production bugs.</li>" +
            "<li>Worked with backend and support teams to maintain stable operations.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter, Dart",
        impact: [
            { label: "Stability", value: "High" },
            { label: "Support", value: "Direct" }
        ]
    },
    "selcom-pesa": {
        title: "Selcom Pesa (Fintech Banking App)",
        overline: "Selcom Tanzania",
        problem: "A digital fintech platform enabling users to transfer money, pay bills, purchase airtime, request loans, and access financial services.",
        solution: "<ul>" +
            "<li>Redesigned major screens to match modern fintech UI standards.</li>" +
            "<li>Implemented animations and smooth transitions.</li>" +
            "<li>Worked closely with designers and backend engineers.</li>" +
            "<li>Helped transform an internal salary app into a full public fintech platform.</li>" +
            "<li>Improved consistency across financial workflows.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter, Dart",
        impact: [
            { label: "Growth", value: "Public" },
            { label: "UI", value: "Premium" }
        ]
    },
    "duka-merchant": {
        title: "duka Merchant (Merchant Operations App)",
        overline: "Selcom Tanzania",
        problem: "Merchant platform allowing businesses to manage orders, products, income tracking, schedules, and real-time order updates.",
        solution: "<ul>" +
            "<li>Built the entire app architecture from scratch.</li>" +
            "<li>Implemented real-time order updates using Socket.io.</li>" +
            "<li>Developed product management and order processing modules.</li>" +
            "<li>Mentored a junior developer on code quality and architecture.</li>" +
            "<li>Deployed the application to both App Store and Play Store.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter, Dart, Socket.io",
        impact: [
            { label: "Real-time", value: "Socket.io" },
            { label: "Platform", value: "iOS/Android" }
        ]
    },
    "breslev": {
        title: "Breslev Center (Spiritual Media App)",
        overline: "OneClick IT Consultancy Pvt Ltd",
        problem: "A media platform providing articles, events, galleries, videos, and music content primarily in Hebrew.",
        solution: "<ul>" +
            "<li>Fixed 25+ bugs improving stability.</li>" +
            "<li>Implemented responsive layouts for iPhone, iPad, and web.</li>" +
            "<li>Improved video player stability and performance.</li>" +
            "<li>Worked with language translation tools to resolve UI issues.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter, Dart",
        impact: [
            { label: "Stability", value: "Fixed 25+ Bugs" },
            { label: "Platforms", value: "iOS/Pad/Web" }
        ]
    },
    "loba": {
        title: "LOBA (IoT Pillbox Reminder App)",
        overline: "OneClick IT Consultancy Pvt Ltd",
        problem: "IoT-based medication reminder app connected to a BLE-enabled smart pillbox for elderly patients.",
        solution: "<ul>" +
            "<li>Improved Bluetooth Low Energy connection reliability.</li>" +
            "<li>Fixed hardware communication and performance issues.</li>" +
            "<li>Optimized BLE scanning and communication.</li>" +
            "<li>Enhanced user experience with improved UI flows.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter, Dart, BLE, IoT",
        impact: [
            { label: "Med Adherence", value: "+35%" },
            { label: "Protocol", value: "BLE" }
        ]
    },
    "terramar-inspection": {
        title: "Terramar – Freestyle II (Vehicle Inspection App)",
        overline: "OneClick IT Consultancy Pvt Ltd",
        problem: "Vehicle inspection and defect reporting app used by WHO partner field teams.",
        solution: "<ul>" +
            "<li>Fixed major bugs and improved system stability.</li>" +
            "<li>Improved asset inspection and defect image upload modules.</li>" +
            "<li>Added requested client features.</li>" +
            "<li>Delivered a stable field-ready release.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter, Dart",
        impact: [
            { label: "User", value: "WHO" },
            { label: "Release", value: "Field-ready" }
        ]
    },
    "terramar-booking": {
        title: "Terramar – Transport Booking",
        overline: "OneClick IT Consultancy Pvt Ltd",
        problem: "Travel management system used to schedule trips, manage itineraries, and coordinate travelers and dispatch teams.",
        solution: "<ul>" +
            "<li>Fixed core booking workflow bugs.</li>" +
            "<li>Improved trip scheduling and return-trip functionality.</li>" +
            "<li>Enhanced filtering and stability.</li>" +
            "<li>Contributed to a large-scale travel management product.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter, Dart",
        impact: [
            { label: "Complexity", value: "Large Scale" },
            { label: "Workflow", value: "Optimized" }
        ]
    },
    "maragoo-patient": {
        title: "Maragoo Lifeline (IoT Patient Monitoring App)",
        overline: "OneClick IT Consultancy Pvt Ltd",
        problem: "Health monitoring platform where carers track elderly patients’ movement, activity, and fall alerts using IoT devices.",
        solution: "<ul>" +
            "<li>Developed UI screens and REST API integrations.</li>" +
            "<li>Implemented dashboards for activity monitoring.</li>" +
            "<li>Integrated fall detection alerts from smart wristbands.</li>" +
            "<li>Improved usability and responsive layouts.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter, Dart, IoT",
        impact: [
            { label: "Safety", value: "Fall Detection" },
            { label: "UI", value: "Dashboard" }
        ]
    },
    "maragoo-admin": {
        title: "Maragoo Lifeline Admin Panel (Flutter Web)",
        overline: "OneClick IT Consultancy Pvt Ltd",
        problem: "Admin dashboard for managing carers, patient assignments, authentication, and monitoring system status.",
        solution: "<ul>" +
            "<li>Built full Flutter Web UI with GetX architecture.</li>" +
            "<li>Implemented carer management workflows and authentication.</li>" +
            "<li>Enabled real-time synchronization with the carer mobile app.</li>" +
            "<li>Improved dashboard performance and responsiveness.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter Web, Dart, GetX, REST APIs",
        impact: [
            { label: "Platform", value: "Flutter Web" },
            { label: "Architecture", value: "GetX" }
        ]
    },
    "oneclick-buzz": {
        title: "OneClick Buzz (Office Communication App)",
        overline: "OneClick IT Consultancy Pvt Ltd",
        problem: "Internal communication platform with chat, media sharing, buzz alerts, and role-based notifications.",
        solution: "<ul>" +
            "<li>Built the entire application from scratch during internship.</li>" +
            "<li>Implemented chat, media uploads, and location sharing.</li>" +
            "<li>Created buzz notifications that ring even in silent mode.</li>" +
            "<li>Integrated Cloud Firestore for real-time messaging.</li>" +
            "<li>Deployed to both Play Store and App Store.</li>" +
            "</ul>",
        challenges: "Tech Stack: Flutter, Dart, Firebase, Cloud Firestore, NoSQL",
        impact: [
            { label: "Real-time", value: "Firestore" },
            { label: "Impact", value: "Company-wide" }
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
    document.getElementById('modal-solution').innerHTML = data.solution;
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
    const gallerySection = document.querySelector('.modal-gallery-section');
    if (data.images && data.images.length > 0) {
        gallerySection.style.display = 'block';
        gallery.innerHTML = data.images.map(imgSrc => `
            <div class="gallery-item" onclick="openLightbox('${imgSrc}')">
                <img src="${imgSrc}" alt="Project screenshot">
            </div>
        `).join('');
    } else {
        gallerySection.style.display = 'none';
        gallery.innerHTML = '';
    }

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

// Modal Trigger Delegation
document.addEventListener('click', (e) => {
    const trigger = e.target.closest('.project-details-trigger');
    if (trigger) {
        console.log('Project trigger clicked:', trigger.getAttribute('data-project'));
        e.preventDefault();
        const projectId = trigger.getAttribute('data-project') || trigger.closest('[data-project]').getAttribute('data-project');
        if (projectId) {
            openModal(projectId);
        }
    }
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
