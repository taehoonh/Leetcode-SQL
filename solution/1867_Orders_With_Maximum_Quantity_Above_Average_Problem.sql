# Write your MySQL query statement below
select order_id
from OrdersDetails
group by order_id
having max(quantity) > all (
    select (sum(quantity) /
            count(distinct product_id)) as avg_quant_order
    from OrdersDetails
    group by order_id
)
order by order_id asc;