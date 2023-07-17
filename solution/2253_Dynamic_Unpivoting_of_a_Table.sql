# Write your MySQL query statement below
CREATE OR REPLACE PROCEDURE UnpivotProducts()
LANGUAGE plpgsql
AS $$
DECLARE
  macro TEXT;
  sql_query TEXT;
BEGIN
  -- Override array_agg output limit which has a default limit of 1024
  SET SESSION array_agg_max_len = 1000000;

  SELECT STRING_AGG(
      format(
          'SELECT product_id, ''%s'' AS store, %s AS price FROM products WHERE %s IS NOT NULL',
          column_name, column_name, column_name
      ), ' UNION '
  )
  INTO macro
  FROM information_schema.columns
  WHERE table_schema = 'public' AND table_name = 'products' AND column_name != 'product_id';

  -- Execute final query
  EXECUTE macro;
END;
$$;
