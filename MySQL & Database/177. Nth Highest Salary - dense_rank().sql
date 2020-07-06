#The DENSE_RANK() is a window function that assigns a rank to each row within a partition of a result set. Unlike the RANK() function, the DENSE_RANK() function returns consecutive rank values. Rows in each partition receive the same ranks if they have the same values.

#The syntax of the DENSE_RANK() function is as follows:

#DENSE_RANK() OVER (
#    [PARTITION BY partition_expression, ... ]
#    ORDER BY sort_expression [ASC | DESC], ...
# )
# The DENSE_RANK() function is applied to the rows of each partition defined by the PARTITION BY clause, in a specified order, defined by ORDER BY clause. It resets the rank when the partition boundary is crossed.

# Write a SQL query to get the nth highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
# For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.

+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+


CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select salary from(
          select distinct salary, dense_rank() over (order by salary desc) as rankn
          from employee) a
      where a.rankn = N);
END
