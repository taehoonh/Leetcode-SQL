# Write your MySQL query statement below
select user_id,
       concat(upper(left(name, 1)), lower(right(name, length(name) - 1))) as name
from Users
group by 1
order by 1;