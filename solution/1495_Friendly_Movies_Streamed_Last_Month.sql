# Write your MySQL query statement below
SELECT
	DISTINCT title
FROM
	(
	SELECT
		title
	FROM
		CONTENT c
	LEFT JOIN TVProgram t ON
		c.content_id = t.content_id
	WHERE
		Kids_content = 'Y'
		AND content_type = 'Movies'
		AND date_format(program_date,
		'%Y-%m') = '2020-06' ) x;
