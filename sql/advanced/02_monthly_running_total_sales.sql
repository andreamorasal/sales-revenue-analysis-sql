-- Running total sales by month

WITH monthly_sales AS (
	SELECT 
		DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(quantity * unit_price) AS revenue
	FROM orders 
    WHERE payment_status = 'Paid'
    GROUP BY month
)
SELECT 
	month,
    revenue,
    SUM(revenue) OVER (ORDER BY MONTH) AS running_total
FROM monthly_sales
ORDER BY month;