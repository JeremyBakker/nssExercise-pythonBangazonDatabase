DELETE FROM Employees;
DELETE FROM Training;
DELETE FROM Orders;
DELETE FROM Computer;
DELETE FROM Product Types;
DELETE FROM Payment Types;
DELETE FROM Departments;
DELETE FROM Products
DELETE FROM Customers

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Training;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Computer;
DROP TABLE IF EXISTS ProductTypes;
DROP TABLE IF EXISTS PaymentTypes;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Computer (
    ComputerId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    PurchseDate TEXT NOT NULL,
    DecomissionDate TEXT NOT NULL,
	Description TEXT NOT NULL
);

CREATE TABLE PaymentTypes (
    PaymentTypeId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Account Number INT NOT NULL,
    PaymentType TEXT NOT NULL
);

CREATE TABLE ProductTypes (
    ProductTypeId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    ProductType TEXT NOT NULL
);

CREATE TABLE Training (
    TrainingId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    StartDate TEXT NOT NULL,
    EndDate TEXT NOT NULL,
	MaxAttendees TEXT NOT NULL,
	TrainingTitle TEXT NOT NULL
);

CREATE TABLE Employees (
    EmployeeId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
	ComputerId INT NOT NULL,
	FOREIGN KEY(ComputerId) REFERENCES Computer(ComputerId)
);


CREATE TABLE Orders (
    OrderId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	PaymentTypeId INT NOT NULL,
    FOREIGN KEY(PaymentTypeId) REFERENCES PaymentTypes(PaymentTypeId)
);


CREATE TABLE Departments (
    DepartmentId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	EmployeeId INT NOT NULL,
    Supervisor TEXT NOT NULL,
	Budget TEXT NOT NULL,
	Name TEXT NOT NULL,
	FOREIGN KEY(EmployeeId) REFERENCES Employees(EmployeeId)
);

CREATE TABLE Products (
    ProductId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ProductTypeId INT NOT NULL,
	Price INT NOT NULL,
	Title TEXT NOT NULL,
	Description TEXT NOT NULL,
	CustomerId INT NOT NULL,
	FOREIGN KEY(CustomerId) REFERENCES Customers(CustomerId),
	FOREIGN KEY(ProductTypeId) REFERENCES ProductTypes(ProductTypeId)
);

CREATE TABLE Customers (
    CustomerId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	OrderId INT NOT NULL,
	PaymentTypeId INT NOT NULL,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
	AccountCreationDate TEXT NOT NULL,
	DateOfLastActivity TEXT NOT NULL,
	FOREIGN KEY (PaymentTypeId) REFERENCES PaymentTypes(PaymentTypeId),
	FOREIGN KEY(OrderId) REFERENCES Orders(OrderId)
);