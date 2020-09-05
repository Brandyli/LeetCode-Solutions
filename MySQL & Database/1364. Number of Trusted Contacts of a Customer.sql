

Q: find the following for each invoice_id:
customer_name: The name of the customer the invoice is related to.
price: The price of the invoice.

contacts_cnt: The number of contacts related to the customer.
trusted_contacts_cnt: The number of contacts related to the customer and at the same time they are customers to the shop. 
(i.e His/Her email exists in the Customers table.)

Logic:
# 1) columns without calculations - invoice_id, customer_name, price
# find the following for each invoice_id:
# customer_name: The name of the customer the invoice is related to.
# price: The price of the invoice.

select i.invoice_id, c.customer_name, i.price
from Invoices i join Customers c
on i.user_id=c.customer_id 

# 2) columns with calculations - contacts_cnt, trusted_contacts_cnt
# contacts_cnt: The number of contacts related to the customer. -- Why do we use Contacts.contact_email to count contacts_cnt? 
# Because it mentions the number of contacts, which means it should be in Contacts table?
# trusted_contacts_cnt: The number of contacts related to the customer and at the same time they are customers to the shop. 
# (i.e His/Her email exists in the Customers table.)
count(cont.contact_email) as contacts_cnt, 
sum(if(cont.contact_email in (select distinct email from Customers),1,0)) as trusted_contacts_cnt

# 3) the joined two tables of Invoices and Customers
left join Contacts cont
on c.customer_id=cont.user_id

# 4) for each invoice_id
group by i.invoice_id
order by i.invoice_id;


A:
select i.invoice_id, c.customer_name, i.price, count(cont.contact_email) as contacts_cnt, 
sum(if(cont.contact_email in (select distinct email from Customers),1,0)) as trusted_contacts_cnt
from Invoices i join Customers c
on i.user_id=c.customer_id 
left join Contacts cont
on c.customer_id=cont.user_id
group by i.invoice_id
order by i.invoice_id;

Table: Customers

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| customer_name | varchar |
| email         | varchar |
+---------------+---------+
customer_id is the primary key for this table.
Each row of this table contains the name and the email of a customer of an online shop.
 

Table: Contacts

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | id      |
| contact_name  | varchar |
| contact_email | varchar |
+---------------+---------+
(user_id, contact_email) is the primary key for this table.
Each row of this table contains the name and email of one contact of customer with user_id.
This table contains information about people each customer trust. The contact may or may not exist in the Customers table.

 

Table: Invoices

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| invoice_id   | int     |
| price        | int     |
| user_id      | int     |
+--------------+---------+
invoice_id is the primary key for this table.
Each row of this table indicates that user_id has an invoice with invoice_id and a price.
 

Write an SQL query to find the following for each invoice_id:

customer_name: The name of the customer the invoice is related to.
price: The price of the invoice.
contacts_cnt: The number of contacts related to the customer.
trusted_contacts_cnt: The number of contacts related to the customer and at the same time they are customers to the shop. (i.e His/Her email exists in the Customers table.)
Order the result table by invoice_id.

The query result format is in the following example:

Customers table:
+-------------+---------------+--------------------+
| customer_id | customer_name | email              |
+-------------+---------------+--------------------+
| 1           | Alice         | alice@leetcode.com |
| 2           | Bob           | bob@leetcode.com   |
| 13          | John          | john@leetcode.com  |
| 6           | Alex          | alex@leetcode.com  |
+-------------+---------------+--------------------+
Contacts table:
+-------------+--------------+--------------------+
| user_id     | contact_name | contact_email      |
+-------------+--------------+--------------------+
| 1           | Bob          | bob@leetcode.com   |
| 1           | John         | john@leetcode.com  |
| 1           | Jal          | jal@leetcode.com   |
| 2           | Omar         | omar@leetcode.com  |
| 2           | Meir         | meir@leetcode.com  |
| 6           | Alice        | alice@leetcode.com |
+-------------+--------------+--------------------+
Invoices table:
+------------+-------+---------+
| invoice_id | price | user_id |
+------------+-------+---------+
| 77         | 100   | 1       |
| 88         | 200   | 1       |
| 99         | 300   | 2       |
| 66         | 400   | 2       |
| 55         | 500   | 13      |
| 44         | 60    | 6       |
+------------+-------+---------+
Result table:
+------------+---------------+-------+--------------+----------------------+
| invoice_id | customer_name | price | contacts_cnt | trusted_contacts_cnt |
+------------+---------------+-------+--------------+----------------------+
| 44         | Alex          | 60    | 1            | 1                    |
| 55         | John          | 500   | 0            | 0                    |
| 66         | Bob           | 400   | 2            | 0                    |
| 77         | Alice         | 100   | 3            | 2                    |
| 88         | Alice         | 200   | 3            | 2                    |
| 99         | Bob           | 300   | 2            | 0                    |
+------------+---------------+-------+--------------+----------------------+
Alice has three contacts, two of them are trusted contacts (Bob and John).
Bob has two contacts, none of them is a trusted contact.
Alex has one contact and it is a trusted contact (Alice).
John doesn't have any contacts.
