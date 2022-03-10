# Write your MySQL query statement below
select *, dense_rank() over(order by salary) team_id
from Employees
where salary in 
	(select salary
	from Employees
	group by salary
	having count(*) > 1)
order by team_id, employee_id;
