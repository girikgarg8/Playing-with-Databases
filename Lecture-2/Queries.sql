SHOW DATABASES; /* Show the list of all databases */

CREATE DATABASE IF NOT EXISTS SQL_COHORT; /* Create the database, if it does not already exist */

USE SQL_COHORT; /* Use this database */

SHOW TABLES; /* Show the tables in the current database */

CREATE TABLE IF NOT EXISTS FIRST (NAME VARCHAR(15), DOB DATE, SALARY INT); /* Create a new table within the current database, along with the required attributes */

DESC FIRST; /* Describe the schmea of the table, as in the columns, their dataypes, the constraints (if any) etc. */

INSERT INTO FIRST VALUES('GIRIK','2002-08-19',20000);

INSERT INTO FIRST(NAME,DOB) VALUES('Nikhil','1994-10-08'); /* Specify the columns which need to be inserted, along with their values */

SELECT * FROM FIRST; /* Display all the rows from the table, with all columns */

SELECT NAME,DOB FROM FIRST; /* Display specific columns only from the table */

CREATE TABLE IF NOT EXISTS SECOND(NAME VARCHAR(15) NOT NULL,DOB DATE DEFAULT '2000-01-01',GENDER ENUM ('Male','Female','Other')); /* Specifying constraints like NOT NULL and DEFAULT constraint,
 also using the ENUM datatype
 */

SHOW TABLES;

DESC SECOND;

INSERT INTO SECOND(NAME,GENDER) VALUES ('Girik','Male');

INSERT INTO SECOND VALUES ('Nikhil',DEFAULT,'Male');

SELECT * FROM SECOND;

/* INSERT INTO SECOND VALUES('Random',DEFAULT, 'Random'); Throws an error because of enum data type being used for gender */

INSERT INTO SECOND VALUES ('Arun','2000-01-01','Male'), ('Aman','2000-02-02','Male'); /* Bulk insertion of rows, comma separated in the INSERT command */

SELECT * FROM SECOND;

SELECT * FROM SECOND WHERE GENDER='Male'; /*Using the WHERE clause to filter rows based on some conditions*/

SELECT * FROM SECOND WHERE DOB>'2000-01-01' AND GENDER='Male'; /* Using combination of conditions */

SELECT * FROM SECOND WHERE DOB>'2000-01-01' OR GENDER='Male'; /* Using combination of conditions */

SELECT * FROM SECOND WHERE NAME LIKE 'Giri_'; /* Wildcard for a single character */

SELECT * FROM SECOND WHERE NAME LIKE 'Gir%'; /* Wildcard for zero or more characters */

SELECT * FROM SECOND WHERE NAME LIKE '%n'; /* Wildcards can be used at any place in the string */

SELECT * FROM SECOND WHERE GENDER LIKE '%a%'; /* Any record that has 'a' in gender will be reported */

SELECT * FROM SECOND WHERE GENDER LIKE '_a%'; /* Any record that has 'a' as the second character in gender will be reported */

SELECT * FROM SECOND WHERE GENDER <> 'Female'; /* Not equal operator */

SELECT * FROM SECOND WHERE NOT GENDER = 'Female'; /* Another way to use negation operator */

SELECT * FROM SECOND ORDER BY DOB ASC, NAME DESC; /* Getting records sorted in ascending order of dates. If dates are same, use descending order of name */

SELECT * FROM SECOND ORDER BY DOB ASC LIMIT 5; /* Getting the five least values by DOB from the table */

SELECT * FROM SECOND WHERE GENDER='Male' ORDER BY DOB ASC LIMIT 2; /* Get the two youngest male employees */