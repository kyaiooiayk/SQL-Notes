# Description
- Write an SQL query that will, for each date_id and make_name, return the number of distinct lead_id's and distinct partner_id's.
- Return the result table in any order.
- The query result format is in the following example.
```
Input: 
DailySales table:
+-----------+-----------+---------+------------+
| date_id   | make_name | lead_id | partner_id |
+-----------+-----------+---------+------------+
| 2020-12-8 | toyota    | 0       | 1          |
| 2020-12-8 | toyota    | 1       | 0          |
| 2020-12-8 | toyota    | 1       | 2          |
| 2020-12-7 | toyota    | 0       | 2          |
| 2020-12-7 | toyota    | 0       | 1          |
| 2020-12-8 | honda     | 1       | 2          |
| 2020-12-8 | honda     | 2       | 1          |
| 2020-12-7 | honda     | 0       | 1          |
| 2020-12-7 | honda     | 1       | 2          |
| 2020-12-7 | honda     | 2       | 1          |
+-----------+-----------+---------+------------+
Output: 
+-----------+-----------+--------------+-----------------+
| date_id   | make_name | unique_leads | unique_partners |
+-----------+-----------+--------------+-----------------+
| 2020-12-8 | toyota    | 2            | 3               |
| 2020-12-7 | toyota    | 1            | 2               |
| 2020-12-8 | honda     | 2            | 2               |
| 2020-12-7 | honda     | 3            | 2               |
+-----------+-----------+--------------+-----------------+
Explanation: 
For 2020-12-8, toyota gets leads = [0, 1] and partners = [0, 1, 2] while honda gets leads = [1, 2] and partners = [1, 2].
For 2020-12-7, toyota gets leads = [0] and partners = [1, 2] while honda gets leads = [0, 1, 2] and partners = [1, 2].
```
***

## SQL schema
```
Create table If Not Exists DailySales(date_id date, make_name varchar(20), lead_id int, partner_id int)
Truncate table DailySales
insert into DailySales (date_id, make_name, lead_id, partner_id) values ('2020-12-8', 'toyota', '0', '1')
insert into DailySales (date_id, make_name, lead_id, partner_id) values ('2020-12-8', 'toyota', '1', '0')
insert into DailySales (date_id, make_name, lead_id, partner_id) values ('2020-12-8', 'toyota', '1', '2')
insert into DailySales (date_id, make_name, lead_id, partner_id) values ('2020-12-7', 'toyota', '0', '2')
insert into DailySales (date_id, make_name, lead_id, partner_id) values ('2020-12-7', 'toyota', '0', '1')
insert into DailySales (date_id, make_name, lead_id, partner_id) values ('2020-12-8', 'honda', '1', '2')
insert into DailySales (date_id, make_name, lead_id, partner_id) values ('2020-12-8', 'honda', '2', '1')
insert into DailySales (date_id, make_name, lead_id, partner_id) values ('2020-12-7', 'honda', '0', '1')
insert into DailySales (date_id, make_name, lead_id, partner_id) values ('2020-12-7', 'honda', '1', '2')
insert into DailySales (date_id, make_name, lead_id, partner_id) values ('2020-12-7', 'honda', '2', '1')
```
***

## SQL type
- MySQL
***

## Solution #1
```
SELECT date_id, make_name, COUNT(DISTINCT(partner_id)) AS unique_leads, COUNT(DISTINCT(lead_id)) AS unique_partners FROM DailySales
GROUP BY date_id, make_name
```
***