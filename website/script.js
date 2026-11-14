const navLinks = document.querySelectorAll("#nav-navigation a");
const sections = document.querySelectorAll("main section");
const main = document.querySelector("main");
const navNav = document.querySelector("#nav-navigation");

if (sections.length > 0 && navLinks.length > 0) {
  const setActiveLink = (id) => {
    navLinks.forEach(link => {
      const isMatch = link.getAttribute("href") === `#${id}`;
      if (isMatch) {
        if (!link.classList.contains("active")) {
          link.classList.add("active");
        }
        // Se la lista di navigazione ha uno scroll, mantiene visibile l'elemento attivo
        if (navNav && navNav.scrollHeight > navNav.clientHeight) {
          link.scrollIntoView({ block: "nearest", inline: "nearest" });
        }
      } else {
        link.classList.remove("active");
      }
    });
  };

  const updateActiveSection = () => {
    if (sections.length === 0) return;

    // Rileva se lo scroll è gestito da main (desktop) o window/body (mobile)
    const isMainScrollable = main && (main.scrollHeight > main.clientHeight) && window.getComputedStyle(main).overflowY !== "visible";

    const scrollTop = isMainScrollable ? main.scrollTop : (window.scrollY || document.documentElement.scrollTop);
    const scrollHeight = isMainScrollable ? main.scrollHeight : document.documentElement.scrollHeight;
    const clientHeight = isMainScrollable ? main.clientHeight : window.innerHeight;

    // Se si è all'inizio della pagina, attiva sempre la prima sezione
    if (scrollTop <= 10) {
      setActiveLink(sections[0].id);
      return;
    }

    // Se si è arrivati in fondo alla pagina, attiva l'ultima sezione
    if (scrollTop + clientHeight >= scrollHeight - 10) {
      setActiveLink(sections[sections.length - 1].id);
      return;
    }

    const containerTop = isMainScrollable ? main.getBoundingClientRect().top : 0;
    const offset = 120; // Offset di lettura dal top

    let currentSectionId = sections[0].id;

    for (let i = 0; i < sections.length; i++) {
      const rect = sections[i].getBoundingClientRect();
      const relativeTop = rect.top - containerTop;

      if (relativeTop <= offset) {
        currentSectionId = sections[i].id;
      } else {
        break;
      }
    }

    setActiveLink(currentSectionId);
  };

  // Ottimizzazione eventi di scroll con requestAnimationFrame
  let ticking = false;
  const onScroll = () => {
    if (!ticking) {
      window.requestAnimationFrame(() => {
        updateActiveSection();
        ticking = false;
      });
      ticking = true;
    }
  };

  if (main) {
    main.addEventListener("scroll", onScroll, { passive: true });
  }
  window.addEventListener("scroll", onScroll, { passive: true });

  // Gestione click sui link della sidebar
  navLinks.forEach(link => {
    link.addEventListener("click", () => {
      const targetId = link.getAttribute("href")?.replace("#", "");
      if (targetId) {
        setActiveLink(targetId);
      }
    });
  });

  // Chiamata immediata e al caricamento completo
  updateActiveSection();
  window.addEventListener("load", updateActiveSection);
}

// --- Animazione di comparsa allo scroll per file e contenuti ---
const initScrollReveal = () => {
  const itemsToReveal = document.querySelectorAll("main section h4, main section h3, .member-item");
  if (!itemsToReveal.length) return;

  // Rispetta la preferenza di movimento ridotto dell'utente
  if (window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
    return;
  }

  itemsToReveal.forEach(el => el.classList.add("reveal-item"));

  const revealElement = (el, delay = 0) => {
    if (!el.classList.contains("revealed")) {
      if (delay > 0) {
        setTimeout(() => el.classList.add("revealed"), delay);
      } else {
        el.classList.add("revealed");
      }
    }
  };

  const checkVisibility = () => {
    const unrevealed = document.querySelectorAll(".reveal-item:not(.revealed)");
    if (!unrevealed.length) return;

    const isMainScrollable = main && (main.scrollHeight > main.clientHeight) && window.getComputedStyle(main).overflowY !== "visible";
    const containerTop = isMainScrollable ? main.getBoundingClientRect().top : 0;
    const containerBottom = isMainScrollable ? main.getBoundingClientRect().bottom : window.innerHeight;

    unrevealed.forEach((el, index) => {
      const rect = el.getBoundingClientRect();
      if (rect.top < containerBottom - 20 && rect.bottom > containerTop + 20) {
        revealElement(el, index * 35);
      }
    });
  };

  if ("IntersectionObserver" in window) {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry, index) => {
        if (entry.isIntersecting) {
          revealElement(entry.target, index * 40);
          observer.unobserve(entry.target);
        }
      });
    }, {
      root: null,
      threshold: 0.1,
      rootMargin: "0px 0px -20px 0px"
    });

    itemsToReveal.forEach(el => observer.observe(el));
  }

  // Verifica immediata e allo scroll (supporta sia lo scroll interno di main che quello globale di window)
  checkVisibility();
  if (main) {
    main.addEventListener("scroll", checkVisibility, { passive: true });
  }
  window.addEventListener("scroll", checkVisibility, { passive: true });
  window.addEventListener("load", checkVisibility);
};

if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", initScrollReveal);
} else {
  initScrollReveal();
}
