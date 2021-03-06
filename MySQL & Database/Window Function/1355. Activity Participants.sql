Key: rank() over()

Q:
Write an SQL query to find the names of all the activities with neither maximum, nor minimum number of participants.

Return the result table in any order. Each activity in table Activities is performed by any person in the table Friends.


#find the names of all the activities with neither maximum, nor minimum number of participants.

#1)find the names of all the activities
select activity from 

#2) neither maximum, nor minimum number of participants
(select activity, 
rank() over(order by count(id)) as minimum,
rank() over(order by count(id) desc) as maximum
from Friends

#1)find the names of all the activities
group by activity) t

#2) neither maximum, nor minimum number of participants
where minimum!=1 and maximum!=1;


A:
select activity from 
(select activity, 
rank() over(order by count(id)) as minimum,
rank() over(order by count(id) desc) as maximum
from Friends
group by activity) t
where minimum!=1 and maximum!=1;

10222020 2nd practice
A2:            
select  activity from
(select  activity,
rank() over(order by count(id)) minn,
rank() over(order by count(id) desc) maxx
from Friends group by activity) t
where t.minn!=1 and t.maxx!=1;
            
            
Table: Friends

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
| activity      | varchar |
+---------------+---------+
id is the id of the friend and primary key for this table.
name is the name of the friend.
activity is the name of the activity which the friend takes part in.
Table: Activities

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+
id is the primary key for this table.
name is the name of the activity.
 

The query result format is in the following example:

Friends table:
+------+--------------+---------------+
| id   | name         | activity      |
+------+--------------+---------------+
| 1    | Jonathan D.  | Eating        |
| 2    | Jade W.      | Singing       |
| 3    | Victor J.    | Singing       |
| 4    | Elvis Q.     | Eating        |
| 5    | Daniel A.    | Eating        |
| 6    | Bob B.       | Horse Riding  |
+------+--------------+---------------+

Activities table:
+------+--------------+
| id   | name         |
+------+--------------+
| 1    | Eating       |
| 2    | Singing      |
| 3    | Horse Riding |
+------+--------------+

Result table:
+--------------+
| activity     |
+--------------+
| Singing      |
+--------------+

Eating activity is performed by 3 friends, maximum number of participants, (Jonathan D. , Elvis Q. and Daniel A.)
Horse Riding activity is performed by 1 friend, minimum number of participants, (Bob B.)
Singing is performed by 2 friends (Victor J. and Jade W.)
