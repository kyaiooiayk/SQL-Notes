/*
This SQL script shows how to use built-infunctions

[Reference article] https://towardsdatascience.com/sql-in-a-nutshell-part-1-basic-real-world-scenarios-33a25ba8d220
[Reference code] https://gist.github.com/sejalv
*/


-- get Sales details on quarterly basis

-- MySQL
SELECT
    CASE
        WHEN MONTH(Date) BETWEEN 1  AND 3  THEN CONCAT(YEAR(Date),'Q1')
        WHEN MONTH(Date) BETWEEN 4  AND 6  THEN CONCAT(YEAR(Date),'Q2')
        WHEN MONTH(Date) BETWEEN 7  AND 9  THEN CONCAT(YEAR(Date),'Q3')
        WHEN MONTH(Date) BETWEEN 10 AND 12 THEN CONCAT(YEAR(Date),'Q4')
    END AS Quarter
    , CAST(SUM(Price) AS DECIMAL(10,2)) Total_Sales
    , COUNT(1) Num_of_Sales
FROM Sales
GROUP BY Quarter
ORDER BY Quarter


/* Output:
| Quarter | Total_Sales | Num_of_Sales |
|---------|-------------|--------------|
|  2015Q4 |    24000.00 |            4 |
|  2016Q4 |    21000.00 |            3 |
|  2017Q4 |    18000.00 |            2 |
*/

-- get Sales details on monthly basis

-- MySQL
SELECT YEAR(DATE) Year
  , MONTHNAME(DATE) Month
  , CAST(SUM(Price) As Decimal (10,2)) Total_Sales
  , COUNT(1) AS Num_of_Sales
FROM Sales
GROUP BY Year(Date), Month(Date)
ORDER BY Year(Date) DESC, Month(Date) DESC

/* Output:
| Year |    Month | Total_Sales | Num_of_Sales |
|------|----------|-------------|--------------|
| 2017 | November |     9000.00 |            1 |  
| 2017 |  October |     9000.00 |            1 |
| 2016 | December |     5000.00 |            1 |
| 2016 | November |     9000.00 |            1 |
| 2016 |  October |     7000.00 |            1 |
| 2015 | December |     7000.00 |            1 |
| 2015 | November |    12000.00 |            2 |
| 2015 |  October |     5000.00 |            1 |
*/
                                
                                
/*
The first query displays a quarterly Sales report. Here, the MONTH and YEAR functions transforms a Date value into its corresponding month and year values in Integer form, while CAST is used on Price to transform from Integer to Decimal. The CASE function (a variation of IF-ELSE) checks then checks the condition and maps each Date value into quarterly buckets, and thereafter the results are grouped by the quarter. Similarly, in order to display a monthly Sales report, we need to group over both Year and Month, as shown in the second query.                                
*/