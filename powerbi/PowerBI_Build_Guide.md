# Power BI Desktop — E-commerce Intelligence Dashboard

> **Important:** This package contains the actual source data and report design assets, plus a separate fully interactive browser preview. It does **not** contain a precompiled `.pbix` file. Power BI Desktop is needed to create and save the native report; no `.pbix` has been validated in this environment.

## Deliverables already prepared
- `data/PowerBI_Ready_Sales.csv` — a pre-joined fact table with **239 line items** and order/customer/product dimensions, ready for import
- `data/customers.csv`, `products.csv`, `orders.csv`, `order_items.csv` — original four normalized source CSVs
- `powerbi/measures.dax` — seven documented measures and an optional Calendar calculated table
- `powerbi/theme.json` — business intelligence theme
- `dashboard/ecommerce-powerbi-preview.html` — fully interactive portfolio dashboard preview, filterable by city, category, segment and month
- `images/dashboard-preview.png` — screenshot of the preview

## Build the native Power BI report (one-time setup)
1. Open **Power BI Desktop** on Windows. Choose **Get data > Text/CSV** and open `data/PowerBI_Ready_Sales.csv`.
2. Select **Transform data**, rename the query to `Sales`, and set the data types as follows:
   - Whole number: `OrderItemID`, `OrderID`, `CustomerID`, `ProductID`, `Quantity`
   - Date: `OrderDate` (use locale English-US if parsing is ambiguous)
   - Decimal number / fixed decimal: `UnitPrice`, `LineValue`
   - Text: `OrderStatus`, `Customer`, `City`, `Segment`, `Product`, `Category`
   Choose **Close & Apply**.
3. Under **View > Themes > Browse for themes**, import `powerbi/theme.json`.
4. Select **Modeling > New measure** and create the measures in `powerbi/measures.dax` one at a time. DAX `//` comments are explanatory, not one pasteable multi-measure formula.
5. Optional but recommended: create the Calendar table from the bottom of the DAX file, relate its Date to `Sales[OrderDate]`, and mark it as a date table.
6. Add the report elements below to a **16:9** report page with a dark canvas. Format currency measures as USD currency (0 or 2 decimals) and Completion Rate as percent.
7. Save as `Ali_Ghaithan_Ecommerce_Sales_Dashboard.pbix`. Only after successfully saving and testing it should you call the file a native PBIX deliverable.

## Visual layout: one-page, five insights + filters

| Area | Power BI visual | Field / measure | Notes |
|---|---|---|---|
| Row 1 | 4 Cards | `[Completed Revenue]`, `[Completed Orders]`, `[Average Order Value]`, `[Units Sold]` | Expected USD 6,421; 91; USD 70.56; see units from model |
| Row 2 left | Line chart | X `Calendar[YearMonth]` (or month of `Sales[OrderDate]`); Y `[Completed Revenue]` | Monthly trend, Jan–Dec 2025 |
| Row 2 right | Clustered bar chart | Y `Sales[Product]`, X `[Completed Revenue]` | Sort descending and apply Top N=5 |
| Row 3 left | Bar chart | `Sales[City]` vs `[Completed Revenue]` | Show 4 cities |
| Row 3 right | Donut chart | Legend `Sales[Category]`, Values `[Completed Revenue]` | Category composition |
| Row 4 left | Bar chart | `Sales[Segment]` vs `[Completed Revenue]` | Retail and Business |
| Row 4 right | Table | Product, Category, Units Sold, Completed Revenue | Sort by completed revenue |
| Top/sidebar | 4 Slicers | City, Category, Segment, Calendar Month | Allow a single selection or All |

The DAX measures apply a **Completed** order condition without inflating order counts due to the many-order-items relationship.

## Data validation: expected unfiltered totals
- Customers 40, Products 10, Orders 120, Order item rows 239
- Completed orders 91; cancelled 21; returned 8
- Completed revenue: **$6,421.00**; Average order value: **$70.56**
- Highest revenue product: Sunscreen **$1,159**
- Highest revenue city: Mukalla **$2,434**
- Monthly high: December 2025 **$1,110**

## Interpretation and limits
All records are synthetic practice data. Report numbers are valid for this dataset, not representative real retail performance. The revenue rule is quantity multiplied by recorded unit price for orders with status Completed. It does not incorporate accounting adjustments, tax, shipping or discounts.

## How to publish the native report later
You can optionally publish the `.pbix` from Power BI Desktop if your Microsoft account allows it. Keep in mind that the "Publish to web" feature makes the report publicly accessible; only use synthetic/non-sensitive data. Alternatively, host the included static HTML dashboard on GitHub Pages (already usable without a Power BI account).