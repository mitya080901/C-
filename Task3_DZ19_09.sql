-- TASK 3 DZ

USE tempdb;
GO

-- ������� � ��������� ������� Sales � ������ �������
IF OBJECT_ID('Sales', 'U') IS NOT NULL
    DROP TABLE Sales;

CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(50) NOT NULL,
    SaleDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Category NVARCHAR(20) NOT NULL
);

INSERT INTO Sales (ProductName, SaleDate, Amount, Category)
VALUES
    ('�������� Adidas', '2024-05-15', 1800.00, '������'),
    ('��������� Puma', '2024-05-15', 4500.00, '������'),
    ('������', '2024-05-16', 300.00, '���'),
    ('������', '2024-05-16', 150.00, '���'),
    ('����������� Lego', '2024-05-17', 2500.00, '�������'),
    ('������� Hot Wheels', '2024-05-17', 800.00, '�������'),
    ('������� Apple', '2024-05-18', 35000.00, '�����������'),
    ('���������� Mechanical', '2024-05-18', 2000.00, '�����������'),
    ('������� Dyson', '2024-05-19', 15000.00, '������� �������'),
    ('���� Philips', '2024-05-19', 2500.00, '������� �������');

-- 1. ������: ��������� ����� ����� ���� ������.
SELECT SUM(Amount) AS TotalRevenue
FROM Sales;

-- 2. ������: ����� ������� ����� �������.
SELECT AVG(Amount) AS AverageCheck
FROM Sales;

-- 3. ������: ��������� ���������� ������ � ������ ��������� �������.
SELECT Category, COUNT(*) AS SalesCount
FROM Sales
GROUP BY Category;

-- 4. ������: ������� ��������� �������, � ������� ����� ����� ������ ��������� 10 000 ������.
SELECT Category, SUM(Amount) AS TotalCategoryRevenue
FROM Sales
GROUP BY Category
HAVING SUM(Amount) > 10000;

-- 5. ������: ����� ���� � ������������ ����� ������ ������.
SELECT TOP(1) SaleDate, SUM(Amount) AS DailyRevenue
FROM Sales
GROUP BY SaleDate
ORDER BY DailyRevenue DESC;