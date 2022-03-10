# Write your MySQL query statement below
select SchoolA.student_name as member_A, SchoolB.student_name as member_B, SchoolC.student_name as member_C
from SchoolA, SchoolB, SchoolC
where (SchoolA.student_id != SchoolB.student_id and SchoolA.student_id != SchoolC.student_id and 
      SchoolB.student_id != SchoolC.student_id and SchoolA.student_name != SchoolB.student_name and
      SchoolA.student_name != SchoolC.student_name and SchoolB.student_name != SchoolC.student_name);