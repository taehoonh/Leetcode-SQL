# Write your MySQL query statement below
select distinct c1.user_id
from Confirmations c1
join Confirmations c2
on c1.user_id = c2.user_id and timestampdiff(second, c2.time_stamp, c1.time_stamp) <= 86400
and timestampdiff(second, c2.time_stamp, c1.time_stamp) > 0;