SQL Schema

The Employee table holds all employees including their “managers”. 
Every employee has an Id, and there is also a column for the manager Id.

+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+
For the above table, Joe is the only employee who earns more than his manager.

Q：
Given the Employee table, write a SQL query that finds out employees who earn more than their managers. 
--> employees' salary > managers' salary
-> managers are employees at the same time, How to identify who are employees'managers?--> if employees'ID=employees'ManagerID
-> So we need 2 tables, one for employees, another for managers

+----------+
| Employee |
+----------+
| Joe      |
+----------+

S：
SELECT a.Name AS 'Employee' FROM Employee a JOIN Employee b --> directly join since two tables are same
ON a.ManagerId = b.Id 
AND a.Salary > b.Salary;
