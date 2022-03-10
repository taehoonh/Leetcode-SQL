# Write your MySQL query statement below
select distinct title
from
(
  select title
  from Content c
  left join TVProgram t
  on c.content_id = t.content_id
  where Kids_content = 'Y' and content_type = 'Movies'
  and date_format(program_date, '%Y-%m') = '2020-06'
) x;