EASY
1. Дайте определения:
•	Данные (data) — это информация, представленная в форме, пригодной для обработки компьютером (например, числа, текст, даты).
•	База данных (database) — это организованное хранилище данных, которое позволяет удобно их сохранять, изменять и извлекать.
•	Реляционная база данных (relational database) — это база данных, в которой данные организованы в виде связанных между собой таблиц.
•	Таблица (table) — это структура, состоящая из строк и столбцов, в которой хранятся данные. Каждый столбец имеет имя и тип данных.
2. Перечислите 5 ключевых особенностей SQL Server:
1.	Поддержка транзакций (ACID-свойства).
2.	Высокая безопасность и управление пользователями.
3.	Расширенные средства резервного копирования и восстановления.
4.	Поддержка хранимых процедур и триггеров.
5.	Интеграция с Visual Studio и поддержка T-SQL.
3. Режимы аутентификации в SQL Server:
•	Windows Authentication — вход через учётную запись Windows.
•	SQL Server Authentication — вход с использованием логина и пароля, настроенных в SQL Server.

MEDIUM
4. Создание базы данных в SSMS:
CREATE DATABASE SchoolDB;
5. Создание таблицы Students:
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);

6. Различия между SQL Server, SSMS и SQL:
•	SQL Server — это сама система управления базами данных (СУБД).
•	SSMS (SQL Server Management Studio) — это графическая среда для работы с SQL Server (редактирование, администрирование, запросы).
•	SQL (Structured Query Language) — это язык программирования для работы с данными в реляционных базах (вставка, выборка, обновление и удаление).

HARD
7. Типы SQL-команд:
DQL (Data Query Language) Запрос данных SELECT * FROM Students;
DML (Data Manipulation Language) Изменение данных INSERT, UPDATE, DELETE
DDL (Data Definition Language) Определение структуры CREATE TABLE, ALTER, DROP
DCL (Data Control Language) Управление доступом GRANT, REVOKE
TCL (Transaction Control Language) Управление транзакциями BEGIN, COMMIT, ROLLBACK
8. Вставка трёх записей в таблицу Students:
INSERT INTO Students (StudentID, Name, Age)
VALUES 
(1, 'Алексей', 20),
(2, 'Мария', 22),
(3, 'Иван', 19);

9. Восстановление файла AdventureWorksDW2022.bak:
Шаги:
1.	Скачайте файл .bak по ссылке:
https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak
2.	Переместите файл .bak в папку резервного копирования SQL Server, например:
pgsql
КопироватьРедактировать
C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\
3.	Откройте SSMS, подключитесь к серверу.
4.	Кликните правой кнопкой мыши по папке Databases → Restore Database...
5.	Выберите:
o	Source: Device
o	Нажмите Add, выберите файл .bak
6.	Назовите базу (например AdventureWorksDW2022) → Нажмите OK
7.	Дождитесь завершения восстановления.

