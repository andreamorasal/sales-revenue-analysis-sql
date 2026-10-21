-- Month-over-month sales growth.

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
    LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue,
    ROUND(
		100.0 * (
			revenue - LAG(revenue) OVER (ORDER BY month)
            ) / NULLIF(LAG(revenue) OVER (ORDER BY month), 0),
        2
	) AS mom_growth_percentage	
FROM monthly_sales
ORDER BY month;



 