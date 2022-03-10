# Write your MySQL query statement below
select transaction_id from transactions 
where (date(day), amount) in
	(select date(day) as day, max(amount) as max_amt 
	from transactions 
	group by 1)
order by 1;