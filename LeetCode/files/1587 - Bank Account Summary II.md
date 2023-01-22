# Description
- Write an SQL query to report the name and balance of users with a balance higher than 10000.
- The balance of an account is equal to the sum of the amounts of all transactions involving that account.
- Return the result table in any order.
```
Input: 
Users table:
+------------+--------------+
| account    | name         |
+------------+--------------+
| 900001     | Alice        |
| 900002     | Bob          |
| 900003     | Charlie      |
+------------+--------------+
Transactions table:
+------------+------------+------------+---------------+
| trans_id   | account    | amount     | transacted_on |
+------------+------------+------------+---------------+
| 1          | 900001     | 7000       |  2020-08-01   |
| 2          | 900001     | 7000       |  2020-09-01   |
| 3          | 900001     | -3000      |  2020-09-02   |
| 4          | 900002     | 1000       |  2020-09-12   |
| 5          | 900003     | 6000       |  2020-08-07   |
| 6          | 900003     | 6000       |  2020-09-07   |
| 7          | 900003     | -4000      |  2020-09-11   |
+------------+------------+------------+---------------+
Output: 
+------------+------------+
| name       | balance    |
+------------+------------+
| Alice      | 11000      |
+------------+------------+
Explanation: 
Alice's balance is (7000 + 7000 - 3000) = 11000.
Bob's balance is 1000.
Charlie's balance is (6000 + 6000 - 4000) = 8000.

```
***

## SQL schema
```
Create table If Not Exists Users (account int, name varchar(20))
Create table If Not Exists Transactions (trans_id int, account int, amount int, transacted_on date)
Truncate table Users
insert into Users (account, name) values ('900001', 'Alice')
insert into Users (account, name) values ('900002', 'Bob')
insert into Users (account, name) values ('900003', 'Charlie')
Truncate table Transactions
insert into Transactions (trans_id, account, amount, transacted_on) values ('1', '900001', '7000', '2020-08-01')
insert into Transactions (trans_id, account, amount, transacted_on) values ('2', '900001', '7000', '2020-09-01')
insert into Transactions (trans_id, account, amount, transacted_on) values ('3', '900001', '-3000', '2020-09-02')
insert into Transactions (trans_id, account, amount, transacted_on) values ('4', '900002', '1000', '2020-09-12')
insert into Transactions (trans_id, account, amount, transacted_on) values ('5', '900003', '6000', '2020-08-07')
insert into Transactions (trans_id, account, amount, transacted_on) values ('6', '900003', '6000', '2020-09-07')
insert into Transactions (trans_id, account, amount, transacted_on) values ('7', '900003', '-4000', '2020-09-11')
```
***

## SQL type
- MySQL
***

## Solution #1
```
SELECT name, SUM(T.amount) as balance
FROM Users as U
LEFT JOIN Transactions as T
ON U.account = T.account
GROUP BY name HAVING balance >10000
```
***
