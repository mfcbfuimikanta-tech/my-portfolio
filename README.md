# Ali Ghaithan — Data Analyst Portfolio

**Live portfolio:** https://mfcbfuimikanta-tech.github.io/my-portfolio/

A responsive, static portfolio featuring three reproducible analytics case studies using SQL, Python/Pandas, Excel and Power BI.

## Featured projects

| Project | Focus | Explore |
| --- | --- | --- |
| Loan Default Risk Analysis | Synthetic loan application data, credit score segmentation, default rates, Pandas and SQL | [Case study](projects/loan-default-risk.html) · [Interactive dashboard](demos/loan-default-dashboard.html) |
| E-commerce Sales Performance | MySQL joins, validation, revenue, products, cities and monthly trends | [Case study](projects/ecommerce-sales-sql.html) · [SQL script](sql/ecommerce-sales-analysis.sql) |
| E-commerce Sales Dashboard | Sales KPIs, cross-filtered HTML dashboard, DAX measures, and a native Power BI Desktop report | [Case study](projects/ecommerce-powerbi.html) · [Dashboard preview](dashboard/ecommerce-powerbi-preview.html) · [PBIX](downloads/Ali_Ghaithan_Ecommerce_Sales_Dashboard.pbix) |

### Highlighted sample outcomes

- **Loan risk:** 460 synthetic loan applications, 78 observed defaults (16.96%). These are descriptive sample results, not a validated lending model.
- **E-commerce:** 120 synthetic orders, including 91 completed orders and $6,421 in completed revenue.
- **Power BI:** Downloadable Desktop report plus a separate browser-based interactive preview. The HTML preview is **not** a Microsoft Power BI embedded report.

## Tools and methods

Python (Pandas), MySQL, SQL joins and aggregations, exploratory analysis, data cleaning, Excel, Power BI, DAX, KPIs and interactive dashboards.

## Services highlighted on the homepage

- Data cleaning and preparation (Excel / CSV)
- SQL analysis and reporting
- Power BI dashboards and KPI reporting
- Python / Pandas exploratory analysis

Project previews are lightweight illustrative CSS/SVG visual summaries, rather than screenshots of deployed Power BI.

## Site structure

- `index.html` — homepage, skills, projects and contact
- `projects/` — full project write-ups, methods, limitations and results
- `dashboard/` and `demos/` — interactive HTML dashboards
- `sql/`, `powerbi/`, `results/` — analysis, models, measures and reports
- `downloads/` — downloadable project assets and Power BI Desktop report
- `assets/profile.js` — contact/profile configuration
- `assets/styles.css` and `assets/main.js` — styling and interaction

## Run locally

Clone this repository and open `index.html` in a browser. Some browser-based data loading works best with a local HTTP server, for example `python -m http.server 8000`, then visit `http://localhost:8000`.

## Important data disclosure

**All published numerical results use synthetic training datasets.** They do not represent real commercial or lending outcomes. No causal or production-ready credit-risk claims are made.

## Contact

Email: **ghaithan61@gmail.com**

GitHub: https://github.com/mfcbfuimikanta-tech
