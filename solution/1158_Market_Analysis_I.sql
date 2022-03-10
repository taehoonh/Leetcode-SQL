-- Solution 1: Join, CASE WHEN
SELECT u.user_id AS buyer_id, u.join_date AS join_date,
    SUM(CASE WHEN YEAR(order_date) = 2019 THEN 1 ELSE 0 END) AS orders_in_2019
FROM Users u
LEFT JOIN Orders o
ON u.user_id = o.buyer_id
GROUP BY u.user_id, u.join_date;



-- Solution 2: Subquery, Join
WITH tb1 AS (
    SELECT buyer_id, COUNT(*) AS num
    FROM orders
    WHERE YEAR(order_date) = 2019
    GROUP BY buyer_id
)

SELECT u.user_id AS buyer_id, u.join_date, ISNULL(num, 0) AS orders_in_2019
FROM users u
LEFT JOIN tb1 o
ON u.user_id = o.buyer_id;
