# Write your MySQL query statement below
select date(sale_date) as sale_date,
       sum(case when fruit = 'apples' then sold_num
                when fruit = 'oranges' then -sold_num end) as diff
from Sales
group by 1
order by 1
;