Q:
Given the Employee table, write a SQL query that finds out managers with at least 5 direct report. For the above table, your SQL query should return:

1. with at least 5 direct report - having count(ManagerId) >= 5)
2. managers with at least 5 direct report -
(select managerId from Employee
group by managerId
having count(managerId)>=5) 
3. find accordingly manager's name by connecting e1.Id and e2.ManagerId - on e1.Id = e2.ManagerId

**Key: k1 in (select k2 from table group by k2 having count(k2)>=5)

A:
select name from employee 
where id in 
(select managerId from Employee
group by managerId
having count(managerId)>=5) 

SQL Schema
The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.

+------+----------+-----------+----------+
|Id    |Name 	  |Department |ManagerId |
+------+----------+-----------+----------+
|101   |John 	  |A 	      |null      |
|102   |Dan 	  |A 	      |101       |
|103   |James 	  |A 	      |101       |
|104   |Amy 	  |A 	      |101       |
|105   |Anne 	  |A 	      |101       |
|106   |Ron 	  |B 	      |101       |
+------+----------+-----------+----------+

+-------+
| Name  |
+-------+
| John  |
+-------+
Note:
No one would report to himself.
