# SQL
*List of notebooks/cheatsheets and more focused on SQL*
***

##  ACID
- ACID is an acronym for four interdependent properties: Atomicity, Consistency, Isolation, and Durability. Much of the architecture of any modern relational database is founded on these properties. Understanding the ACID properties of a transaction is a prerequisite for understanding many facets of SQL Server.
  - **Atomic** – Transaction acting on several pieces of information complete only if all pieces successfully save.   Here, “all or nothing” applies to the transaction.
  - **Consistent** – The saved data cannot violate the integrity of the database.
  - **Isolation** – No other transactions take place and affect the transaction in question.   This prevents “mid-air collisions.”
  - **Durable** – System failures or restarts do not affect committed transactions.
***

## Normalisation
- Normalisation is the process to eliminate data redundancy and enhance data integrity in the table. Normalization also helps to organize the data in the database. It is a multi-step process that sets the data into tabular form and removes the duplicated data from the relational tables.
- Normalisation organises the columns and tables of a database to ensure that database integrity constraints properly execute their dependencies. It is a systematic technique of decomposing tables to eliminate data redundancy (repetition) and undesirable characteristics like Insertion, Update, and Deletion anomalies.
***

## A note on the notebook rendering
Each notebook has two versions (all python scripts are unaffected by this):
- One where all the markdown comments are rendered in black and white. These are placed in the folder named `GitHub_MD_rendering` where MD stands for MarkDown.
- One where all the markdown comments are rendered in coloured.
***

## Where to practice
- [www.w3schools.com](https://www.w3schools.com/sql/default.asp) has some very nice tutorials where you can also try out your code in an interpreter running on their web browser. 
- w3schools offere a [live SQL server](https://www.w3schools.com/sql/trysqlserver.asp?filename=trysql_func_sqlserver_difference) with some tables available. Probably the easiest, cheapest and quickiest way to start practicing SQL queries.
- [leetcode](https://leetcode.com/) also allows you to try out some problem directly on your browser.
***

## How to run SQL queries from your jupyter notebook?
- [JupySQL: Better SQL in Jupyter](https://ploomber.io/blog/jupysql/?utm_source=substack&utm_medium=email)
***

## How many versions?
- `MySQL` is an open-source relational database system.
- `Oracle SQL` is also a relational database system but it's not open-source.
- `PostgreSQL` is an open-source, object-relational database management system. It is fully SQL-compliant and was built to be feature-rich.
***

## How to optimise your SQL queries
- In big data analytics, using a subquery is not efficient to process millions of rows of data. Using `joins` would be a better approach as most RDBMS's are optimized for joins.
***

## Other resources
- [The Not-so-Sexy SQL Concepts to Make You Stand Out](https://www.kdnuggets.com/2022/02/not-so-sexy-sql-concepts-stand-out.html)
- https://www.kdnuggets.com/2021/10/data-science-sql-interview-questions.html
- https://e2eml.school/sql_resources.html
- https://realpython.com/pandas-groupby/
- https://github.com/imrankhan17/apprentices-training/tree/master/session3
- [MySQL vs Oracle SQL](https://towardsdatascience.com/mysql-vs-oracle-sql-a97a7659f992)
- [PostgreSQL vs MySQL: Explore Their 12 Critical Differences](https://kinsta.com/blog/postgresql-vs-mysql/)
***
