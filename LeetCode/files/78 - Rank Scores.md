# Description
- Write an SQL query to rank the scores. The ranking should be calculated according to the following rules:
  - The scores should be ranked from the highest to the lowest.
  - If there is a tie between two scores, both should have the same ranking.
  - After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
- Return the result table ordered by score in descending order.

```
Input: 
Scores table:
+----+-------+
| id | score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+

Output: 
+-------+------+
| score | rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+
```
***

## SQL schema
```sql
Create table If Not Exists Scores (id int, score DECIMAL(3,2))
Truncate table Scores
insert into Scores (id, score) values ('1', '3.5')
insert into Scores (id, score) values ('2', '3.65')
insert into Scores (id, score) values ('3', '4.0')
insert into Scores (id, score) values ('4', '3.85')
insert into Scores (id, score) values ('5', '4.0')
insert into Scores (id, score) values ('6', '3.65')
```

## SQL version
- MySQL
***

## Solution #1
```sql
SELECT score, 
DENSE_RANK() over(ORDER BY score DESC) AS "rank"
FROM Scores
```
***
