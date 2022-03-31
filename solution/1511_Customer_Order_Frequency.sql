# Write your MySQL query statement below
SELECT
	o.customer_id,
	name
FROM
	Orders o
JOIN Product p ON
	o.product_id = p.product_id
JOIN Customers c ON
	o.customer_id = c.customer_id
GROUP BY
	1,
	2
HAVING
	sum(CASE WHEN date_format(order_date, '%Y-%m')= '2020-06' THEN price*quantity END) >= 100
	AND sum(CASE WHEN date_format(order_date, '%Y-%m')= '2020-07' THEN price*quantity END) >= 100;
