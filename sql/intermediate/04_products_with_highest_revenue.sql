-- Top 10 products with the highest revenue. 

SELECT
    p.product_id,
    p.product_name,
    SUM(o.quantity * o.unit_price) AS total_revenue
FROM products p
JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.product_id
ORDER BY total_revenue DESC
LIMIT 10;
