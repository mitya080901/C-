-- TASK DZ 2
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'University')
    CREATE DATABASE University;
GO

-- Переключаем контекст
USE University;
GO

-- Удаляем таблицу Students, если она существует
IF OBJECT_ID('Students', 'U') IS NOT NULL
    DROP TABLE Students;
GO

-- Создаем таблицу Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    BirthDate DATE NULL,
    Email NVARCHAR(100) NULL,
    GroupName NVARCHAR(20) NULL
);
GO

-- Добавляем новые записи о студентах
INSERT INTO Students (FirstName, LastName, BirthDate, Email, GroupName)
VALUES
    ('Алексей', 'Морозов', '2001-04-12', 'morozov@example.com', 'КБ-201'),
    ('Екатерина', 'Волкова', '2000-09-25', 'volkova@example.com', 'КБ-201'),
    ('Дмитрий', 'Лебедев', '2002-01-18', 'lebedev@example.com', 'КБ-201'),
    ('Алина', 'Козлова', '1999-06-30', 'kozlova@example.com', 'ИС-202'),
    ('Максим', 'Зайцев', '2001-11-07', 'zaytsev@example.com', 'ИС-202'),
    ('Юлия', 'Орлова', '2000-03-22', 'orlova@example.com', 'КБ-201'),
    ('Никита', 'Григорьев', '2002-07-14', 'grigoryev@example.com', 'ИС-202');
GO

-- Задача: Вывести всех студентов из группы "КБ-201"
SELECT *
FROM Students
WHERE GroupName = 'КБ-201';
GO

-- Задача: Студент Дмитрий Лебедев перешел в группу "КБ-202". Изменить его данные
UPDATE Students
SET GroupName = 'КБ-202'
WHERE FirstName = 'Дмитрий' AND LastName = 'Лебедев';
GO

-- Проверяем изменение
SELECT * FROM Students WHERE LastName = 'Лебедев';
GO

-- Задача: Студент Алина Козлова отчислилась. Удалить её запись
DELETE FROM Students
WHERE FirstName = 'Алина' AND LastName = 'Козлова';
GO

-- Проверяем результат
SELECT * FROM Students;
GO