1) Since the indirect relation between managers will <= 3 managers as the company is small.
# So we need 3 tables with maximum 3 managers
select e1.employee_id
from Employees e1, Employees e2, Employees e3

2)Find employee_id of all employees that directly or indirectly report their work to the head of the company.
# I assume ??
where e1.manager_id=e2.employee_id
and e2.manager_id=e3.employee_id

3)The head of the company is the employee with employee_id = 1. 
# I assume no head manager is in e1 table but in e3

and e3.manager_id=1
and e1.employee_id!=1;

Key:The START WITH clause is optional and specifies the rows athat are the root(s) of the hierarchical query. 
If you omit this clause, then Oracle uses all rows in the table as root rows. The START WITH condition can contain a subquery, 
but it cannot contain a scalar subquery expression.

The CONNECT BY clause specifies the relationship between parent rows and child rows of the hierarchy. 
The connect_by_condition can be any condition, however, it must use the PRIOR operator to refer to the parent row.

Method 2
select employee_id
from Employees
where employee_id != 1
start with employee_id = 1
connect by NOCYCLE prior employee_id = manager_id;


Table: Employees

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| employee_id   | int     |
| employee_name | varchar |
| manager_id    | int     |
+---------------+---------+
employee_id is the primary key for this table.
Each row of this table indicates that the employee with ID employee_id and name employee_name reports his work to his/her direct manager with manager_id
The head of the company is the employee with employee_id = 1.
 
Q:
Write an SQL query to find employee_id of all employees that directly or indirectly report their work to the head of the company.

The indirect relation between managers will not exceed 3 managers as the company is small.

Return result table in any order without duplicates.

The query result format is in the following example:

Employees table:
+-------------+---------------+------------+
| employee_id | employee_name | manager_id |
+-------------+---------------+------------+
| 1           | Boss          | 1          |
| 3           | Alice         | 3          |
| 2           | Bob           | 1          |
| 4           | Daniel        | 2          |
| 7           | Luis          | 4          |
| 8           | Jhon          | 3          |
| 9           | Angela        | 8          |
| 77          | Robert        | 1          |
+-------------+---------------+------------+

Result table:
+-------------+
| employee_id |
+-------------+
| 2           |
| 77          |
| 4           |
| 7           |
+-------------+

The head of the company is the employee with employee_id 1.
The employees with employee_id 2 and 77 report their work directly to the head of the company.
The employee with employee_id 4 report his work indirectly to the head of the company 4 --> 2 --> 1. 
The employee with employee_id 7 report his work indirectly to the head of the company 7 --> 4 --> 2 --> 1.
The employees with employee_id 3, 8 and 9 don't report their work to head of company directly or indirectly. 
