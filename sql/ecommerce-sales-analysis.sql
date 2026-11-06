-- E-commerce Sales Performance — Ali Ghaithan
-- MySQL 8+ | SYNTHETIC sample data only
-- Import customers, products, orders, order_items from the accompanying dataset first.
USE ecommerce_portfolio;

-- 01 | Validate counts and the order status distribution
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items;

SELECT order_status, COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

-- 02 | Completed-order revenue: expected 6421.00
SELECT ROUND(SUM(oi.quantity * oi.unit_price), 2) AS completed_revenue
FROM orders AS o
JOIN order_items AS oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed';

-- 03 | Average completed order value: expected 70.56
-- Group to one row per order before taking the average.
WITH order_totals AS (
 SELECT o.order_id, SUM(oi.quantity * oi.unit_price) AS order_revenue
 FROM orders AS o
 JOIN order_items AS oi ON o.order_id = oi.order_id
 WHERE o.order_status = 'Completed'
 GROUP BY o.order_id
)
SELECT COUNT(*) AS completed_orders,
       ROUND(AVG(order_revenue), 2) AS average_order_value
FROM order_totals;

-- 04 | Monthly completed revenue
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
       COUNT(DISTINCT o.order_id) AS completed_orders,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS completed_revenue
FROM orders AS o
JOIN order_items AS oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;

-- 05 | Product ranking by revenue
SELECT p.product_name, p.category,
       SUM(oi.quantity) AS units_sold,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS completed_revenue
FROM orders AS o
JOIN order_items AS oi ON o.order_id = oi.order_id
JOIN products AS p ON p.product_id = oi.product_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY completed_revenue DESC;

-- 06 | Completed revenue by customer city
SELECT c.city,
       COUNT(DISTINCT o.order_id) AS completed_orders,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS completed_revenue
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN order_items AS oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.city
ORDER BY completed_revenue DESC;

-- 07 | Revenue by customer segment
SELECT c.segment,
       COUNT(DISTINCT o.order_id) AS completed_orders,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS completed_revenue
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN order_items AS oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.segment
ORDER BY completed_revenue DESC;

-- 08 | Customers with more than one completed order
WITH completed_customer_orders AS (
 SELECT customer_id, COUNT(*) AS completed_orders
 FROM orders
 WHERE order_status = 'Completed'
 GROUP BY customer_id
)
SELECT COUNT(*) AS repeat_customers
FROM completed_customer_orders
WHERE completed_orders > 1;

-- 09 | Data-integrity checks: expected zero unmatched links
SELECT COUNT(*) AS missing_order_links
FROM order_items AS oi
LEFT JOIN orders AS o ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

SELECT COUNT(*) AS missing_product_links
FROM order_items AS oi
LEFT JOIN products AS p ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

-- Note: 'Completed' is a simple analytic convention for this synthetic dataset.
-- Financial revenue recognition can require adjustments for refunds, discounts,
-- tax, shipping, payment capture, and accounting policies.
