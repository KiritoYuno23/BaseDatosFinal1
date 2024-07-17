-- Ejercicio 1: 
-- Realiazar una venta dentro de la base de datos norwind utilizando transacciones y 
-- store procedures


create or alter PROCEDURE sp_nueva_venta(

            -- Order
            @CustomerID nchar(5)
           ,@EmployeeID int
           ,@OrderDate datetime
           ,@RequiredDate datetime
           ,@ShippedDate datetime
           ,@ShipVia int
           ,@Freight money = null
           ,@ShipName nvarchar(40) = null
           ,@ShipAddress nvarchar(60) = null
           ,@ShipCity nvarchar(15) = null
           ,@ShipRegion nvarchar(15) = null
           ,@ShipPostalCode nvarchar(10) = null
           ,@ShipCountry nvarchar(15) = null,



           --Order details
            @OrderID int
           ,@ProductID int
           ,@UnitPrice money
           ,@Quantity smallint
           ,@Discount real
)
AS
begin 

    BEGIN TRANSACTION
    
    begin TRY 
    -- insertar en la tabla order 
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
           (@CustomerID
           ,@EmployeeID
           ,@OrderDate
           ,@RequiredDate
           ,@ShippedDate
           ,@ShipVia
           ,@Freight
           ,@ShipName
           ,@ShipAddress
           ,@ShipCity
           ,@ShipRegion
           ,@ShipPostalCode
           ,@ShipCountry);

            --Obtener el ID instertado de la orden
            Declare @orderId INT
            set @orderId = SCOPE_IDENTITY();

            -- Insertar en detalle_orden el producto
            --Obtener el precio del producto a insertar
            declare @precioVenta money 

            SELECT @precioVenta = unitPrice  from products 
            where ProductID = @ProductID

            --set @precioVenta = (select unitPrice from products
            --where ProductID =3)

			INSERT INTO [dbo].[Order Details]
           ([OrderID]
           ,[ProductID]
           ,[UnitPrice]
           ,[Quantity]
           ,[Discount])
     VALUES
           (@OrderID
           ,@ProductID
           ,@UnitPrice
           ,@Quantity
           ,@Discount)


           --Actualizar la tabla products redunciendo el unitinstock con una cantidad vendida

           update products

           set unitinstock = unitinstock -@Quantity
           where ProductID = @ProductID

            COMMIT TRANSACTION;

    end TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @mensajeError varchar(400);
        set @mensajeError= ERROR_MESSAGE();
        print @mensajeError;
    end CATCH

end;
GO


select * from Products
where ProductID = 9

select max(orderid)
from Orders







UPDATE products
set unitinstock = 29
WHERE ProductID = 9

SELECT max(OrderID) from Orders

SELECT * FROM [Order Details]
where OrderID = 11078


SELECT * FROM [Order Details]
where OrderID = 11078

SELECT * FROM [Order Details]
where OrderID = 11078

SELECT * FROM [Order Details]
where OrderID = 11078


SELECT * from Customers


































