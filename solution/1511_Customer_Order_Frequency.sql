# Write your MySQL query statement below
select o.customer_id, name
from
Orders o
join
Product p
on o.product_id = p.product_id
join
Customers c
on o.customer_id = c.customer_id
group by 1, 2
having sum(case when date_format(order_date, '%Y-%m')='2020-06'
then price*quantity end) >= 100
and 
sum(case when date_format(order_date, '%Y-%m')='2020-07'
then price*quantity end) >= 100
;