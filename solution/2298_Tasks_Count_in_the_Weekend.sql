# Write your MySQL query statement below
SELECT 
    SUM(EXTRACT(DOW FROM submit_date) IN (0, 6)) AS weekend_cnt,
    SUM(EXTRACT(DOW FROM submit_date) BETWEEN 1 AND 5) AS working_cnt
FROM Tasks;