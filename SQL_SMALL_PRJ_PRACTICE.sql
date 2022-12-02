CREATE DATABASE IF NOT EXISTS ORG;
USE ORG;

CREATE TABLE EMP(
EMP_ID INT PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME VARCHAR(20),
LAST_NAME VARCHAR(20),
JOINING_DATE DATETIME,
SALARY INT(10),
DEPARTMENT VARCHAR(20)
);

INSERT INTO EMP  VALUES 
(001, 'SACHIN','MEHTA' ,'14-2-20 9.00.00', 1000 ,'HR'), 
(002,'JAY','MEHTA','14-2-20 9.00.00',1000,'TECH'), 
(003,'KARAN','MEHTA','14-2-20 9.00.00',1000,'ADMIN'), 
(004,'MAM','MEHTA','14-2-20 9.00.00',100,'HR'), 
(005,'JINAL','MEHTA','14-2-20 9.00.00',100,'HR'),
(006,'KP','MEHTA','14-2-20 9.00.00',52000,'TECH'); 

CREATE TABLE BONUS(
EMP_REF_ID INT,
BONUS_AMOUNT INT(10),
FOREIGN KEY(EMP_REF_ID)
REFERENCES EMP(EMP_ID)
ON DELETE SET NULL
);

INSERT INTO BONUS 
VALUES(001,1000),
(002,3000),
(003,4000),
(004,6000),
(005,8000);

CREATE TABLE TITLE(
EMP_REF_ID INT,
EMP_TITLE VARCHAR(25),
FOREIGN KEY(EMP_REF_ID)
REFERENCES EMP(EMP_ID)
ON DELETE SET NULL
);

INSERT INTO TITLE VALUES(001,'EMP01'),
(002,'EMP02'),
(003,'EMP03'),
(004,'EMP04'),
(005,'EMP05');

#used select statment here
SELECT * FROM EMP;
SELECT SALARY FROM EMP; 
SELECT FIRST_NAME,SALARY FROM EMP;
SELECT * FROM EMP WHERE SALARY <= 100;
SELECT * FROM EMP WHERE DEPARTMENT = 'HR';

-- GETTING SALARY BW 1000 AND 500;
SELECT * FROM EMP WHERE SALARY BETWEEN 50000 AND 100000;

-- NORAML WAY
SELECT * FROM EMP WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'ADMIN';
-- BETTER WAY 
SELECT * FROM EMP WHERE DEPARTMENT IN ('HR','ADMIN'); 

SELECT * FROM EMP WHERE DEPARTMENT NOT IN ('HR','ADMIN'); 

SELECT * FROM EMP WHERE DEPARTMENT IS NULL;

-- WILDCARD

SELECT * FROM EMP WHERE FIRST_NAME LIKE '_A%';

-- SORTING USING ORDER BY
 
SELECT * FROM EMP ORDER BY SALARY DESC;

-- DISTINCT DATA 
SELECT DISTINCT DEPARTMENT FROM EMP;

-- DATA GROUPING  USING AGGREGATE FUNCTION

SELECT DEPARTMENT ,COUNT(DEPARTMENT) FROM EMP GROUP BY DEPARTMENT;   

SELECT DEPARTMENT, AVG(SALARY) FROM EMP GROUP BY DEPARTMENT;

SELECT DEPARTMENT, MIN(SALARY) FROM EMP GROUP BY DEPARTMENT;

SELECT DEPARTMENT, MAX(SALARY) FROM EMP GROUP BY DEPARTMENT;

SELECT DEPARTMENT, SUM(SALARY) FROM EMP GROUP BY DEPARTMENT;

-- USING HAVING KEYWORD TO GET DEPARTMENT HAVING MORE THEN 2 VALUES

SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM EMP GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) > 2;



CREATE TABLE ACCOUNT_USER(
ACC_ID INT PRIMARY KEY,
ACC_NAME VARCHAR(20) UNIQUE,
BALANCE INT NOT NULL DEFAULT 0
);

--- ADD NEW COLUMN IN TABLE

ALTER TABLE ACCOUNT_USER ADD LOAN_NUM INT;

SELECT * FROM ACCOUNT_USER;

-- MDOIFY DATA TYPE OF PERTICULER COLUMN

ALTER TABLE ACCOUNT_USER MODIFY LOAN_NUM FLOAT NOT NULL;

-- TO DESCRIBE THE TABLE DATATYPES AND MORE INFO
DESC ACCOUNT_DETAILS;

-- TO CHANGE COLUMN -- RENAME  THE COLUMN
ALTER TABLE ACCOUNT_USER CHANGE BALANCE SAVING_BALANCE INT;

-- DROP COLUMN
ALTER TABLE ACCOUNT_USER DROP COLUMN LOAN_NUM;

-- RENAME THE TBALE 
ALTER TABLE ACCOUNT_USER RENAME TO ACCOUNT_DETAILS;

-- ON DELET CASCADE
DELETE FROM EMP WHERE EMP_ID = 001;

SELECT * FROM EMP;
SELECT * FROM TITLE;
SELECT * FROM BONUS;


