-- Revenue contribution percentage by category.

WITH category_revenue AS (
	SELECT 
		p.category,
        SUM(o.quantity * o.unit_price) AS revenue
	FROM orders o
    JOIN products p
		ON p.product_id = o.product_id
	WHERE o.payment_status = 'Paid'
    GROUP BY p.category
)
SELECT 
	category,
    revenue,
    ROUND(100.0 * revenue / SUM(revenue) OVER (), 2) AS percentage_of_total_revenue
FROM category_revenue
ORDER BY revenue DESC;