-- Q1. What is a Common Table Expression (CTE), and how does it improve SQL query readability?
-- A Common Table Expression (CTE) is a temporary result set defined using the WITH clause in SQL.
-- It allows complex queries to be broken into smaller, logical parts which makes them easier to read,
-- understand, and maintain. Instead of writing long nested subqueries, developers can define a CTE
-- and reuse it within the main query, improving readability and organization of SQL code.

-- Q2. Why are some views updatable while others are read-only? Explain with an example.
-- A view is updatable when it is based on a single table and does not contain complex SQL operations
-- such as JOIN, GROUP BY, DISTINCT, or aggregate functions (SUM, AVG, etc.).
-- When a view includes these operations, it becomes read-only because the database cannot determine
-- how to update the underlying tables correctly.
-- Example:
-- An updatable view:
-- CREATE VIEW SimpleView AS
-- SELECT ProductID, ProductName, Price FROM Products;
-- A read-only view:
-- CREATE VIEW SalesSummary AS
-- SELECT ProductID, SUM(Quantity) FROM Sales GROUP BY ProductID;

-- Q3. What advantages do stored procedures offer compared to writing raw SQL queries repeatedly?
-- Stored procedures are precompiled SQL programs stored inside the database.
-- Advantages include:
-- 1. Reusability – The same procedure can be executed multiple times without rewriting the query.
-- 2. Better Performance – Stored procedures are precompiled and execute faster.
-- 3. Security – Users can execute procedures without direct access to the tables.
-- 4. Maintainability – Changes can be made in one place instead of modifying multiple queries.
-- 5. Reduced Network Traffic – Only the procedure call is sent to the server instead of long SQL queries.

-- Q4. What is the purpose of triggers in a database? Mention one use case where a trigger is essential.
-- A trigger is a database object that automatically executes when a specific event occurs in a table,
-- such as INSERT, UPDATE, or DELETE. Triggers help enforce business rules, maintain data integrity,
-- and automate tasks.
-- Example use case:
-- A trigger can automatically store deleted records into an archive table so that the data is not lost.

-- Q5. Explain the need for data modelling and normalization when designing a database.
-- Data modelling is the process of designing the structure of a database by defining tables,
-- relationships, and constraints. Normalization is the process of organizing data to reduce
-- redundancy and improve data integrity.
-- The benefits include:
-- 1. Eliminating duplicate data
-- 2. Improving data consistency
-- 3. Making the database easier to maintain
-- 4. Improving query performance



CREATE database IF NOT exists assignment_db;
USE assignment_db;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;
DROP VIEW IF EXISTS vw_CategorySummary;
DROP VIEW IF EXISTS vw_ProductPrice;
DROP PROCEDURE IF EXISTS GetProductsByCategory;
DROP TRIGGER IF EXISTS after_product_delete;
CREATE  TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(1, 'Keyboard', 'Electronics', 1200),
(2, 'Mouse', 'Electronics', 800),
(3, 'Chair', 'Furniture', 2500),
(4, 'Desk', 'Furniture', 5500);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Sales VALUES
(1, 1, 4, '2024-01-05'),
(2, 2, 10, '2024-01-06'),
(3, 3, 2, '2024-01-10'),
(4, 4, 1, '2024-01-11');


-- Q6. Write a CTE to calculate total revenue for each product (Revenue = Price × Quantity)
-- Return only products where revenue > 3000

WITH RevenueCTE AS (
    SELECT 
        p.ProductID,
        p.ProductName,
        p.Price,
        s.Quantity,
        (p.Price * s.Quantity) AS Revenue
    FROM Products p
    JOIN Sales s ON p.ProductID = s.ProductID
)
SELECT *
FROM RevenueCTE
WHERE Revenue > 3000;


-- Q7. Create a view named vw_CategorySummary that shows Category, TotalProducts, AveragePrice

CREATE VIEW vw_CategorySummary AS
SELECT 
    Category,
    COUNT(ProductID) AS TotalProducts,
    AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;

SELECT * FROM vw_CategorySummary;


-- Q8. Create an updatable view with ProductID, ProductName, Price
-- Then update the price of ProductID = 1 using the view

CREATE VIEW vw_ProductPrice AS
SELECT ProductID, ProductName, Price
FROM Products;

UPDATE vw_ProductPrice
SET Price = 1500
WHERE ProductID = 1;


-- Q9. Create a stored procedure that accepts a category name
-- and returns all products belonging to that category

DELIMITER //

CREATE PROCEDURE GetProductsByCategory(IN cat_name VARCHAR(50))
BEGIN
    SELECT *
    FROM Products
    WHERE Category = cat_name;
END //

DELIMITER ;

CALL GetProductsByCategory('Electronics');


-- Q10. Create an AFTER DELETE trigger to archive deleted product rows

DROP TABLE IF exists ProductArchive;
CREATE TABLE ProductArchive (
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    DeletedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

drop trigger IF exists after_product_delete;
DELIMITER //


CREATE TRIGGER after_product_delete
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductArchive (ProductID, ProductName, Category, Price)
    VALUES (OLD.ProductID, OLD.ProductName, OLD.Category, OLD.Price);
END //

DELIMITER ;
DELETE FROM Sales WHERE ProductID = 2;
DELETE FROM Products WHERE ProductID = 2;

SELECT * FROM ProductArchive;