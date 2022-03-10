# Write your MySQL query statement below
SELECT Country.name country
FROM Calls c, Person p, Country 
WHERE (c.caller_id = p.id or c.callee_id = p.id) and 
	Country.country_code = SUBSTR(p.phone_number,1,3)
GROUP BY Country.name
HAVING avg(duration) > (SELECT AVG(duration) from Calls);