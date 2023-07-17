# Write your MySQL query statement below
WITH 
cte0 AS (
  SELECT p1.*, p2.price, quantity * price AS prices
  FROM Purchases p1
  JOIN Products p2 ON p1.product_id = p2.product_id
), 
cte1 AS (
  SELECT invoice_id, RANK() OVER (ORDER BY SUM(prices) DESC) AS rnk
  FROM cte0
  GROUP BY invoice_id
), 
cte2 AS (
  SELECT invoice_id
  FROM cte1
  WHERE rnk = 1
  ORDER BY invoice_id
  LIMIT 1
)
SELECT product_id, quantity, prices AS price
FROM cte0
WHERE invoice_id IN (SELECT invoice_id FROM cte2);
