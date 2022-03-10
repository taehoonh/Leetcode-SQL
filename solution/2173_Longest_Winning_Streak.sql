# Write your MySQL query statement below
with t1 as (
select a.*, row_number() over(partition by player_id order by match_day) - row_number() over(partition by player_id, result order by match_day) as rk
from Matches a
)

Select m.player_id, IFNULL(max(streak), 0) longest_streak
From (Select player_id, count(rk) streak
        From t1
        where result = 'Win'
        group by player_id, rk) tmp
right join Matches m on tmp.player_id=m.player_id
group by m.player_id;
