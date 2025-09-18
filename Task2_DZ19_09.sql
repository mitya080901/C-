-- TASK DZ 2
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'University')
    CREATE DATABASE University;
GO

-- ����������� ��������
USE University;
GO

-- ������� ������� Students, ���� ��� ����������
IF OBJECT_ID('Students', 'U') IS NOT NULL
    DROP TABLE Students;
GO

-- ������� ������� Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    BirthDate DATE NULL,
    Email NVARCHAR(100) NULL,
    GroupName NVARCHAR(20) NULL
);
GO

-- ��������� ����� ������ � ���������
INSERT INTO Students (FirstName, LastName, BirthDate, Email, GroupName)
VALUES
    ('�������', '�������', '2001-04-12', 'morozov@example.com', '��-201'),
    ('���������', '�������', '2000-09-25', 'volkova@example.com', '��-201'),
    ('�������', '�������', '2002-01-18', 'lebedev@example.com', '��-201'),
    ('�����', '�������', '1999-06-30', 'kozlova@example.com', '��-202'),
    ('������', '������', '2001-11-07', 'zaytsev@example.com', '��-202'),
    ('����', '������', '2000-03-22', 'orlova@example.com', '��-201'),
    ('������', '���������', '2002-07-14', 'grigoryev@example.com', '��-202');
GO

-- ������: ������� ���� ��������� �� ������ "��-201"
SELECT *
FROM Students
WHERE GroupName = '��-201';
GO

-- ������: ������� ������� ������� ������� � ������ "��-202". �������� ��� ������
UPDATE Students
SET GroupName = '��-202'
WHERE FirstName = '�������' AND LastName = '�������';
GO

-- ��������� ���������
SELECT * FROM Students WHERE LastName = '�������';
GO

-- ������: ������� ����� ������� �����������. ������� � ������
DELETE FROM Students
WHERE FirstName = '�����' AND LastName = '�������';
GO

-- ��������� ���������
SELECT * FROM Students;
GO