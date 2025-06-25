Lesson 2: DDL and DML Commands
Basic-Level Tasks (10)

1. Создайте таблицу Employees со столбцами: EmpID, Name, Salary.
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

2. Вставьте 3 записи с разными подходами INSERT INTO.
-- Одинарная вставка
INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Alex', 6000.00);

-- Вставка сразу двух строк
INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
(2, 'Maria', 5500.00),
(3, 'John', 4800.00);

3. Обновите зарплату сотрудника с EmpID = 1 до 7000.
UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1;

4. Удалите запись, где EmpID = 2.
DELETE FROM Employees
WHERE EmpID = 2;

5. Определите разницу между DELETE, TRUNCATE, DROP.
-- DELETE удаляет строки, но сохраняет структуру таблицы. Можно использовать WHERE.
-- TRUNCATE удаляет все строки быстрее, не требует WHERE, не записывается построчно в журнал.
-- DROP полностью удаляет таблицу со всей структурой.
________________________________________
6. Измените столбец Name на VARCHAR(100).
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);
7. Добавьте новый столбец Department.
ALTER TABLE Employees
ADD Department VARCHAR(50);

8. Измените тип столбца Salary на FLOAT.
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

9. Создайте таблицу Departments.
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

10. Удалите все записи из Employees, не удаляя структуру.
TRUNCATE TABLE Employees;

🔸 Intermediate-Level Tasks (6)
1. Вставьте 5 записей в Departments через INSERT INTO SELECT.
-- Создаем временную таблицу
SELECT 1 AS DepartmentID, 'HR' AS DepartmentName
INTO #TempDepartments
UNION
SELECT 2, 'IT'
UNION
SELECT 3, 'Sales'
UNION
SELECT 4, 'Finance'
UNION
SELECT 5, 'Logistics';

-- Вставляем в Departments
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT DepartmentID, DepartmentName FROM #TempDepartments;

DROP TABLE #TempDepartments;

2. Обновите Department у сотрудников с зарплатой > 5000 на 'Management'.
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;
________________________________________
3. Удалите всех сотрудников, сохранив структуру.
DELETE FROM Employees;

4. Удалите столбец Department из Employees.
ALTER TABLE Employees
DROP COLUMN Department;

5. Переименуйте таблицу Employees в StaffMembers.
EXEC sp_rename 'Employees', 'StaffMembers';

6. Удалите таблицу Departments.
DROP TABLE Departments;

🔺 Advanced-Level Tasks (9)
1. Создайте таблицу Products.
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Description VARCHAR(200)
);

2. Добавьте ограничение CHECK для Price > 0.
ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);

3. Добавьте столбец StockQuantity со значением по умолчанию 50.
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

4. Переименуйте Category в ProductCategory.
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

5. Вставьте 5 записей в Products.
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES 
(1, 'Laptop', 'Electronics', 1200.00, 'Gaming laptop'),
(2, 'Desk', 'Furniture', 200.00, 'Wooden desk'),
(3, 'Pen', 'Stationery', 1.50, 'Blue ink pen'),
(4, 'Chair', 'Furniture', 75.00, 'Office chair'),
(5, 'Headphones', 'Electronics', 150.00, 'Wireless headset');

6. Создайте резервную таблицу Products_Backup.
SELECT * INTO Products_Backup
FROM Products;

7. Переименуйте таблицу Products в Inventory.
EXEC sp_rename 'Products', 'Inventory';
8. Измените тип Price на FLOAT в Inventory.
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;
9. Добавьте ProductCode как IDENTITY(1000, 5).
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000,5);

