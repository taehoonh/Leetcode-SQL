# Write your MySQL query statement below
select *, (case when credit < 0 then "Yes" else "No" end) as credit_limit_breached
from (select u.user_id, u.user_name, 
      credit + ifnull(sum((case when u.user_id=t.paid_by then -t.amount
                               else t.amount end)), 0) as credit
      from Users u
      left join Transactions t
      on u.user_id = t.paid_by or u.user_id = t.paid_to
      group by u.user_id, u.user_name) t;