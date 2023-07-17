# Write your MySQL query statement below
SELECT a.driver_id, COALESCE(COUNT(DISTINCT b.ride_id), 0) AS cnt
FROM Rides a
LEFT JOIN Rides b ON a.driver_id = b.passenger_id
GROUP BY a.driver_id;
