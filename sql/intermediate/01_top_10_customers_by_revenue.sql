-- Database selection. 

USE sales_revenue_analysis;


-- Top 10 customers by revenue.  

SELECT
	c.customer_id,
	c.customer_name,
    ROUND(SUM(o.quantity * o.unit_price),2) AS total_revenue
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
WHERE o.payment_status = 'Paid'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC
LIMIT 10;


