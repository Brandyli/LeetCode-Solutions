Key:ifnull(sum(case when u.user_id = t.paid_by then -amount else amount end),0)+u.credit as credit,
case when ifnull(sum(case when u.user_id = t.paid_by then -amount else amount end),0)>= -u.credit then 'No' else 'Yes' end

Q:
# Write an SQL query to report.
# user_id
# user_name
# Return the result table in any order.
# check wheter they have breached their credit limit (If their current credit is less than 0).
# credit, current balance after performing transactions.  
# credit_limit_breached, check credit_limit ("Yes" or "No")

Logic:
1) Sketch
# +------------+------------+------------+-----------------------+
# | user_id    | user_name  | credit     | credit_limit_breached |
# +------------+------------+------------+-----------------------+

select u.user_id, u.user_name, 
from Users u left join Transactions t
on u.user_id=t.paid_by 
or u.user_id=t.paid_to
group by user_id;

# 2) credit, current balance after performing transactions.  
# Moustafa paid $400 on "2020-08-01" and received $200 on "2020-08-03", credit (100 -400 +200) = -$100
# Jonathan received $500 on "2020-08-02" and paid $200 on "2020-08-08", credit (200 +500 -200) = $500
# Winston received $400 on "2020-08-01" and paid $500 on "2020-08-03", credit (10000 +400 -500) = $9990
# Luis didn't received any transfer, credit = $800

# ifnull(condition,0)+u.credit
# sum()
# case when u.user_id=t.paid_by then -amount else amount end
ifnull(sum(case when u.user_id=t.paid_by then -amount else amount end),0)+u.credit as credit,

# 3) credit_limit_breached, check credit_limit ("Yes" or "No")
# ifnull(condition,0)>=-u.credit
# sum()
# case when u.user_id=t.paid_by then -amount else amount end
case when ifnull(sum(case when u.user_id = t.paid_by then -amount else amount end),0)>= -u.credit then 'No' else 'Yes' end
as credit_limit_breached

A:
select user_id, user_name,
ifnull(sum(case when u.user_id = t.paid_by then -amount else amount end),0)+u.credit as credit,
case when ifnull(sum(case when u.user_id = t.paid_by then -amount else amount end),0)>= -u.credit then 'No' else 'Yes' end
as credit_limit_breached
from Users u left join Transactions t
on u.user_id = t.paid_by
or u.user_id = t.paid_to
group by user_id

Table: Users

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| user_id      | int     |
| user_name    | varchar |
| credit       | int     |
+--------------+---------+
user_id is the primary key for this table.
Each row of this table contains the current credit information for each user.
 

Table: Transactions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| trans_id      | int     |
| paid_by       | int     |
| paid_to       | int     |
| amount        | int     |
| transacted_on | date    |
+---------------+---------+
trans_id is the primary key for this table.
Each row of this table contains the information about the transaction in the bank.
User with id (paid_by) transfer money to user with id (paid_to).
 

Leetcode Bank (LCB) helps its coders in making virtual payments. Our bank records all transactions in the table Transaction, we want to find out the current balance of all users and check wheter they have breached their credit limit (If their current credit is less than 0).

Write an SQL query to report.

user_id
user_name
credit, current balance after performing transactions.  
credit_limit_breached, check credit_limit ("Yes" or "No")
Return the result table in any order.

The query result format is in the following example.

 

Users table:
+------------+--------------+-------------+
| user_id    | user_name    | credit      |
+------------+--------------+-------------+
| 1          | Moustafa     | 100         |
| 2          | Jonathan     | 200         |
| 3          | Winston      | 10000       |
| 4          | Luis         | 800         | 
+------------+--------------+-------------+

Transactions table:
+------------+------------+------------+----------+---------------+
| trans_id   | paid_by    | paid_to    | amount   | transacted_on |
+------------+------------+------------+----------+---------------+
| 1          | 1          | 3          | 400      | 2020-08-01    |
| 2          | 3          | 2          | 500      | 2020-08-02    |
| 3          | 2          | 1          | 200      | 2020-08-03    |
+------------+------------+------------+----------+---------------+

Result table:
+------------+------------+------------+-----------------------+
| user_id    | user_name  | credit     | credit_limit_breached |
+------------+------------+------------+-----------------------+
| 1          | Moustafa   | -100       | Yes                   | 
| 2          | Jonathan   | 500        | No                    |
| 3          | Winston    | 9900       | No                    |
| 4          | Luis       | 800        | No                    |
+------------+------------+------------+-----------------------+
Moustafa paid $400 on "2020-08-01" and received $200 on "2020-08-03", credit (100 -400 +200) = -$100
Jonathan received $500 on "2020-08-02" and paid $200 on "2020-08-08", credit (200 +500 -200) = $500
Winston received $400 on "2020-08-01" and paid $500 on "2020-08-03", credit (10000 +400 -500) = $9990
Luis didn't received any transfer, credit = $800
