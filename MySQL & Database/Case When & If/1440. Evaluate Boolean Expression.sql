Key: case when

Logic:

# 1) sketch the structure: Join three tables -- since name originates from both left_operand & right_operand, so we need two tables Varibale
# +--------------+----------+---------------+-------+
# | left_operand | operator | right_operand | value |
# +--------------+----------+---------------+-------+

select e.*,

from Expressions join Variables v1
on v1.name = e.left_operand
join Variables v2
on v2.name = e.right_operand


# 2) value - evaluate the boolean expressions in Expressions table.
# the first thought is to use 'if clause' to classify the boolean expression false & true, 
# but it doesn't work due to different order compared to the reference result
# the another option is to use 'case when' for selecting true ones that satisfy two conditions--1. operator 2. value comparison

case when (operator ='>' and v1.value>v2.value) then 'true' 
when (operator ='=' and v1.value=v2.value) then 'true' 
when (operator ='<' and v1.value<v2.value) then 'true' 
else 'false' end as value

A:

select e.*,
case when (operator='>' and v1.name>v2.name) then 'true'
when (operator='=' and v1.name=v2.name) then 'true'
when (operator='<' and v1.name<v2.name) then 'true'
else 'false' end as value
from Expressions e join Variables v1
on v1.name = e.left_operand
join Variables v2
on v2.name = e.right_operand


If clause
*If switch to "if", there are three conditions and brackets which will make clause complexed

Table Variables:

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| name          | varchar |
| value         | int     |
+---------------+---------+
name is the primary key for this table.
This table contains the stored variables and their values.
 

Table Expressions:

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| left_operand  | varchar |
| operator      | enum    |
| right_operand | varchar |
+---------------+---------+
(left_operand, operator, right_operand) is the primary key for this table.
This table contains a boolean expression that should be evaluated.
operator is an enum that takes one of the values ('<', '>', '=')
The values of left_operand and right_operand are guaranteed to be in the Variables table.
 

Write an SQL query to evaluate the boolean expressions in Expressions table.

Return the result table in any order.

The query result format is in the following example.

Variables table:
+------+-------+
| name | value |
+------+-------+
| x    | 66    |
| y    | 77    |
+------+-------+

Expressions table:
+--------------+----------+---------------+
| left_operand | operator | right_operand |
+--------------+----------+---------------+
| x            | >        | y             |
| x            | <        | y             |
| x            | =        | y             |
| y            | >        | x             |
| y            | <        | x             |
| x            | =        | x             |
+--------------+----------+---------------+

Result table:
+--------------+----------+---------------+-------+
| left_operand | operator | right_operand | value |
+--------------+----------+---------------+-------+
| x            | >        | y             | false |
| x            | <        | y             | true  |
| x            | =        | y             | false |
| y            | >        | x             | true  |
| y            | <        | x             | false |
| x            | =        | x             | true  |
+--------------+----------+---------------+-------+
As shown, you need find the value of each boolean exprssion in the table using the variables table.
