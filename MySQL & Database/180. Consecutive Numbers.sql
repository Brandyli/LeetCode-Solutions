SQL Schema
Write a SQL query to find all numbers that appear at least three times consecutively.

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

# Then we can select any Num column from the above table to get the target data. 
# However, we need to add a keyword DISTINCT because it will display a duplicated number if one number appears more than 3 times consecutively.

select distinct l1.num as ConsecutiveNums
from logs l1, logs l2, logs l3
where l1.id = l2.id - 1
and l2.id = l3.id -1
and l1.num = l2.num
and l2.num = l3.num;
