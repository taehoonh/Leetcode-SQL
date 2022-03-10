# Write your MySQL query statement below
select company_id, employee_id, employee_name, round(salary - salary*tax, 0) as salary
from
(
  select *,
  case when max(salary) over(partition by company_id) < 1000 then 0
       when max(salary) over(partition by company_id) between 1000
       and 10000 then 0.24
       else 0.49 end as tax
  from Salaries
) x 
