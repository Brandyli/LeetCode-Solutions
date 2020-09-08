key: UNION


# Write your MySQL query statement below
# +--------------+--------------+
# | bin          | total        |
# +--------------+--------------+

# Target: how long a user visits your application. 
# Create bins of "[0-5>", "[5-10>", "[10-15>" and "15 minutes or more" and count the number of sessions on it.

# 1) Create 4 time periods alias bins -- "[0-5>", "[5-10>", "[10-15>" and "15 minutes or more"
select '[0-5>' as bin, 
select '[5-10>' as bin, 
select '[10-15>' as bin, 
select '15 or more' as bin, 

# 2) count the number of sessions on it
sum(duration/60<5) as total from Sessions
sum(duration/60>=5 and duration/60<10) as total from Sessions
sum(duration/60>=10 and duration/60<15) as total from Sessions
sum(duration/60>=15) as total from Sessions

# 3) UNION bins together 
# Each SELECT statement within UNION must have 'the same number of columns'
# The columns must also have 'similar data types'
# The columns in each SELECT statement must also be in 'the same order'
# use 3 unions to union four select clauses

select '[0-5>' as bin, sum(duration/60<5) as total from Sessions
union
select '[5-10>' as bin, sum(duration/60>=5 and duration/60<10) as total from Sessions
union
select '[10-15>' as bin, sum(duration/60>=10 and duration/60<15) as total from Sessions
union
select '15 or more' as bin, sum(duration/60>=15) as total from Sessions


A:
select '[0-5>' as bin, sum(duration/60<5) as total from Sessions
union
select '[5-10>' as bin, sum(duration/60>=5 and duration/60<10) as total from Sessions
union
select '[10-15>' as bin, sum(duration/60>=10 and duration/60<15) as total from Sessions
union
select '15 or more' as bin, sum(duration/60>=15) as total from Sessions

Table: Sessions

+---------------------+---------+
| Column Name         | Type    |
+---------------------+---------+
| session_id          | int     |
| duration            | int     |
+---------------------+---------+
session_id is the primary key for this table.
duration is the time in seconds that a user has visited the application.
 

You want to know how long a user visits your application. You decided to create bins of "[0-5>", "[5-10>", "[10-15>" and "15 minutes or more" and count the number of sessions on it.

Q:
Write an SQL query to report the (bin, total) in any order.

The query result format is in the following example.

Sessions table:
+-------------+---------------+
| session_id  | duration      |
+-------------+---------------+
| 1           | 30            |
| 2           | 199           |
| 3           | 299           |
| 4           | 580           |
| 5           | 1000          |
+-------------+---------------+

Result table:
+--------------+--------------+
| bin          | total        |
+--------------+--------------+
| [0-5>        | 3            |
| [5-10>       | 1            |
| [10-15>      | 0            |
| 15 or more   | 1            |
+--------------+--------------+

For session_id 1, 2 and 3 have a duration greater or equal than 0 minutes and less than 5 minutes.
For session_id 4 has a duration greater or equal than 5 minutes and less than 10 minutes.
There are no session with a duration greater or equial than 10 minutes and less than 15 minutes.
For session_id 5 has a duration greater or equal than 15 minutes.
