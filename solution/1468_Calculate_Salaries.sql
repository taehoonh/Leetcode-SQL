# Write your MySQL query statement below
SELECT
	company_id,
	employee_id,
	employee_name,
	round(salary - salary*tax, 0) AS salary
FROM
	(
	SELECT
		*,
		CASE
			WHEN max(salary) OVER(PARTITION BY company_id) < 1000 THEN 0
			WHEN max(salary) OVER(PARTITION BY company_id) BETWEEN 1000 AND 10000 THEN 0.24
			ELSE 0.49
		END AS tax
	FROM
		Salaries ) x;
