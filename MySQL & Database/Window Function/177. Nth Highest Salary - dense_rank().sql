Key: DENSE_RANK()

Difference: DENSE_RANK() & RANK()
RANK: This gives you the ranking within your ordered partition. 
Ties are assigned the same rank, with the next ranking(s) skipped. 
Therefore, if you have 3 items at rank 2, the next rank listed will be ranked 5.

DENSE_RANK: This gives you the ranking within your ordered partition, but the ranks are consecutive in it. 
Also, no ranks are skipped if there are ranks with multiple items.

Definitions:
RANK() is a window function -- to calculate a rank for each row within a partition of a result set.

RANK() OVER (
    [PARTITION BY partition_expression, ... ]
    ORDER BY sort_expression [ASC | DESC], ...
)


The DENSE_RANK() is a window function & has 2 features
- Assigns a rank to each row within a partition of a result set 
- Returns "consecutive rank values"
- "Rows in each partition" receive the "same ranks" if they have the "same values"

Syntax of DENSE_RANK():
2 features:
DENSE_RANK() involves two:
1. The rows of each partition - PARTITION BY
2. A specified order - ORDER BY
3. Rank is reset when the "partition boundary is crossed".

#DENSE_RANK() OVER (
#    [PARTITION BY partition_expression, ... ]
#    ORDER BY sort_expression [ASC | DESC], ...
# )

Q: Write a SQL query to get the --nth highest salary-- from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
# For example, given the above Employee table, the nth highest salary where n = 2 is 200. 

** If there is no nth highest salary, then the query should return null.

+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      
  );
END

Key: 
- define a function using sub-query
- getNthHighestSalary(N INT): N = rank, INT = salary
- RETURNS INT: the goal - is to get the accordingly salary

- in dense_rank(), we need to define the rankn order using salary desc
- Is a newly defined table, so a.rankn = N???


A:
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select salary from(
          select distinct salary, dense_rank() over (order by salary desc) as rankn
          from employee) a
      where a.rankn = N);
END
