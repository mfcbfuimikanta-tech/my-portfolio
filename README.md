# Data Analyst Portfolio Website

A responsive static portfolio site showcasing a **Loan Default Risk Analysis** case study.

## Pages and features
- `index.html` — Home, featured project, skills, about, contact
- `projects/loan-default-risk.html` — Detailed case study with sample results and charts
- `demos/loan-default-dashboard.html` — Standalone interactive demonstration dashboard
- `downloads/loan-default-risk-analysis-project.zip` — Source code, synthetic data and documentation
- `assets/styles.css` — Responsive dark/light styles
- `assets/profile.js` — **Edit your name and contact details here**
- `assets/main.js` — Profile links, mobile nav, theme switch and SQL copy interaction

**All results shown are from a synthetic sample dataset**, not a real lender's loan book. The demo includes 320 sample borrowers, 460 loan applications and 78 observed defaults. The analytical patterns are descriptive, not causal or a validated credit-risk policy.

## Customize before you publish
1. Open `assets/profile.js` in Notepad or VS Code.
2. Replace `Your Name` with your real name.
3. Optionally add `location`, `email`, `github`, `linkedin`, and `resume`.
   - Leave unavailable fields blank: their links will stay hidden.
   - If you add a resume path, place your PDF in the matching folder.
4. Edit the introduction or skills in `index.html` to reflect your actual experience.
5. Open `index.html` in a browser and check both pages and the dashboard.

## Publish using GitHub Pages (no coding or hosting fee required)
1. Create a public GitHub repository called `<your-github-username>.github.io` for a root portfolio URL.
   - Or use any repository name (site URL will contain the repository name).
2. Upload **the contents of this folder** (including `index.html` at repository root).
3. In **Settings → Pages**, choose `Deploy from a branch`, `main`, and `/(root)`, then save.
4. Visit `https://<your-github-username>.github.io/` for the special root repository, or `https://<your-github-username>.github.io/<repository-name>/` for any other repo.
5. Confirm your `projects/`, `demos/`, and `downloads/` links work.

GitHub Pages deployment can take a short time after commit. Check the repository's Pages settings for the published URL.

## Good portfolio practice
- State clearly that the published loan data are synthetic.
- Do not claim projected results, actual banking work or completed future projects.
- Re-run the analysis on original source files only when available and safe to share.
- Add new case studies as you finish them.

No build tooling required; works with ordinary HTML, CSS and JavaScript.
