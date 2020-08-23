Key: Use subquery to select all the numbers appearing just one time.

A:
select max(num) as num from 
(select num from my_numbers
group by num
having count(num)=1) as t;

Q:
Table my_numbers contains many numbers in column num including duplicated ones.
Can you write a SQL query to find the biggest number, which only appears once.

+---+
|num|
+---+
| 8 |
| 8 |
| 3 |
| 3 |
| 1 |
| 4 |
| 5 |
| 6 | 
For the sample data above, your query should return the following result:
+---+
|num|
+---+
| 6 |

