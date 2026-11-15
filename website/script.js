const main = document.querySelector("main");
const navNav = document.querySelector("#nav-navigation");

// Rileva se ci troviamo nella pagina principale (index.html) o nel glossario
const isIndexPage = document.querySelector("main section#rtb") !== null;

if (isIndexPage) {
  // =========================================================================
  // MODALITÀ SITO PRINCIPALE: Scorrimento tra le sezioni con animazione lenta
  // =========================================================================
  const navLinks = document.querySelectorAll("#nav-navigation a");
  const sections = document.querySelectorAll("main section");
  const logoLink = document.querySelector("#header-logo a");

  let currentSectionId = "";
  let isNavClicking = false;
  let navClickTimeout = null;
  let lastSettledIndex = 0;
  let scrollSettleTimer = null;
  let isAutoCentering = false;

  const isMainScrollable = () =>
    main && main.scrollHeight > main.clientHeight && window.getComputedStyle(main).overflowY !== "visible";

  const getCurrentScroll = () =>
    isMainScrollable() ? main.scrollTop : (window.scrollY || document.documentElement.scrollTop);

  const getSectionTop = (sec) =>
    isMainScrollable()
      ? sec.offsetTop
      : (sec.getBoundingClientRect().top + (window.scrollY || document.documentElement.scrollTop));

  const scrollToPosition = (top) => {
    const scroller = isMainScrollable() ? main : window;
    scroller.scrollTo({ top, behavior: "smooth" });
  };

  const setActiveNav = (id) => {
    navLinks.forEach(link => {
      const linkId = link.getAttribute("href")?.replace("#", "");
      if (linkId === id) {
        link.classList.add("active");
        if (navNav && navNav.scrollHeight > navNav.clientHeight) {
          link.scrollIntoView({ block: "nearest", inline: "nearest" });
        }
      } else {
        link.classList.remove("active");
      }
    });
  };

  const navigateToSection = (targetSec, pushHistory = true) => {
    if (!targetSec) return;
    const targetId = targetSec.id;
    const idx = Array.from(sections).indexOf(targetSec);
    if (idx !== -1) lastSettledIndex = idx;

    isNavClicking = true;
    clearTimeout(navClickTimeout);
    clearTimeout(scrollSettleTimer);
    navClickTimeout = setTimeout(() => {
      isNavClicking = false;
    }, 900);

    sections.forEach(s => {
      if (s !== targetSec) s.classList.remove("is-active-section");
    });
    targetSec.classList.remove("is-active-section");
    void targetSec.offsetWidth;
    targetSec.classList.add("is-active-section");

    currentSectionId = targetId;
    setActiveNav(targetId);
    scrollToPosition(getSectionTop(targetSec));
    if (pushHistory) {
      history.pushState(null, "", `#${targetId}`);
    }
  };

  // Rileva la sezione attualmente visibile durante lo scorrimento
  const observerOptions = {
    root: null,
    threshold: [0.2, 0.55]
  };

  const sectionObserver = new IntersectionObserver((entries) => {
    if (isNavClicking) return;

    entries.forEach(entry => {
      const sec = entry.target;
      if (entry.isIntersecting) {
        // Avvia l'animazione di comparsa ogni volta che la sezione entra nella vista
        if (!sec.classList.contains("is-active-section")) {
          sec.classList.add("is-active-section");
        }
      } else {
        // Quando esce dalla vista, resetta la classe per permettere la ripartenza alla prossima entrata
        sec.classList.remove("is-active-section");
      }
    });

    // Seleziona la sezione con maggiore visibilità per aggiornare il link attivo nella navbar
    const containerTop = isMainScrollable() ? main.getBoundingClientRect().top : 0;
    const containerBottom = isMainScrollable() ? main.getBoundingClientRect().bottom : window.innerHeight;
    let mostVisibleSec = null;
    let maxVisibleHeight = 0;
    sections.forEach(s => {
      const rect = s.getBoundingClientRect();
      const visibleHeight = Math.max(0, Math.min(rect.bottom, containerBottom) - Math.max(rect.top, containerTop));
      if (visibleHeight > maxVisibleHeight) {
        maxVisibleHeight = visibleHeight;
        mostVisibleSec = s;
      }
    });

    if (mostVisibleSec && mostVisibleSec.id !== currentSectionId && maxVisibleHeight > 100) {
      currentSectionId = mostVisibleSec.id;
      setActiveNav(mostVisibleSec.id);
      history.replaceState(null, "", `#${mostVisibleSec.id}`);
    }
  }, observerOptions);

  sections.forEach(sec => sectionObserver.observe(sec));

  // Centra automaticamente la sezione sullo schermo al termine dello scorrimento
  const centerVisibleSection = () => {
    if (isNavClicking || isAutoCentering || sections.length === 0) return;

    const mainScrollable = isMainScrollable();
    const vh = mainScrollable ? main.clientHeight : window.innerHeight;
    const currentScroll = getCurrentScroll();

    const containerTop = mainScrollable ? main.getBoundingClientRect().top : 0;
    const containerBottom = mainScrollable ? main.getBoundingClientRect().bottom : window.innerHeight;
    let mostVisibleSec = null;
    let maxVisibleHeight = 0;
    sections.forEach(s => {
      const rect = s.getBoundingClientRect();
      const visibleHeight = Math.max(0, Math.min(rect.bottom, containerBottom) - Math.max(rect.top, containerTop));
      if (visibleHeight > maxVisibleHeight) {
        maxVisibleHeight = visibleHeight;
        mostVisibleSec = s;
      }
    });

    if (!mostVisibleSec) return;

    const mostVisibleIdx = Array.from(sections).indexOf(mostVisibleSec);
    const lastSec = sections[lastSettledIndex] || mostVisibleSec;
    const lastTop = getSectionTop(lastSec);
    const lastHeight = lastSec.offsetHeight;

    let targetSec = mostVisibleSec;

    // Se l'utente ha fatto un piccolo movimento dalla sezione corrente, interpreta la direzione
    if (mostVisibleIdx === lastSettledIndex) {
      if (lastHeight <= vh + 4) {
        const delta = currentScroll - lastTop;
        if (delta > 80 && lastSettledIndex < sections.length - 1) {
          targetSec = sections[lastSettledIndex + 1];
        } else if (delta < -80 && lastSettledIndex > 0) {
          targetSec = sections[lastSettledIndex - 1];
        }
      } else {
        // Sezione più alta dello schermo: consenti lo scorrimento interno libero
        if (currentScroll < lastTop - 80 && lastSettledIndex > 0) {
          targetSec = sections[lastSettledIndex - 1];
        } else if (currentScroll + vh > lastTop + lastHeight + 80 && lastSettledIndex < sections.length - 1) {
          targetSec = sections[lastSettledIndex + 1];
        } else if (currentScroll >= lastTop && currentScroll + vh <= lastTop + lastHeight) {
          return;
        }
      }
    }

    const targetIdx = Array.from(sections).indexOf(targetSec);
    const targetTop = getSectionTop(targetSec);
    const targetHeight = targetSec.offsetHeight;

    let finalScroll = targetTop;
    if (targetHeight > vh + 4 && currentScroll > targetTop && currentScroll + vh < targetTop + targetHeight) {
      lastSettledIndex = targetIdx;
      return;
    }

    lastSettledIndex = targetIdx;
    if (targetSec.id !== currentSectionId) {
      currentSectionId = targetSec.id;
      setActiveNav(targetSec.id);
      history.replaceState(null, "", `#${targetSec.id}`);
    }

    if (Math.abs(currentScroll - finalScroll) > 2) {
      isAutoCentering = true;
      scrollToPosition(finalScroll);
      setTimeout(() => {
        isAutoCentering = false;
      }, 650);
    }
  };

  const scheduleCenterSection = () => {
    if (isNavClicking || isAutoCentering) return;
    clearTimeout(scrollSettleTimer);
    scrollSettleTimer = setTimeout(centerVisibleSection, 140);
  };

  if (main) {
    main.addEventListener("scroll", scheduleCenterSection, { passive: true });
  }
  window.addEventListener("scroll", scheduleCenterSection, { passive: true });

  // Gestione click sui link di navigazione della sidebar
  navLinks.forEach(link => {
    link.addEventListener("click", (e) => {
      const targetId = link.getAttribute("href")?.replace("#", "");
      const targetSec = document.getElementById(targetId);
      if (targetSec) {
        e.preventDefault();
        navigateToSection(targetSec, true);
      }
    });
  });

  // Gestione click sul logo Akme Group
  if (logoLink) {
    logoLink.addEventListener("click", (e) => {
      const targetId = logoLink.getAttribute("href")?.replace("#", "");
      const targetSec = document.getElementById(targetId);
      if (targetSec) {
        e.preventDefault();
        navigateToSection(targetSec, true);
      }
    });
  }

  // Gestione dell'hash iniziale e navigazione cronologia browser
  const initHash = () => {
    const hash = window.location.hash?.replace("#", "");
    const sec = document.getElementById(hash) || sections[0];
    if (sec) {
      const idx = Array.from(sections).indexOf(sec);
      if (idx !== -1) lastSettledIndex = idx;
      currentSectionId = sec.id;
      sec.classList.add("is-active-section");
      setActiveNav(sec.id);
      scrollToPosition(getSectionTop(sec));
    }
  };

  window.addEventListener("hashchange", () => {
    const hash = window.location.hash?.replace("#", "");
    const sec = document.getElementById(hash);
    if (sec && sec.id !== currentSectionId) {
      navigateToSection(sec, false);
    }
  });

  initHash();

} else {
  // =========================================================================
  // MODALITÀ GLOSSARIO: Scrollspy continuo delle sezioni alfabetiche A-Z
  // =========================================================================
  const navLinks = document.querySelectorAll("#nav-navigation a");
  const sections = document.querySelectorAll("main section");

  if (sections.length > 0 && navLinks.length > 0) {
    const setActiveLink = (id) => {
      navLinks.forEach(link => {
        const isMatch = link.getAttribute("href") === `#${id}`;
        if (isMatch) {
          if (!link.classList.contains("active")) {
            link.classList.add("active");
          }
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

      const isMainScrollable = main && (main.scrollHeight > main.clientHeight) && window.getComputedStyle(main).overflowY !== "visible";
      const scrollTop = isMainScrollable ? main.scrollTop : (window.scrollY || document.documentElement.scrollTop);
      const scrollHeight = isMainScrollable ? main.scrollHeight : document.documentElement.scrollHeight;
      const clientHeight = isMainScrollable ? main.clientHeight : window.innerHeight;

      if (scrollTop <= 10) {
        setActiveLink(sections[0].id);
        return;
      }

      if (scrollTop + clientHeight >= scrollHeight - 10) {
        setActiveLink(sections[sections.length - 1].id);
        return;
      }

      const containerTop = isMainScrollable ? main.getBoundingClientRect().top : 0;
      const offset = 120;
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

    navLinks.forEach(link => {
      link.addEventListener("click", () => {
        const targetId = link.getAttribute("href")?.replace("#", "");
        if (targetId) {
          setActiveLink(targetId);
        }
      });
    });

    updateActiveSection();
    window.addEventListener("load", updateActiveSection);
  }
}

// =========================================================================
// ANIMAZIONE COMPARSA ALLO SCROLL PER FILE E CONTENUTI
// =========================================================================
const initScrollReveal = () => {
  const itemsToReveal = document.querySelectorAll("main section h4, main section h3, .member-item");
  if (!itemsToReveal.length) return;

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

    const viewportHeight = window.innerHeight;
    unrevealed.forEach((el, index) => {
      const rect = el.getBoundingClientRect();
      if (rect.top < viewportHeight - 20 && rect.bottom > 20) {
        revealElement(el, index * 35);
      }
    });
  };

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
