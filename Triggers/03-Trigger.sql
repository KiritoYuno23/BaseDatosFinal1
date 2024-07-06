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





--___________________________________________________________________________________________



CREATE PROCEDURE GestionarVenta(
    IN p_product_id INT,
    IN p_quantity INT,
    IN p_customer_id VARCHAR(5),
    IN p_order_date DATE,
    IN p_ship_address VARCHAR(60),
    IN p_ship_city VARCHAR(15),
    IN p_ship_postal_code VARCHAR(10),
    IN p_ship_country VARCHAR(15)
)
BEGIN
    DECLARE v_stock_actual INT;
    DECLARE v_order_id INT;

    -- Verificar el stock actual del producto
    SELECT UnitsInStock INTO v_stock_actual
    FROM Products
    WHERE ProductID = p_product_id;

    -- Verificar si el stock es suficiente
    IF v_stock_actual >= p_quantity THEN
        -- Insertar la orden en la tabla Orders
        INSERT INTO Orders (CustomerID, OrderDate, ShipAddress, ShipCity, ShipPostalCode, ShipCountry)
        VALUES (p_customer_id, p_order_date, p_ship_address, p_ship_city, p_ship_postal_code, p_ship_country);
        
        -- Obtener el último OrderID insertado
        SET v_order_id = LAST_INSERT_ID();
        
        -- Insertar el detalle de la orden en la tabla OrderDetails
        INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
        VALUES (v_order_id, p_product_id, p_quantity, (SELECT UnitPrice FROM Products WHERE ProductID = p_product_id));
        
        -- Actualizar el stock del producto en la tabla Products
        UPDATE Products
        SET UnitsInStock = UnitsInStock - p_quantity
        WHERE ProductID = p_product_id;
    ELSE
        -- Si el stock no es suficiente, cancelar la inserción
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock insuficiente para completar la venta';
    END IF;
END //


CALL GestionarVenta(1, 5, 'ALFKI', '2024-07-05', '1234 Elm St', 'Seattle', '98101', 'USA');









