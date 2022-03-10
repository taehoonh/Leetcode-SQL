# Write your MySQL query statement below
select q.id, q.year, ifnull(n.npv,0) as npv
from queries as q
left join npv as n
on (q.id, q.year) = (n.id, n.year);