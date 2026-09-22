---step 1Create Catalog if not exsist
DROP TABLE  exercise3.class.attendance_brightlearn;
CREATE CATALOG IF NOT EXISTS exercise3;

---Step 2 create Scheme if not exsist
CREATE SCHEMA IF NOT EXISTS exercise3.class;

---Step 3 create table if not EXSIST
CREATE TABLE IF NOT EXISTS exercise3.class.attendance_brightlearn(
student_id INT,
days_present INT,
total_days INT);

---Step 4 Insert information into table
INSERT INTO exercise3.class.attendance_brightlearn VALUES
(1,45,50),
(2,30,50),
(3,48,50),
(4,25,50),
(5,50,50);

--Step 5 check if table values loaded correct
SELECT*
FROM exercise3.class.attendance_brightlearn;

---Question 7 Calculate attendance percentage and classify the result.
SELECT student_id,
       (days_present/total_days)*100 AS attendance_percentage,
CASE 
     WHEN attendance_percentage>=90 THEN 'EXCELLENT'
     WHEN attendance_percentage BETWEEN 75 AND 89 THEN 'GOOD'
     WHEN attendance_percentage <75 THEN 'NEEDS IMPROVEMENT'
END AS attendance_status
FROM exercise3.class.attendance_brightlearn;  

--01 Classify each product by price into the three tiers below.

---step 1Create Catalog if not exsist
CREATE CATALOG IF NOT EXISTS Products;

---Step 2 create Scheme if not exsist
CREATE SCHEMA IF NOT EXISTS Products.Table;

---Step 3 create table if not EXSIST
CREATE TABLE IF NOT EXISTS Products.Table._id(
product_id INT,
product_name STRING,
price INT);

---Step 4 Insert information into table
INSERT INTO Products.`Table`._id VALUES
(1,'Laptop',1200),
(2,'Phone',800),
(3,'Keyboard',45),
(4,'Monitor',300),
(5,'Mouse',25);

SELECT*
FROM Products.`Table`._id;

--01 Classify each product by price into the three tiers below.
SELECT product_name,
       price,
CASE 
     WHEN Price >1000 THEN  'EXPENSIVE'
     WHEN Price BETWEEN 100 AND 1000 THEN 'Mid Range'
     WHEN Price <100 THEN 'Budget'
END AS Price_Category
FROM Products.`Table`._id; 

---------------------------------------------------
---step 1Create Catalog if not exsist
--DROP TABLE Products.`Table`._id;
CREATE CATALOG IF NOT EXISTS Orders;


---Step 2 create Scheme if not exsist
CREATE SCHEMA IF NOT EXISTS Orders._id;

---Step 3 create table if not EXSIST
CREATE TABLE IF NOT EXISTS Orders._id.Exercise_(
Order_id INT,
Customer_Name STRING,
Amount INT);

---Step 4 Insert information into table
INSERT INTO Orders._id.Exercise_ VALUES
(1,'Alice',150.00),
(2,'Bob',560.00),
(3,'Charlie',999.99),
(4,'Diana',45.45),
(5,'Ethan',1200.00);

SELECT*
FROM Orders._id.Exercise_;


--02 Label each order by its value.
SELECT Customer_Name,
       Amount,
CASE 
     WHEN Amount >=1000 THEN 'High value'
     WHEN Amount BETWEEN 500 AND 999.99 THEN 'Medium Value'
     WHEN Amount <500 THEN 'Low Value'
END AS Order_Value_Category
FROM Orders._id.Exercise_;

-------------------------------------
---
CREATE CATALOG IF NOT EXISTS Employees;


---Step 2 create Scheme if not exsist
CREATE SCHEMA IF NOT EXISTS Employees.Schema;

---Step 3 create table if not EXSIST
CREATE TABLE IF NOT EXISTS Employees.Schema._id(
Employee_id INT,
Employee_Name STRING,
Department STRING,
Salary INT
);

---Step 4 Insert information into table
INSERT INTO Employees.Schema._id VALUES
(1,'John','IT',85000),
(2,'Sarah','HR',60000),
(3,'Mark','IT',75000),
(4,'Lucy','Finance',95000),
(5,'Tom','HR',55000);

SELECT*
FROM Employees.Schema._id;

---03 Categorize each employee's position level using both department and salary.
SELECT Employee_Name,
       Department,
       Salary,
CASE 
     WHEN Department = 'IT' AND Salary >80000 THEN 'Senior IT'
     WHEN Department = 'HR' AND Salary >55000 THEN 'Experienced HR'
     ELSE 'STAFF'
END AS Position_Level
FROM Employees.Schema._id;

----------------------------------------------------
--- step 1 
CREATE CATALOG IF NOT EXISTS Deliveries;

---Step 2 create Scheme if not exsist
CREATE SCHEMA IF NOT EXISTS Deliveries.exit;

---Step 3 create table if not EXSIST
CREATE OR REPLACE TABLE Deliveries.exit.time_(
Delivery_id INT,
Delivery_time_minutes INT
);

---Step 4 Insert information into table
INSERT INTO Deliveries.exit.time_ VALUES
(1,45),
(2,80),
(3,30),
(4,65),
(5,100);

SELECT*
FROM Deliveries.exit.time_;

--05 Label delivery performance based on the time taken.
SELECT Delivery_id,
       Delivery_time_minutes,
CASE
    WHEN Delivery_time_minutes <=30 THEN 'FAST'
    WHEN Delivery_time_minutes BETWEEN 31 AND 60 THEN 'ON TIME'
    WHEN Delivery_time_minutes >60 THEN 'LATE'
END AS PERFORMANCE
FROM Deliveries.exit.time_;
-----------------------------------------------------------------------
---
CREATE CATALOG IF NOT EXISTS Tickets;

CREATE SCHEMA IF NOT EXISTS Tickets.PRIORITY;

CREATE OR REPLACE TABLE  Tickets.PRIORITY._ID (
Ticket_id INT,
Issue_type STRING,
Priority INT
);

INSERT INTO Tickets.PRIORITY._ID VALUES
(1,'Login Issue',1),
(2,'Server Down',3),
(3,' Slow System',2),
(4,'Email Error',2),
(5,'Password Reset',1);

SELECT*
FROM Tickets.PRIORITY._ID;

SELECT Issue_type,
       Priority,
CASE 
    WHEN Priority = 3 THEN 'HIGH'
    WHEN Priority = 2 THEN 'MEDIUM'
    WHEN Priority = 1 THEN 'LOW'
END AS Priority_Label
FROM Tickets.PRIORITY._ID;
-----------------------------------------------------------------
----
---step 1Create Catalog if not exsist
CREATE CATALOG IF NOT EXISTS exercise3;

---Step 2 create Scheme if not exsist
CREATE SCHEMA IF NOT EXISTS exercise3.class;

---Step 3 create table if not EXSIST
CREATE TABLE IF NOT EXISTS exercise3.class.attendance_brightlearn(
student_id INT,
days_present INT,
total_days INT);

---Step 4 Insert information into table
INSERT INTO exercise3.class.attendance_brightlearn VALUES
(1,45,50),
(2,30,50),
(3,48,50),
(4,25,50),
(5,50,50);

--Step 5 check if table values loaded correct
SELECT*
FROM exercise3.class.attendance_brightlearn;

---Question 7 Calculate attendance percentage and classify the result.
SELECT student_id,
       (days_present/total_days)*100 AS attendance_percentage,
CASE 
     WHEN attendance_percentage>=90 THEN 'EXCELLENT'
     WHEN attendance_percentage BETWEEN 75 AND 89 THEN 'GOOD'
     WHEN attendance_percentage <75 THEN 'NEEDS IMPROVEMENT'
END AS attendance_status
FROM exercise3.class.attendance_brightlearn;  

------------------------------------------------------------------------------
------------------
CREATE CATALOG IF NOT EXISTS Produts;

CREATE SCHEMA IF NOT EXISTS Produts.STOCK;

CREATE TABLE IF NOT EXISTS Produts.STOCK.STATUS(
Product_id INT,
Stock_QTY INT
);

INSERT INTO Produts.STOCK.STATUS VALUES
(1,5),
(2,0),
(3,25),
(4,10),
(5,3);

SELECT*
FROM Produts.STOCK.STATUS;

---08 Label the stock status of each product.
SELECT Product_id,
       Stock_QTY,
CASE
     WHEN Stock_QTY = 0 THEN 'OUT OF STOCK'
     WHEN Stock_QTY BETWEEN 1 AND 5 THEN 'LOW STOCK'
     WHEN Stock_QTY > 5 THEN 'IN STOCK'
END AS STOCK_STATUS
FROM Produts.STOCK.STATUS;
-------------------------------------------------------------------------------------------------
---
CREATE CATALOG IF NOT EXISTS Classes;
CREATE SCHEMA IF NOT EXISTS Classes.Subject;

CREATE TABLE IF NOT EXISTS Classes.Subject.Enrollment (
class_id INT,
Subject STRING,
Enrolled_students INT
);

INSERT INTO  Classes.Subject.Enrollment VALUES
(1,'MATH',30),
(2,'ENGLISH',25),
(3,'SCIENCE',15),
(4,'ART',5),
(5,'HISTORY',20);

SELECT*
FROM Classes.Subject.Enrollment;

--09 Classify each class by the number of enrolled students.
SELECT Subject,
       Enrolled_students,
CASE 
    WHEN Enrolled_students>=25 THEN 'LARGE'
    WHEN Enrolled_students BETWEEN 10 AND 24 THEN 'MEDIUM'
    WHEN Enrolled_students<10 THEN 'SMALL'
END AS Class_size_category
FROM Classes.Subject.Enrollment;

------------------------------------------------------------------------
---
CREATE CATALOG IF NOT EXISTS PAYMENTS;
CREATE SCHEMA IF NOT EXISTS PAYMENTS.AMOUNT;
CREATE TABLE IF NOT EXISTS PAYMENTS.AMOUNT.METHOD(
PAYMET_ID INT,
AMOUNT INT,
PAYMENT_METHOD STRING
);

INSERT INTO PAYMENTS.AMOUNT.METHOD VALUES
(1,50,'CARD'),
(2,200,'CASH'),
(3,150,'CARD'),
(4,75,'PAY PAL'),
(5,300,'CASH');

SELECT*
FROM PAYMENTS.AMOUNT.METHOD;

---10 Apply a discount flag based on the payment method and amount.
SELECT PAYMET_ID,
       AMOUNT,
       PAYMENT_METHOD,
CASE 
     WHEN PAYMENT_METHOD = 'CASH' AND AMOUNT >= 200 THEN 'Eligible for Discount'
     ELSE 'Not Eligible'
END AS `Discount Eligibility`
FROM PAYMENTS.AMOUNT.METHOD;
