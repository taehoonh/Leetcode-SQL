# Write your MySQL query statement below
select user_id, max(diff) as biggest_window
from
(
    select user_id, 
       datediff(coalesce(lead(visit_date) over (partition by user_id order by visit_date), '2021-01-01'), visit_date) as diff
    from userVisits
) t
group by user_id
order by user_id