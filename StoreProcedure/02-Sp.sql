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



