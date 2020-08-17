Q: Write a SQL query to get the "second highest salary" from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the query should return 200 as the second highest salary. 

** If there is no second highest salary, then "the query should return null".

Thoughts:
The result should be divided to 2 steps
1. has 2nd highest salary
2. NO 2nd highest salary, return null --> subquery: ifnull() if the expression is null, return alternative value --"NULL", otherwise it returns 2nd highest salary.

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+

A:
SELECT IFNULL(
    (SELECT DISTINCT salary FROM Employee 
     ORDER BY salary DESC
     LIMIT 1 OFFSET 1), NULL) AS SecondHighestSalary
