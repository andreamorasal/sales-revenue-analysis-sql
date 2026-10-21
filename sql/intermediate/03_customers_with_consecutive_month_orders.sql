-- Customers who ordered in consecutive months. 

WITH cust_months AS (
    SELECT DISTINCT
        customer_id,
        DATE_FORMAT(order_date, '%Y-%m') AS order_month
    FROM orders
),
ranked AS (
    SELECT
        customer_id,
        order_month,
        LAG(order_month) OVER (
            PARTITION BY customer_id
            ORDER BY order_month
        ) AS prev_month
    FROM cust_months
)
SELECT DISTINCT 
	r.customer_id,
    c.customer_name
FROM ranked r
JOIN customers c
	ON r.customer_id = c.customer_id
WHERE STR_TO_DATE(CONCAT(order_month, '-01'), '%Y-%m-%d')
    = STR_TO_DATE(CONCAT(prev_month, '-01'), '%Y-%m-%d')
      + INTERVAL 1 MONTH;