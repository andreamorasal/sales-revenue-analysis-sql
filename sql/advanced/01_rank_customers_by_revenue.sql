-- Rank customers based on total revenue. 

SELECT 
	customer_id,
	customer_name,
	total_revenue,
	RANK() OVER (
			ORDER BY total_revenue DESC) AS revenue_rank
FROM (
	SELECT 
		c.customer_id, 
		c.customer_name,
		SUM(o.quantity * o.unit_price) AS total_revenue
	FROM orders o
	JOIN customers c 
		ON c.customer_id = o.customer_id
	GROUP BY c.customer_id, c.customer_name
) temporary_table;
        
        
 
 

