# Write your MySQL query statement below
select from_id as person1,to_id as person2,
    count(duration) as call_count, sum(duration) as total_duration
from (select * 
      from Calls 
      
      union all
      
      select to_id, from_id, duration 
      from Calls) t1
where from_id < to_id
group by person1, person2