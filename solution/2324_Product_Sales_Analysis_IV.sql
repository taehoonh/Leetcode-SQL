# Write your MySQL query statement below
WITH user_product_count AS (
  SELECT user_id, product_id, SUM(quantity) AS total_quantity
  FROM Sales
  GROUP BY user_id, product_id
),

user_spent AS (
  SELECT user_id, product_id,
    RANK() OVER (PARTITION BY user_id ORDER BY total_quantity * price DESC) AS rk
  FROM user_product_count s
  INNER JOIN Product p USING(product_id)
)

SELECT user_id, product_id
FROM user_spent
WHERE rk = 1;