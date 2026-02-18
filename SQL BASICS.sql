CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);
INSERT INTO employees VALUES
(101, 'Amit', 'Sharma', 'HR', 50000, '2020-01-15'),
(102, 'Riya', 'Kapoor', 'Sales', 75000, '2019-03-22'),
(103, 'Raj', 'Mehta', 'IT', 90000, '2018-07-11'),
(104, 'Neha', 'Verma', 'IT', 85000, '2021-09-01'),
(105, 'Arjun', 'Singh', 'Finance', 60000, '2022-02-10');
SELECT * FROM employees;
SELECT * FROM employees
ORDER BY salary ASC;
SELECT * FROM employees
ORDER BY department ASC, salary DESC;
SELECT * FROM employees
WHERE department = 'IT'
ORDER BY hire_date DESC;
USE company_db;
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount INT,
    sale_date DATE
);
INSERT INTO sales VALUES
(1, 'Aditi', 1500, '2024-08-01'),
(2, 'Rohan', 2200, '2024-08-03'),
(3, 'Aditi', 3500, '2024-09-05'),
(4, 'Meena', 2700, '2024-09-15'),
(5, 'Rohan', 1500, '2024-09-25');
SELECT * 
FROM sales
ORDER BY amount DESC;
SELECT * 
FROM sales
WHERE customer_name = 'Aditi';
-- Primary Key:
-- A column that uniquely identifies each record in a table.
-- It cannot contain NULL or duplicate values.

-- Foreign Key:
-- A column that links one table to another.
-- It refers to the Primary Key of another table.
-- It maintains relationship between tables.
-- Constraints are rules applied to table columns to ensure data accuracy and integrity.
-- Examples:
-- PRIMARY KEY → Unique + Not Null
-- FOREIGN KEY → Maintains relationship between tables
-- NOT NULL → Prevents empty values
-- UNIQUE → Prevents duplicate values
-- CHECK → Limits values
-- DEFAULT → Sets default value









