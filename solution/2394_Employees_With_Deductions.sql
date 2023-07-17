# Write your MySQL query statement below
SELECT
  E.employee_id
FROM
  Employees E
  LEFT JOIN Logs L ON E.employee_id = L.employee_id
GROUP BY
  E.employee_id,
  E.needed_hours
HAVING
  (SUM(CEIL(COALESCE(EXTRACT(EPOCH FROM (L.out_time - L.in_time)),0) / 60)) / 60) < E.needed_hours;
