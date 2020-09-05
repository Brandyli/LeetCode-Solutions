
# Write your MySQL query statement below

1)
# +-------------+---------------+
# | customer_id | customer_name |
# +-------------+---------------+

select a.customer_id, a.customer_name
from customers a , orders b
where a.customer_id  = b.customer_id

# 2) Return the result table ordered by customer_id.
# Since only one answer, no need for 'order by'
# but still need 'group by' since a customer might have mulitiple orders 

group by a.customer_id

# 3) report the customer_id and customer_name of customers who bought products "A", "B" but did not buy the product "C" 
# since we want to recommend them buy this product.

having sum(b.product_name="A") >0 
and sum(b.product_name="B") > 0 
and sum(b.product_name="C")=0


A:
select c.customer_id, c.customer_name
from Customers c, Orders o
where c.customer_id=o.customer_id
group by c.customer_id
having sum(product_name='C')=0
and sum(product_name='A')>0
and sum(product_name='B')>0;

Table: Customers

+---------------------+---------+
| Column Name         | Type    |
+---------------------+---------+
| customer_id         | int     |
| customer_name       | varchar |
+---------------------+---------+
customer_id is the primary key for this table.
customer_name is the name of the customer.
 

Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| customer_id   | int     |
| product_name  | varchar |
+---------------+---------+
order_id is the primary key for this table.
customer_id is the id of the customer who bought the product "product_name".
 

Write an SQL query to report the customer_id and customer_name of customers who bought products "A", "B" but did not buy the product "C" since we want to recommend them buy this product.

Return the result table ordered by customer_id.

The query result format is in the following example.

 

Customers table:
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
| 1           | Daniel        |
| 2           | Diana         |
| 3           | Elizabeth     |
| 4           | Jhon          |
+-------------+---------------+

Orders table:
+------------+--------------+---------------+
| order_id   | customer_id  | product_name  |
+------------+--------------+---------------+
| 10         |     1        |     A         |
| 20         |     1        |     B         |
| 30         |     1        |     D         |
| 40         |     1        |     C         |
| 50         |     2        |     A         |
| 60         |     3        |     A         |
| 70         |     3        |     B         |
| 80         |     3        |     D         |
| 90         |     4        |     C         |
+------------+--------------+---------------+

Result table:
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
| 3           | Elizabeth     |
+-------------+---------------+
Only the customer_id with id 3 bought the product A and B but not the product C.
