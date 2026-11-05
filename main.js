(() => {
  const config = window.PORTFOLIO_PROFILE || {};
  const escapeText = v => String(v ?? '');
  document.querySelectorAll('[data-profile="name"]').forEach(el => { el.textContent = escapeText(config.name || 'Your Name'); });
  document.querySelectorAll('[data-profile="role"]').forEach(el => { el.textContent = escapeText(config.role || 'Data Analyst'); });
  document.querySelectorAll('[data-profile="initials"]').forEach(el => { el.textContent = escapeText(config.initials || 'DA'); });
  const loc = document.querySelector('[data-profile="location"]');
  if (loc) {
    if (config.location) loc.textContent = config.location;
    else loc.hidden = true;
  }
  document.querySelectorAll('[data-link]').forEach(el => {
    const key = el.getAttribute('data-link');
    const value = config[key];
    if (!value) { el.hidden = true; return; }
    el.href = key === 'email' ? 'mailto:' + value : value;
    if (key === 'resume') el.setAttribute('download', 'Resume');
  });
  const contactInfo = document.querySelector('[data-contact-hint]');
  if (contactInfo && config.email) contactInfo.hidden = true;
  const year = document.querySelector('[data-year]');
  if (year) year.textContent = new Date().getFullYear();

  const themeBtn = document.querySelector('[data-theme-toggle]');
  const saved = localStorage.getItem('da-portfolio-theme');
  if (saved === 'light' || saved === 'dark') document.documentElement.dataset.theme = saved;
  const setThemeText = () => {
    if (!themeBtn) return;
    const isLight = document.documentElement.dataset.theme === 'light';
    themeBtn.setAttribute('aria-label', isLight ? 'Switch to dark mode' : 'Switch to light mode');
    themeBtn.textContent = isLight ? '☾' : '☀';
  };
  setThemeText();
  themeBtn?.addEventListener('click', () => {
    const next = document.documentElement.dataset.theme === 'light' ? 'dark' : 'light';
    document.documentElement.dataset.theme = next;
    localStorage.setItem('da-portfolio-theme', next);
    setThemeText();
  });

  const burger = document.querySelector('[data-mobile-menu]');
  const nav = document.querySelector('[data-nav-links]');
  burger?.addEventListener('click', () => {
    const expanded = burger.getAttribute('aria-expanded') !== 'true';
    burger.setAttribute('aria-expanded', String(expanded));
    nav?.classList.toggle('is-open', expanded);
  });
  nav?.querySelectorAll('a').forEach(a => a.addEventListener('click', () => {
    nav.classList.remove('is-open');
    burger?.setAttribute('aria-expanded','false');
  }));

  document.querySelectorAll('[data-copy]').forEach(button => {
    button.addEventListener('click', async () => {
      const el = document.getElementById(button.getAttribute('data-copy'));
      if (!el) return;
      try { await navigator.clipboard.writeText(el.textContent); button.textContent='Copied!'; }
      catch (_) { button.textContent = 'Select the code to copy'; }
      setTimeout(() => button.textContent='Copy SQL', 2400);
    });
  });
})();
