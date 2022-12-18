# The proper way to write SQL queies


## The Problem
- The majority of developers start writing their SQL queries with the ‘SELECT’ clause, then write ‘FROM’, ‘WHERE’, ‘HAVING’….and so on. But this is not the **right** way of writing your SQL queries as this is very prone to syntactic errors, especially if you are a beginner in SQL.

## The Solution
- The ‘ideal’ query writing sequence should be in line with how the **SQL executor executes the queries**.

## Case study
- We will be using the Customer and Order tables (below) to find the top 2 customers from the USA/UK who have a total spend of more than $300.
![image](https://user-images.githubusercontent.com/89139139/208289837-e8e942a9-6de3-4f7c-b839-32153e7f2898.png)
![image](https://user-images.githubusercontent.com/89139139/208289840-2e11918d-50fd-4a92-b74f-1c69f9a79e30.png)
***

## 1 - Always start with FROM/JOIN
- Intuitively, the first step is to read the tables using the FROM clause and perform JOIN(if required). So, you should always start your query with the ‘FROM’/‘JOIN’ statement.
```
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id
```
- We can also filter rows from the input tables even before the join is executed. We can do this by adding the ‘AND’ clause after the ‘ON’ clause of the join.
```
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id
AND country in ('USA','UK')
```

## 2 - Then move to WHERE
- The second clause in the order of execution is the WHERE clause. It is used to filter the data tables after the join has been applied.
- The WHERE clause is very helpful to reduce the number of rows especially when we are working with big datasets having millions of rows.
```
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id
WHERE country in ('USA','UK')
```
***

## 3 - Then use GROUP BY
- Group By clause should be written **after** the `WHERE` clause. It is used to group the rows based on the selected column/columns.
```
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id
WHERE country in ('USA','UK')
GROUP BY Customers.customer_id
```
## 4 - HAVING after GROUP BY
- The HAVING clause gets executed **after** `GROUP BY`, it is used to filter the aggregated rows that were generated in the group by operation.
- In our example, we will filter the sum of the amount spent by each customer to be greater than 300.
```
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id
WHERE country in ('USA','UK')
GROUP BY Customers.customer_id
HAVING sum(amount) >300
```

## 5 - Then write the SELECT clause
- Columns that we want to show in the output are selected using the `SELECT` clause.
```
SELECT Customers.customer_id, sum(amount) as total_amount
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id
WHERE country in ('USA','UK')
GROUP BY Customers.customer_id
HAVING sum(amount) >300
```
***

## 6 - Use ORDER BY after the SELECT clause
- After selecting the columns, the next step is to provide the order in which we want to output the rows.
- In our example, we can use the ORDER BY clause to order the rows in descending order of total spend.
```
SELECT Customers.customer_id, sum(amount) as total_amount
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id
WHERE country in ('USA','UK')
GROUP BY Customers.customer_id
HAVING sum(amount) >=300
ORDER BY total_amount desc
```

## 7 - Write the LIMIT clause at last
- The last step in the writing sequence is to limit the number of rows that we want to see in the output.
```
SELECT Customers.customer_id, sum(amount) as total_amount
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id
WHERE country in ('USA','UK')
GROUP BY Customers.customer_id
HAVING sum(amount) >=300
ORDER BY total_amount desc
LIMIT 2
```
***

## Conclusion
![image](https://user-images.githubusercontent.com/89139139/208290709-7dfa7843-1765-47e6-9a57-3c70775ab7d0.png)
***

## References
- [Don’t Start Your SQL Queries with the ‘Select’ Statement](https://towardsdatascience.com/dont-start-your-sql-queries-with-select-clause-d30fa1b701f6)
***
