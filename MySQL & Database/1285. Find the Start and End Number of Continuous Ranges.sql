Key:
The ROW_NUMBER() is a window function that assigns a sequential integer to each row within the partition of a result set. 
The row number starts with 1 for the first row in each partition.

A:find the start and end number of continuous ranges in table Logs.

select min(log_id) as start_id, max(log_id) as end_id from
(select log_id, log_id-row_number() over (order by log_id) num 
from Logs) temp
group by num;


Table: Logs

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| log_id        | int     |
+---------------+---------+
id is the primary key for this table.
Each row of this table contains the ID in a log Table.


Since some IDs have been removed from Logs. 

Q:
Write an SQL query to find the start and end number of continuous ranges in table Logs.

Order the result table by start_id.

The query result format is in the following example:

Logs table:
+------------+
| log_id     |
+------------+
| 1          |
| 2          |
| 3          |
| 7          |
| 8          |
| 10         |
+------------+

Result table:
+------------+--------------+
| start_id   | end_id       |
+------------+--------------+
| 1          | 3            |
| 7          | 8            |
| 10         | 10           |
+------------+--------------+
The result table should contain all ranges in table Logs.
From 1 to 3 is contained in the table.
From 4 to 6 is missing in the table
From 7 to 8 is contained in the table.
Number 9 is missing in the table.
Number 10 is contained in the table.
