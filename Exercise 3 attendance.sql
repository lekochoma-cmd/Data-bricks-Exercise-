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
