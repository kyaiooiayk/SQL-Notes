# Description
- Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.
- The test cases are generated so that exactly one customer will have placed more orders than any other customer.
```
Input: 
Orders table:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+
Output: 
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
Explanation: 
The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order. 
So the result is customer_number 3.

```
***

## SQL schema
```
Create table If Not Exists orders (order_number int, customer_number int)
Truncate table orders
insert into orders (order_number, customer_number) values ('1', '1')
insert into orders (order_number, customer_number) values ('2', '2')
insert into orders (order_number, customer_number) values ('3', '3')
insert into orders (order_number, customer_number) values ('4', '3')
```
***

## SQL type
- MySQL
***

## Solution #1
```
SELECT  customer_number
FROM    orders
GROUP BY customer_number
# The DESC keyword allows you to show the highest count first, ORDER BY by default orders in ascending order which would show the lowest count first.
ORDER BY COUNT(order_number) DESC 
LIMIT 1
```
***

## Reference
- [SQL Order By Count](https://stackoverflow.com/questions/9545637/sql-order-by-count)
***
