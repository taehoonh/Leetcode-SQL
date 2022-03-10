# Write your MySQL query statement below
SELECT name, 
       Sum(rest)     rest, 
       Sum(paid)     paid, 
       Sum(canceled) canceled, 
       Sum(refunded) refunded 
FROM   product p 
       INNER JOIN invoice i 
               ON p.product_id = i.product_id 
GROUP  BY name 
ORDER  BY name;