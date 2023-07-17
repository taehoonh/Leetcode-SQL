SELECT
	q.id,
	q.year,
	ifnull(n.npv, 0) AS npv
FROM
	queries AS q
LEFT JOIN npv AS n ON
	(q.id,
	q.year) = (n.id,
	n.year);
