# Write your MySQL query statement below
select t.customer_id, t.product_id, product_name
from
(
  select customer_id, product_id,
  dense_rank() over(partition by customer_id order by count(*) desc) 
  as prank
  from Orders
  join Products
  using(product_id)
  group by 1, 2
) t
join
Products p
on t.product_id = p.product_id
where prank = 1;