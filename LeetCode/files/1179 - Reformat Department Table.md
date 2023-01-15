# Description
- Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.
- Return the result table in any order.
```
Example 1:

Input: 
Department table:
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
| 1    | 8000    | Jan   |
| 2    | 9000    | Jan   |
| 3    | 10000   | Feb   |
| 1    | 7000    | Feb   |
| 1    | 6000    | Mar   |
+------+---------+-------+
Output: 
+------+-------------+-------------+-------------+-----+-------------+
| id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
+------+-------------+-------------+-------------+-----+-------------+
| 1    | 8000        | 7000        | 6000        | ... | null        |
| 2    | 9000        | null        | null        | ... | null        |
| 3    | null        | 10000       | null        | ... | null        |
+------+-------------+-------------+-------------+-----+-------------+
Explanation: The revenue from Apr to Dec is null.
Note that the result table has 13 columns (1 for the department id + 12 for the months).
```
***

## SQL schema
```
Create table If Not Exists Department (id int, revenue int, month varchar(5))
Truncate table Department
insert into Department (id, revenue, month) values ('1', '8000', 'Jan')
insert into Department (id, revenue, month) values ('2', '9000', 'Jan')
insert into Department (id, revenue, month) values ('3', '10000', 'Feb')
insert into Department (id, revenue, month) values ('1', '7000', 'Feb')
insert into Department (id, revenue, month) values ('1', '6000', 'Mar')
```
***

## SQL version
- MySQL
***

## Solution #1
```
SELECT id,
    sum(case `month` when 'Jan' then revenue end) as Jan_Revenue,
    sum(case `month` when 'Feb' then revenue end) as Feb_Revenue,
    sum(case `month` when 'Mar' then revenue end) as Mar_Revenue,
    sum(case `month` when 'Apr' then revenue end) as Apr_Revenue,
    sum(case `month` when 'May' then revenue end) as May_Revenue,
    sum(case `month` when 'Jun' then revenue end) as Jun_Revenue,
    sum(case `month` when 'Jul' then revenue end) as Jul_Revenue,
    sum(case `month` when 'Aug' then revenue end) as Aug_Revenue,
    sum(case `month` when 'Sep' then revenue end) as Sep_Revenue,
    sum(case `month` when 'Oct' then revenue end) as Oct_Revenue,
    sum(case `month` when 'Nov' then revenue end) as Nov_Revenue,
    sum(case `month` when 'Dec' then revenue end) as Dec_Revenue
FROM Department 
GROUP BY id;
```
***

## Solution #2
```
SELECT id,
       SUM(if(month = 'Jan', revenue, null)) AS Jan_Revenue,
       SUM(if(month = 'Feb', revenue, null)) AS Feb_Revenue,
       SUM(if(month = 'Mar', revenue, null)) AS Mar_Revenue,
       SUM(if(month = 'Apr', revenue, null)) AS Apr_Revenue,
       SUM(if(month = 'May', revenue, null)) AS May_Revenue,
       SUM(if(month = 'Jun', revenue, null)) AS Jun_Revenue,
       SUM(if(month = 'Jul', revenue, null)) AS Jul_Revenue,
       SUM(if(month = 'Aug', revenue, null)) AS Aug_Revenue,
       SUM(if(month = 'Sep', revenue, null)) AS Sep_Revenue,
       SUM(if(month = 'Oct', revenue, null)) AS Oct_Revenue,
       SUM(if(month = 'Nov', revenue, null)) AS Nov_Revenue,
       SUM(if(month = 'Dec', revenue, null)) AS Dec_Revenue
FROM Department
GROUP BY id
```
***
