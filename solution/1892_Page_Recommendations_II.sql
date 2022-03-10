# Write your MySQL query statement below
select user1_id as user_id,page_id, count(user_id) as friends_likes
from
(
    select a.user1_id, b.user_id, b.page_id 
    from Friendship as a
    join Likes as b
    on a.user2_id=b.user_id
    union 
    select a.user2_id, b.user_id, b.page_id
    from Friendship as a
    join Likes as b
    on a.user1_id=b.user_id
) a
where concat(user1_id, ",", page_id) not in
	(select concat(user_id, ",", page_id) from Likes)
group by user1_id, page_id;