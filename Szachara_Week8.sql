## Steven Szachara ISTE 608
## Fall 2024
## PE06

## create/drop database

DROP DATABASE IF EXISTS Orders;
CREATE DATABASE Orders;
USE Orders;

DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS PO_Detail;
DROP TABLE IF EXISTS PO;
DROP TABLE IF EXISTS Paid_PO;

## Create Customer table

CREATE TABLE Customer(
	CustID INT UNSIGNED AUTO_INCREMENT NOT NULL,
	CustName VARCHAR(100) NOT NULL,
	CustContact VARCHAR(100) NOT NULL,
	PRIMARY KEY (CustID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

## Create Product table

CREATE TABLE Product(
	ProdID INT UNSIGNED NOT NULL,
	ProdDescription VARCHAR(300) NOT NULL,
	UnitPrice DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (ProdID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

## Create PO_Detail
CREATE TABLE PO_Detail (
	PO INT UNSIGNED NOT NULL,
	CustID INT UNSIGNED NOT NULL,
	ProductID INT UNSIGNED NOT NULL,
	Quantity INT UNSIGNED NOT NULL,
	PRIMARY KEY (PO),
	CONSTRAINT CustID_fk Foreign Key (CustID)
		REFERENCES Customer(CustID),
	CONSTRAINT ProductID_fk Foreign Key (ProductID)
		REFERENCES Product(ProdID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

## Create PO
CREATE TABLE PO (
	PO INT UNSIGNED NOT NULL,
	OrderDate DATETIME NOT NULL,
	BillToAddress VARCHAR(200) NOT NULL,
	ShipToAddress VARCHAR(200) NOT NULL,
	PRIMARY KEY (PO),
	CONSTRAINT PO_fk Foreign Key (PO)
		REFERENCES PO_Detail(PO)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

## Create Paid_PO
CREATE TABLE Paid_PO (
	PO INT UNSIGNED NOT NULL,
	Date DATETIME NOT NULL,
	Amount DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (PO,Date),
	CONSTRAINT PO_k Foreign Key (PO)
		REFERENCES PO_Detail(PO)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Customer (CustName, CustContact) VALUES 
('Alice Smith', 'alice@example.com'),
('Bob Johnson', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com');

INSERT INTO Product (ProdID, ProdDescription, UnitPrice) VALUES 
(1, 'Wireless Mouse', 29.99),
(2, 'Mechanical Keyboard', 99.99),
(3, 'HDMI Cable', 15.50);

INSERT INTO PO_Detail (PO, CustID, ProductID, Quantity) VALUES 
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 2, 1),
(4, 2, 3, 1);

INSERT INTO PO (PO, OrderDate, BillToAddress, ShipToAddress) VALUES 
(1, '2024-10-19 10:00:00', '123 Main St, Springfield', '456 Elm St, Springfield'),
(2, '2024-10-20 11:30:00', '789 Oak St, Springfield', '321 Maple St, Springfield'),
(3, '2024-10-19 10:00:00', '123 Main St, Springfield', '456 Elm St, Springfield'),
(4, '2024-10-20 11:30:00', '789 Oak St, Springfield', '321 Maple St, Springfield');


INSERT INTO Paid_PO (PO, Date, Amount) VALUES 
(1, '2024-10-19 12:00:00', 29.99),
(2, '2024-10-20 15:00:00', 99.99),
(3, '2024-10-20 15:00:00', 99.99),
(4, '2024-10-20 15:00:00', 15.50);


SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM PO;
SELECT * FROM PO_Detail;
SELECT * FROM Paid_PO;


