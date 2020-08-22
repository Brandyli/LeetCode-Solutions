Key:

The euclidean distance between two points P1(x1,y1) and P2(x2, y2) in two dimensions is defined as \sqrt{(x1-x2)^2+(y1-y2)^2} 

 . So in order to get the distances, we can join this table with itself, and then utilize the built-in function POW() and SQRT() like below.
Return 4 raised to the second power:
SELECT POW(4, 2);
Result: 16

Note:

The condition 'p1.x != p2.x OR p2.y != p2.y' is to avoid calculating the distance of a point with itself. Otherwise, the minimum distance will be always zero.
The columns p1.x, p1.y, p2.x and p2.y are for demonstrating. They are not necessary for the final solution.

To put the MIN() inside of SQRT() will slightly improve the performance.

A:
select round(sqrt(min(pow((p1.x-p2.x),2)+pow((p1.y-p2.y),2))))  shortest
from point_2d p1 join point_2d p2
on p1.x!=p2.x or p1.y!=p2.y;

Table point_2d holds the coordinates (x,y) of some unique points (more than two) in a plane.
 

Write a query to find the shortest distance between these points rounded to 2 decimals.
 

| x  | y  |
|----|----|
| -1 | -1 |
| 0  | 0  |
| -1 | -2 |
 

The shortest distance is 1.00 from point (-1,-1) to (-1,2). So the output should be:
 

| shortest |
|----------|
| 1.00     |
 

Note: The longest distance among all the points are less than 10000.
