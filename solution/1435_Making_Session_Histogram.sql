# Write your MySQL query statement below
select t2.bin, ifnull(count(t1.bin),0) total from
(
    select
        case when duration < 300 then '[0-5>'
            when duration < 600 then '[5-10>'
            when duration < 900 then '[10-15>'
            else '15 or more'
        end
        as bin        
    from Sessions
) t1
right join 
(
    select '[0-5>' as bin union
    select '[5-10>' as bin union
    select '[10-15>' as bin union
    select '15 or more' as bin
) t2
on t2.bin = t1.bin
group by t2.bin