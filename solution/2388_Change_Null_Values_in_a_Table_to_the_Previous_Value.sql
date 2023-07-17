# Write your MySQL query statement below
WITH cte AS (
  SELECT id, drink, ROW_NUMBER() OVER () AS nb
  FROM CoffeeShop
), 
cte2 AS (
  SELECT id, drink, nb, SUM(CASE WHEN drink IS NOT NULL THEN 1 ELSE 0 END) OVER (ORDER BY nb) AS group_id
  FROM cte
)
SELECT id, FIRST_VALUE(drink) OVER (PARTITION BY group_id) AS drink
FROM cte2
ORDER BY nb;
