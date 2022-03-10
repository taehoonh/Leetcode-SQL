# Write your MySQL query statement below
select problem_id
from problems
where likes/cast((likes+dislikes) as float) < 0.6
order by problem_id;