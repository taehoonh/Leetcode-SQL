# Write your MySQL query statement below
select customer_name, customer_id, order_id, order_date
from
(
  select name as customer_name, o.customer_id, order_id,order_date,
         dense_rank() over(partition by customer_id order by order_date desc) as rnk
from Orders o
left join
Customers c
using(customer_id)
) t
where rnk = 1 or rnk = 2 or rnk = 3
order by 1, 2, 4 desc;