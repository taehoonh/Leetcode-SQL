# Write your MySQL query statement below
CREATE OR REPLACE PROCEDURE PivotProducts()
LANGUAGE plpgsql
AS $$
DECLARE
  case_stmt TEXT;
  sql_query TEXT;
BEGIN
  -- Override array_agg output limit which has a default limit of 1024
  SET SESSION array_agg_max_len = 1000000;

  -- Store case statement for dynamically generated columns in a variable ie case_stmt
  SELECT STRING_AGG(DISTINCT format('SUM(CASE WHEN store = ''%s'' THEN price END) AS "%s"', store, store), ', ')
  INTO case_stmt
  FROM products;

  -- Insert above statement (case_stmt) in the following main query to frame final query 
  sql_query := format('SELECT product_id, %s FROM products GROUP BY product_id', case_stmt);

  -- Execute final query
  EXECUTE sql_query;
END;
$$;
