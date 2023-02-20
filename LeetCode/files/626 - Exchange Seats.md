# Description
- Write an SQL query to swap the seat id of every two consecutive students.
- If the number of students is odd, the id of the last student is not swapped.
- Return the result table ordered by id in ascending order.
```
Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation: 
Note that if the number of students is odd, there is no need to change the last one's seat.
```
***

## SQL schema
```sql
Create table If Not Exists Seat (id int, student varchar(255))
Truncate table Seat
insert into Seat (id, student) values ('1', 'Abbot')
insert into Seat (id, student) values ('2', 'Doris')
insert into Seat (id, student) values ('3', 'Emerson')
insert into Seat (id, student) values ('4', 'Green')
insert into Seat (id, student) values ('5', 'Jeames')
```

## SQL version
- MySQL
***

## Solution #1
- An SQL if statement has the following format:
```sql
IF( conditional statement, executes when condition is true , executes when condition is false)
```

```sql
SELECT  IF(id % 2 = 0 , 
           id-1 ,       
           # additional if statement when the first if is false
           IF(id != ( SELECT MAX(id) FROM SEAT ),id+1,id)
           ) AS id 
        ,student
    FROM SEAT
    ORDER BY id;
```
