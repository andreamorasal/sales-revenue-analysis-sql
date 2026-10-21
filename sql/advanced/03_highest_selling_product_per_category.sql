-- Highest selling product per category.

WITH product_sales AS (
	SELECT 
		p.category,
        p.product_id,
        p.product_name,
        SUM(o.quantity * o.unit_price) AS revenue,
        ROW_NUMBER() OVER (
			PARTITION BY p.category
			ORDER BY SUM(o.quantity * o.unit_price) DESC
		) AS row_number_category
	FROM orders o
    JOIN products p
		ON p.product_id = o.product_id
	GROUP BY p.category, p.product_id, p.product_name
)
SELECT 
	category,
    product_id,
    product_name,
    revenue
FROM product_sales
WHERE row_number_category = 1;