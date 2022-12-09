# Description
- Write an SQL query to report all customers who never order anything.
- Return the result table in any order.
- The query result format is in the following example.

```
Example 1:

Input: 
Customers table:
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Orders table:
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Output: 
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
```
***

# SQL Schema
```
Create table If Not Exists Customers (id int, name varchar(255))
Create table If Not Exists Orders (id int, customerId int)
Truncate table Customers
insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')
Truncate table Orders
insert into Orders (id, customerId) values ('1', '3')
insert into Orders (id, customerId) values ('2', '1')
```
***

# SQL version
- MySQL
***

# How LEFT JOIN works
- In some databases `LEFT JOIN` is called `LEFT OUTER JOIN`.
- This query show what is returned and if there is no value exist in second table then it inserts null value in that column. 
```
SELECT * FROM Customers
LEFT JOIN Orders 
ON Customers.id = Orders.customerId;

| id | name  | id | customerId |
| -- | ----- | -- | ---------- |
| 1  | Joe   | 2  | 1          |
| 2  | Henry |    |            |
| 3  | Sam   | 1  | 3          |
| 4  | Max   |    |            |
```
<img width="266" alt="image" src="https://user-images.githubusercontent.com/89139139/206686205-b6a84382-bca9-4926-8a2d-29fd36c3fa26.png">

***

# Solution #1
```
SELECT name as Customers FROM Customers c1
LEFT JOIN Orders o1 
ON c1.id = o1.customerId WHERE o1.id is NULL;
```
***
