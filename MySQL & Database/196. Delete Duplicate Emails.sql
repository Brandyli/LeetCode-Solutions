Q: 
Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.

** Key --> keep distinct emails that has its smallest ID --> delete emails that has larger ID

- duplicate email --> two tables P1, P2 ```from Person P1, Person P2```
- how to delete? ``Delete Table A.features from Table A, Table B``` * we can not attache A.*, which works well
- how to find emails that has larger ID? ```P1.Email = P2.Email And P1.Id > P2.Id``


+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id is the primary key column for this table.
For example, after running your query, the above Person table should have the following rows:

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Note:

Your output is the whole Person table after executing your sql. Use delete statement.

A:
Delete P1.* from Person P1, Person P2
Where P1.Email = P2.Email And P1.Id > P2.Id;
