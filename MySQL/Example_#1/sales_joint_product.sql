/*
This SQL script shows how to use the JOIN operation

[Reference article] https://towardsdatascience.com/sql-in-a-nutshell-part-1-basic-real-world-scenarios-33a25ba8d220
[Reference code] https://gist.github.com/sejalv
*/



/*
In this example we'll look at Inner Join which returns only those results from 
both tables where the join condition is True.

Get the details of those Products that have made Sales:
In this example, it is observed from the result-set that there is no sale made 
by product ‘LG’, since there is no listing for product ‘LG’ (or no Product_ID)
in the Sales table.

The join condition is specified via an ON clause.
*/

SELECT Sale_ID, Date, Quantity, Price, p.Product_Name
FROM SALES s INNER JOIN PRODUCTS p
ON s.Product_ID=p.Product_ID

/* Output:
| Sale_ID |                 Date | Quantity | Price | Product_Name |
|---------|----------------------|----------|-------|--------------|
|       1 | 2015-10-01T00:00:00Z |       25 |  5000 |        Nokia |
|       2 | 2015-11-01T00:00:00Z |       16 |  5000 |        Nokia |
|       3 | 2016-12-01T00:00:00Z |        8 |  5000 |        Nokia |
|       4 | 2016-11-01T00:00:00Z |       10 |  9000 |       IPhone |
|       5 | 2017-10-01T00:00:00Z |       15 |  9000 |       IPhone |
|       6 | 2017-11-01T00:00:00Z |       20 |  9000 |       IPhone |
|       7 | 2015-12-01T00:00:00Z |       20 |  7000 |      Samsung |
|       8 | 2015-11-01T00:00:00Z |       18 |  7000 |      Samsung |
|       9 | 2016-10-01T00:00:00Z |       20 |  7000 |      Samsung |
*/



/*
We can also add multiple conditions to it using the AND operator. 
For example, to get the details of those Products that have made Sales in 2017:
*/

SELECT Sale_ID, Date, Quantity, Price, p.Product_Name
FROM SALES s INNER JOIN PRODUCTS p
ON s.Product_ID=p.Product_ID
AND YEAR(Date) = '2017'

/* Output:
| Sale_ID |                 Date | Quantity | Price | Product_Name |
|---------|----------------------|----------|-------|--------------|
|       5 | 2017-10-01T00:00:00Z |       15 |  9000 |       IPhone |
|       6 | 2017-11-01T00:00:00Z |       20 |  9000 |       IPhone |
*/