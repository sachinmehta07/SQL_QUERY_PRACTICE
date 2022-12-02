CREATE DATABASE PROJECT_DETAILS;  

USE PROJECT_DETAILS;

CREATE TABLE EMP(
EMP_ID INT PRIMARY KEY,
F_NAME VARCHAR(20),
AGE INT(2),
EMAIL_ID VARCHAR (25),
PHONE_NO INT(10),
CITY VARCHAR(10) 
);

INSERT INTO EMP VALUES
(001,'AMAN',32,'ABC@GMIAL.COM',8798,'DELHI'),
(002,'YAGYA',44,'ABC@GMIAL.COM',456,'PALAM'),
(003,'RAHUL',22,'ABC@GMIAL.COM',545,'KOLKATA'),
(004,'JATIN',32,'ABC@GMIAL.COM',887,'RAIPUR'),
(005,'PK',32,'ABC@GMIAL.COM',798,'JAIPUR');



CREATE TABLE CLIENT(
C_ID INT,
F_NAME VARCHAR(20),
AGE INT(2),
EMAIL_ID VARCHAR (25),
PHONE_NO INT(10),
CITY VARCHAR(10),
EMP_ID INT
);

INSERT INTO CLIENT VALUES
(001,'MAC',25,'MAC@GMAIL.COM',588,'HYD',003),
(002,'MAC',25,'MAC@GMAIL.COM',588,'KOLKATA',003),
(003,'MAC',25,'MAC@GMAIL.COM',588,'KOLKATA',001),
(004,'MAC',25,'MAC@GMAIL.COM',588,'HYD',005),
(005,'MAC',25,'MAC@GMAIL.COM',588,'KOLKATA',002);

CREATE TABLE PROJECT_DETAIL(
P_ID INT,
C_ID INT,
P_NAME VARCHAR(20),
START_DATE DATE,
EMP_ID INT
);

INSERT INTO PROJECT_DETAIL VALUES (001,003,'A','2021-04-12',001),
(002,001,'B','2021-05-13',002),
(003,005,'C','2021-06-16',003),
(004,002,'D','2021-05-14',003),
(005,004,'E','2021-07-17',005);

SELECT * FROM PROJECT_DETAIL;

-- INNERJOIN 
-- ENLIST ALL THE EMPLOYESS ID'S , NAMES ALONG WITH THE PROJECT ALLOCATED TO THEM.
SELECT E.EMP_ID, E.F_NAME , P.P_ID, P.P_NAME 
FROM EMP AS E INNER JOIN PROJECT_DETAIL  AS P ON E.EMP_ID = P.EMP_ID;

-- WITHOUT USING JOIN KEYWORRD
SELECT  E.EMP_ID, E.F_NAME , P.P_ID, P.P_NAME 
FROM EMP AS E , PROJECT_DETAIL  AS P WHERE E.EMP_ID = P.EMP_ID;

-- FETCH OUR ALL DETAILS OF EMP ID AND THEIR CONTACTS DETAILS WOHOS WORKING FROM JAIPUR
-- WITH THE CLEINT NAME WORKING IN HEYDRABAD

SELECT E.EMP_ID,E.EMAIL_ID,E.PHONE_NO , C.F_NAME
 FROM EMP AS E INNER JOIN CLIENT AS C ON E.EMP_ID = C.EMP_ID WHERE E.CITY = 'JAIPUR';

SELECT * FROM CLIENT;

-- LEFT JOINN
-- FETCHOUT ALL EMPLOYEEWORKING ON PROJECT
SELECT * FROM EMP AS E LEFT JOIN PROJECT_DETAIL AS P ON E.EMP_ID = P.EMP_ID;
 
--- RIGHT JOIN
-- LIST OUT ALL PRJ ALONG WITH EMP NAME  AND THEIER EMAIL ID
SELECT P.EMP_ID,P.P_NAME , E.EMP_ID,E.F_NAME, E.EMAIL_ID FROM 
EMP AS E RIGHT JOIN PROJECT_DETAIL AS P ON E.EMP_ID = P.EMP_ID;

-- CROSS JOIN
-- LIST OUT ALL POSSIBLE COMBINATION OF EMP NAME AND PRJ ID

SELECT P.P_ID P,P_NAME , E.F_NAME FROM EMP AS E CROSS JOIN PROJECT_DETAIL AS P; 
