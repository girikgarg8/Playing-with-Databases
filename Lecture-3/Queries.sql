SHOW DATABASES;

USE SQL_COHORT;

SHOW TABLES;

SELECT * FROM SECOND;

ALTER TABLE SECOND ADD CONSTRAINT PRIMARY KEY (NAME); /* This is done to avoid the warning of using DELETE on a non key COLUMN */

DESC SECOND;

DELETE FROM SECOND WHERE NAME='Arun'; /* Beware- using DELETE without WHERE will delete all the rows ! */

DELETE FROM SECOND WHERE NAME LIKE '%i%' ORDER BY NAME LIMIT 1; /* Here, all the records which have 'i' in the name will be sorted in ascending order and only the row(s) with limit 1 will be deleted */

/* Offset describes how many rows in the table to skip, while limit describes how many rows to display. Real life usecase of limit and offset: pagination implemented in search engines. The API sends a subset of the data described by the limit, and as we switch between different pages, the offset value changes. */

SELECT * FROM SECOND;

UPDATE SECOND SET DOB='1994-10-08' WHERE NAME='Nikhil'; /* Caution: Using the UPDATE statement without the WHERE clause will update all the rows !*/

SELECT * FROM SECOND;

ALTER TABLE SECOND ADD COLUMN PHONE_NUMBER INT; /* Adding a new column to the table */

DESC SECOND; 

ALTER TABLE SECOND MODIFY COLUMN NAME VARCHAR(255);			/* Modifying datatype of existing column of table */

DESC SECOND;

ALTER TABLE SECOND RENAME COLUMN PHONE_NUMBER TO PHONE_NO;   /* Renaming an existing column of the table */

DESC SECOND; 

ALTER TABLE SECOND ADD COLUMN EMAIL_ID VARCHAR(255) AFTER GENDER; /* Specifying the order of insertion of new column i.e. the column EMAIL_ID should be inserted after the column GENDER */

DESC SECOND;

ALTER TABLE SECOND DROP COLUMN EMAIL_ID; /* Dropping a column from the table */

DESC SECOND;

SELECT NAME,DOB AS DATE_OF_BIRTH FROM SECOND; /* Using a column alias, it displays the column as DATE_OF_BIRTH in the output */

SELECT CONCAT (NAME,' ',DOB) AS INFO FROM SECOND; /* Concatenation of columns and aliasing them */

SELECT CONCAT('Hello',' ','World') AS TXT from DUAL; /* Concatenation of strings*/

INSERT INTO SECOND VALUES('Girik','1994-10-08','Male',9988);

SELECT DISTINCT DOB FROM SECOND; /* In order to print the distinct values of DOB from the table */

SELECT COUNT(*)  AS COUNT FROM SECOND; /* Prints the total count of rows in the table */

SELECT COUNT(DISTINCT DOB) AS DISTINCT_DOB_COUNT FROM SECOND; /* Prints the count of distinct DOB in the table */

SELECT COUNT(*) AS COUNT FROM SECOND WHERE Gender='Male'; /* Printing the count of rows which satisfy some condition */

ALTER TABLE SECOND ADD COLUMN MARKS INT DEFAULT 99;

SELECT SUM(MARKS) AS 'Sum of Marks' FROM SECOND; /* Using the SUM aggregate function, aggregate functions are the functions like MIN, MAX, SUM, COUNT etc which perform calculation on set of values and return a single value  */

SELECT SUM(MARKS) AS 'Sum of Marks' FROM SECOND WHERE DOB = '2000-02-02'; /* Using aggregate function along with WHERE claue to filter based on criteria */

SELECT AVG(MARKS) AS 'Average Marks' FROM SECOND;

SELECT MIN(MARKS) AS 'Minimum Marks' FROM SECOND;

SELECT MAX(MARKS) AS 'Maximum Marks' from SECOND;

/* GROUP BY clause in SQL - this clause is often used with aggregate queries for grouping rows based on the value of some column 
It's important to understand that we can't use SELECT * while using GROUP BY clause: let's understand why.
Consider an table EMP with the attributes ID, EMP_NAME, SALARY, DEPT_NAME : now if we group by department name, the department name 'HR' or 'Engineering' would not have an ID or EMP_NAME attribute
hence we cannot select all the columns from the table.
*/

SELECT DOB, SUM(MARKS) FROM SECOND GROUP BY DOB; /* This query groups all the records by their DOB, and then prints every group of DOB along with sum of marks for each group */

SELECT DOB,COUNT(*) AS COUNT FROM SECOND GROUP BY DOB; /* This query is used to group the records by the DOB, and print each group along with the count of records in the group */

SELECT DOB, COUNT(DISTINCT NAME) FROM SECOND GROUP BY DOB; /*This query is used to group the records by DOB, and get the count of unique records within each group. The NAME column is used as unique attribute here */

/* Having clause in SQL : HAVING clause is used to filter groups based on some condition on aggregate values. 
As an example, we can find out the maximum salary department-wise using the EMP table.
Now, if we further, list those departments where maximum salary>x, we can use HAVING clause

The complete query would be as follows: SELECT DEPT,MAX(SALARY) FROM EMP GROUP BY DEPT HAVING MAX(SALARY)>10000 ;
*/

SELECT DOB,AVG(MARKS) FROM SECOND GROUP BY DOB HAVING AVG(MARKS)>=99;