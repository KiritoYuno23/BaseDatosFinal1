use Northwind;


-- actualice los precios de los productos y guardarlos en una tabla de historicos_precios (id, id del producto que se modifico, precio anterior, fecha de notificacion)
-- Store procedure que elimine una orden (orden, order detail, actualizar el stock)

SELECT * 
from Products
WHERE ProductID = 2

CREATE TABLE historicos_precios (
    id int PRIMARY KEY,
    ProductID int,
    precioAnterior money,
    precioNuevo money,
    fecha date
);




GO


create or alter PROCEDURE sp_actualizarPrecios
    @idProducto int,
    @precio_nuevo money
    
AS
BEGIN

    BEGIN TRANSACTION

    BEGIN try

        declare @precioAnterior money;


        -- Precio anterior
        SELECT @precioAnterior = UnitPrice
        from Products
        WHERE ProductID = @idProducto

        -- Actualizar producto
        update Products
        set unitPrice = @precio_nuevo
        WHERE ProductID = @idProducto
    
        --Insertar  datos 

        INSERT into [dbo].[historicos_precios](
            [ProductID]
           ,[precioAnterior]
           ,[precioNuevo]
           ,[fecha]
        )

         VALUES
           (
            @idProducto
            ,@precioAnterior
            ,@precio_nuevo 
            ,GETDATE()
           );


            COMMIT TRANSACTION

    end TRY

    BEGIN CATCH

        ROLLBACK TRANSACTION;

        DECLARE @mensajeError varchar(400);
        set @mensajeError= ERROR_MESSAGE();
        print @mensajeError;

    end CATCH
END;
GO


exec sp_actualizarPrecios 18.00, 12

    COMMIT TRANSACTION


SELECT * 
FROM historicos_precios


SELECT * 
FROM Products
where ProductID = 18


GO

























-- Coregido



CREATE OR ALTER PROCEDURE sp_actualizarPrecio
    @idProducto INT,
    @precio_nuevo MONEY
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        DECLARE @precioAnterior MONEY;


        SELECT @precioAnterior = UnitPrice
        FROM Products
        WHERE ProductID = @idProducto;


        UPDATE Products
        SET UnitPrice = @precio_nuevo
        WHERE ProductID = @idProducto;


        INSERT INTO [dbo].[historicos_precios] (
            ProductID,
            precioAnterior,
            precioNuevo,
            fecha
        )
        VALUES (
            @idProducto,
            @precioAnterior,
            @precio_nuevo,
            GETDATE()
        );


        COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH

        ROLLBACK TRANSACTION;

        DECLARE @mensajeError VARCHAR(400);
        SET @mensajeError = ERROR_MESSAGE();
        PRINT @mensajeError;
    END CATCH;
END;
GO



EXEC sp_actualizarPrecio
    @idProducto = 12,
    @precio_nuevo = 39;

SELECT * from historicos_precios


    SELECT * 
    from Products
    WHERE ProductID = 12



































