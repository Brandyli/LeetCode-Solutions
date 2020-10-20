Q:
Write an SQL query to _find all active businesses_. (what is 'active businesses'?)

An active business is a business that has _more than one event type_ with _occurences greater than the average occurences_ of that event type among all businesses. (2 conditions)

Key:avg(k1) over(partition by k2)

A:
select business_id from              

# 3) the average occurences of 'that event type' among all businesses 
(select *, avg(occurences) over(partition by event_type) as mean from Events) as t

# 2)occurences greater than mean=the average occurences of 'that event type' among all businesses
where occurences > mean 
group by business_id 

# 1) a business that has more than one event type
having count(distinct event_type) >1;   

# 10/22/2020 
A:
 select business_id from
 (select *, avg(occurences) over(partition by event_type) as mean 
 from Events) t 
 where occurences > mean
 group by business_id
 having count(distinct event_type) > 1;
 
 
Table: Events
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| business_id   | int     |
| event_type    | varchar |
| occurences    | int     | 
+---------------+---------+
(business_id, event_type) is the primary key of this table.
Each row in the table logs the info that an event of some type occured at some business for a number of times.
 

The query result format is in the following example:

Events table:
+-------------+------------+------------+
| business_id | event_type | occurences |
+-------------+------------+------------+
| 1           | reviews    | 7          |
| 3           | reviews    | 3          |
| 1           | ads        | 11         |
| 2           | ads        | 7          |
| 3           | ads        | 6          |
| 1           | page views | 3          |
| 2           | page views | 12         |
+-------------+------------+------------+

Result table:
+-------------+
| business_id |
+-------------+
| 1           |
+-------------+ 
Average for 'reviews', 'ads' and 'page views' are (7+3)/2=5, (11+7+6)/3=8, (3+12)/2=7.5 respectively.
Business with id 1 has 7 'reviews' events (more than 5) and 11 'ads' events (more than 8) so it is an active business.
