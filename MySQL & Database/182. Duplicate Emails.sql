SQL Schema

Q:
Write a SQL query to find "all duplicate" emails in a table named Person.

+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
For example, your query should return the following for the above table:

+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Note: All emails are in lowercase.

Key: use "having" when "count"
use "having" since we need to "count" the email number and select duplicates that the email number is larger than 1


A:
select email from Person 
group by email 
having count(email) > 1;
