Q: Write an SQL query to find all dates' id with higher temperature compared to its previous dates (yesterday).

*Konwledge Check
DATEDIFF(interval, date1, date2)

*Example
SELECT DATEDIFF(month, '2017/08/25', '2011/08/25') AS DateDiff;

**Key--comparison: create two tables
select w1.id as 'Id' from weather w1 join weather w2 

compared to its previous dates (yesterday)
- on datediff(w1.recorddate, w2.recorddate) = 1


find all dates' id with higher temperature
-and w1.temperature > w2.temperature

SQL Schema
Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the primary key for this table.
This table contains information about the temperature in a certain day.
 

Return the result table in any order.

The query result format is in the following example:

Weather
+----+------------+-------------+
| id | recordDate | Temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+

Result table:
+----+
| id |
+----+
| 2  |
| 4  |
+----+
In 2015-01-02, temperature was higher than the previous day (10 -> 25).
In 2015-01-04, temperature was higher than the previous day (30 -> 20).

select w1.id as 'Id' from weather w1 join weather w2 
on datediff(w1.recorddate, w2.recorddate) = 1
and w1.temperature > w2.temperature;
