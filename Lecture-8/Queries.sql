USE CLASSICMODELS;

SHOW TABLES;

SELECT * FROM CUSTOMERS;

DESC CUSTOMERS;

DESC ORDERS;

DESC ORDERDETAILS;

DESC PRODUCTS;

SELECT * FROM ORDERDETAILS;

SELECT * FROM ORDERDETAILS INNER JOIN PRODUCTS 
ON ORDERDETAILS.PRODUCTCODE = PRODUCTS.PRODUCTCODE;

SELECT * FROM ORDERDETAILS INNER JOIN PRODUCTS 
ON ORDERDETAILS.PRODUCTCODE = PRODUCTS.PRODUCTCODE 
WHERE ORDERDETAILS.ORDERNUMBER = '10101';  

SELECT * FROM ORDERS INNER JOIN ORDERDETAILS
ON ORDERS.ORDERNUMBER = ORDERDETAILS.ORDERNUMBER 
INNER JOIN PRODUCTS ON ORDERDETAILS.PRODUCTCODE = PRODUCTS.PRODUCTCODE;

SELECT ORDERS.ORDERNUMBER,PRODUCTS.PRODUCTNAME,PRODUCTS.PRODUCTLINE,ORDERDETAILS.QUANTITYORDERED,ORDERS.ORDERDATE,ORDERS.STATUS FROM ORDERS INNER JOIN ORDERDETAILS
ON ORDERS.ORDERNUMBER = ORDERDETAILS.ORDERNUMBER 
INNER JOIN PRODUCTS ON ORDERDETAILS.PRODUCTCODE = PRODUCTS.PRODUCTCODE;

SELECT ORDERNUMBER, ORDERDATE FROM ORDERS
UNION
SELECT ORDERNUMBER, PRODUCTCODE FROM ORDERDETAILS; /*For UNION, we need same number of columns from the result sets of both the SELECT queries. 
In this case, the orderNumber, orderDate from orders table is combined with the orderNumber,productCode from orderDetails table under the same column names orderNumber,orderDate
*/

CREATE OR REPLACE VIEW OrderProductView AS 
SELECT ORDERS.ORDERNUMBER,PRODUCTS.PRODUCTNAME,PRODUCTS.PRODUCTLINE,ORDERDETAILS.QUANTITYORDERED,ORDERS.ORDERDATE,ORDERS.STATUS FROM ORDERS INNER JOIN ORDERDETAILS
ON ORDERS.ORDERNUMBER = ORDERDETAILS.ORDERNUMBER 
INNER JOIN PRODUCTS ON ORDERDETAILS.PRODUCTCODE = PRODUCTS.PRODUCTCODE WHERE ORDERS.ORDERNUMBER = '10101'; /* Creates a new view, if it doesn't exist already. Replaces the view if it exists already */

SELECT * FROM ORDERPRODUCTVIEW;

UPDATE OrderProductView SET QUANTITYORDERED = 100 WHERE ORDERNUMBER = '10101' AND PRODUCTNAME = '1938 Cadillac V-16 Presidential Limousine';

SELECT * FROM ORDERPRODUCTVIEW;

SELECT * FROM ORDERS INNER JOIN ORDERDETAILS ON ORDERS.ORDERNUMBER = ORDERDETAILS.ORDERNUMBER WHERE ORDERS.ORDERNUMBER = '10101';

/* If the data is updated in the table, it will reflect in the view as well. Hence, it works both ways - update in table will reflect in view and update in view will reflect in table */

DELIMITER $
CREATE PROCEDURE passingOrderNumberToOrderAndCounting(IN orderNo VARCHAR(255), OUT cnt int)
BEGIN
	SELECT COUNT(*) INTO CNT FROM ORDERS WHERE ORDERNUMBER = orderNo;
END $
DELIMITER ;

CALL passingOrderNumberToOrderAndCounting('10101',@cnt);

SELECT @cnt;

/* Let's take a deep dive into the procedure above and understand the different concepts 
	We are creating a procedure named passingOrderNumberToOrderAndCounting which takes two parameters - orderNumber and cnt

	orderNo is an IN parameter which means that its value is passed into the stored procedure.

	cnt is an OUT parameter which means that its value is returned to the caller.

	Inside the procedure, we get the count of orders where OrderNumber = orderNumber and assign it into cnt parameter.

	The procedure is then called using the arguments '10101' and @cnt respectively.
    
    @cnt is a session variable in MySQL which can be initialized in the session and persists its value until the session ends. 
    
    Here, session refers to the database connection.

	Also, the delimiter is changed to $ to enable the entire definition to be passed to the server as a single statement, and then restored to ; before invoking the procedure. 
    
    This enables the ; delimiter used in the procedure body to be passed through to the server rather than being interpreted by MySQL itself.
*/

/* Using loops in SQL */

DELIMITER $
CREATE PROCEDURE PROC()
BEGIN
	DECLARE X INT;
    SET X = 1;
    WHILE X <=5 DO
		SELECT X;
        SET X = X+1;
	END WHILE;
END $
DELIMITER ;

CALL PROC();


SET @log = "";

DELIMITER $
CREATE TRIGGER LOGGER
BEFORE INSERT ON PRODUCTS
FOR EACH ROW
	SET @log = "adding new product";
$
DELIMITER ;


/* Here, we are creating a trigger named logger which is fired before insert event in products table. 
This is a row based trigger which sets the session variable to "adding new product" for every row in the insert operation. */

DESC PRODUCTS;

SELECT DISTINCT(PRODUCTLINE) FROM PRODUCTS;

INSERT INTO PRODUCTS VALUES('A320','Airbus A320','Planes','Big','Airbus','Airbus Plane',100,1000000,1000000);
SELECT @log;

/* Let's create another trigger, wherein the MSRP of every newly inserted row will be set to 1000 */

DELIMITER $
CREATE TRIGGER setPrice
BEFORE INSERT ON Products
FOR EACH ROW 
	SET NEW.MSRP = 1000;
$
DELIMITER ;

INSERT INTO PRODUCTS VALUES('B767','Boeing 767','Planes','Big','Boeing','Boeing Airplane',100,1000000,1000000);

SELECT MSRP FROM PRODUCTS WHERE PRODUCTCODE = 'B767';

SHOW TRIGGERS; /* Shows all the triggers' details*/

SHOW PROCEDURE STATUS WHERE DB = 'classicmodels'; /* Shows details of all the stored procedures in the database */