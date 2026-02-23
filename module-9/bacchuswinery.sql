DROP USER IF EXISTS 'bacchuswinery_user'@'localhost';

-- create bacchuswinery_user and grant them all privileges to the bacchuswinery database 
CREATE USER 'bacchuswinery_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'winery';

-- grant all privileges to the movies database to user movies_user on localhost 
GRANT ALL PRIVILEGES ON bacchuswinery.* TO 'bacchuswinery_user'@'localhost';

USE bacchuswinery;

CREATE TABLE Owners (
    Owner_ID INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Phone_number VARCHAR(20),
    Address VARCHAR(100),
    City VARCHAR(50),
    Postal_Code VARCHAR (20),
    Email VARCHAR(100)
);

USE bacchuswinery;

CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Role_ID INT,
    Dept_ID INT,
    Address VARCHAR(100),
    City VARCHAR(50),
    Postal_Code VARCHAR (20),
    Email VARCHAR(100),
    FOREIGN KEY (Role_ID) REFERENCES Roles(Role_ID),
    FOREIGN KEY (Dept_ID) REFERENCES Departments(Department_ID)
);

USE bacchuswinery;

CREATE TABLE Roles (
    Role_ID INT PRIMARY KEY,
    Role_Title VARCHAR(50)
);

USE bacchuswinery;

CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50)
);

USE bacchuswinery;

CREATE TABLE Wine (
    Wine_ID INT PRIMARY KEY,
    Wine_Name VARCHAR(50),
    Brand VARCHAR(50),
    Vintage YEAR,
    Price_perCase INT
);

USE bacchuswinery;

CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY,
    Wine_ID INT,
    Quantity_onHand INT,
    Location VARCHAR(50),
    Last_RestockedDate DATE,
    Reorder_Level INT,
    FOREIGN KEY (Wine_ID) REFERENCES Wine(Wine_ID)
);

USE bacchuswinery;

CREATE TABLE Suppliers (
    Supplier_ID INT PRIMARY KEY,
    Supplier_name VARCHAR(50),
    Component_Supplied VARCHAR(50),
    Delivery_Date DATE,
    Contact_name VARCHAR(50),
    Phone_number VARCHAR(20),
    Address VARCHAR(100),
    City VARCHAR(50),
    Postal_Code VARCHAR (20)
);

USE bacchuswinery;

CREATE TABLE Distributors (
    Distributor_ID INT PRIMARY KEY,
    Wine_ID INT,
    Distributor_name VARCHAR(50),
    Quantity_Shipped INT,
    Shipment_Date DATE,
    Contact_name VARCHAR(50),
    Phone_number VARCHAR(20),
    Region_Served VARCHAR(50),
    FOREIGN KEY (Wine_ID) REFERENCES Wine(Wine_ID)
);


INSERT INTO Owners (Owner_ID, First_name, Last_name, Phone_number, Address, City, Postal_Code, Email)
VALUES 
(1, 'Stan', 'Bacchus', '973-855-8609', '847 Old York Rd', 'Ringoes', '08551', 'stanbacchus@gmail.com'),
(2, 'Davis', 'Bacchus', '973-835-7024', '942 Old York Rd', 'Ringoes', '08551', 'davisbacchus@gmail.com');

INSERT INTO Roles (Role_ID, Role_Title)
VALUES 
(1, 'Manager'), (2, 'Assistant'), (3, 'Employee');

INSERT INTO Departments (Department_ID, Dept_Name)
VALUES 
(1, 'Finances and Payroll'), 
(2, 'Marketing'), 
(3, 'Production'), 
(4, 'Distribution');

INSERT INTO Employees (Employee_ID, First_Name, Last_Name, Role_ID, Dept_ID, Address, City, Postal_Code, Email)
VALUES 
(101, 'Janet', 'Collins', 1, 1, '456 Oak Ave', 'Ringoes', '08551', 'jcollins@gmail.com'),
(102, 'Roz', 'Murphy', 1, 2, '789 Pine Rd', 'Ringoes', '08551', 'rozmurphy@yahoo.com'),
(103, 'Bob', 'Ulrich', 2, 2, '72 George St', 'Flemington', '08552', 'bulrich@outlook.com'),
(104, 'Henry', 'Doyle', 1, 3, '54 Mount Salem Rd', 'Pittstown', '08867', 'henry.doyle@gmail.com'),
(105, 'Maria', 'Costanza', 1, 4, '269 County Rd 519', 'Finesville', '08556', 'mariac@hotmail.com'),
(106, 'Jay', 'Stevens', 3, 3, '24 Stone Ave', 'Ringoes', '08551', 'jstevens@gmail.com'),
(107, 'Fred', 'Ulm', 3, 3, '620 Hamp Rd', 'Ringoes', '08551', 'ulmf@yahoo.com'),
(108, 'Patricia', 'Smith', 3, 3, '9 Rocky Rd', 'Ringoes', '08551', 'pat.smith@outlook.com'),
(109, 'Marie', 'Dykeman', 3, 3, '85 Fox Farm Rd', 'Phillipsburg', '08865', 'maried@gmail.com'),
(110, 'Raymond', 'Wu', 3, 3, '222 Main St', 'Stockton', '08559', 'rwu1@yahoo.com'),
(111, 'Alex', 'Stine', 3, 3, '44 N 5th Ave', 'Manville', '08835', 'alex.stine@gmail.com'),
(112, 'Tony', 'Solimoon', 3, 3, '76 S 21st Ave', 'Hampton', '08846', 'tsolimoon@yahoo.com'),
(113, 'Robin', 'Sharrot', 3, 3, '79 8th St', 'Manville', '08835', 'rsharrot@yahoo.com'),
(114, 'Will', 'Swan', 3, 3, '265 Main St', 'Stockton', '08559', 'willswam@gmail.com'),
(115, 'Angelo', 'Trent', 3, 3, '88 Hampton Ave', 'Stockton', '08559', 'angelot@gmail.com'),
(116, 'Brock', 'Lesner', 3, 3, '62 Mark St', 'Ringoes', '08551', 'lesnerb@gmail.com'),
(117, 'Austin', 'Stevenson', 3, 3, '10 Main St', 'Stockton', '08559', 'astevenson@yahoo.com'),
(118, 'Taylor', 'McCane', 3, 3, '74 S Gate Ave', 'Lambertville', '08530', 'mctaylor@yahoo.com'),
(119, 'Seth', 'Mackintosh', 3, 3, '99 Seashore Ave', 'Ringoes', '08551', 'smackintosh@gmail.com'),
(120, 'Rebecca', 'Collins', 3, 3, '522 Pine St', 'Finesville', '08556', 'rcollins2@yahoo.com'),
(121, 'Michael', 'Burke', 3, 3, '456 Oakley St', 'Stockton', '08559', 'burkem@gmail.com'),
(122, 'Mitchell', 'Leonardo', 3, 3, '219 Swanson Rd', 'Ringoes', '08551', 'mleonardo@outlook.com'),
(123, 'Evan', 'Abraham', 3, 3, '65 Stain Ave', 'Ringoes', '08551', 'eabraham@outlook.com'),
(124, 'Jeff', 'Greener', 3, 3, '668 Tewksbury Ave', 'Stockton', '08559', 'jgreener@gmail.com'),
(125, 'Ken', 'Greener', 3, 3, '668 Tewksbury Ave', 'Stockton', '08559', 'kgreener@gmail.com');

INSERT INTO Suppliers (Supplier_ID, Supplier_name, Component_Supplied, Delivery_Date, Contact_name, Phone_number, Address, City, Postal_Code)
VALUES 
(201, 'Bottling Co.', 'Bottles and Corks', '2026-02-15', 'David Green', '862-555-5678', '321 Vineyard Ln', 'Stockton', '08859'),
(202, 'Label Machine', 'Labels and Boxes', '2026-02-14', 'Ryan Fin', '973-440-2200', '840 Clinton Ave', 'Ringoes', '08851'),
(203, 'The Tube Masters', 'Vats and Tubing', '2026-02-16', 'Tyler Stark', '908-602-6702', '349 Allen St', 'Pittstown', '08867');


INSERT INTO Wine (Wine_ID, Wine_Name, Brand, Vintage, Price_perCase)
VALUES 
(301, 'Cabernet', 'Estate Vintage', 2022, 200.00),
(302, 'Merlot', 'Select', 2022, 80.00),
(303, 'Chablis', 'Private Select', 2021, 150.00),
(304, 'Chardonnay', 'Oak Cask', 2023, 65.00);


INSERT INTO Inventory (Inventory_ID, Wine_ID, Quantity_onHand, Location, Last_RestockedDate, Reorder_Level)
VALUES 
(401, 301, 50, 'Warehouse', '2026-02-10', 10),
(402, 302, 100, 'Warehouse', '2026-02-14', 25),
(403, 303, 55, 'Warehouse', '2026-02-11', 12),
(404, 304, 120, 'Warehouse', '2026-02-13', 30);


INSERT INTO Distributors (Distributor_ID, Wine_ID, Distributor_name, Quantity_Shipped, Shipment_Date, Contact_name, Phone_number, Region_Served)
VALUES 
(501, 301, 'Boujee Booze', 150, '2026-02-09', 'Emily Brown', '862-555-8765', 'North East'),
(502, 302, 'Wine Sellar', 300, '2026-02-11', 'James Thompson', '973-442-3325', 'North East'),
(503, 303, 'Good Spirits', 175, '2026-02-07', 'Jack Boon', '973-644-8255', 'East Coast'),
(504, 304, 'Wine World', 350, '2026-02-10', 'Steven Stonk', '862-204-8897', 'North East');
