/*
This SQL script retrieve data via queries
A SELECT command is used to retrieve data from teh database

[Reference article] https://towardsdatascience.com/sql-in-a-nutshell-part-1-basic-real-world-scenarios-33a25ba8d220
[Reference code] https://gist.github.com/sejalv/389ddd7f297ed3ce7e32f7caa8290f15#file-select_all_sales-sql 
*/


- set database before querying (first step)
use dbo;     -- or your DB Name


-- Get all the details from Sales:
SELECT * FROM SALES;

/* Output:
| SALE_ID | PRODUCT_ID |                 DATE | Quantity | PRICE |
|---------|------------|----------------------|----------|-------|
|       1 |        100 | 2015-10-01T00:00:00Z |       25 |  5000 |
|       2 |        100 | 2015-11-01T00:00:00Z |       16 |  5000 |
|       3 |        100 | 2016-12-01T00:00:00Z |        8 |  5000 |
|       4 |        200 | 2016-11-01T00:00:00Z |       10 |  9000 |
|       5 |        200 | 2017-10-01T00:00:00Z |       15 |  9000 |
|       6 |        200 | 2017-11-01T00:00:00Z |       20 |  9000 |
|       7 |        300 | 2015-12-01T00:00:00Z |       20 |  7000 |
|       8 |        300 | 2015-11-01T00:00:00Z |       18 |  7000 |
|       9 |        300 | 2016-10-01T00:00:00Z |       20 |  7000 |
*/


-- Get top 5 details from Sales:
SELECT * FROM SALES LIMIT 5;

/* Output:
| SALE_ID | PRODUCT_ID |                 DATE | Quantity | PRICE |
|---------|------------|----------------------|----------|-------|
|       1 |        100 | 2015-10-01T00:00:00Z |       25 |  5000 |
|       2 |        100 | 2015-11-01T00:00:00Z |       16 |  5000 |
|       3 |        100 | 2016-12-01T00:00:00Z |        8 |  5000 |
|       4 |        200 | 2016-11-01T00:00:00Z |       10 |  9000 |
|       5 |        200 | 2017-10-01T00:00:00Z |       15 |  9000 |
*/


-- Get only Sale_ID, Product, Order_Quantity from Sales:
SELECT Sale_ID, Product_ID, Quantity FROM Sales;

/* Output:
| Sale_ID | Product_ID | Quantity |
|---------|------------|----------|
|       1 |        100 |       25 |
|       2 |        100 |       16 |
|       3 |        100 |        8 |
|       4 |        200 |       10 |
|       5 |        200 |       15 |
|       6 |        200 |       20 |
|       7 |        300 |       20 |
|       8 |        300 |       18 |
|       9 |        300 |       20 |
*/


-- Get top 5 details of only Sale_ID, Product, Order_Quantity from Sales 
-- with exactly those field-names in the results:
SELECT
  Sale_ID
  , Product_ID as 'Product'
  , Quantity as 'Order_Quantity'
FROM Sales
LIMIT 5;

/* Output:
| Sale_ID | Product | Order_Quantity |
|---------|---------|----------------|
|       1 |     100 |             25 |
|       2 |     100 |             16 |
|       3 |     100 |              8 |
|       4 |     200 |             10 |
|       5 |     200 |             15 |
*/


-- Get unique Products from Sales:
SELECT DISTINCT Product_ID FROM Sales;

/* Output:
| Product_ID |
|------------|
|        100 |
|        200 |
|        300 |
*/