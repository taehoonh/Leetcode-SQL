# Write your MySQL query statement below
SELECT city_id, day, degree
FROM (
  SELECT city_id, day, degree,
         ROW_NUMBER() OVER (PARTITION BY city_id ORDER BY degree DESC, day ASC) AS rnk
  FROM Weather
) A
WHERE rnk = 1
ORDER BY 1;
