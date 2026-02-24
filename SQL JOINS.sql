CREATE database if NOT exists company_db;
USE company_db;-- ===============================
-- 1: Customers Table
-- ===============================


DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(100)
);

INSERT INTO Customers VALUES
(1, 'John Smith', 'New York'),
(2, 'Mary Johnson', 'Chicago'),
(3, 'Peter Adams', 'Los Angeles'),
(4, 'Nancy Miller', 'Houston'),
(5, 'Robert White', 'Miami');
-- ===============================
-- 2:   Orders Table
-- ===============================

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount INT
);

INSERT INTO Orders VALUES
(101, 1, '2024-10-01', 250),
(102, 2, '2024-10-05', 300),
(103, 1, '2024-10-07', 150),
(104, 3, '2024-10-10', 450),
(105, 6, '2024-10-12', 400);
-- ===============================
-- 3: Payments Table
-- ===============================

DROP TABLE IF EXISTS Payments;
CREATE TABLE Payments (
    PaymentID VARCHAR(10) PRIMARY KEY,
    CustomerID INT,
    PaymentDate DATE,
    Amount INT
);

INSERT INTO Payments VALUES
('P001', 1, '2024-10-02', 250),
('P002', 2, '2024-10-06', 300),
('P003', 3, '2024-10-11', 450),
('P004', 4, '2024-10-15', 200);
-- ===============================
-- 4: Employees Table
-- ===============================

DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    ManagerID INT
);

INSERT INTO Employees VALUES
(1, 'Alex Green', NULL),
(2, 'Brian Lee', 1),
(3, 'Carol Ray', 1),
(4, 'David Kim', 2),
(5, 'Eva Smith', 2);



-- =========================================
-- Q1: Retrieve all customers who have placed at least one order.
-- =========================================
SELECT DISTINCT c.*
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

-- =========================================
-- Q2: Retrieve all customers and their orders,
-- including customers who have not placed any orders.
-- =========================================
SELECT c.CustomerID, c.CustomerName, c.City,
       o.OrderID, o.OrderDate, o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;


-- =========================================
-- Q3: Retrieve all orders and their corresponding customers,
-- including orders placed by unknown customers.
-- =========================================
SELECT o.OrderID, o.OrderDate, o.Amount,
       c.CustomerID, c.CustomerName, c.City
FROM Orders o
LEFT JOIN Customers c
ON o.CustomerID = c.CustomerID;


-- =========================================
-- Q4: Display all customers and orders,
-- whether matched or not.
-- =========================================
SELECT c.CustomerID, c.CustomerName, c.City,
       o.OrderID, o.OrderDate, o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID

UNION

SELECT c.CustomerID, c.CustomerName, c.City,
       o.OrderID, o.OrderDate, o.Amount
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;

-- =========================================
-- Q5: Find customers who have not placed any orders.
-- =========================================
SELECT c.CustomerID, c.CustomerName, c.City
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- =========================================
-- Q6: Retrieve customers who made payments but did not place any orders.
-- =========================================
SELECT c.CustomerID, c.CustomerName, c.City
FROM Customers c
INNER JOIN Payments p
ON c.CustomerID = p.CustomerID
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- =========================================
-- Q7: Generate all possible combinations between customers and orders.
-- =========================================
SELECT c.CustomerName, o.OrderID
FROM Customers c
CROSS JOIN Orders o;

-- =========================================
-- Q8: Show all customers along with order and payment amounts.
-- =========================================
SELECT c.CustomerName,
       o.Amount AS OrderAmount,
       p.Amount AS PaymentAmount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p
ON c.CustomerID = p.CustomerID;

-- =========================================
-- Q9: Retrieve customers who have both placed orders and made payments.
-- =========================================
SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
INNER JOIN Payments p
ON c.CustomerID = p.CustomerID;