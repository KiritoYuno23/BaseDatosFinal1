use northwind;

/*Primer ejercicio*/
--crear una base de datos que permita vizualizar 
--lo vendido a los clientes mostrando el nombre del cliente y en año
CREATE PROCEDURE VisualzacionVentas
    @Year INT
AS
BEGIN
    SELECT 
        c.CompanyName AS nombrecliente,
        YEAR(o.OrderDate) AS añoOrden,
        SUM(od.Quantity * od.UnitPrice) AS ventastotales
    FROM 
        Orders o
        INNER JOIN Customers c ON o.CustomerID = c.CustomerID
        INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
    WHERE 
        YEAR(o.OrderDate) = @Year
    GROUP BY 
        c.CompanyName, 
        YEAR(o.OrderDate)
    ORDER BY 
        ventastotales DESC;
END;


EXEC VisualzacionVentas @Year = 1997;



select * from Customers

select * from Suppliers


/*Segundo ejercicio*/
--crear un store procedure que permita insertar un producto en la tabla Products

CREATE PROCEDURE InsertarProducto
    @ProductName NVARCHAR(40),
    @SupplierID INT,
    @CategoryID INT,
    @QuantityPerUnit NVARCHAR(20),
    @UnitPrice DECIMAL(10, 2),
    @UnitsInStock SMALLINT,
    @UnitsOnOrder SMALLINT,
    @ReorderLevel SMALLINT,
    @Discontinued BIT
AS
BEGIN

    BEGIN TRANSACTION;

    BEGIN TRY
        INSERT INTO Products (
            ProductName, 
            SupplierID, 
            CategoryID, 
            QuantityPerUnit, 
            UnitPrice, 
            UnitsInStock, 
            UnitsOnOrder, 
            ReorderLevel, 
            Discontinued
        )
        VALUES (
            @ProductName, 
            @SupplierID, 
            @CategoryID, 
            @QuantityPerUnit, 
            @UnitPrice, 
            @UnitsInStock, 
            @UnitsOnOrder, 
            @ReorderLevel, 
            @Discontinued
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        
        ROLLBACK TRANSACTION;


        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;


/*Tercer ejercicio*/
--crear un sp que inserteen los catalogos customer, employee, category, pero el sp debe recicbir 
--tambien como parametro el catalogo a insertar

CREATE PROCEDURE InsertIntoCatalog
    @Catalog NVARCHAR(50),
    @CustomerID NCHAR(5) = NULL,
    @CompanyName NVARCHAR(40) = NULL,
    @ContactName NVARCHAR(30) = NULL,
    @ContactTitle NVARCHAR(30) = NULL,
    @Address NVARCHAR(60) = NULL,
    @City NVARCHAR(15) = NULL,
    @Region NVARCHAR(15) = NULL,
    @PostalCode NVARCHAR(10) = NULL,
    @Country NVARCHAR(15) = NULL,
    @Phone NVARCHAR(24) = NULL,
    @Fax NVARCHAR(24) = NULL,
    @LastName NVARCHAR(20) = NULL,
    @FirstName NVARCHAR(10) = NULL,
    @Title NVARCHAR(30) = NULL,
    @TitleOfCourtesy NVARCHAR(25) = NULL,
    @BirthDate DATETIME = NULL,
    @HireDate DATETIME = NULL,
    @ReportsTo INT = NULL,
    @CategoryName NVARCHAR(15) = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    -- Iniciar una transacción
    BEGIN TRANSACTION;

    BEGIN TRY
        IF @Catalog = 'Customers'
        BEGIN
            INSERT INTO Customers (
                CustomerID,
                CompanyName,
                ContactName,
                ContactTitle,
                Address,
                City,
                Region,
                PostalCode,
                Country,
                Phone,
                Fax
            )
            VALUES (
                @CustomerID,
                @CompanyName,
                @ContactName,
                @ContactTitle,
                @Address,
                @City,
                @Region,
                @PostalCode,
                @Country,
                @Phone,
                @Fax
            );
        END
        ELSE IF @Catalog = 'Employees'
        BEGIN
            INSERT INTO Employees (
                LastName,
                FirstName,
                Title,
                TitleOfCourtesy,
                BirthDate,
                HireDate,
                Address,
                City,
                Region,
                PostalCode,
                Country,
                HomePhone,
                ReportsTo
            )
            VALUES (
                @LastName,
                @FirstName,
                @Title,
                @TitleOfCourtesy,
                @BirthDate,
                @HireDate,
                @Address,
                @City,
                @Region,
                @PostalCode,
                @Country,
                @Phone, -- Assuming Phone is HomePhone
                @ReportsTo
            );
        END
        ELSE IF @Catalog = 'Categories'
        BEGIN
            INSERT INTO Categories (
                CategoryName,
                Description
            )
            VALUES (
                @CategoryName,
                @Description
            );
        END
        ELSE
        BEGIN
           
            RAISERROR('No conozco el catalogo', 16, 1);
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH;
END;







--______________________________________________________________________________________





create DATABASE Tarea2
use Tarea2;


create TABLE Customer(
    clienteID int not null UNIQUE identity (1,1),
    clienteBK  int not null UNIQUE ,
    CompanyName VARCHAR(50) UNIQUE not null,
    [Address] VARCHAR(50) not null,
    City varchar(50) not null,
    Region VARCHAR(50) not null,
    Country varchar (50) not null,
    CONSTRAINT PK_clienteID
    PRIMARY key (clienteID)
)
CREATE TABLE Supplier(
    supplierID int not null UNIQUE IDENTITY(1,1),
    supplierBK int not null UNIQUE ,
    CompanyName VARCHAR(50) UNIQUE not null,
    country VARCHAR(50) not null,
    [Address] VARCHAR(50) not null,
    city VARCHAR(50) not NULL
    CONSTRAINT Pk_Supplier
    PRIMARY key (supplierID)
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
    PRIMARY key (employeeID)

)
CREATE TABLE Product(
    ProductID int not null UNIQUE IDENTITY(1,1),
    ProductBK int not null UNIQUE ,
    Product_Name VARCHAR(50) UNIQUE,
    Category_Name int not null UNIQUE ,
    CONSTRAINT pk_producto
    PRIMARY KEY (ProductID)
)

Create TABLE Ventas(
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

