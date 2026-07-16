-- Query 1:
-- Create the SalesData table
CREATE TABLE SalesData (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    City VARCHAR(100),
    PurchaseAmount DECIMAL(10,2),
    PurchaseDate DATE
);

-- Insert 10,000 rows of realistic sample data
DECLARE @i INT = 1;
DECLARE @FirstNames TABLE (FirstName VARCHAR(50));
DECLARE @LastNames TABLE (LastName VARCHAR(50));
DECLARE @Cities TABLE (City VARCHAR(100));

INSERT INTO @FirstNames VALUES 
('John'), ('Mary'), ('Robert'), ('Patricia'), ('Michael'), 
('Linda'), ('James'), ('Barbara'), ('William'), ('Elizabeth'),
('David'), ('Jennifer'), ('Richard'), ('Susan'), ('Joseph');

INSERT INTO @LastNames VALUES 
('Smith'), ('Johnson'), ('Williams'), ('Brown'), ('Davis'),
('Miller'), ('Wilson'), ('Moore'), ('Taylor'), ('Anderson'),
('Thomas'), ('Jackson'), ('White'), ('Harris'), ('Martin');

INSERT INTO @Cities VALUES 
('New York'), ('Los Angeles'), ('Chicago'), ('Houston'), ('Phoenix'),
('Philadelphia'), ('San Antonio'), ('San Diego'), ('Dallas'), ('Austin'),
('Jacksonville'), ('Seattle'), ('Denver'), ('Boston'), ('Miami');

WHILE @i <= 10000
BEGIN
    INSERT INTO SalesData (Name, Age, City, PurchaseAmount, PurchaseDate)
    VALUES (
        (SELECT FirstName FROM @FirstNames ORDER BY NEWID() OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) + ' ' +
        (SELECT LastName FROM @LastNames ORDER BY NEWID() OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY),
        18 + ABS(CHECKSUM(NEWID())) % 60,
        (SELECT City FROM @Cities ORDER BY NEWID() OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY),
        CAST(ABS(CHECKSUM(NEWID())) % 9990 + 10 AS DECIMAL(10,2)) / 100,
        DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 365, '2024-01-01')
    );
    SET @i = @i + 1;
END;

-- Verify the data
SELECT COUNT(*) AS TotalRows FROM SalesData;
SELECT TOP 10 * FROM SalesData;
GO
-- Query 2: Find the top 5 cities by total revenue
SELECT TOP 5
    City,
    SUM(PurchaseAmount) AS TotalRevenue,
    COUNT(*) AS NumberOfPurchases,
    AVG(PurchaseAmount) AS AvgPurchaseAmount
FROM SalesData
GROUP BY City
ORDER BY TotalRevenue DESC;
GO
-- Query 3: 
SELECT
    CustomerID,
    Name,
    Age,
    City,
    PurchaseAmount,
    PurchaseDate
FROM SalesData
WHERE PurchaseAmount > (
    SELECT AVG(PurchaseAmount)
    FROM SalesData
)
ORDER BY PurchaseAmount DESC;