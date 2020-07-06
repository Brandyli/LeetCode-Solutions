SELECT
  *,
  -- Assign numbers to each row
  row_number() over()AS Row_N
FROM Summer_Medals
ORDER BY Row_N ASC;
