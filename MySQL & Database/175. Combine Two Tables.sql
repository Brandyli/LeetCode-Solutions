SQL Schema
Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| PersonId    | int     | --> common key
| FirstName   | varchar | --> required info
| LastName    | varchar | --> required info
+-------------+---------+
PersonId is the primary key column for this table.
Table: Address

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| AddressId   | int     | --> regardless if there is an address for each of those people --> In other words, it's fine for a person doesn't have "AddressId"
| PersonId    | int     | --> common key
| City        | varchar | --> required info
| State       | varchar | --> required info
+-------------+---------+
AddressId is the primary key column for this table.
 

Write a SQL query for a report that provides the following information for each person in the Person table, 
regardless if there is an address for each of those people:

```FirstName, LastName, City, State```

---Brandy Knowledge Check--- LEFT OUTER JOIN or RIGHT OUTER JOIN
** If you are joining two tables and want the result set to "include unmatched rows from only one table", 
** use a LEFT OUTER JOIN clause or a RIGHT OUTER JOIN clause.

select FirstName, LastName, City, State from Person P 
left join Address A 
on P.PersonId = A.PersonId;
