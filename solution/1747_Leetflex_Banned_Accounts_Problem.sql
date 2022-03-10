# Write your MySQL query statement below
select distinct l1.account_id
from LogInfo l1 
join LogInfo l2
on l1.account_id = l2.account_id and l1.ip_address != l2.ip_address
where not (l1.login > l2.logout or l1.logout < l2.login);