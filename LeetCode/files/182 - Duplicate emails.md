# Description
- Write an SQL query to report all the duplicate emails.
- Return the result table in any order.
```Input: 
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
Output: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Explanation: a@b.com is repeated two times.
```
***

## SQL schema
```sql
Create table If Not Exists Person (id int, email varchar(255))
Truncate table Person
insert into Person (id, email) values ('1', 'a@b.com')
insert into Person (id, email) values ('2', 'c@d.com')
insert into Person (id, email) values ('3', 'a@b.com')
```
***

## SQL type
- MySQL
***

## Solution #1
```sql
SELECT Email
FROM Person
GROUP BY Email
HAVING count(Email) > 1
```
***
