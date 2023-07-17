# Write your MySQL query statement below
SELECT user_id, gender
FROM genders
ORDER BY dense_rank() OVER (PARTITION BY gender ORDER BY user_id ASC), LENGTH(gender) DESC;
