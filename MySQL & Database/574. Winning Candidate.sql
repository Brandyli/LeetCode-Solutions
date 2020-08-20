Q:
Write a sql to find the name of the winning candidate, the example will return the winner B.

Key: select k1 from table a where k2 = (select k3 from table b group by b order by b limit 1);
id = common key

1. Query in the Vote table to get the winner's id --> 

(select CandidateId from Vote
group by CandidateId
order by CandidateId
limit 1) 


2. and then join it with the Candidate table to get the name
** CandidateId is the id appeared in Candidate table: Candidate.id = Vote.CandidateId 

select c.name as Name
from Candidate c
where id = (select CandidateId ...)

A:
select c.name as Name
from Candidate c
where id = (
select CandidateId from Vote
group by CandidateId
order by CandidateId
limit 1);

SQL Schema
Table: Candidate

+-----+---------+
| id  | Name    |
+-----+---------+
| 1   | A       |
| 2   | B       |
| 3   | C       |
| 4   | D       |
| 5   | E       |
+-----+---------+  
Table: Vote

+-----+--------------+
| id  | CandidateId  |
+-----+--------------+
| 1   |     2        |
| 2   |     4        |
| 3   |     3        |
| 4   |     2        |
| 5   |     5        |
+-----+--------------+
id is the auto-increment primary key,
** CandidateId is the id appeared in Candidate table.


+------+
| Name |
+------+
| B    |
+------+
Notes:

You may assume there is no tie, in other words there will be only one winning candidate.
