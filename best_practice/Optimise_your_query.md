# How to optimise you SQL query
***

## Suggestion #1
- Use `SELECT` instead of `SELECT *`.
- This reduces the amount of data retrieved from the databse.
***

## Suggestion #2
- Avoid using `SELECT DISTINCT`
- This requires additional processing to remove duplicates.
- The unique values in the segment column ca be retrieve by using a GROUP BY clause. The GROUP BY clause groups the records based on the specified column(s) and returns one record for each group.
- Instead of:
```sql
SELECT DISTINCT segment 
FROM customer;
```
- Use:
```sql
SELECT segment
FROM customer
GROUP BY segment;
```
***

## Suggestion #3
- Avoid using loops.
- Replace loops with built-in functions to boost query performance.
***

## Suggestion #4
- Use wildcard wisely. Instead of:
```sql
SELECT customer_name
FROM customer
WHERE RIGHT(customer_name, 3) = 'son';
```
- Use:
```sql
SELECT customer_name
FROM customer
WHERE customer_name LIKE '%son';
```
***

## Suggestion #5
- Use Indexes. Instead of:
```sql
SELECT customer_id, 
       customer_name
FROM customer
WHERE segment = 'Corporate';
```
- Use:
```sql
CREATE INDEX idx_segment ON customer (segment);
SELECT customer_id, 
       customer_name
FROM customer WITH (INDEX(idx_segment))
WHERE segment = 'Corporate';
```
***
 
## References
- [How to Optimize SQL Queries for Faster Data Retrieval](https://www.kdnuggets.com/2023/06/optimize-sql-queries-faster-data-retrieval.html)
***
