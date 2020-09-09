
# +----------+-------------+-------------+
# | p1       | p2          | area        |
# +----------+-------------+-------------+

# 1) sketch the structure: Create two same tables and Join them
# report all possible rectangles which can be formed by any two points of the table. 
# p1 should be less than p2 and area greater than 0.

select a.id as p1, b.id as p2, 
on a.id<b.id
and a.x_value!=b.x_value 
and a.y_value!=b.y_value

# 2) build the rectangle's formula
# p1 = 1 and p2 = 2, has an area equal to |2-4| * |8-7| = 2.
# p1 = 2 and p2 = 3, has an area equal to |4-2| * |7-10| = 6.

abs(a.x_value-b.x_value)*abs(a.y_value-b.y_value) as area
from Points a join Points b


# descending order by area in case of tie in ascending order by p1 and p2
order by area desc, p1 asc, p2 asc;

A:
select a.id as p1, b.id as p2,
abs(a.x_value-b.x_value)*abs(a.y_value-b.y_value) as area
from Points a join Points b
on a.id<b.id
and a.x_value!=b.x_value
and a.y_value!=b.y_value
order by area desc, p1 asc, p2 asc;



Table: Points

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| x_value       | int     |
| y_value       | int     |
+---------------+---------+
id is the primary key for this table.
Each point is represented as a 2D Dimensional (x_value, y_value).

Q:
Write an SQL query to report of all possible rectangles which can be formed by any two points of the table. 

Each row in the result contains three columns (p1, p2, area) where:

p1 and p2 are the id of two opposite corners of a rectangle and p1 < p2.
Area of this rectangle is represented by the column area.
Report the query in descending order by area in case of tie in ascending order by p1 and p2.

Points table:
+----------+-------------+-------------+
| id       | x_value     | y_value     |
+----------+-------------+-------------+
| 1        | 2           | 8           |
| 2        | 4           | 7           |
| 3        | 2           | 10          |
+----------+-------------+-------------+

Result table:
+----------+-------------+-------------+
| p1       | p2          | area        |
+----------+-------------+-------------+
| 2        | 3           | 6           |
| 1        | 2           | 2           |
+----------+-------------+-------------+

p1 should be less than p2 and area greater than 0.
p1 = 1 and p2 = 2, has an area equal to |2-4| * |8-7| = 2.
p1 = 2 and p2 = 3, has an area equal to |4-2| * |7-10| = 6.
p1 = 1 and p2 = 3 It's not possible because the rectangle has an area equal to 0.
