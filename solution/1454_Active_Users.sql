# Write your MySQL query statement below
-- create a cte to find the day which is 5 days from the login_date
with active as
(
  select id, login_date,
         lag(login_date, 4) over(partition by id order by login_date) as lag4
from
    (
      select distinct * from Logins
    ) t
)
select a.id, a.name
from Accounts a
join active a1
on a.id = a1.id
and datediff(login_date, lag4) = 4
group by 1
order by 1;