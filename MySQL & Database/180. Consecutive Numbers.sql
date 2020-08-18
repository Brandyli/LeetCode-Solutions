SQL Schema
Q: 
Write a SQL query to find all numbers that appear "at least three times consecutively".

+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+
For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+

Key:
** select any Num column from the above table to get the target data
** DISTINCT needs to be added, because it will display a duplicated number if one number appears more than 3 times consecutively.
- beacuse we need to find all numbers tha appear "at least 3 times consecutively", 3 seperate tables are needed to query
- ids in 3 tables should be same

A:
select distinct l1.num as ConsecutiveNums
from logs l1, logs l2, logs l3
where l1.id = l2.id - 1
and l2.id = l3.id -1
and l1.num = l2.num
and l2.num = l3.num;
