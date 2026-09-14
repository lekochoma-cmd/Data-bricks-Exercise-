---step 1 Create Catalog if not exsist I N N E R J O I N  T a b l e 1 · u s e r s
CREATE CATALOG IF NOT EXISTS USERSS;

---Step 2 create Scheme if not exsist
CREATE SCHEMA IF NOT EXISTS USERSS.TABLE;

---Step 3 create table if not EXSIST
CREATE OR REPLACE TABLE USERSS.TABLE.USER_ID (
user_id INT,
user_name STRING,
country STRING);

---Step 4 Insert information into tabUSERD
INSERT INTO USERSS.TABLE.USER_ID VALUES
(1, 'Nomvula','Johannesburg'),
(2, 'David','Cape Town'),
(3, 'Anele','Durban'),
(4, 'Kabelo','Pretoria'),
(5,'Lerato','Port Elizabeth');

---DROP TABLE USERSS.TABLE.USER_ID;

SELECT*
FROM USERSS.TABLE.USER_ID;

--DROP TABLE Subscriptions.user_id.START_DATE;
---Creating table TWO for the JOINS as per excercise on BRIGHTLEARN T a b l e 3 · s u b s c r i p t i o n s
CREATE CATALOG IF NOT EXISTS Subscriptions;

--step 2 create schema for subscription
CREATE SCHEMA IF NOT EXISTS Subscriptions.user_id;

---Step 3 create table if not EXSIST
CREATE OR REPLACE TABLE Subscriptions.user_id.START_DATE (
subscription_id  INT,
user_id INT,
plan_id INT,
start_date INT);

---STEP 4 INSERT INFORMATION INTO SUBSCRIPTION TABLE
INSERT INTO Subscriptions.user_id.START_DATE VALUES
(501,1,10,15-01-2026),
(502,2,11,01-02-2026),
(503,1,12,10-03-2026),
(504,6,11,20-03-2026),
(505,3,13,05-04-2026);

--Step 5 check if all information is loaded correctly 
SELECT*
FROM Subscriptions.user_id.START_DATE;

--Q U E S T I O N 0 1 Show every user who has a subscription. Match users to subscriptions.
SELECT B.user_id,
       A.user_name,
       B.subscription_id,
       B.start_date
FROM USERSS.TABLE.USER_ID AS A
INNER JOIN Subscriptions.user_id.START_DATE AS B
ON A.user_id=B.user_id;

--CREATING NEW TABLE CALLED PLANS 
CREATE CATALOG IF NOT EXISTS PLANS;

CREATE SCHEMA IF NOT EXISTS PLANS.PLAN_id;

CREATE OR REPLACE TABLE PLANS.PLAN_id.MONTHLY_PRICE (
Plan_id  INT,
Plan_Name STRING,
Monthly_Price INT);

INSERT INTO PLANS.PLAN_id.MONTHLY_PRICE VALUES
(10,'basic',79),
(11,'Standard',129),
(12,'Premium',199),
(13,'Family',249),
(14,'Mobile',59);

SELECT*
FROM PLANS.PLAN_id.MONTHLY_PRICE;



--Q U E S T I O N 0 2 Show every subscription with its matching plan name and monthly price.
SELECT A.subscription_id,
       A.user_id,
       B.Plan_Name,
       B.Monthly_Price
FROM Subscriptions.user_id.START_DATE AS A
INNER JOIN PLANS.PLAN_id.MONTHLY_PRICE AS B
ON A.Plan_id=B.Plan_id;

---LOADING THE VIEWS TABLE FOR NEXT QUESTION ON INNER JOIN
CREATE CATALOG IF NOT EXISTS SHOWS;

CREATE SCHEMA IF NOT EXISTS SHOWS.SHOWS_id;

CREATE OR REPLACE TABLE SHOWS.SHOWS_id.GENDRE (
show_id  INT,
show_tittle STRING,
genre STRING);

---STEP 4 INSERT INFORMATION INTO SUBSCRIPTION TABLE
INSERT INTO SHOWS.SHOWS_id.GENDRE VALUES
(701,'Comedy_hour','Comedy'),
(702,'Crime_time','Drama'),
(703,'Tech tales','Documentary'),
(704,'Cooking lab','Life_style'),
(706,'Wild earth','Documentary');

SELECT*
FROM SHOWS.SHOWS_id.GENDRE;


---Creating Viewing session table in order to do SQL on questions asked in exercise
CREATE CATALOG IF NOT EXISTS  Viewing_session;

--step 2 create schema for subscription
CREATE SCHEMA IF NOT EXISTS Viewing_session.Sesssion_id;

--step 3 creating table called Viewing session with columns as per exercise
CREATE OR REPLACE TABLE Viewing_session.Sesssion_id.user_id (
Session_id  INT,
User_id INT,
Show_id INT,
Watch_Minutes INT);

---STEP 4 INSERT INFORMATION INTO SUBSCRIPTION TABLE
INSERT INTO Viewing_session.Sesssion_id.user_id  VALUES
(901,1,701,45),
(902,2,703,30),
(903,1,702,60),
(904,7,701,20),
(905,3,705,90);

SELECT*
FROM Viewing_session.Sesssion_id.user_id;

--Q U E S T I O N 0 3 Show every viewing session that has a matching show. Include the show title and genre.
SELECT B.Session_id,
       B.User_id,
       A.show_tittle,
       A.genre,
       B.Watch_Minutes
FROM SHOWS.SHOWS_id.GENDRE AS A
INNER JOIN Viewing_session.Sesssion_id.user_id AS B
ON A.Show_id=B.Show_id;

--Q U E S T I O N 0 4 Show every viewing session with the user who watched it. Only show sessions with a matching user.
SELECT A.user_name,
       A.user_name,
       B.Session_id,
       B.Show_id,
       B.Watch_Minutes
FROM USERSS.TABLE.USER_ID AS A
INNER JOIN Viewing_session.Sesssion_id.user_id AS B
ON A.user_id=B.user_id;

---Q U E S T I O N 0 5 Show users along with their subscriptions, the plan name, and the price. Use only users who have both a subscription and a valid plan
SELECT A.user_name,
       A.country,
       B.Plan_Name,
       B.Monthly_Price,
       C.start_date
FROM USERSS.TABLE.USER_ID AS A
INNER JOIN PLANS.PLAN_id.MONTHLY_PRICE AS B
INNER JOIN Subscriptions.user_id.START_DATE AS C
ON A.user_id=B.user_id;---I NEED HELP WITH JOINNING 3 TABLES AS THER IS NO COMMON COLUMN ON 3 TABLES

--Part B — LEFT JOIN 
---Q U E S T I O N 0 6 Show every user and any subscriptions they have. Users without subscriptions must still appear.
SELECT A.user_id,
       A.user_name,
       B.subscription_id,
       B.start_date
FROM USERSS.TABLE.USER_ID AS A
LEFT JOIN Subscriptions.user_id.START_DATE AS B
ON A.user_id=B.user_id;

-- QUESTION 7 Show every plan and the subscriptions on it. Plans with no subscribers must still appear.

SELECT A.Plan_id,
       A.Plan_Name,
       B.subscription_id,
       B.user_id
FROM PLANS.PLAN_id.MONTHLY_PRICE AS A
LEFT JOIN Subscriptions.user_id.START_DATE AS B
ON A.plan_id= B.plan_id;

---Q U E S T I O N 0 8 Show every show and any viewing sessions on it. Shows that were never watched must still appear.

SELECT A.show_id,
       A.show_tittle,
       B.Session_id,
       B.Watch_Minutes
FROM SHOWS.SHOWS_id.GENDRE AS A
INNER JOIN Viewing_session.Sesssion_id.user_id AS B
ON A.show_id=B.show_id;

---Q U E S T I O N 0 9 Show every viewing session and the user who watched it. Sessions referencing users that do not exist must still appear (with NULL user details).

SELECT A.Session_id,
       A.Show_id,
       A.Watch_Minutes,
       B.user_name,
       B.user_id
FROM Viewing_session.Sesssion_id.user_id AS A
LEFT JOIN USERSS.TABLE.USER_ID  AS B
ON A.user_id=B.user_id;

---Q U E S T I O N 1 1 Show every user and every subscription, including users without subscriptions AND subscriptions referencing users that do not exist.
SELECT A.user_id,
       A.user_name,
       B.subscription_id,
       B.start_date
FROM USERSS.TABLE.USER_ID AS A
FULL OUTER JOIN Subscriptions.user_id.START_DATE AS B
ON A.user_id=B.user_id;

--Q U E S T I O N 1 2 Show every plan and every subscription, including plans without subscribers AND any subscription referencing a plan that does not exist.

SELECT A.Plan_Name,
       B.subscription_id,
       B.user_id
FROM PLANS.PLAN_id.MONTHLY_PRICE AS A
FULL OUTER JOIN Subscriptions.user_id.START_DATE AS B
ON A.Plan_id=B.Plan_id;

--Q U E S T I O N 1 3 Show every show and every viewing session, including shows that were never watched AND sessions referencing shows that do not exist.
SELECT A.show_id,
       A.show_tittle,
       B.Session_id,
       B.Watch_Minutes
FROM SHOWS.SHOWS_id.GENDRE AS A
FULL OUTER JOIN Viewing_session.Sesssion_id.user_id AS B
ON A.show_id=B.show_id;

---Q U E S T I O N 1 4 Show every user and every viewing session, including users with no sessions AND sessions referencing users who do not exist.
SELECT A.user_id,
       A.user_name,
       B.Session_id,
       B.Show_id,
       B.Watch_Minutes
FROM USERSS.TABLE.USER_ID AS A
FULL OUTER JOIN Viewing_session.Sesssion_id.user_id AS B
ON A.User_id=B.User_id;

---Q U E S T I O N 1 5  Show every user, every subscription, and every plan in one query — using FULL OUTER JOIN throughout. This is the hardest question — get all gaps visible at once.
--- NEED HELP WITH JOINNING THREE TABLES




