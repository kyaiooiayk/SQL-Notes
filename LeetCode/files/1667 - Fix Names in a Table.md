# Description
- Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.
- Return the result table ordered by user_id.

```
Input: 
Users table:
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | aLice |
| 2       | bOB   |
+---------+-------+
Output: 
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | Alice |
| 2       | Bob   |
+---------+-------+
```
***

## SQL schema
```sql
Create table If Not Exists Users (user_id int, name varchar(40))
Truncate table Users
insert into Users (user_id, name) values ('1', 'aLice')
insert into Users (user_id, name) values ('2', 'bOB')
```

***
## SQL type
- MySQL
***

## Solution #1
- `UPPER()` upper the character
- `LOWER()` lower the character
- `SUBSTR(A,index,length)` where A is string index is starting index(1 index insead of 0 index) and length which is optional. So to get first letter we can use SUBSTR(name,1,1). To get the remaining string we can use SUBSTR(name,2) // length is not required here
- `CONCAT(A,B)` where we concat two strings A+B

```sql
SELECT user_id,
CONCAT(UPPER(SUBSTR(name,1,1)),LOWER(SUBSTR(name,2,length(name)))) AS name 
FROM Users
ORDER BY user_id
```
***
