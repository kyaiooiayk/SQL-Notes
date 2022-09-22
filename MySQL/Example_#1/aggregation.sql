/*
This SQL script shows how to use aggregation in our query

[Reference article] https://towardsdatascience.com/sql-in-a-nutshell-part-1-basic-real-world-scenarios-33a25ba8d220
[Reference code] https://gist.github.com/sejalv
*/


/*
By aggregating data, we can observe insights like monthly totals, 
or averages across sales orders by category.
Some basic ones are min, max, average, sum and count, and the more analytical
ones include standard deviation, variance, and rank.
*/


-- Aggregation on all rows
select count(*) Total_Rows, sum(price) Total_Sales, avg(price) Avg_Price
, min(price) Min_Price, max(price) Max_Price
FROM Sales;

/* Output:
| Total_Rows | Total_Sales | Avg_Price | Min_Price | Max_Price |
|------------|-------------|-----------|-----------|-----------|
|          9 |       63000 |      7000 |      5000 |      9000 |
*/


/*
GROUP BY allows you to separate data into groups, which can be aggregated 
independently of one another.
For example — Get the total sales, average price and total quantity sold 
for each product in our database:
*/

SELECT p.Product_Name,
COALESCE(SUM(price),0) Total_Sales
,COALESCE(AVG(price),0) Avg_Price
,COALESCE(SUM(Quantity),0) Total_Quantity
FROM Products p LEFT JOIN Sales s
ON p.Product_ID=s.Product_ID
GROUP BY p.Product_Name;

/* Output:
| Product_Name | Total_Sales | Avg_Price | Total_Quantity |
|--------------|-------------|-----------|----------------|
|       IPhone |       27000 |      9000 |             45 |
|           LG |           0 |         0 |              0 |
|        Nokia |       15000 |      5000 |             49 |
|      Samsung |       21000 |      7000 |             58 |
*/


/*
Let’s consider another example — For every product sold from 1st October 2016 onward, 
get the total sales, average price and total quantity on a yearly basis, and return 
only those products that have sold at least 10 items, sorted by product name and year.
*/


/*
Step 1: For every product sold from 1st October 2016 onward
*/

select p.Product_Name
FROM Products p LEFT JOIN Sales s
ON p.Product_ID=s.Product_ID
WHERE s.Date >= '2016-10-01'    -- date filter
GROUP BY p.Product_Name;        -- for each product

/* Output:
| product_name |
|--------------|
|      Samsung |
|        Nokia |
|       IPhone |
*/

/*
Step 2: get the total sales, average price and total quantity on a yearly basis
*/

select p.Product_Name
,COALESCE(YEAR(s.Date),'None') Year
,COALESCE(SUM(price),0) Total_Sales
,COALESCE(AVG(price),0) Avg_Price
,COALESCE(SUM(Quantity),0) Total_Quantity
FROM Products p LEFT JOIN Sales s
ON p.Product_ID=s.Product_ID
WHERE s.Date >= '2016-10-01'
GROUP BY p.Product_Name, YEAR(s.Date);  -- For each product, and each year

/* Output:
| Product_Name | Year | Total_Sales | Avg_Price | Total_Quantity |
|--------------|------|-------------|-----------|----------------|
|       IPhone | 2016 |        9000 |      9000 |             10 |
|       IPhone | 2017 |       18000 |      9000 |             35 |
|        Nokia | 2016 |        5000 |      5000 |              8 |
|      Samsung | 2016 |        7000 |      7000 |             20 |
*/


/*
Step 3: return only those products that have sold at least 10 items, sorted by product name and year.
The HAVING clause, applies a filter after an aggregation is performed.
*/

select p.Product_Name
,COALESCE(YEAR(s.Date),'None') Year
,COALESCE(SUM(price),0) Total_Sales
,COALESCE(AVG(price),0) Avg_Price
,COALESCE(SUM(Quantity),0) Total_Quantity
FROM Products p LEFT JOIN Sales s
ON p.Product_ID=s.Product_ID
WHERE s.Date >= '2016-10-01'
GROUP BY p.Product_Name, YEAR(s.Date)
HAVING Total_Quantity>=10    -- final filter on quantity
ORDER BY Product_Name, Year;


/* Output:
| Product_Name | Year | Total_Sales | Avg_Price | Total_Quantity |
|--------------|------|-------------|-----------|----------------|
|       IPhone | 2016 |        9000 |      9000 |             10 |
|       IPhone | 2017 |       18000 |      9000 |             35 |
|      Samsung | 2016 |        7000 |      7000 |             20 |
*/