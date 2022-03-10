# Write your MySQL query statement below
with friendtable as(
    select user1_id as userid, user2_id as friend
    from friendship
    union
    select user2_id as userid, user1_id as friend
    from friendship
)

select f1.userid as user1_id, f2.userid as user2_id, count(f1.friend) as common_friend
from friendtable as f1
join friendtable as f2
on f1.friend=f2.friend
where f1.userid<f2.userid 
    and (f1.userid, f2.userid) in(
        select user1_id, user2_id
        from friendship
)
group by f1.userid, f2.userid
having count(f2.friend)>=3;