# Write your MySQL query statement below
select name, mail
from Users
where user_id in (
    select gold_medal as user_id
    from Contests
    group by gold_medal
    having count(gold_medal) >= 3
    union all
    (with contest_and_medal as (
        select contest_id, gold_medal as user_id
        from Contests
        union all
        select contest_id, silver_medal as user_id
        from Contests
        union all
        select contest_id, bronze_medal as user_id
        from Contests)
     select distinct c1.user_id
     from contest_and_medal c1,
          contest_and_medal c2,
          contest_and_medal c3
     where c1.contest_id - c2.contest_id = 1
       and c2.contest_id - c3.contest_id = 1
       and c1.user_id = c2.user_id
       and c1.user_id = c3.user_id));