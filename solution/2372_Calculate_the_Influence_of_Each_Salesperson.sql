# Write your MySQL query statement below
SELECT
    P.salesperson_id,
    P.name,
    COALESCE(SUM(price), 0) AS total
FROM Salesperson P
LEFT JOIN Customer C
    ON P.salesperson_id = C.salesperson_id
LEFT JOIN Sales S
    ON C.customer_id = S.customer_id
GROUP BY 1, 2;
