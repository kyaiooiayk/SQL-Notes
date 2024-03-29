# List of common SQL query statement
- The following SQL statements are a list of common actions you may want to do in a database.
- A simple `control+find and keyword` would be enough to find what you are looking for.
***

## Database creation
- The following SQL statement creates a database called "testDB":
```sql
CREATE DATABASE testDB;
```
***
- The BACKUP DATABASE statement is used in SQL Server to create a full back up of an existing SQL database.
```sql
BACKUP DATABASE databasename
TO DISK = 'filepath';
```
***
- A differential back up only backs up the parts of the database that have changed since the last full database backup.
```sql
BACKUP DATABASE databasename
TO DISK = 'filepath'
WITH DIFFERENTIAL; 
```
***
- The following example creates a table called "Persons" that contains five columns: PersonID, LastName, FirstName, Address, and City:
```sql
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
```
***
- To add a column in a table, use the following syntax:
```sql
ALTER TABLE table_name
ADD column
_name datatype;
```
***
- The following SQL adds an "Email" column to the "Customers" table:
```sql
ALTER TABLE Customers
ADD Email varchar(255);
```
***
- The following example creates a table called "Persons" that contains : PersonID, LastName, FirstName, Address, and City. where the last columns will accept a NULL value which means no data is stored for those entries
```sql
CREATE TABLE Persons (
    PersonID int PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Address varchar(255) NULL,
    City varchar(255) NULL
);    
```
***

## Queries
```
Select all the records in the "Customers" table
    SELECT * FROM Customers;
```
***

```
Select the "CustomerName" and "City" columns from the "Customers" table
    SELECT CustomerName, City FROM Customers;
```
***

```
Select only the DISTINCT values from the "Country" column in the "Customers" table
    SELECT DISTINCT Country FROM Customers;
```
***

```
List the number of different (distinct) customer countries:
    SELECT COUNT(DISTINCT Country) FROM Customers;
```
***

```
Select all (*) the customers from the country "Mexico", in the "Customers" table:
    SELECT * FROM Customers
    WHERE Country='Mexico'; 
```
***

```
Select all fields from "Customers" where city is "Berlin" OR "München":
    WHERE City='Berlin' OR City='München';
```
***

```
Select all fields from "Customers" where country is NOT "Germany":
    SELECT * FROM Customers
    WHERE NOT Country='Germany';
```
***

```
Statement selects all fields from "Customers" where country is "Germany" AND 
city must be "Berlin" OR "München" 
    SELECT * FROM Customers
    WHERE Country='Germany' AND (City='Berlin' OR City='München');
```
***

```
Select all customers from the "Customers" table, sorted by the "Country" column:
    SELECT * FROM Customers
    ORDER BY Country;
```
***

```
Select all customers from the "Customers" table, sorted DESCENDING by the "Country" column:
    SELECT * FROM Customers
    ORDER BY Country DESC;
```
***

```
Select all customers from the "Customers" table, sorted by the "Country" and the "CustomerName" column. This means that it orders by Country, but if some rows have the same Country, it orders them by CustomerName:
    SELECT * FROM Customers
    ORDER BY Country, CustomerName; 
```
***

```
Select all customers from the "Customers" table, sorted ascending by the "Country" and descending by the "CustomerName" column:
    SELECT * FROM Customers
    ORDER BY Country ASC, CustomerName DESC;
```
***

```
Insert a new record in the "Customers" table:
    INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
    VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');
    
Alternative you can see this syntax but it is not suggested
    INSERT INTO Customers
    VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

```
***

```
Insert a new record, but only insert data in the "CustomerName", "City", and "Country" columns (CustomerID will be updated automatically)
    INSERT INTO Customers (CustomerName, City, Country)
    VALUES ('Cardinal', 'Stavanger', 'Norway');
```
***

```
List all customers with a NULL value in the "Address" field:
    SELECT CustomerName, ContactName, Address
    FROM Customers
    WHERE Address IS NULL;
```
***

```
The IS NOT NULL operator is used to test for non-empty values (NOT NULL values).
The following SQL lists all customers with a value in the "Address" field:
    SELECT CustomerName, ContactName, Address
    FROM Customers
    WHERE Address IS NOT NULL;
```
***

```
Updates the first customer (CustomerID = 1) with a new contact person and a new city.
    UPDATE Customers
    SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
    WHERE CustomerID = 1;
```
***

```
It is the WHERE clause that determines how many records will be updated.
Update the ContactName to "Juan" for all records where country is "Mexico":
Be careful when updating records. If you omit the WHERE clause, ALL records will be updated!
    UPDATE Customers
    SET ContactName='Juan'
    WHERE Country='Mexico';
```
***

```
Delete the customer "Alfreds Futterkiste" from the "Customers" table:
The WHERE clause specifies which record(s) should be deleted. If you omit
the WHERE clause, all records in the table will be deleted!
    DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';
```
***

```
Delete all rows in a table without deleting the table. This means that the table structure,
attributes, and indexes will be intact:
    DELETE FROM Customers;
```
***

```
Suppose you have to specify the number of records to return, because returning a large number of records can impact performance
SQL TOP, LIMIT, FETCH FIRST or ROWNUM Clause
see this link as every SQL language differes in the way this is implemented
https://www.w3schools.com/sql/sql_top.asp

Select all the records in the "Customers" table but limit the output to 5 records

Syntax for SQLite
    SELECT * FROM Customers LIMIT 5;
Syntax for Oracle
    SELECT * FROM Customers WHERE ROWNUM <=5;
Syntax for DB2
    SELECT * FROM Customers FETCH FIRST 5 ROWS ONLY;

```
***

```
Find the price of the cheapest product:
    SELECT MIN(Price) AS SmallestPrice
    FROM Products;
```
***

```
Find the price of the most expensive product:
    SELECT MAX(Price) AS LargestPrice
    FROM Products; 
```
***

```
Find the number of products:
    SELECT COUNT(ProductID)
    FROM Products;
```
***

```
Find the average price of all products:
    SELECT AVG(Price)
    FROM Products;
```
***

```
Sum of the "Quantity" fields in the "OrderDetails" table:
    SELECT SUM(Quantity)
    FROM OrderDetails;
```
***

```
Select all customers with a CustomerName starting with "a":
    SELECT * FROM Customers
    WHERE CustomerName LIKE 'a%'; 
```
***

```
Select all customers with a CustomerName ending with "a":
    SELECT * FROM Customers
    WHERE CustomerName LIKE '%a';
```
***

```
Select all customers with a CustomerName that have "or" in any position:
    SELECT * FROM Customers
    WHERE CustomerName LIKE '%or%';
```
***

```
Select all customers that are located in "Germany", "France" or "UK":
    SELECT * FROM Customers
    WHERE Country IN ('Germany', 'France', 'UK');
```
***

```
Select all customers that are from the same countries as the suppliers:
    SELECT * FROM Customers
    WHERE Country IN (SELECT Country FROM Suppliers);
```
***

```
Select all products with a price between 10 and 20:
    SELECT * FROM Products
    WHERE Price BETWEEN 10 AND 20;
```
***

```
Create two aliases, one for the CustomerID column and one for the CustomerName column:
Aliases are often used to make column names more readable.
An alias only exists for the duration of that query.
    SELECT CustomerID AS ID, CustomerName AS Customer
    FROM Customers; 
```
***

```
Notice that the "CustomerID" column in the "Orders" table refers to the "CustomerID" in the "Customers" table. The relationship between the two tables above is the "CustomerID" column.
Then, we can create the following SQL statement (that contains an INNER JOIN), that selects records that have matching values in both tables:
    SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
    FROM Orders
    INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
```
***

```
The following SQL statement returns the cities (only distinct values) from both the "Customers" and the "Suppliers" table:
    SELECT City FROM Customers
    UNION
    SELECT City FROM Suppliers
    ORDER BY City;
```
***

```
The following SQL statement returns the cities (duplicate values also) from both the "Customers" and the "Suppliers" table:
    SELECT City FROM Customers
    UNION ALL
    SELECT City FROM Suppliers
    ORDER BY City;
```
***

```
he following SQL statement returns the German cities (only distinct values) from both the "Customers" and the "Suppliers" table:
    SELECT City, Country FROM Customers
    WHERE Country='Germany'
    UNION
    SELECT City, Country FROM Suppliers
    WHERE Country='Germany'
    ORDER BY City;
```
***

```
The following SQL statement lists the number of customers in each country:
The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
    SELECT COUNT(CustomerID), Country
    FROM Customers
    GROUP BY Country;
```
***

```
The following SQL statement lists the number of customers in each country, sorted high to low:
    SELECT COUNT(CustomerID), Country
    FROM Customers
    GROUP BY Country
    ORDER BY COUNT(CustomerID) DESC;
```
***

```
The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
List the number of customers in each country. Only include countries with more than 5 customers:
    SELECT COUNT(CustomerID), Country
    FROM Customers
    GROUP BY Country
    HAVING COUNT(CustomerID) > 5;
```
***

```
List the number of customers in each country, sorted high to low (Only include countries with more than 5 customers):
    SELECT COUNT(CustomerID), Country
    FROM Customers
    GROUP BY Country
    HAVING COUNT(CustomerID) > 5
    ORDER BY COUNT(CustomerID) DESC;
```
***

```
The following SQL statement returns TRUE and lists the suppliers with a product price less than 20:
    SELECT SupplierName
    FROM Suppliers
    WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);
```
***

```
The following SQL statement lists the ProductName if it finds ANY records in the OrderDetails table has Quantity equal to 10
    SELECT ProductName
    FROM Products
    WHERE ProductID = ANY
      (SELECT ProductID
      FROM OrderDetails
      WHERE Quantity = 10); 
```
***

```
The following SQL statement creates a backup copy of Customers:
    SELECT * INTO CustomersBackup2017
    FROM Customers; 
```
***

```
The following SQL statement copies only the German customers into a new table:
    SELECT * INTO CustomersGermany
    FROM Customers
    WHERE Country = 'Germany'; 
```
***

```
The following SQL goes through conditions and returns a value when the first condition is met:
    SELECT OrderID, Quantity,
    CASE
        WHEN Quantity > 30 THEN 'The quantity is greater than 30'
        WHEN Quantity = 30 THEN 'The quantity is 30'
        ELSE 'The quantity is under 30'
    END AS QuantityText
    FROM OrderDetails;
```
***

```
The following SQL statement creates a stored procedure named "SelectAllCustomers" that selects all records from the "Customers" table:
    CREATE PROCEDURE SelectAllCustomers
    AS
    SELECT * FROM Customers
    GO;
Execute the stored procedure above as follows:
    EXEC SelectAllCustomers;
```
***

```
The following SQL statement creates a stored procedure that selects Customers from a particular City from the "Customers" table:
    CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
    AS
    SELECT * FROM Customers WHERE City = @City
    GO;
Execute the stored procedure above as follows:
    EXEC SelectAllCustomers @City = 'London'; 
```

## References
https://www.w3schools.com/sql/sql_syntax.asp             !
***
