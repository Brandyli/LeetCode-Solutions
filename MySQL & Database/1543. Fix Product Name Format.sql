Key:
lower(trim(product_name))
date_format(sale_date,'%Y-%m') 
count(sale_id) total

Logic:
# 1) product_name in lowercase without leading or trailing white spaces.
select lower(trim(product_name)) product_name, 

# 2) sale_date in the format ('YYYY-MM')
date_format(sale_date,'%Y-%m') sale_date, 

# 3) total the number of times the product was sold in this month.
count(sale_id) total

# 4) sketch the struture
from Sales
group by 1,2
# 5) Return the result table ordered by product_name in ascending order, in case of a tie order it by sale_date in ascending order.
order by 1,2;

A:
select lower(trim(product_name)) product_name, 
date_format(sale_date,'%Y-%m') sale_date, 
count(sale_id) total
from Sales
group by 1, 2
order by 1, 2;

Table: Sales

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| sale_id      | int     |
| product_name | varchar |
| sale_date    | date    |
+--------------+---------+
sale_id is the primary key for this table.
Each row of this table contains the product name and the date it was sold.

Since table Sales was filled manually in the year 2000, product_name may contain leading and/or trailing white spaces, also they are case-insensitive.

Q:
Write an SQL query to report

product_name in lowercase without leading or trailing white spaces.
sale_date in the format ('YYYY-MM') 
total the number of times the product was sold in this month.
Return the result table ordered by product_name in ascending order, in case of a tie order it by sale_date in ascending order.

The query result format is in the following example.

 

Sales
+------------+------------------+--------------+
| sale_id    | product_name     | sale_date    |
+------------+------------------+--------------+
| 1          |      LCPHONE     | 2000-01-16   |
| 2          |    LCPhone       | 2000-01-17   |
| 3          |     LcPhOnE      | 2000-02-18   |
| 4          |      LCKeyCHAiN  | 2000-02-19   |
| 5          |   LCKeyChain     | 2000-02-28   |
| 6          | Matryoshka       | 2000-03-31   | 
+------------+------------------+--------------+

Result table:
+--------------+--------------+----------+
| product_name | sale_date    | total    |
+--------------+--------------+----------+
| lcphone      | 2000-01      | 2        |
| lckeychain   | 2000-02      | 2        | 
| lcphone      | 2000-02      | 1        | 
| matryoshka   | 2000-03      | 1        | 
+--------------+--------------+----------+

In January, 2 LcPhones were sold, please note that the product names are not case sensitive and may contain spaces.
In Februery, 2 LCKeychains and 1 LCPhone were sold.
In March, 1 matryoshka was sold.
