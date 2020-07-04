SELECT IFNULL(
    (SELECT DISTINCT salary FROM Employee 
     ORDER BY salary 
     LIMIT 1 OFFSET 1), NULL) AS SecondHighestSalary
