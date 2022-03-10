# Write your MySQL query statement below
select t.task_id, x.subtask_id
from Tasks t
join (
    select 1 as subtask_id union select 2 as subtask_id union select 3 as subtask_id union
    select 4 as subtask_id union select 5 as subtask_id union select 6 as subtask_id union
    select 10 as subtask_id union select 11 as subtask_id union select 12 as subtask_id union
    select 7 as subtask_id union select 8 as subtask_id union select 9 as subtask_id union
    select 13 as subtask_id union select 14 as subtask_id union select 15 as subtask_id union
    select 16 as subtask_id union select 17 as subtask_id union select 18 as subtask_id union
    select 19 as subtask_id union select 20 as subtask_id
) x
where x.subtask_id <= t.subtasks_count and (t.task_id, x.subtask_id) not in (
    select task_id, subtask_id from Executed
);