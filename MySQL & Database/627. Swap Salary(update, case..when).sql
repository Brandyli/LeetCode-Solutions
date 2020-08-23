Key:
To dynamically set a value to a column, we can use UPDATE statement together when CASE...WHEN... flow control statement.

UPDATE table_name
SET column1 = CASE column1
WHEN 'k1' THEN 'k2'
ELSE 'k1'
END;

UPDATE table_name
SET column = IF(column = 'f','m','f')

A1:
update salary
set sex=if(sex ='f','m','f');

A2:
update salary
set sex = case sex when 'm' then 'f' else 'm'
end;

Q: Given a table salary, such as the one below, that has m=male and f=female values. Swap all f and m values (i.e., change all f values to m and vice versa) with a single update statement and no intermediate temp table.

Note that you must write a single update statement, DO NOT write any select statement for this problem.

 

Example:

| id | name | sex | salary |
|----|------|-----|--------|
| 1  | A    | m   | 2500   |
| 2  | B    | f   | 1500   |
| 3  | C    | m   | 5500   |
| 4  | D    | f   | 500    |
After running your update statement, the above salary table should have the following rows:
| id | name | sex | salary |
|----|------|-----|--------|
| 1  | A    | f   | 2500   |
| 2  | B    | m   | 1500   |
| 3  | C    | f   | 5500   |
| 4  | D    | m   | 500    |
