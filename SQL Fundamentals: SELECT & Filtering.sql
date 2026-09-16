---step 1 Create Catalog if not exsist Exercise 
--DROP TABLE employees.names.id ;
CREATE CATALOG IF NOT EXISTS employees;


---Step 2 create Scheme if not exsist
CREATE SCHEMA IF NOT EXISTS employees.names;

---Step 3 create table if not EXSIST
CREATE OR REPLACE TABLE employees.names.id (
_id INT,
First_name STRING,
Last_name STRING,
Department STRING,
Salary INT,
Hire_Date DATE,
_City STRING
) USING DELTA;

---STEP 4 INSERT INFORMATION INTO SUBSCRIPTION TABLE
INSERT INTO employees.names.id VALUES
(1,'Anna','Green','IT',70000, DATE '2020-01-10', 'Johannesburg'),
(2,'Brian','lee','HR',45000, DATE '2019-03-22', 'Cape Town'),
(3,'Cathy','Zulu','Finance',65000, DATE '2018-07-18', 'Durban'),
(4,'David','Mokoena','Marketing',50000, DATE '2021-11-05', 'Pretoria'),
(5,'Eva','Naidoo','IT',72000, DATE '2020-09-30', 'Johannesburg');

--- Step 5 check if table is loaded correctly 
SELECT*
FROM employees.names.id;

---Question 01 Retrieve all columns from the employees table.
SELECT*
FROM employees.names.id;

---Question 02 Find all unique departments.
SELECT _id,
       Department
FROM employees.names.id;

---03 Retrieve first and last names ordered by salary descending
SELECT First_name,
       Last_name
FROM employees.names.id
ORDER BY Salary DESC;

---04 Retrieve the top 3 highest-paid employees.
SELECT First_name,
       Last_name,
       salary
FROM  employees.names.id
ORDER BY salary DESC
LIMIT 3;

--05 Find employees in the IT department.
SELECT First_name,
       Last_name,
       _id,
       Department
FROM  employees.names.id
WHERE Department='IT';

--06 Find employees in Finance with salary > 60000

SELECT First_name,
       Last_name,
       _id,
       Department,
       Salary
FROM  employees.names.id
WHERE Department='Finance' AND Salary>60000;

--07 Find employees in HR or Marketing.
SELECT First_name,
       Last_name,
       _id,
       Department
FROM  employees.names.id
WHERE department IN ('HR', 'Marketing');

--08 Find employees not in IT.

SELECT First_name,
       Last_name,
       _id,
       Department
FROM  employees.names.id
WHERE department <> ('IT');

--09 Find employees in IT, HR, or Finance using IN.
SELECT First_name,
       Last_name,
       _id,
       Department
FROM  employees.names.id
WHERE department IN ('Marketing','HR','Finance');

--10 Find employees in IT with salary > 65000 and city Johannesburg.
SELECT _id,
       First_name,
       Last_name,
       Department,
       Salary,
       _City
FROM  employees.names.id
WHERE department = 'IT'
AND salary > 65000;
