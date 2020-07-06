The DENSE_RANK() is a window function that assigns a rank to each row within a partition of a result set. Unlike the RANK() function, the DENSE_RANK() function returns consecutive rank values. Rows in each partition receive the same ranks if they have the same values.

The syntax of the DENSE_RANK() function is as follows:

DENSE_RANK() OVER (
    [PARTITION BY partition_expression, ... ]
    ORDER BY sort_expression [ASC | DESC], ...
)
The DENSE_RANK() function is applied to the rows of each partition defined by the PARTITION BY clause, in a specified order, defined by ORDER BY clause. It resets the rank when the partition boundary is crossed.
