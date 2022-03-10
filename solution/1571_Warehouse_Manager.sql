# Write your MySQL query statement below
select name as warehouse_name, sum(units * vol) as volume
from Warehouse w
join (select product_id, Width*Length*Height as vol
     from Products) p
on w.product_id = p.product_id
group by name;