 Easy-Level Tasks (10)
--1. Дайте определение и объясните назначение BULK INSERT.
-- BULK INSERT используется для быстрой загрузки больших объемов данных из файла в таблицу SQL Server.
-- Пример синтаксиса:
-- BULK INSERT TableName
-- FROM 'C:\path\to\file.txt'
-- WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

--2. Укажите четыре формата файлов, которые можно импортировать в SQL Server.
•	.csv
•	.txt
•	.xls / .xlsx (Excel)
•	.xml / .json
--3. Создайте таблицу Products.


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

4. Вставьте 3 записи в Products.


INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Keyboard', 25.99),
(2, 'Mouse', 15.49),
(3, 'Monitor', 199.99);

5. Объясните разницу между NULL и NOT NULL.


-- NULL означает, что значение отсутствует.
-- NOT NULL означает, что значение обязательно должно быть указано.

6. Добавьте ограничение UNIQUE на ProductName.


ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

7. Напишите комментарий в SQL-запросе.

-- Этот запрос добавляет новую категорию в таблицу Categories
INSERT INTO Categories (CategoryID, CategoryName) VALUES (1, 'Electronics');
8. Добавьте колонку CategoryID в Products.

ALTER TABLE Products
ADD CategoryID INT;
9. Создайте таблицу Categories.


CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

10. Объясните назначение колонки IDENTITY в SQL Server.

-- IDENTITY используется для автоинкрементных значений в таблице.
-- Пример: IDENTITY(1,1) — начинается с 1, увеличивается на 1 при каждой вставке.

Medium-Level Tasks (10)

1. Используйте BULK INSERT для загрузки данных из текстового файла.


-- Пример загрузки из файла:
BULK INSERT Products
FROM 'C:\data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

2. Создайте внешний ключ в Products, ссылающийся на Categories.


ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);

3. Объясните различия между PRIMARY KEY и UNIQUE KEY.

-- PRIMARY KEY:
-- - Только один на таблицу.
-- - Не допускает NULL.
-- - Гарантирует уникальность.

-- UNIQUE KEY:
-- - Может быть несколько на таблицу.
-- - Допускает NULL.
-- - Также гарантирует уникальность.

4. Добавьте ограничение CHECK, чтобы Price > 0.

ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);

5. Добавьте колонку Stock (INT NOT NULL) в Products.

ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;
6. Используйте ISNULL для замены NULL в Price на 0.


SELECT ProductID, ProductName, ISNULL(Price, 0) AS AdjustedPrice
FROM Products;

7. Опишите назначение и применение FOREIGN KEY.


-- FOREIGN KEY обеспечивает ссылочную целостность.
-- Он связывает одну таблицу с другой, гарантируя,
-- что значения в подчинённой таблице существуют в главной.

 Hard-Level Tasks (10)
1. Создайте таблицу Customers с ограничением CHECK на возраст ≥ 18.

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT CHECK (Age >= 18)
);

2. Создайте таблицу с IDENTITY, начиная с 100, шаг 10.

CREATE TABLE AutoIncrementTest (
    ID INT IDENTITY(100,10) PRIMARY KEY,
    Description VARCHAR(100)
);

3. Создайте таблицу OrderDetails с составным PRIMARY KEY.

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);

4. Объясните использование COALESCE и ISNULL для обработки NULL.


-- ISNULL(value, replacement): возвращает replacement, если value = NULL
-- COALESCE(val1, val2, ...): возвращает первый НЕ NULL из списка
-- COALESCE полезен для нескольких значений, ISNULL — для двух

5. Создайте таблицу Employees с PRIMARY KEY на EmpID и UNIQUE на Email.


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);

6. Создайте FOREIGN KEY с ON DELETE CASCADE и ON UPDATE CASCADE.


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
