# Write your MySQL query statement below
select contest_id,
       round(users/num*100, 2) as percentage
from (
    select contest_id, count(user_id) as users,
    (select count(*) from Users) as num
    from Register
    group by contest_id
) a
group by 1
order by 2 desc, 1 asc;