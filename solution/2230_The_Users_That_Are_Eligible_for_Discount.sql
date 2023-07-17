# Write your MySQL query statement below
CREATE OR REPLACE PROCEDURE getUserIDs(startDate DATE, endDate DATE, minAmount INT)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT DISTINCT user_id
    FROM purchases
    WHERE time_stamp BETWEEN startDate AND endDate
    AND amount >= minAmount
    ORDER BY user_id;
END;
$$;
