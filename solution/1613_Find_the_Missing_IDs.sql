# Write your MySQL query statement below
with recursive cte (ids) as
(
    select 1 as ids
    
    union all
    
    select ids + 1 
    from cte 
    where ids < (select max(customer_id) from Customers)
)
select ids
from cte
where ids not in (select customer_id from Customers)
order by ids