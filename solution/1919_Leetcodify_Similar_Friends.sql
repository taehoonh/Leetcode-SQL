# Write your MySQL query statement below
select distinct a.user_id as user1_id,
                b.user_id as user2_id
from Listens a
    inner join Listens b
    on a.user_id < b.user_id
        and a.song_id = b.song_id
        and a.day = b.day
        and (a.user_id, b.user_id) in (select * from Friendship)
group by a.user_id, b.user_id, a.day
having count(distinct a.song_id) >= 3;