USE Northwind;



create or ALTER PROCEDURE sp_reporteventas
-- parametros 
    @fechainicio as INT,
    @fechasalida as int 
as 
BEGIN
    select *
    from Customers as c 
    INNER JOIN Orders as o 
    on c.CustomerID = o.OrderID
    INNER JOIN [Order Details] as od 
    on od.OrderID = o.OrderID
    WHERE o.OrderDate = @fechainicio and o.OrderDate = @fechasalida
    GROUP by c.CompanyName   
end
go

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














CREATE PROCEDURE VerVentasPorCliente (
    @Año INT
)
AS
BEGIN
    SELECT *
    FROM Customers as c 
    INNER join [Orders] as o
    on c.CustomerID = o.CustomerID
    INNER join [Order Details] as od 
    on od.OrderID = o.OrderID

    WHERE YEAR(o.OrderDate) = @año
END;


SELECT*
from [Order Details]

SELECT * 
from Products

SELECT*
from [Orders]

SELECT*
from [Order Details]


SELECT*
from Employees

SELECT *
    FROM Customers as c 
    INNER join [Orders] as o
    on c.CustomerID = o.CustomerID
    INNER join [Order Details] as od 
    on od.OrderID = o.OrderID

    WHERE YEAR(o.OrderDate) = '1996'







CREATE PROCEDURE InsertarProductos (

            @ProductName, nvarchar(40),
           ,@SupplierID, int,
           ,@CategoryID, int,
           ,@QuantityPerUnit, nvarchar(20) = null,
           ,@UnitPrice, money = null,
           ,@UnitsInStock, smallint = null,
           ,@UnitsOnOrder, smallint = null,
           ,@ReorderLevel, smallint = null,
           ,@Discontinued, bit = null,
)

AS
BEGIN
           INSERT INTO [dbo].[Products]
           ([ProductName]
           ,[SupplierID]
           ,[CategoryID]
           ,[QuantityPerUnit]
           ,[UnitPrice]
           ,[UnitsInStock]
           ,[UnitsOnOrder]
           ,[ReorderLevel]
           ,[Discontinued])

        VALUES
            (@ProductName
           ,@SupplierID
           ,@CategoryID
           ,@QuantityPerUnit
           ,@UnitPrice
           ,@UnitsInStock
           ,@UnitsOnOrder
           ,@ReorderLevel
           ,@Discontinued)
END;


BEGIN TRANSACTION

EXEC InsertarProductos
            @ProductName = " "
           ,@SupplierID = " "
           ,@CategoryID = " "
           ,@QuantityPerUnit = " "
           ,@UnitPrice = " "
           ,@UnitsInStock = " "
           ,@UnitsOnOrder = " "
           ,@ReorderLevel = " "
           ,@Discontinued = " "

GO













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