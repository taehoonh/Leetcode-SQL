# Write your MySQL query statement below
CREATE FUNCTION getUserIDs(startDate DATE, endDate DATE, minAmount INT) 
RETURNS INT AS $$
BEGIN
  RETURN (
      SELECT COUNT(DISTINCT user_id) AS usr_cnt
      FROM purchases
      WHERE time_stamp >= startDate AND time_stamp <= endDate
      AND amount >= minAmount
  );
END;
$$ LANGUAGE plpgsql;
