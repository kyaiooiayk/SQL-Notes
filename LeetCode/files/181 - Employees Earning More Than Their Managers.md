# Description
- Write an SQL query to find the employees who earn more than their managers.
- Return the result table in any order.

```
Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.
```
***

## SQL schema
```sql
Create table If Not Exists Employee (id int, name varchar(255), salary int, managerId int)
Truncate table Employee
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', 'None')
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', 'None')
```
***

## SQL type
MySQL
***

## Solution
```sql
SELECT E1.Name AS Employee
FROM Employee AS E1, Employee AS E2 
WHERE E1.ManagerId = E2.Id AND E1.Salary > E2.Salary
```
***

## References
- [Leetcode](www.leetcode.com)
- [SQL aliases](https://www.w3schools.com/sql/sql_alias.asp)
***
