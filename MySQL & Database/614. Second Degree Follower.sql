Key:
group by 1
order by 1
It means to group by the first column regardless of what it's called. You can do the same with ORDER BY.

A:
select followee as follower, count(distinct follower) num
from follow
where followee in (select follower from follow)
group by 1
order by 1;


In facebook, there is a follow table with two columns: followee, follower.

Q:
Please write a sql query to get the amount of each follower’s follower if he/she has one.

For example:

+-------------+------------+
| followee    | follower   |
+-------------+------------+
|     A       |     B      |
|     B       |     C      |
|     B       |     D      |
|     D       |     E      |
+-------------+------------+
should output:
+-------------+------------+
| follower    | num        |
+-------------+------------+
|     B       |  2         |
|     D       |  1         |
+-------------+------------+
Explaination:
Both B and D exist in the follower list, when as a followee, B's follower is C and D, and D's follower is E. A does not exist in follower list.
 

 

Note:
Followee would not follow himself/herself in all cases.
Please display the result in follower's alphabet order.
 
