SQL Schema
Suppose that a website contains two tables, the Customers table and the Orders table. 

Q:

Write a SQL query to find all customers who never order anything. 

--> customers in table "Customers" but not in table "Orders" 
Key:--> left anti join
```Select *
From TableA a Left JOIN TableB b
ON a.Key=b.Key
WHERE b.key is Null```


Table: Customers.

+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Table: Orders.

+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Using the above tables as example, return the following:

+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+

A:
select c.Name as 'Customers' from Customers c left join Orders o
on c.Id = o.CustomerId
where o.CustomerId is null;
