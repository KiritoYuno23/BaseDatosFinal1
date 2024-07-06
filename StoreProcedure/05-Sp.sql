
use Northwind




create or alter sp_ventas_proveedor
@year int, @month int, @day INT
AS
begin

SELECT s.CompanyName, (od.UnitPrice * od.Quantity) as Total
FROM Suppliers as s 

INNER JOIN Products as p 
on s.SupplierID=p.SupplierID

INNER join [Order Details] as od 
on p.ProductID= od.ProductID

INNER join Orders as o 
on od.OrderID = o.OrderID

WHERE DATEPART(year, o.OrderDate) = @year
and DATENAME(month, o.OrderDate) = @month
and DATEPART(day, o.OrderDate) = @day;

END
go


exec sp_ventas_proveedor 1996,07,05
exec sp_ventas_proveedor 1996,07,04
go






GROUP by s.CompanyName
order by s.CompanyName


SELECT OrderDate
FROM Orders
WHERE DATEPART(year, OrderDate) = 1996
and DATEPART(month, OrderDate) = 07
and DATEPART(day, OrderDate) = 04




SELECT *
FROM Orders
where DATEPART(year, OrderDate) = 1996
and ShipCountry = 'France'




create or alter PROCEDURE sp_visualizar_ordenes
@year int, @pais VARCHAR (50) 
AS
begin

SELECT COUNT(OrderID) 'Cantidad de Ordenes', @pais 'Pais'
FROM Orders
where DATEPART(year, OrderDate) = @year
and ShipCountry = @pais

END
go


exec sp_visualizar_ordenes 1997, 'France'




















