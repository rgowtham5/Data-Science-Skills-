/*non-coded comments on SQL*/

-- Show existing databases
SHOW DATABASES;

-- Creating a new database
CREATE DATABASE TTA;

USE TTA;

-- Creating a table and defining table structure
CREATE TABLE Studentscoring(
  ID int (10),
  Student varchar (25),
  Score int (10),
  Age int (10),
  PRIMARY KEY (ID)
);

-- Show table structure
EXPLAIN Studentscoring;

-- Student activity to create a table


-- Insert values into table
 INSERT INTO Studentscoring
	(ID, Student, Score, Age)
VALUES (1, 'Chris',78, 23),
		(2, 'Charlotte',92, 22),
		(3, 'Caleb',92, 24),
		(4, 'Chantelle',88, 23);


-- Selectin all information from table
SELECT *
FROM Studentscoring;

-- Student activity to insert data

-- Select 1 column
SELECT Score
FROM Studentscoring;

-- Select 2 columns
SELECT Score, Age
FROM Studentscoring; 

-- Adding a condition in the WHERE clause
SELECT Score
FROM Studentscoring 
WHERE Score >78;

-- Using adding an AND or OR to your query
SELECT *
FROM Studentscoring
WHERE Score>88 or Age>23;

-- Using Update to modify records
UPDATE Studentscoring
SET Score=90
WHERE Student="Charlotte";

SELECT *
FROM Studentscoring;

UPDATE Studentscoring
SET Score=89, Age=21
WHERE Student="Caleb";

SELECT *
FROM Studentscoring

-- Deleting a record from the table
DELETE FROM Studentscoring
WHERE Student="Caleb";

SELECT *
FROM Studentscoring

-- Using Alter to modify the table
ALTER TABLE Studentscoring
ADD Country varchar(25);

ALTER TABLE Studentscoring
MODIFY COLUMN Student varchar (25) NOT NULL;

EXPLAIN Studentscoring;

ALTER TABLE Studentscoring
DROP Age;


-- Odering data
SELECT * FROM Studentscoring 
ORDER BY Score DESC;

SELECT * FROM Studentscoring
ORDER BY Student ;


-- Basic Calculations 
SELECT Score, (SUM(Score)/COUNT(Score)) AS AverageScore
FROM  Studentscoring;

SELECT MIN (Score)
FROM Studentscoring;

SELECT MAX (Score)
FROM Studentscoring;

-- Using AS to create an alias
SELECT MIN (Score) AS Lowest
FROM Studentscoring;

SELECT COUNT (Score)
FROM Studentscoring;

SELECT SUM (Score)
FROM Studentscoring;

SELECT AVG (Score)
FROM Studentscoring;

SELECT COUNT (*)
FROM Studentscoring
WHERE Score>78;

-- Student activity to manipulate data

-- Joining tables together 

use tta;

CREATE TABLE Customerinfo(
  ID_Customerinfo int (10),
  Country varchar (20),
  Gender varchar (10),
  Age int (25),
  PRIMARY KEY (ID_Customerinfo)
);


INSERT INTO Customerinfo
	( ID_Customerinfo, Country, Gender, Age)
VALUES (9, 'UK','M', 32),
		(2, 'Canada','F', 44),
		(12, 'UK','M', 36),
		(4, 'Australia','F', 56);

CREATE TABLE customer_orders(
OrderID INT (10),
ID_Customerinfo INT (10),
ItemName VARCHAR(20),
ProductPrice INT (10),
PRIMARY KEY(OrderID),
);

INSERT INTO customer_orders (OrderID, ID_Customerinfo, ItemName, ProductPrice)
VALUES
(6333, 2,  "Toaster",  17.99),
(3434, 8, "Set of 3 Nested Tables", 105.99),
(3433, 4, "Electric Toothbrush", 45.99),
(1443, 3, "4 Person Tent", 220.99),
(4678, 10, "Upright Fan", 41.99),
(5244, 22, "Henry Hoover", 111.99)
;

-- Automatically selects inner join if not specified
SELECT *
FROM Customerinfo
JOIN Customer_orders
ON Customerinfo.ID_Customerinfo = Customer_orders.ID_Customerinfo;



SELECT Customer_orders.ID_Customerinfo,Customer_orders.ItemName, Customerinfo.Gender
FROM Customerinfo
INNER JOIN Customer_orders
ON Customerinfo.ID_Customerinfo = Customer_orders.ID_Customerinfo;


-- left join
SELECT *
FROM Customerinfo
LEFT JOIN Customer_orders
ON Customerinfo.ID_Customerinfo = Customer_orders.ID_Customerinfo;
