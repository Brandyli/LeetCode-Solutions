# 1) find the id and the name of active users 

# if distinct is needed?
# name is needed to be defined
# +----+----------+
# | id | name     |
# +----+----------+
select distinct a.id, 
from Logins a, Logins b
where a.id=b.id
group by a.id, a.login_date

# 2) name 
(select name from Accounts where id=a.id) name

# 3) what is active users? -- Active users are those who logged in to their accounts for 5 or more consecutive days.
,datediff(a.login_date, b.login_date) between 1 and 4
# ?? why dowe need 'having count(distinct b.login_date) = 4'?
having count(distinct b.login_date)=4;

A:
select distinct a.id, 
(select name from Accounts where id=a.id) as name
from Logins a, Logins b
where a.id=b.id 
and datediff(a.login_date,b.login_date) between 1 and 4
group by a.id,a.login_date 
having count(distinct b.login_date) = 4;


Select id, name from Accounts where id in 
(Select id from
(Select distinct id, login_date, dense_rank() over (Partition by id order by login_date ASC) as rnk from Logins) tmp
group by id, date_sub(login_date, INTERVAL rnk DAY)
having count(login_date)>4) 
order by id

Table Accounts:

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+
the id is the primary key for this table.
This table contains the account id and the user name of each account.
 

Table Logins:

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| login_date    | date    |
+---------------+---------+
There is no primary key for this table, it may contain duplicates.
This table contains the account id of the user who logged in and the login date. A user may log in multiple times in the day.
 
Q:
Write an SQL query to find the id and the name of active users.

Active users are those who logged in to their accounts for 5 or more consecutive days.

Return the result table ordered by the id.

The query result format is in the following example:

Accounts table:
+----+----------+
| id | name     |
+----+----------+
| 1  | Winston  |
| 7  | Jonathan |
+----+----------+

Logins table:
+----+------------+
| id | login_date |
+----+------------+
| 7  | 2020-05-30 |
| 1  | 2020-05-30 |
| 7  | 2020-05-31 |
| 7  | 2020-06-01 |
| 7  | 2020-06-02 |
| 7  | 2020-06-02 |
| 7  | 2020-06-03 |
| 1  | 2020-06-07 |
| 7  | 2020-06-10 |
+----+------------+

Result table:
+----+----------+
| id | name     |
+----+----------+
| 7  | Jonathan |
+----+----------+
User Winston with id = 1 logged in 2 times only in 2 different days, so, Winston is not an active user.
User Jonathan with id = 7 logged in 7 times in 6 different days, five of them were consecutive days, so, Jonathan is an active user.
