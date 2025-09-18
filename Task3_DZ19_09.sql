-- TASK 3 DZ

USE tempdb;
GO

-- Создаем и заполняем таблицу Sales с новыми данными
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
    ('Футболка Adidas', '2024-05-15', 1800.00, 'Одежда'),
    ('Кроссовки Puma', '2024-05-15', 4500.00, 'Одежда'),
    ('Бананы', '2024-05-16', 300.00, 'Еда'),
    ('Молоко', '2024-05-16', 150.00, 'Еда'),
    ('Конструктор Lego', '2024-05-17', 2500.00, 'Игрушки'),
    ('Машинка Hot Wheels', '2024-05-17', 800.00, 'Игрушки'),
    ('Планшет Apple', '2024-05-18', 35000.00, 'Электроника'),
    ('Клавиатура Mechanical', '2024-05-18', 2000.00, 'Электроника'),
    ('Пылесос Dyson', '2024-05-19', 15000.00, 'Бытовая техника'),
    ('Утюг Philips', '2024-05-19', 2500.00, 'Бытовая техника');

-- 1. Задача: Посчитать общую сумму всех продаж.
SELECT SUM(Amount) AS TotalRevenue
FROM Sales;

-- 2. Задача: Найти среднюю сумму продажи.
SELECT AVG(Amount) AS AverageCheck
FROM Sales;

-- 3. Задача: Посчитать количество продаж в каждой категории товаров.
SELECT Category, COUNT(*) AS SalesCount
FROM Sales
GROUP BY Category;

-- 4. Задача: Вывести категории товаров, у которых общая сумма продаж превышает 10 000 рублей.
SELECT Category, SUM(Amount) AS TotalCategoryRevenue
FROM Sales
GROUP BY Category
HAVING SUM(Amount) > 10000;

-- 5. Задача: Найти день с максимальной общей суммой продаж.
SELECT TOP(1) SaleDate, SUM(Amount) AS DailyRevenue
FROM Sales
GROUP BY SaleDate
ORDER BY DailyRevenue DESC;