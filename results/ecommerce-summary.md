# E-commerce Sales Performance — SQL Case Study
**Analyst:** Ali Ghaithan  
**Tools:** MySQL 8+, JOIN, GROUP BY, SUM, DATE_FORMAT, CTEs  
**Source:** Fully synthetic practice dataset — not real transaction data.

## Scope
Four linked tables: 40 customers, 10 products, 120 orders, and 239 order items. The order date is in 2025. Revenue is computed as line item quantity × transaction unit price, **only for orders marked Completed**. Cancelled and Returned orders are excluded.

## Verified sample results
| KPI | Result |
| --- | ---: |
| All orders | 120 |
| Completed orders | 91 |
| Cancelled / Returned orders | 21 / 8 |
| Completed revenue | $6,421.00 |
| Average completed order value | $70.56 |
| Purchasing customers | 36 |
| Repeat customers (2+ completed orders) | 24 |

## Completed revenue by city
| City | Revenue |
| --- | ---: |
| Mukalla | $2,434 |
| Aden | $1,515 |
| Sanaa | $1,316 |
| Taiz | $1,156 |

## Top five products by completed revenue
| Product | Revenue |
| --- | ---: |
| Sunscreen | $1,159 |
| Vitamin C Serum | $1,144 |
| Body Lotion | $756 |
| Moisturizer | $612 |
| Conditioner | $611 |

## Monthly completed revenue
| Month | Revenue |
| --- | ---: |
| 2025-01 | $311 |
| 2025-02 | $474 |
| 2025-03 | $429 |
| 2025-04 | $617 |
| 2025-05 | $256 |
| 2025-06 | $390 |
| 2025-07 | $594 |
| 2025-08 | $711 |
| 2025-09 | $429 |
| 2025-10 | $849 |
| 2025-11 | $251 |
| 2025-12 | $1,110 |

## How to reproduce
1. Download the accompanying E-commerce SQL project dataset ZIP from the project delivery in ChatGPT.
2. Create the `ecommerce_portfolio` schema using its `sql/01_create_tables.sql`.
3. Import the CSV files in the order: customers, products, orders, order_items.
4. Run the `sql/ecommerce-sales-analysis.sql` script in MySQL Workbench.

## Insights
- Mukalla contributes roughly **37.9%** of completed revenue, the largest city share in this sample.
- Sunscreen and Vitamin C Serum together account for **$2,303** (~35.9% of revenue).
- December has the highest monthly revenue at **$1,110**; a small synthetic sample cannot demonstrate genuine seasonality.

## Limitations
Synthetic data is useful for demonstrating relational SQL and business reporting, not for real market claims. No inference about causal drivers, seasonality, or financial statement revenue recognition is warranted from this dataset. Results were independently cross-checked against the original sample CSVs with SQLite; MySQL syntax is provided for direct reproduction.
