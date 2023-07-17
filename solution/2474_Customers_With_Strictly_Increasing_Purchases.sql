# Write your MySQL query statement below
WITH yearly AS (
  SELECT customer_id, EXTRACT(YEAR FROM MAX(order_date)) AS year, SUM(price) AS price
  FROM orders
  GROUP BY EXTRACT(YEAR FROM order_date), customer_id
), 
yearly_comparison AS (
  SELECT y1.customer_id
  FROM yearly y1
  LEFT JOIN yearly y2 ON y1.customer_id = y2.customer_id AND y1.year + 1 = y2.year AND y1.price < y2.price
  GROUP BY y1.customer_id
  HAVING COUNT(*) - COUNT(y2.customer_id) = 1
)
SELECT customer_id
FROM yearly_comparison;