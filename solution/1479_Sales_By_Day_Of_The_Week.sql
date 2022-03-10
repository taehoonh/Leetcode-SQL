# Write your MySQL query statement below
select i.item_category as Category,
       coalesce(sum(case when dayofweek(o.order_date) = 2 then o.quantity end), 0) as Monday,
coalesce(sum(case when dayofweek(o.order_date) = 3 then o.quantity end), 0) as Tuesday,
coalesce(sum(case when dayofweek(o.order_date) = 4 then o.quantity end), 0) as Wednesday,
coalesce(sum(case when dayofweek(o.order_date) = 5 then o.quantity end), 0) as Thursday,
coalesce(sum(case when dayofweek(o.order_date) = 6 then o.quantity end), 0) as Friday,
coalesce(sum(case when dayofweek(o.order_date) = 7 then o.quantity end), 0) as Saturday,
coalesce(sum(case when dayofweek(o.order_date) = 1 then o.quantity end), 0) as Sunday
from Items i
left join
Orders o
on i.item_id = o.item_id
group by 1
order by 1
;