Q:
Select all employee's name and bonus whose bonus is < 1000.

Key: left join/is null

1. since table Employee has the all employee's name, so left join table Bonus - select e.name, b.bonus from Employee e left join Bonus b
2. and empId is the common key - on e.empId = b.empId
3.  bonus is < 1000 can be 1. a number < 1000, or null - where b.bonus < 1000 or b.bonus is null;

A:
select e.name, b.bonus from Employee e left join Bonus b
on e.empId = b.empId
where b.bonus < 1000 or b.bonus is null;


Table:Employee

+-------+--------+-----------+--------+
| empId |  name  | supervisor| salary |
+-------+--------+-----------+--------+
|   1   | John   |  3        | 1000   |
|   2   | Dan    |  3        | 2000   |
|   3   | Brad   |  null     | 4000   |
|   4   | Thomas |  3        | 4000   |
+-------+--------+-----------+--------+
empId is the primary key column for this table.
Table: Bonus

+-------+-------+
| empId | bonus |
+-------+-------+
| 2     | 500   |
| 4     | 2000  |
+-------+-------+
empId is the primary key column for this table.
Example ouput:

+-------+-------+
| name  | bonus |
+-------+-------+
| John  | null  |
| Dan   | 500   |
| Brad  | null  |
+-------+-------+
