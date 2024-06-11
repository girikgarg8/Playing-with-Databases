SHOW DATABASES;

USE SQL_COHORT;

CREATE TABLE EMPLOYEE(ID INT PRIMARY KEY,NAME VARCHAR(255),MANAGED_BY_ID INT);

INSERT INTO EMPLOYEE VALUES(1,'Girik',2);

INSERT INTO EMPLOYEE VALUES(2,'Sarvesh',3);

INSERT INTO EMPLOYEE VALUES(3,'Sanjay',4);

SELECT * FROM EMPLOYEE;

SELECT EMPLOYEE.NAME,EMPLOYEE1.NAME AS MANAGER FROM EMPLOYEE,EMPLOYEE AS EMPLOYEE1 WHERE EMPLOYEE.MANAGED_BY_ID = EMPLOYEE1.ID;

CREATE TABLE DEPT(ID INT PRIMARY KEY,NAME VARCHAR(255));

CREATE TABLE EMP(ID INT PRIMARY KEY,NAME VARCHAR(255),DEPT_ID INT);

INSERT INTO DEPT VALUES(1,'PTG');
INSERT INTO DEPT VALUES(2,'SBSEG');
INSERT INTO DEPT VALUES(3,'T4I');

INSERT INTO EMP VALUES(1,'Girik',1);
INSERT INTO EMP VALUES(2,'Nikhil',2);
INSERT INTO EMP VALUES(3,'Abhay',5);

SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT EMP.NAME,DEPT.NAME AS DEPT FROM EMP LEFT JOIN DEPT ON EMP.DEPT_ID = DEPT.ID;

SELECT EMP.NAME AS EMP_NAME ,DEPT.NAME AS DEPT_NAME FROM EMP RIGHT JOIN DEPT ON EMP.DEPT_ID = DEPT.ID;

/* SELECT EMP.NAME AS EMP_NAME,DEPT.NAME AS DEPT_NAME FROM EMP FULL JOIN DEPT ON EMP.DEPT_ID = DEPT.ID; Full Join is not implemented in MySQL yet. Can try this on LiveSQL though */

SELECT EMP.NAME,DEPT.NAME FROM EMP INNER JOIN DEPT ON EMP.DEPT_ID = DEPT.ID; 

SELECT EMP.NAME,DEPT.NAME FROM EMP CROSS JOIN DEPT;

CREATE DATABASE IF NOT EXISTS TEST_SQL_COHORT;

USE TEST_SQL_COHORT;

CREATE TABLE DEPT(ID INT PRIMARY KEY,NAME VARCHAR(255));

CREATE TABLE EMP(EMP_ID INT PRIMARY KEY,NAME VARCHAR(255),ID INT);

INSERT INTO DEPT VALUES(1,'PTG');
INSERT INTO DEPT VALUES(2,'SBSEG');
INSERT INTO DEPT VALUES(3,'T4I');

INSERT INTO EMP VALUES(1,'Girik',1);
INSERT INTO EMP VALUES(2,'Nikhil',2);
INSERT INTO EMP VALUES(3,'Abhay',5);

SELECT EMP.NAME,DEPT.NAME FROM EMP INNER JOIN DEPT USING(ID);

USE SQL_COHORT;

SHOW TABLES;

DESC EMP;

SELECT * FROM EMP WHERE DEPT_ID = 2 UNION SELECT * FROM EMP WHERE NAME = 'Girik'; 

SELECT * FROM EMP WHERE DEPT_ID = 1 UNION ALL SELECT * FROM EMP WHERE NAME = 'Girik'; 

/* 
 MINUS and INTERSECT are not supported in MySQL, but are supported in Oracle SQL.

 SELECT * FROM EMP WHERE DEPT_ID = 1 INTERSECT SELECT * FROM EMP WHERE NAME = 'Girik';

 SELECT * FROM EMP WHERE DEPT_ID = 2 MINUS SELECT * FROM EMP WHERE NAME = 'Girik';
 */
 
 USE TEST_SQL_COHORT;
 
 DESC DEPT;
 
ALTER TABLE DEPT RENAME COLUMN NAME TO DEPT_NAME;
 
SELECT * FROM EMP NATURAL JOIN DEPT;