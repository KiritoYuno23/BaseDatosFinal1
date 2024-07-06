-- Crear la tabla Customers
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    ClientName VARCHAR(50) NOT NULL,
    CompanyName VARCHAR(50),
    Address VARCHAR(100),
    City VARCHAR(50),
    Region VARCHAR(50),
    Country VARCHAR(50)
);

-- Crear la tabla Suppliers
CREATE TABLE Suppliers (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName VARCHAR(50) NOT NULL,
    CompanyName VARCHAR(50),
    Address VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50)
);


-- Crear la tabla Products
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    ProductDesc VARCHAR(255),
    CategoryName VARCHAR(50),
);

-- Crear la tabla Employees
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Full_Name VARCHAR(50) NOT NULL,
    Title VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100),
    City VARCHAR(50),
    Region VARCHAR(50),
    Country VARCHAR(50)
);

-- Crear la tabla Ventas
CREATE TABLE Ventas (
    VentasID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    SupplierID INT,
    EmployeeID INT,
    SaleDate DATE,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

GO



CREATE PROCEDURE InsertData
    -- Parámetros para la tabla Customers
    @ClientName VARCHAR(50) = NULL,
    @CompanyName_Customer VARCHAR(50) = NULL,
    @Address_Customer VARCHAR(100) = NULL,
    @City_Customer VARCHAR(50) = NULL,
    @Region_Customer VARCHAR(50) = NULL,
    @Country_Customer VARCHAR(50) = NULL,

    -- Parámetros para la tabla Suppliers
    @SupplierName VARCHAR(50) = NULL,
    @CompanyName_Supplier VARCHAR(50) = NULL,
    @Address_Supplier VARCHAR(100) = NULL,
    @City_Supplier VARCHAR(50) = NULL,
    @Country_Supplier VARCHAR(50) = NULL,

    -- Parámetros para la tabla Employees
    @Full_Name VARCHAR(50) = NULL,
    @Title VARCHAR(50) = NULL,
    @HireDate DATE = NULL,
    @Address_Employee VARCHAR(100) = NULL,
    @City_Employee VARCHAR(50) = NULL,
    @Region_Employee VARCHAR(50) = NULL,
    @Country_Employee VARCHAR(50) = NULL,

    -- Parámetros para la tabla Products
    @ProductName VARCHAR(50) = NULL,
    @ProductDesc VARCHAR(255) = NULL,
    @CategoryName VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar en la tabla correspondiente según los parámetros proporcionados
    CASE 
        WHEN @ClientName IS NOT NULL THEN
            INSERT INTO Customers (ClientName, CompanyName, Address, City, Region, Country)
            VALUES (@ClientName, @CompanyName_Customer, @Address_Customer, @City_Customer, @Region_Customer, @Country_Customer);

        WHEN @SupplierName IS NOT NULL THEN
            INSERT INTO Suppliers (SupplierName, CompanyName, Address, City, Country)
            VALUES (@SupplierName, @CompanyName_Supplier, @Address_Supplier, @City_Supplier, @Country_Supplier);

        WHEN @Full_Name IS NOT NULL THEN
            INSERT INTO Employees (Full_Name, Title, HireDate, Address, City, Region, Country)
            VALUES (@Full_Name, @Title, @HireDate, @Address_Employee, @City_Employee, @Region_Employee, @Country_Employee);

        WHEN @ProductName IS NOT NULL THEN
            INSERT INTO Products (ProductName, ProductDesc, CategoryName)
            VALUES (@ProductName, @ProductDesc, @CategoryName);
    END;

GO
















































































create DATABASE Tarea


create TABLE Customer(
    clienteID int not null UNIQUE identity (1,1),
    clienteBK  int not null UNIQUE ,
    CompanyName VARCHAR(50) UNIQUE not null,
    [Address] VARCHAR(50) not null,
    City varchar(50) not null,
    Region VARCHAR(50) not null,
    Country varchar (50) not null,
    CONSTRAINT PK_clienteID
    PRIMARY key (clienteID,clienteBK,CompanyName)
)
CREATE TABLE Supplier(
    supplierID int not null UNIQUE IDENTITY(1,1),
    supplierBK int not null UNIQUE ,
    CompanyName VARCHAR(50) UNIQUE not null,
    country VARCHAR(50) not null,
    [Address] VARCHAR(50) not null,
    city VARCHAR(50) not NULL
    CONSTRAINT Pk_Supplier
    PRIMARY key (supplierID,supplierBK),
    CONSTRAINT fk_CompanyName
    FOREIGN KEY(CompanyName)
    REFERENCES Customer(CompanyName)
)
CREATE TABLE Employee(
    employeeID INT NOT NULL UNIQUE IDENTITY(1,1),
    employeeBK int not null UNIQUE,
    First_Name VARCHAR(50) not null,
    Last_Name VARCHAR(50) not null,
    Title VARCHAR(50) not null,
    HireDate date not null,
    [Address] VARCHAR (50) not null,
    city VARCHAR(50) not null,
    Region VARCHAR(50) not null,
    Country VARCHAR(50) not null,
    CONSTRAINT Pk_Employee
    PRIMARY key (employeeID,employeeBK)

)
CREATE TABLE Product(
    ProductID int not null UNIQUE IDENTITY(1,1),
    ProductBK int not null UNIQUE ,
    Product_Name VARCHAR(50) UNIQUE,
    Category_Name int not null UNIQUE ,
    CONSTRAINT pk_producto
    PRIMARY KEY (ProductID,ProductBK)
)

Create TABLE Venta(
    clienteID int not null UNIQUE ,
    ProductID int not null UNIQUE ,
    employeeID INT NOT NULL UNIQUE ,
    supplierID int not null UNIQUE,
    quantity int,
    unitPrice money,
    CONSTRAINT FK_Customer
    FOREIGN key (clienteID)
    REFERENCES Customer(clienteID),
    CONSTRAINT FK_Product
    FOREIGN key (ProductID)
    REFERENCES Product(ProductID),
    CONSTRAINT FK_Employee
    FOREIGN key (employeeid)
    REFERENCES Employee(employeeID),
    CONSTRAINT FK_Supplier
    FOREIGN key (supplierID)
    REFERENCES Supplier(supplierID)


)