## Joins and Triggers

For the sake of this lecture, we can use the sample database data from [here](https://github.com/hhorak/mysql-sample-db/blob/master/mysqlsampledatabase.sql)

Talking about the database, we have Orders, Products and OrderDetails table. There is a many to many mapping between Orders and Products tables, as one order can have multiple products and one product can be associated with multiple orders. OrderDetails table acts as the join table for the many to many mapping between Orders and Products table. The columns OrderNumber and ProductCode in the OrderDetails tables are the foreign keys which reference the primary keys OrderNumber and ProductCode of the Orders and Products table respectively. The OrderDetails table has a composite key composed of the OrderNumber and ProductCode attributes.

Let's say, we have a use case where we want to show the order details along with the product details for each order. For doing this, we'll have to use a join between orderDetails and products table as the order and product details are present in different tables.

Let's understand how we can join more than 2 tables, and also understand how the SQL query works :

Let's consider a usecase where we want to show the order details, along with the product details which are a part of the order. To do this, we'll need to join three tables : Orders, OrderDetails and Products. We can do this with the following SQL query:

```
SELECT * FROM ORDERS INNER JOIN ORDERDETAILS ON ORDERS.ORDERNUMBER = ORDERDETAILS.ORDERNUMBER INNER JOIN PRODUCTS ON ORDERDETAILS.PRODUCTCODE = PRODUCTS.PRODUCTCODE 
```

In the SQL query above, firstly the join is computed between OrderDetails and Orders table using the OrderNumber column. Further, a join is computed between the table obtained in the previous step and Products using ProductCode column.

**Difference between Union and Joins**

Many people confuse between the two.
Union is used to combine the result set of two or more different SELECT queries, whereas a JOIN clause is used to combine rows from two or more tables, based on a related column between them. See the SQL file for more details.

**What is a view in SQL?**

A view is a virtual table based on the result set of a SQL statement. Following are some usecases for SQL Views:

1. Encapsulation of logic: When dealing with complex queries involving multiple tables, joins, aggregations etc, the SQL code can become lengthy and hard to manage. Views abstract out these details and present users with a simple view of the data.

2. Code Reusability and Performance: 
If there is a complex query that needs to be used in multiple parts of application or by multiple users, views can be helpful as they allow to write the complex query once and reference at different places. This promotes code reusability and also helps optimize performance due to precomputation.

3. Security: Column Level and Row Level : There can be certain columns or rows in a table which are sensitive or confidential in nature. By using views, we can enforce row or column level security and prevent unauthorized access to data.

4. Masking Sensitive Data: In some cases, we might want to show the data but mask certain parts of it, such as hiding parts of a credit card number. Views can be used to apply data masking rules, displaying altered or masked data to users while preserving the original data in the database.

Myth Buster: A view is read-only in nature. Views can be read-only or updatable, depending on the constraints enforced while creating it.

Note: Any update made to an updatable view will also update the data in the source table.

Stored Procedures in SQL: A SQL stored procedure a group of pre-compiled SQL statements that is stored in the database. The stored procedure can be called at multiple places and reused. For examples, refer the SQL file.

Note: The concept of stored procedures is used in production databases as well.

Let's understand about triggers in databases:

Trigger is a set of procedural statements which are automatically executed in response to certain events on database. Triggers can be said to be a special kind of stored procedure, which are invoked in response to database events.

In general, there are different types of triggers in databases, such as DDL triggers (triggers which are fired in response to DDL events such as CREATE, DROP etc), DML triggers (triggers which are fired in response to DML events such as UPDATE, DELETE, INSERT), logon triggers(triggers which are fired in response to a LOGON event, i.e. the user session is established with the SQL Server), logoff trigger (trigger fired in response to a LOGOFF event).

The specific triggers supported by the RDBMS can differ. MySQL, as an example, provides only DML and logon triggers, whereas DDL and logoff triggers are not supported.

Let's deep dive into DML triggers in MySQL:

[Reference article](https://www.javatpoint.com/mysql-trigger)

1. Row Level Trigger: Row Level trigger is a type of trigger which is activated for each row by a triggering statement such as INSERT, UPDATE or DELETE. For example, if a table has inserted, updated or deleted multiple rows,the row trigger is fired for each row affected by the statement. 

2. Statement Level Trigger: This is a type of trigger which is fired once for every database event regardless of how many rows are inserted, updated or deleted.

DML Triggers can be classified based on two criteria: the timing (before or after the DML event is fired), and the type of event (INSERT, UPDATE or DELETE). Hence, in total there are 2 * 3 = 6 types of DML triggers in MySQL. 

For RDBMS that support statement level triggers as well, there would be 2 * 3 * 2 = 12 types of DML triggers.

Note: MySQL only supports row level triggers, and doesn't support statement level triggers.

[Documentation for OLD and NEW keywords in MySQL Triggers](https://dev.mysql.com/doc/refman/8.4/en/trigger-syntax.html#:~:text=Within%20the%20trigger%20body%2C%20the,there%20is%20no%20old%20row.) 

In a backend application, we might need to create triggers directly in SQL, since ORMs provide functionality to create them. As an example, Sequelize ORM has hooks which allows to create different types of triggers.

For examples of triggers, please see the attached SQL file.

All the SQL queries from the lecture are attached in the SQL file.