#### Numbering rows

SELECT
  *,
  -- Assign numbers to each row
  ROW_NUMBER() OVER() Row_N
FROM Summer_Medals
ORDER BY Row_N ASC;

#### Numbering Olympic games in ascending order
What if you want to easily query the table to see in which year the 13th Summer Olympics were held?

SELECT
  Year,

  -- Assign numbers to each year
  ROW_NUMBER() OVER() Row_N
FROM (
  SELECT DISTINCT Year
  FROM Summer_Medals
  ORDER BY Year ASC
) AS Years
ORDER BY Year ASC;
