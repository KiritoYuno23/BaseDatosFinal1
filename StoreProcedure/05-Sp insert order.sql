USE [Northwind]
GO
/****** Object:  StoredProcedure [dbo].[spu_agregar_venta]    Script Date: 26/07/2024 9:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create or ALTER   procedure [dbo].[spu_agregar_venta]
           @CustomerID nchar(5),
           @EmployeeID int,
           @OrderDate datetime,
           @RequiredDate datetime,
           @ShippedDate datetime,
           @ShipVia int,
           @Freight money = NULL,
           @ShipName nvarchar(40) = NULL,
           @ShipAddress nvarchar(60)=NULL,
           @ShipCity nvarchar(15)=NULL,
           @ShipRegion nvarchar(15)=NULL,
           @ShipPostalCode nvarchar(10)=NULL,
           @ShipCountry nvarchar(15) = NULL,
           @ProductID int,
           @Quantity smallint,
           @Discount real = 0
  AS
  BEGIN
       BEGIN TRANSACTION;
       BEGIN TRY
         INSERT INTO [dbo].[Orders]
           ([CustomerID]
           ,[EmployeeID]
           ,[OrderDate]
           ,[RequiredDate]
           ,[ShippedDate]
           ,[ShipVia]
           ,[Freight]
           ,[ShipName]
           ,[ShipAddress]
           ,[ShipCity]
           ,[ShipRegion]
           ,[ShipPostalCode]
           ,[ShipCountry])
     VALUES
           (@CustomerID,
            @EmployeeID,
            @OrderDate,
           @RequiredDate,
           @ShippedDate,
           @ShipVia,
           @Freight,
           @ShipName,
           @ShipAddress,
           @ShipCity,
           @ShipRegion,
           @ShipPostalCode,
           @ShipCountry);

           -- Obtener el id insertado en orders
           Declare @orderid int;
           set @orderid = SCOPE_IDENTITY();

           -- Obtener el precio del producto
           Declare @precioVenta money
           Select @precioVenta = unitprice from products
           where ProductID = @ProductID;

           -- Insertar en ordersDetails
           INSERT INTO [dbo].[Order Details]
           ([OrderID]
           ,[ProductID]
           ,[UnitPrice]
           ,[Quantity]
           ,[Discount])
     VALUES
           (
           @orderid,
           @ProductID,
           @precioVenta,
           @Quantity,
           @Discount)

     -- Actualizar la tabla products en el campo unitsinstock
     update Products
     set UnitsInStock = UnitsInStock - @Quantity
     where ProductID = @ProductID;

     COMMIT TRANSACTION;

       END TRY
       BEGIN CATCH

       ROLLBACK TRANSACTION;
       DECLARE @mensajeError nvarchar(4000);
       Set @mensajeError = ERROR_MESSAGE();
       print @mensajeError;

       END CATCH;

  END;
