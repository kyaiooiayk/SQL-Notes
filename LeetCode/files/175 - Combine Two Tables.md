# Description
- Write an SQL query to report the first name, last name, city, and state of each person in the Person table. 
- If the address of a personId is not present in the Address table, report null instead.
- Return the result table in any order.
***

# SQL schema
```
Create table If Not Exists Person (personId int, firstName varchar(255), lastName varchar(255))
Create table If Not Exists Address (addressId int, personId int, city varchar(255), state varchar(255))
Truncate table Person
insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen')
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob')
Truncate table Address
insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York')
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')
```
***

# SQL version
- MySQL
***

# Solution #1
```
SELECT firstName, lastName, city, state FROM Person
LEFT JOIN Address
ON Address.personId = Person.personId;
```
***