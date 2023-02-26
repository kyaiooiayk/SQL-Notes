# Description
- Write an SQL query to find all numbers that appear at least three times consecutively.
- Return the result table in any order.
```
Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.
```
***

## SQL schema
```sql
Create table If Not Exists Logs (id int, num int)
Truncate table Logs
insert into Logs (id, num) values ('1', '1')
insert into Logs (id, num) values ('2', '1')
insert into Logs (id, num) values ('3', '1')
insert into Logs (id, num) values ('4', '2')
insert into Logs (id, num) values ('5', '1')
insert into Logs (id, num) values ('6', '2')
insert into Logs (id, num) values ('7', '2')
```
***

## SQL type
- MySQL
***

## Solution #1
- By joining the table Logs with itself three times, using aliases l1, l2, and l3. We then check that l1.num = l2.num and l2.num = l3.num, meaning that the number in the num column appears at least three times consecutively. 
- We select the num column from the first copy of the table and use the DISTINCT keyword to remove duplicates.
```sql
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs AS l1
JOIN Logs AS l2 ON l1.id = l2.id - 1
JOIN Logs AS l3 ON l1.id = l3.id - 2
WHERE l1.num = l2.num AND l2.num = l3.num;
```

## Step-by-step solution
- This code:
```sql
SELECT * 
FROM Logs AS l1
JOIN Logs AS l2 ON l1.id = l2.id - 1
JOIN Logs AS l3 ON l1.id = l3.id - 2
```
would output:
```
| id | num | id | num |
| -- | --- | -- | --- |
| 1  | 1   | 2  | 1   |
| 2  | 1   | 3  | 1   |
| 3  | 1   | 4  | 2   |
| 4  | 2   | 5  | 1   |
| 5  | 1   | 6  | 2   |
| 6  | 2   | 7  | 2   |
```
- This code:
```sql
SELECT *
FROM Logs AS l1
JOIN Logs AS l2 ON l1.id = l2.id - 1
JOIN Logs AS l3 ON l1.id = l3.id - 2
```
would output:
```
| id | num | id | num | id | num |
| -- | --- | -- | --- | -- | --- |
| 1  | 1   | 2  | 1   | 3  | 1   |
| 2  | 1   | 3  | 1   | 4  | 2   |
| 3  | 1   | 4  | 2   | 5  | 1   |
| 4  | 2   | 5  | 1   | 6  | 2   |
| 5  | 1   | 6  | 2   | 7  | 2   |
```
- This code:
```sql
SELECT * 
FROM Logs AS l1
JOIN Logs AS l2 ON l1.id = l2.id - 1
JOIN Logs AS l3 ON l1.id = l3.id - 2
WHERE l1.num = l2.num AND l2.num = l3.num
```
would output:
```
| id | num | id | num | id | num |
| -- | --- | -- | --- | -- | --- |
| 1  | 1   | 2  | 1   | 3  | 1   |
```
- This code:
```sql
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs AS l1
JOIN Logs AS l2 ON l1.id = l2.id - 1
JOIN Logs AS l3 ON l1.id = l3.id - 2
WHERE l1.num = l2.num AND l2.num = l3.num
```
would output:
```
| ConsecutiveNums |
| --------------- |
| 1               |
```
***
