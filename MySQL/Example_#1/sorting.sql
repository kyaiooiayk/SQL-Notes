/*
This SQL script shows how to sort our query

[Reference article] https://towardsdatascience.com/sql-in-a-nutshell-part-1-basic-real-world-scenarios-33a25ba8d220
[Reference code] https://gist.github.com/sejalv
*/


/*
-- Get all Sales details for the Product- 'iPhone' 
-- (Here, we know the Product_ID)
*/

ELECT * FROM Sales
WHERE Product_ID = 200;

/* Output:
| SALE_ID | PRODUCT_ID |                 DATE | Quantity | PRICE |
|---------|------------|----------------------|----------|-------|
|       4 |        200 | 2016-11-01T00:00:00Z |       10 |  9000 |
|       5 |        200 | 2017-10-01T00:00:00Z |       15 |  9000 |
|       6 |        200 | 2017-11-01T00:00:00Z |       20 |  9000 |
        
*/

/*
-- Get sales of a product that ends with '-Phone' 
-- (Here, we aren't sure of the Product_ID or the text casing)
*/

SELECT s.*, p.* FROM Sales s
INNER JOIN Products p ON s.Product_ID = p.Product_ID
WHERE p.Product_Name LIKE '%Phone'

/* Output:
| SALE_ID | PRODUCT_ID |                 DATE | Quantity | PRICE | PRODUCT_ID | PRODUCT_NAME |
|---------|------------|----------------------|----------|-------|------------|--------------|
|       4 |        200 | 2016-11-01T00:00:00Z |       10 |  9000 |        200 |       IPhone |
|       5 |        200 | 2017-10-01T00:00:00Z |       15 |  9000 |        200 |       IPhone |
|       6 |        200 | 2017-11-01T00:00:00Z |       20 |  9000 |        200 |       IPhone |
*/


/*
Notice here, in the first query, we have filtered by Product_ID (if known).
And in the second query, we have joined Sales with the Products table and 
filtered for a product that ends with “-Phone”. Note that the ‘%’ is a wildcard 
character which searches for any text in its place.

Let’s take another example — Get Sales details between 1st November 2015 
and 1st October 2017, sorted by Date:
-- get sales details between a date range
*/

SELECT * FROM Sales
WHERE Date >= '2015-11-01' AND Date <= '2017-10-01'
ORDER BY Date;

/*
Output:
| SALE_ID | PRODUCT_ID |                 DATE | Quantity | PRICE |
|---------|------------|----------------------|----------|-------|
|       2 |        100 | 2015-11-01T00:00:00Z |       16 |  5000 |
|       8 |        300 | 2015-11-01T00:00:00Z |       18 |  7000 |
|       7 |        300 | 2015-12-01T00:00:00Z |       20 |  7000 |
|       9 |        300 | 2016-10-01T00:00:00Z |       20 |  7000 |
|       4 |        200 | 2016-11-01T00:00:00Z |       10 |  9000 |
|       3 |        100 | 2016-12-01T00:00:00Z |        8 |  5000 |
|       5 |        200 | 2017-10-01T00:00:00Z |       15 |  9000 |
*/


SELECT * FROM Sales
WHERE Date BETWEEN '2015-11-01' AND '2017-10-01'
ORDER BY Date;

/* Output:
| SALE_ID | PRODUCT_ID |                 DATE | Quantity | PRICE |
|---------|------------|----------------------|----------|-------|
|       2 |        100 | 2015-11-01T00:00:00Z |       16 |  5000 |
|       8 |        300 | 2015-11-01T00:00:00Z |       18 |  7000 |
|       7 |        300 | 2015-12-01T00:00:00Z |       20 |  7000 |
|       9 |        300 | 2016-10-01T00:00:00Z |       20 |  7000 |
|       4 |        200 | 2016-11-01T00:00:00Z |       10 |  9000 |
|       3 |        100 | 2016-12-01T00:00:00Z |        8 |  5000 |
|       5 |        200 | 2017-10-01T00:00:00Z |       15 |  9000 |
*/


/*
Here, in the first query, we use a set of comparison operators. In the second query, 
we use BETWEEN that searches for Date values within the same range.

Now, what if we needed to get the Sales details for the products — ‘Nokia’, ‘Samsung’, 
and ‘LG’? Or say it’s a list of about 20 products that we need to search for. Rather 
than including 20 AND conditions, a more feasible way to write this query would be to 
use the IN operator:
-- get the Sales details for the products —  ‘Nokia’, ‘Samsung’, and ‘LG’
*/

SELECT s.*, p.* FROM Sales s
INNER JOIN Products p ON s.Product_ID = p.Product_ID
WHERE p.Product_Name IN ('Nokia','Samsung','LG')

/* Output:
| SALE_ID | PRODUCT_ID |                 DATE | Quantity | PRICE | PRODUCT_ID | PRODUCT_NAME |
|---------|------------|----------------------|----------|-------|------------|--------------|
|       1 |        100 | 2015-10-01T00:00:00Z |       25 |  5000 |        100 |        Nokia |
|       2 |        100 | 2015-11-01T00:00:00Z |       16 |  5000 |        100 |        Nokia |
|       3 |        100 | 2016-12-01T00:00:00Z |        8 |  5000 |        100 |        Nokia |
|       7 |        300 | 2015-12-01T00:00:00Z |       20 |  7000 |        300 |      Samsung |
|       8 |        300 | 2015-11-01T00:00:00Z |       18 |  7000 |        300 |      Samsung |
|       9 |        300 | 2016-10-01T00:00:00Z |       20 |  7000 |        300 |      Samsung |
*/
