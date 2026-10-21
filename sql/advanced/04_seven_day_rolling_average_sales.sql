-- 7-day rolling average sales.

WITH daily_sales AS (
	SELECT 
		order_date AS sales_day,
        SUM(quantity*unit_price) AS revenue
	FROM orders
    GROUP BY 1
)
SELECT
	sales_day,
    revenue,
    ROUND(AVG(revenue) OVER (
		ORDER BY sales_day
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2
	) AS rolling_7d_avg
FROM daily_sales
ORDER BY sales_day;
        