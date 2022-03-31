# Write your MySQL query statement below
SELECT
	date(sale_date) AS sale_date,
	sum(CASE WHEN fruit = 'apples' THEN sold_num WHEN fruit = 'oranges' THEN -sold_num END) AS diff
FROM
	Sales
GROUP BY
	1
ORDER BY
	1 ;
