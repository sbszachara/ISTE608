-- Steven Szachara
-- ISTE 608 Fall 2024
-- PE09

DROP DATABASE IF EXISTS farmsdb;
CREATE DATABASE farmsdb;

USE farmsdb;

CREATE TABLE Farm (
    FarmID SMALLINT UNSIGNED NOT NULL,
    FarmName VARCHAR(52) NOT NULL,
    Street VARCHAR(52) NOT NULL,
    City VARCHAR(52) NOT NULL,
    Zip VARCHAR(52) NOT NULL,
    OwnerFirstName VARCHAR(52) NOT NULL,
    OwnerLastName VARCHAR(52) NOT NULL,
    Revenue DECIMAL(12,2) NOT NULL,
    FarmType VARCHAR(52) NOT NULL,
    PRIMARY KEY (FarmID)
);

CREATE TABLE Animal (
    FarmID SMALLINT UNSIGNED NOT NULL,
    AnimalID INT UNSIGNED NOT NULL,
    AnimalName VARCHAR(52),
    AnimalType VARCHAR(52) NOT NULL,
    AnimalAge TINYINT UNSIGNED NOT NULL,
    FeedType VARCHAR(52) NOT NULL,
    Purchase_Date DATE NOT NULL,
    Purchase_Cost DECIMAL(12,2) NOT NULL,
    AnimalPurpose VARCHAR(52),
    PRIMARY KEY(FarmID, AnimalID),
    CONSTRAINT fk_FarmID FOREIGN KEY (FarmID) REFERENCES Farm(FarmID)
);


INSERT INTO Farm (FarmID, FarmName, Street, City, Zip, OwnerFirstName, OwnerLastName, Revenue, FarmType)
VALUES
    (1, 'Green Valley Farm', '123 Oak Street', 'Springfield', '12345', 'John', 'Smith', 125000.50, 'Dairy'),
    (2, 'Sunny Fields', '456 Maple Avenue', 'Shelbyville', '54321', 'Emma', 'Jones', 98000.75, 'Poultry'),
    (3, 'Harvest Moon Farm', '789 Pine Lane', 'Greenville', '67890', 'Liam', 'Brown', 156000.25, 'Mixed'),
    (4, 'Riverside Ranch', '101 Birch Road', 'Fairfield', '11223', 'Olivia', 'Davis', 135000.00, 'Cattle'),
    (5, 'Prairie Acres', '202 Elm Drive', 'Ashville', '44556', 'Noah', 'Wilson', 72000.00, 'Goat'),
    (6, 'Mountain View Farm', '303 Cedar Court', 'Hilltown', '33445', 'Ava', 'Martinez', 112500.00, 'Dairy'),
    (7, 'Orchard Bliss', '404 Walnut Way', 'Woodland', '55678', 'Sophia', 'Garcia', 89000.50, 'Goat'),
    (8, 'Meadow Breeze', '505 Willow Street', 'Lakeside', '66789', 'James', 'Hernandez', 67000.00, 'Horse'),
    (9, 'Golden Pastures', '606 Aspen Lane', 'Riverbend', '77890', 'Isabella', 'Lopez', 102000.00, 'Sheep'),
    (10, 'Rustic Farms', '707 Cherry Road', 'Bridgeport', '88901', 'William', 'Gonzalez', 149000.25, 'Dairy'),
    (11, 'Silver Springs', '808 Fir Street', 'Clearwater', '99001', 'Charlotte', 'Ramirez', 118000.75, 'Horse'),
    (12, 'Blue Horizon Ranch', '909 Palm Road', 'Sunnydale', '88002', 'Ethan', 'Clark', 164000.50, 'Mixed');

-- Animals purchased before a month ago (AnimalID 1-50)
INSERT INTO Animal (FarmID, AnimalID, AnimalName, AnimalType, AnimalAge, FeedType, Purchase_Date, Purchase_Cost, AnimalPurpose)
VALUES
(4, 1, 'Oldy', 'Cow', 5, 'Grass', '2023-09-01', 1500.00, 'Milk'),
(11, 2, 'Milo', 'Goat', 3, 'Grain', '2023-09-05', 800.00, 'Meat'),
(7, 3, 'Twinkle', 'Horse', 7, 'Hay', '2023-09-07', 1200.00, 'Riding'),
(10, 4, 'Benny', 'Chicken', 1, 'Corn', '2023-09-10', 6.00, 'Eggs'),
(1, 5, 'Sally', 'Goat', 3, 'Feed Mix', '2023-09-12', 950.00, 'Milk'),
(3, 6, 'Ginger', 'Horse', 4, 'Grain', '2023-09-15', 1400.00, 'Work'),
(9, 7, 'Storm', 'Cow', 6, 'Grass', '2023-09-17', 1600.00, 'Milk'),
(5, 8, 'Luna', 'Sheep', 2, 'Hay', '2023-09-20', 500.00, 'Wool'),
(8, 9, 'Whiskers', 'Goat', 4, 'Grain', '2023-09-22', 850.00, 'Milk'),
(6, 10, 'Echo', 'Horse', 5, 'Hay', '2023-09-25', 1300.00, 'Work'),
(12, 11, 'Rusty', 'Cow', 4, 'Feed Mix', '2023-09-27', 1450.00, 'Milk'),
(4, 12, 'Bambi', 'Horse', 6, 'Grain', '2023-09-30', 1350.00, 'Riding'),
(2, 13, 'Buster', 'Goat', 5, 'Grass', '2023-10-02', 950.00, 'Meat'),
(10, 14, 'Nina', 'Cow', 3, 'Grass', '2023-10-05', 1550.00, 'Milk'),
(11, 15, 'Zara', 'Horse', 6, 'Feed Mix', '2023-10-08', 1400.00, 'Riding'),
(3, 16, 'Peppy', 'Goat', 2, 'Grain', '2023-10-10', 800.00, 'Milk'),
(1, 17, 'Charlie', 'Cow', 5, 'Hay', '2023-10-13', 1650.00, 'Milk'),
(7, 18, 'Misty', 'Horse', 4, 'Grain', '2023-10-15', 1300.00, 'Work'),
(12, 19, 'Shadow', 'Goat', 6, 'Feed Mix', '2023-10-17', 900.00, 'Meat'),
(8, 20, 'Willow', 'Sheep', 3, 'Hay', '2023-10-19', 600.00, 'Wool'),
(2, 21, 'Cleo', 'Cow', 3, 'Grain', '2023-10-21', 1500.00, 'Milk'),
(9, 22, 'Bolt', 'Horse', 4, 'Hay', '2023-10-23', 1250.00, 'Riding'),
(6, 23, 'Juno', 'Goat', 2, 'Grain', '2023-10-25', 750.00, 'Milk'),
(5, 24, 'Oscar', 'Horse', 6, 'Grass', '2023-10-28', 1350.00, 'Work'),
(7, 25, 'Milo', 'Goat', 4, 'Hay', '2023-11-01', 800.00, 'Meat'),
(3, 26, 'Bliss', 'Cow', 5, 'Grain', '2023-11-03', 1600.00, 'Milk'),
(11, 27, 'Jack', 'Horse', 6, 'Feed Mix', '2023-11-06', 1300.00, 'Riding'),
(9, 28, 'Snow', 'Sheep', 3, 'Grain', '2023-11-08', 550.00, 'Wool'),
(12, 29, 'Buddy', 'Goat', 4, 'Grass', '2023-11-10', 900.00, 'Milk'),
(6, 30, 'Cinnamon', 'Horse', 5, 'Hay', '2023-11-12', 1400.00, 'Riding'),
(3, 31, 'Penny', 'Cow', 4, 'Grass', '2023-11-14', 1550.00, 'Milk'),
(4, 32, 'Thunder', 'Goat', 3, 'Grain', '2023-11-16', 950.00, 'Meat'),
(11, 33, 'Stormy', 'Horse', 5, 'Grass', '2023-11-17', 1300.00, 'Riding'),
(8, 34, 'Maggie', 'Goat', 4, 'Hay', '2023-11-19', 850.00, 'Milk'),
(2, 35, 'Chloe', 'Cow', 5, 'Feed Mix', '2023-11-21', 1450.00, 'Milk'),
(5, 36, 'Ruby', 'Horse', 3, 'Grain', '2023-11-23', 1200.00, 'Work'),
(10, 37, 'Sunny', 'Sheep', 4, 'Hay', '2023-11-25', 600.00, 'Wool'),
(7, 38, 'Thunderbolt', 'Goat', 5, 'Feed Mix', '2023-11-27', 950.00, 'Meat'),
(6, 39, 'Holly', 'Horse', 6, 'Grain', '2023-11-29', 1400.00, 'Riding'),
(8, 40, 'Max', 'Goat', 4, 'Grain', '2023-12-02', 800.00, 'Milk'),
(1, 41, 'Daisy', 'Cow', 3, 'Grass', '2023-12-04', 1500.00, 'Milk'),
(4, 42, 'Vega', 'Horse', 5, 'Hay', '2023-12-06', 1300.00, 'Work'),
(7, 43, 'Charlie', 'Goat', 4, 'Grain', '2023-12-08', 850.00, 'Milk'),
(10, 44, 'Sam', 'Horse', 6, 'Grain', '2023-12-10', 1450.00, 'Riding'),
(12, 45, 'Sandy', 'Goat', 3, 'Feed Mix', '2023-12-12', 950.00, 'Meat'),
(6, 46, 'Bolt', 'Horse', 5, 'Hay', '2023-12-14', 1300.00, 'Riding'),
(8, 47, 'Misty', 'Goat', 5, 'Grain', '2023-12-16', 900.00, 'Milk'),
(4, 48, 'Clover', 'Sheep', 4, 'Hay', '2023-12-18', 700.00, 'Wool'),
(9, 49, 'Diana', 'Goat', 3, 'Feed Mix', '2023-12-20', 850.00, 'Meat'),
(1, 50, 'Bliss', 'Horse', 6, 'Grain', '2023-12-22', 1350.00, 'Work'),
(9, 51, 'Buster', 'Goat', 3, 'Hay', '2024-11-01', 750.00, 'Milk'),
(2, 52, 'Daisy', 'Cow', 4, 'Grass', '2024-11-02', 1500.00, 'Milk'),
(12, 53, 'Ginger', 'Horse', 2, 'Feed Mix', '2024-11-05', 1200.00, 'Riding'),
(8, 54, 'Thunder', 'Goat', 5, 'Grain', '2024-11-07', 950.00, 'Meat'),
(3, 55, 'Nina', 'Cow', 4, 'Grain', '2024-11-08', 1600.00, 'Milk'),
(11, 56, 'Max', 'Goat', 2, 'Grass', '2024-11-08', 800.00, 'Milk'),
(5, 57, 'Whiskers', 'Horse', 3, 'Hay', '2024-11-09', 1400.00, 'Work'),
(9, 58, 'Cleo', 'Sheep', 4, 'Grain', '2024-11-09', 600.00, 'Wool'),
(6, 59, 'Stormy', 'Goat', 3, 'Hay', '2024-11-09', 850.00, 'Milk'),
(4, 60, 'Holly', 'Horse', 5, 'Grain', '2024-11-10', 1300.00, 'Riding'),
(3, 61, 'Vega', 'Goat', 4, 'Grain', '2024-11-10', 950.00, 'Meat'),
(7, 62, 'Thunderbolt', 'Cow', 5, 'Feed Mix', '2024-11-11', 1600.00, 'Milk'),
(2, 63, 'Bliss', 'Horse', 4, 'Hay', '2024-11-11', 1250.00, 'Work'),
(12, 64, 'Sandy', 'Goat', 4, 'Grass', '2024-11-11', 800.00, 'Milk'),
(5, 65, 'Maggie', 'Sheep', 3, 'Grain', '2024-11-12', 700.00, 'Wool'),
(11, 66, 'Oscar', 'Cow', 5, 'Grain', '2024-11-13', 1500.00, 'Milk'),
(9, 67, 'Charlie', 'Goat', 4, 'Hay', '2024-11-14', 850.00, 'Meat'),
(3, 68, 'Bolt', 'Horse', 5, 'Feed Mix', '2024-11-15', 1300.00, 'Riding'),
(7, 69, 'Ruby', 'Goat', 3, 'Grain', '2024-11-16', 950.00, 'Milk'),
(4, 70, 'Juno', 'Sheep', 4, 'Grass', '2024-11-16', 600.00, 'Wool');



SELECT * 
FROM Farm;

SELECT * 
FROM Animal;

SELECT
    Animal.Purchase_Date AS "Purchase Date Last Two Weeks",
    Farm.FarmID AS "Farm ID",
    Farm.FarmName AS "Farm Name",
    Animal.Purchase_Cost AS "Purchase Cost",
    Animal.AnimalType AS "Animal Type",
    Animal.AnimalPurpose AS "Animal Purpose",
    Animal.AnimalAge AS "Age",
    Farm.Revenue AS "Farm Revenue",
    Farm.City AS "Farm City"
FROM 
    Farm
JOIN 
    Animal
USING (FarmID)
WHERE 
    DATE(Animal.Purchase_Date) >= CURDATE() - INTERVAL 14 DAY
ORDER BY 
    Animal.Purchase_Date DESC;




