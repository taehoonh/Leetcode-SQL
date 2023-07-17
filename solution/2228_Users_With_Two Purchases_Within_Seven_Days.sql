# Write your MySQL query statement below
SELECT DISTINCT p1.user_id
FROM purchases p1
INNER JOIN purchases p2
ON p1.user_id = p2.user_id AND p1.purchase_id <> p2.purchase_id
WHERE ABS(EXTRACT(EPOCH FROM (p1.purchase_date - p2.purchase_date))) <= 604800
ORDER BY p1.user_id;
