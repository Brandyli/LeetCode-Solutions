Q: Write a query to return the list of customers NOT referred by the person with id '2'.


Key: is null
MySQL uses three-valued logic -- TRUE, FALSE and UNKNOWN. Anything compared to NULL evaluates to the third value: UNKNOWN. 
That “anything” includes NULL itself! That’s why MySQL provides the IS NULL and IS NOT NULL operators to specifically check for NULL.
Thus, one more condition 'referee_id IS NULL' should be added to the WHERE clause as below.

*Conclusion - if the value contains null, check it using is null.

1. return the list of customers - select name from Customer
2. NOT referred by the person with id '2' ->  where referee_id <> '2' or referee_id is null;


A:
select name from Customer
where referee_id <> '2' or referee_id is null;


Given a table customer holding customers information and the referee.

+------+------+-----------+
| id   | name | referee_id|
+------+------+-----------+
|    1 | Will |      NULL |
|    2 | Jane |      NULL |
|    3 | Alex |         2 |
|    4 | Bill |      NULL |
|    5 | Zack |         1 |
|    6 | Mark |         2 |
+------+------+-----------+

For the sample data above, the result is:

+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+
