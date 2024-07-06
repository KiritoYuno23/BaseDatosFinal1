use Northwind;


-- Crear un trigger que permita gestionar una venta en la cual se debe actualizar las exitencias del producto vendido bajo las siguientes condiciones 

--1.- verificar si la existencia es suficiente si la existencia no es suficiente cancelar la insercion
--2.- si es suficiente, agregar la venta y disminuir el stock del producto 

-- 1.- Insertar en Order
-- 2.- insertar en order details
-- 3.- verificar si el uniStock es suficiente  
-- 4.- si es suficiente aceptar la insercciokn y disminuir unit an stock vendido
-- 5.- 





SELECT Quantity, ProductID, OrderID
from [Order Details]
WHERE ProductID = 1




CREATE or alter PROCEDURE sp_venta
@Quantity,
@producto
AS
BEGIN
    SELECT OrderID, ProductID, Quantity,UnitPrice
    from [Order Details]

end;






INSERT into [Order Details](ProductID, Quantity)
values (1, 50)


SELECT*
from Orders

SELECT*
from Products



create or alter proc obtener_ventas_por_cliente
@customerid nchar(5),
@fechainicial date,
@fechafinal date,
@total decimal(10,2) output
as
begin
select @total = sum(od.UnitPrice * od.Quantity)
from [Order Details] as od 
inner join Orders as o
on od.OrderID = o.OrderID
where CustomerID = @customerid and 
OrderDate between @fechainicial and @fechafinal;
end





GO
CREATE or alter TRIGGER verificar_venta
on categories
after INSERT
AS
BEGIN
    IF exists (select 1 from inserted) and not exists (select 1 from deleted)
    BEGIN
        PRINT ('Agregado eficazmente')
    END

    else IF exists (select 1 from deleted) AND
    exists (select 1 from inserted)
    BEGIN
        PRINT ''
    END
END;

GO



create or alter TRIGGER tg_verificar_venta
on [Order Details]
after INSERT
AS
BEGIN
    
    IF exists (select 1 from inserted) and not exists (select 1 from deleted)
    BEGIN
        PRINT ('Venta eficazmente')
    END


    if (Quantity )
    
    
    PRINT 'Se ejecuto el evento insert en la tabla'
end;









insert into tabla1 
values (1,'Nombre1') 

GO
