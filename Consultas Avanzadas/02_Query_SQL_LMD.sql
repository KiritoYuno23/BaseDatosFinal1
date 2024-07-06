use [bdVentas]

select * from [Northwind].dbo.Customers
go
select * from Cliente
go

-- insertar en la tabla cliente 

insert into Cliente(rfc,curp,nombre,apellido1,apellido2)
values ('hybvcfvghb', 'MEAA115809HHGZRLA5', 'Antonio Moreno Taquer�a', 'hbdhjksiav', 'Futterkiste'),
('hkjnhsjdgbjs', 'MEAA115809HHGZRLA0', 'Alfreds Futterkiste', 'hbdhjksfav', 'Futterkiste')


delete Cliente

-- comando para reiniciar el identity de una tabla
DBCC CHECKIDENT (Cliente, RESEED,0)

-- crea una tabala apartir 
select top 0 EmployeeID as 'EmpleadoID', LastName as 'Apellido', FirstName as 'PrimerNombre', BirthDate as'FechaNacimiento', HireDate as 'FechaContratacion', [Address] as 'Direccion', City as 'Ciudad', Region, PostalCode as 'CodigoPostal', Country as 'Pais' into empleado2 from Northwind.dbo.Employees


select top 5 * from Northwind.dbo.[Order Details]
order by OrderID desc 


--Insertar datos a partir de una lista 

select * from empleado2

drop table empleado2

alter table empleado2   --
add constraint pk_empleado
primary key (empleadoID)



insert into empleado2 (EmpleadoID,Apellido,PrimerNombre,FechaNacimiento,FechaContratacion, Direccion,Ciudad,Region,CodigoPostal,Pais)
select EmployeeID as 'EmpleadoID', LastName as 'Apellido', FirstName as 'PrimerNombre', BirthDate as'FechaNacimiento', HireDate as 'FechaContratacion', [Address] as 'Direccion', City as 'Ciudad', Region, PostalCode as 'CodigoPostal', Country as 'Pais'
from Northwind.dbo.Employees


select * from empleado
select * from cliente 
select * from ordencompra

insert into empleado(nombre, apellido1, apellido2, curp, rfc,numeroexterno,calle,salario,numeronomina) values
('Alan', 'Santiago', 'Molina', 'ALAN0903467HHGRLA0', 'Alan326587', 23, 'calle del infierno', 6778.87, 12345),
('Yamileth', 'Mejia', 'Rangel', 'YAMI547697FFGZJDA8', 'YAMI457643', NULL, 'Calle del Hambire', 78765.9, 54321),
('Moises', 'Santiago', 'Isidro', 'MOIS547697FFGZJDA8', 'MOIS877643', NULL, 'Calle de la gordura', 9000, 98674)



insert into ordencompra
values (GETDATE(),'2024-06-10', 1,3),
   	(GETDATE(), '2024-07-11', 3,4 ),


select * from producto
select * from proveedor
select * from Northwind.dbo.Suppliers

insert into proveedor
select SupplierID, CompanyName, PostalCode, 'Calle de la soledad', City, 2345 as cp, 'www.prueba.com.mx' 
from Northwind.dbo.Suppliers

delete from proveedor


select * from producto

insert into producto (numerocontrol, descripcion, precio,[status], existencia,proveedorid)
select ProductID, ProductName, UnitPrice, Discontinued, UnitsInStock, SupplierID  from Northwind.dbo.Products


select * from detalleCompra



insert into detalleCompra 
values (2, 2, 20 ,
(select precio from producto where numerocontrol =2))



update producto
set precio = 20.2
where numerocontrol = 1


select * from producto 
where numerocontrol = 1

-- seleccionar las oredenes de compra del producto uno
select *, (cantidad * precioCompra) as importe 
from detalleCompra
where productoid = 1

select sum(cantidad * precioCompra) as 'total'
from detalleCompra
where productoid = 1


-- seleciona la fecha actual del sistema 
select GETDATE()

use Northwind

-- seleciona todas las ordenes enviadas de julio de 1996 a abril de 1998
-- para los empleados buchan, leveling davolio (5,3,1)


SELECT * from orders 
where 
ShippedDate BETWEEN '1996-07-01' and '1998-04-30'
and EmployeeID in (5,3,1)


-- seleccionar solo los añoa de las oredenes de compra

SELECT year(OrderDate) 'año' from Orders 

-- selecciona todas la compras de 1996

SELECT OrderID 'numero de pedido',OrderDate 'Fecha orden' , year(OrderDate) 'año' from Orders 
WHERE OrderDate BETWEEN '1996-01-01' and '1996-12-31'

SELECT OrderID 'numero de pedido',OrderDate 'Fecha orden' , year(OrderDate) 'año' from Orders 
WHERE YEAR(OrderDate) = '1996'


-- selecionar todas las oredenes de compra mostrando el numero de ordedn la devha de orden, año, mes y dia de 1996 y 1998

SELECT OrderID 'numero de pedido',OrderDate 'Fecha orden',  year(OrderDate) 'año', MONTH(OrderDate) 'Mes', DAY(OrderDate) 'Dia'
from Orders
WHERE YEAR(OrderDate) = '1996' OR YEAR(OrderDate) = '1998'

SELECT OrderID 'numero de pedido',OrderDate 'Fecha orden',  year(OrderDate) 'año', MONTH(OrderDate) 'Mes', DAY(OrderDate) 'Dia'
from Orders
WHERE YEAR(OrderDate) in ('1996', '1998')

-- selecionar todos los apellidos de los empleados de los clientes que comiencen con d
SELECT *
from Employees
WHERE LastName LIKE 'd%'

-- selecionar todos los empelados que su apellido emepiece con da

SELECT *
from Employees
WHERE LastName LIKE 'da%'


SELECT *
from Employees
WHERE LastName LIKE '%a'

SELECT *
from Employees
WHERE LastName LIKE '%a%'


SELECT *
from Employees
WHERE LastName not LIKE '%a%'

-- selecionar todos los empelados que contengan en su apellido cualquier letra  y una i

SELECT *
from Employees
WHERE LastName LIKE '%_i%'


-- selecionar todos los empleados donde el nombre contenga tres caracteres
--ante de la palabra, li despues un caracter y finalmente la letra d
SELECT * FROM Employees
where FirstName LIKE '%___i_g%'

--selecionar los apellidos que comiencen con e o l

SELECT * from Employees
WHERE FirstName LIKE '[dl]%'

--selecionar todos los empleados que sus apellidos comiencen con una h o uan a


SELECT * from Employees
WHERE LastName LIKE '[ha]%'

--[AF] in or
--[A-F] BETWEEN and


-- seleciona cuantos empleado en su apellido contiene las letras entre la a y f
SELECT COUNT(*) 'Total empelados' from Employees
where LastName like '%[a-f]%'

--selecionar todos los amepelados donde los apellidos comencen con CB
SELECT* FROM Employees
WHERE LastName like '[^cb]%'

--funciones de agragado (consultas de resumen), group by, having
/*
	sum
	count(*)
	count(campo)
	avg()
	max()
	min()
*/

-- selecionar los numeros de ordenes realkizadas

SELECT* FROM Orders

SELECT count(*) 'Total de ordenes' FROM Orders

SELECT COUNT(ShipRegion) FROM Orders


-- seleciona el numero de paises al cual se le a enviado ordenes 

SELECT COUNT(distinct ShipCountry)'Total de envios a paises' from Orders



SELECT COUNT(ShipCountry)  FROM Orders
where ShipCountry = 'uk'




-- selecionar el total de oredenes a francia entre 1996-1998
SELECT COUNT(*) 'Numero de ordenes'  FROM Orders
where ShipCountry = '' 
and ShippedDate BETWEEN '1996-01-01' and '1998-12-31'


-- selecionar precio minimo de los productos 

SELECT MIN(UnitPrice)'precio minimo' from Products

-- selecionar el producto mas caro
SELECT max(UnitPrice)'precio maximo', ProductName  from Products

--selecionar el nombre del rpoducto, precio, de aquel que sea mas caro
SELECT top 1 ProductName 'Nombre del producto', UnitPrice 'Precio' 
from Products
order  by UnitPrice desc



-- selcionar la cantidad total de ventas

SELECT sum(UnitPrice*Quantity) 'importes' from [Order Details]


-- seleccionar el total de ventas realizadas a los productos que no tiene descuento

select * FROM [Order Details]
where Discount =0

SELECT sum(UnitPrice*Quantity) 'importes' from [Order Details]
where Discount = 0

-- selecionar el promedio de ventas  para los promedios 
-- singapurean hokkin friend y pozzarella

select * from Products
where ProductName in ('Mozzarella di Giovanni, Singaporean Hokkien Fried Mee')



SELECT avg(UnitPrice*Quantity) 'importes' from [Order Details]
where ProductID in (72,42)

-- selecionar  los datos de las tablas categorias y de products
SELECT * 
from Categories as c
INNER join Products as p 
on c.CategoryID = p.CategoryID


SELECT c.CategoryName 'Categoria', p.ProductName 'Nombre producto', p.UnitPrice 'Precio unitario', p.UnitsInStock 'inventario', (p.UnitPrice*UnitsInStock)'precio inventario' 
from Categories as c
INNER join Products as p 
on c.CategoryID = p.CategoryID


-- selecionar los productos de la categoria Beverages

SELECT c.CategoryName 'Categoria', p.ProductName 'Nombre producto', p.UnitPrice 'Precio unitario', p.UnitsInStock 'inventario', (p.UnitPrice*UnitsInStock)'precio inventario' 
from Categories as c
INNER join Products as p 
on c.CategoryID = p.CategoryID
WHERE c.CategoryName = 'Beverages'



SELECT c.CategoryName 'Categoria', p.ProductName 'Nombre producto', p.UnitPrice 'Precio unitario', p.UnitsInStock 'inventario', (p.UnitPrice*UnitsInStock)'precio inventario' 
from Categories as c
INNER join Products as p 
on c.CategoryID = p.CategoryID
WHERE c.CategoryName = 'Beverages' 
and p.UnitPrice >20 


SELECT avg(p.UnitPrice*p.UnitsInStock) 'Preioc'
from Categories as c
INNER join Products as p 
on c.CategoryID = p.CategoryID
WHERE c.CategoryName = 'Beverages' 
and p.UnitPrice >20 




-- selecionar el total numero de ventas para el cleinte Chop-suey Chinese 1996-1998



SELECT *
from Customers
WHERE CompanyName LIKE 'chop%'



SELECT *
from Products


select COUNT(*) from Products



SELECT CategoryID, COUNT(*) 'Total de categorias'
from Products
GROUP by CategoryID


SELECT CategoryID, COUNT(*) 'Total de categorias'
from Products
GROUP by CategoryID



select c.CategoryName 'Nombre de Categoria', COUNT(*) 'Numero de productos'
from Categories as c
INNER join Products as p 
on c.CategoryID = p.CategoryID
GROUP by CategoryName


SELECT * 
FROM Suppliers
-- Consultar para mostrar todos los productos junto asus acategorias y sus precios

SELECT * 
FROM Categories as c
INNER JOIN Products as p 
on c.CategoryID = p.CategoryID

SELECT p.ProductName 'Nombre del producto', c.CategoryName 'Nombre categoria', p.UnitPrice 'Precio'
FROM Categories as c
INNER JOIN Products as p 
on c.CategoryID = p.CategoryID

--Consultar para mostrar los nombres de los productos y los nombres de sus provedores 

select p.ProductName 'Nombre Producto', s.CompanyName 'Nombre de la compañia', s.ContactName 'Nombre de contacto'
from Products as p 
INNER JOIN Suppliers as s 
ON p.SupplierID = s.SupplierID
order by s.CompanyName


-- selecionar las oredenes d compra moostrarndo l,os nombres de os productos y sus importes 

SELECT p.ProductName 'Nombre de productos', (o.UnitPrice*o.Quantity) as 'Importes'
from [Order Details] as o 
INNER join Products as p 
on o.ProductID = p.ProductID
WHERE (o.UnitPrice*o.Quantity) <= 15000
order by 'importes' DESC

-- mostrar las oredenes de compra y los nombres de los emleados que las realizaron

SELECT o.OrderID 'Numero de orden',
CONCAT(e.FirstName, ' ', e.LastName) as 'Nombre Completo' , YEAR(OrderDate)
from Employees as e 
INNER join Orders as o 
on e.EmployeeID = o.EmployeeID
WHERE YEAR(OrderDate) in ('1996', '1999') 

-- seleccionar las ordenes mostrarndo los clientes a las que se les hicieron las cantidades vendidas y los nombres de los productos 





























--Ejercicio 1: Obtener el nombre del cliente y el nombre del empleado del representante de ventas de cada pedido.

SELECT o.OrderID 'Numero de orden',o.OrderDate 'Fecha de orden', c.CompanyName as 'Nombre del cliente', CONCAT(e.FirstName, ' ', e.LastName) 'Nombre del Empleado'
from Employees as e 
INNER JOIN 
Orders as o 
on e.EmployeeID = o.EmployeeID
INNER JOIN 
Customers as c 
on c.CustomerID = o.CustomerID



--Ejercicio 2: Mostrar el nombre del producto, el nombre del proveedor y el precio unitario de cada producto.

SELECT p.ProductID 'Nombre del producto', s.CompanyName 'Nombre del proveedor',
UnitPrice 'Precio unitario'
from Products as p 
INNER JOIN Suppliers as s 
on p.SupplierID = s.SupplierID


SELECT p.ProductName, UnitPrice 
from (
	select SupplierID, ProductName, UnitPrice 
	from Products 
) as p 
INNER JOIN 
Suppliers as s 
on p.SupplierID = s.SupplierID


SELECT p.ProductName, UnitPrice, CompanyName
from (
	select SupplierID, ProductName, UnitPrice 
	from Products 
) as p 
INNER JOIN (select SupplierID, CompanyName
	from Suppliers ) as s 
on p.SupplierID = s.SupplierID

--Ejercicio 3: Listar el nombre del cliente, el ID del pedido y la fecha del pedido para cada pedido.

SELECT c.CompanyName 'Nombre del cliente', o.OrderID 'Numero de orden', 
YEAR(o.OrderDate) 'Año de compra',
MONTH(o.OrderDate) 'Mes de compra',
day(o.OrderDate) 'Dia de compra'
from Customers as c 
INNER JOIN [Orders] as o
on c.CustomerID = o.CustomerID

SELECT c.CompanyName 'Nombre del cliente', o.OrderID 'Numero de orden', 
YEAR(o.OrderDate) 'Año de compra',
MONTH(o.OrderDate) 'Mes de compra',
day(o.OrderDate) 'Dia de compra'
from (select CompanyName, CustomerID 
from Customers) as c 
INNER JOIN (select OrderID, CustomerID, OrderDate
from Orders) as o
on c.CustomerID = o.CustomerID

--Ejercicio 4: Obtener el nombre del empleado, el título del cargo y el Territorio del empleado para cada empleado.

SELECT CONCAT(e.FirstName, ' ', e.LastName)'Nombre del empleado', 
e.Title 'Cargo', t.TerritoryDescription 'Territorio'  
FROM Employees as e
INNER JOIN EmployeeTerritories as et 
on e.EmployeeID = et.EmployeeID
INNER join Territories as t 
on t.TerritoryID = et.TerritoryID


SELECT CONCAT(e.FirstName, ' ', e.LastName)'Nombre del empleado', 
e.Title 'Cargo', t.TerritoryDescription 'Territorio'  
FROM (select FirstName, LastName, EmployeeID, Title
from Employees) as e
INNER JOIN (select EmployeeID, TerritoryID
from EmployeeTerritories) as et 
on e.EmployeeID = et.EmployeeID
INNER join (select TerritoryID, TerritoryDescription
from Territories) as t 
on t.TerritoryID = et.TerritoryID



--Ejercicio 5: Mostrar el nombre del proveedor, el nombre del contacto y el teléfono del contacto para cada proveedor.
SELECT  CompanyName 'proveedor', ContactName 'Contacto', Phone 'Telefono'
from Suppliers

SELECT  s.CompanyName 'proveedor', s.ContactName 'Contacto', s.Phone 'Telefono'
from (select CompanyName, ContactName, Phone
from  Suppliers) as s

--Ejercico de reto
--Selecionar todas las oredenes mostrando el empleado que la realizo, el cliente alq eu se le vendio,
--Nombre de los productos, sus categorias, el precio en el que se vendio, unidades vendidas
--y el importe para enero de 1997 a febrero de 1998
SELECT * from [Orders]

SELECT o.OrderID 'Numero de orden', 
CONCAT(e.FirstName, ' ', e.LastName)'Nombre del empleado',
c.CompanyName'Cliente', p.ProductName 'Nombre del Producto', p.UnitPrice 'Precio del producto'
,ca.CategoryName 'Categoria', od.Quantity 'Cantidad'
, (od.Quantity * od.UnitPrice) 'Importe'
from Orders as o
INNER join Employees as e 
on o.EmployeeID = e.EmployeeID
INNER join Customers as c 
on c.CustomerID = o.CustomerID
INNER JOIN [Order Details] as od
on o.OrderID = od.OrderID
INNER join Products as p 
on p.ProductID = od.ProductID
INNER join Categories as ca 
on p.CategoryID = ca.CategoryID


SELECT o.OrderID 'Numero de orden', 
CONCAT(e.FirstName, ' ', e.LastName)'Nombre del empleado',
c.CompanyName'Cliente', p.ProductName 'Nombre del Producto', p.UnitPrice 'Precio del producto'
,ca.CategoryName 'Categoria', od.Quantity 'Cantidad'
, (od.Quantity * od.UnitPrice) 'Importe'
from Orders as o
INNER join Employees as e 
on o.EmployeeID = e.EmployeeID
INNER join Customers as c 
on c.CustomerID = o.CustomerID
INNER JOIN [Order Details] as od
on o.OrderID = od.OrderID
INNER join Products as p 
on p.ProductID = od.ProductID
INNER join Categories as ca 
on p.CategoryID = ca.CategoryID
WHERE o.OrderDate BETWEEN '1997-01-01' and '1998-02-28'


SELECT o.OrderID 'Numero de orden', 
CONCAT(e.FirstName, ' ', e.LastName)'Nombre del empleado',
c.CompanyName'Cliente', p.ProductName 'Nombre del Producto', p.UnitPrice 'Precio del producto'
,ca.CategoryName 'Categoria', od.Quantity 'Cantidad'
, (od.Quantity * od.UnitPrice) 'Importe'
from Orders as o
INNER join Employees as e 
on o.EmployeeID = e.EmployeeID
INNER join Customers as c 
on c.CustomerID = o.CustomerID
INNER JOIN [Order Details] as od
on o.OrderID = od.OrderID
INNER join Products as p 
on p.ProductID = od.ProductID
INNER join Categories as ca 
on p.CategoryID = ca.CategoryID
WHERE o.OrderDate BETWEEN '1997-01-01' and '1998-02-28'
and ca.CategoryName in ('Beverages')
ORDER by c.CompanyName

-- vendido de la categoria beverages
SELECT (od.Quantity * od.UnitPrice) 'Importe'
from Orders as o
INNER join Employees as e 
on o.EmployeeID = e.EmployeeID
INNER join Customers as c 
on c.CustomerID = o.CustomerID
INNER JOIN [Order Details] as od
on o.OrderID = od.OrderID
INNER join Products as p 
on p.ProductID = od.ProductID
INNER join Categories as ca 
on p.CategoryID = ca.CategoryID
WHERE o.OrderDate BETWEEN '1997-01-01' and '1998-02-28'
and ca.CategoryName in ('Beverages')
ORDER by c.CompanyName

SELECT sum(od.UnitPrice * od.Quantity) 'Total de ventas'
from Categories as c 
INNER join Products as p 
on p.CategoryID = c.CategoryID
INNER JOIN [Order Details] as od
on o.productoid = od.OrderID

--Ejercicio 6: Listar el nombre del producto, la categoría del producto y el nombre del proveedor para cada producto.

SELECT 
    p.ProductName AS ProductName,
    c.CategoryName AS Category,
    s.CompanyName AS SupplierName
FROM 
    Products p
JOIN 
    Categories c ON p.CategoryID = c.CategoryID
JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID;

--Ejercicio 7: Obtener el nombre del cliente, el ID del pedido, el nombre del producto y la cantidad del producto para cada detalle del pedido.

SELECT 
    c.CompanyName AS CustomerName,
    o.OrderID,
    p.ProductName,
    od.Quantity
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Products p ON od.ProductID = p.ProductID;

--Ejercicio 8: Obtener el nombre del empleado, el nombre del territorio y la región del territorio para cada empleado que tiene asignado un territorio.

SELECT 
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    t.TerritoryDescription AS TerritoryName,
    r.RegionDescription AS RegionName
FROM 
    Employees e
JOIN 
    EmployeeTerritories et ON e.EmployeeID = et.EmployeeID
JOIN 
    Territories t ON et.TerritoryID = t.TerritoryID
JOIN 
    Region r ON t.RegionID = r.RegionID;

--Ejercicio 9: Mostrar el nombre del cliente, el nombre del transportista y el nombre del país del transportista para cada pedido enviado por un transportista.

SELECT 
    c.CompanyName AS CustomerName,
    s.ShipperName AS ShipperName,
    s.ShipperCountry AS ShipperCountry
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    Shippers s ON o.ShipVia = s.ShipperID;


--Ejercicio 10: Obtener el nombre del producto, el nombre de la categoría y la descripción de la categoría para cada producto que pertenece a una categoría.


SELECT 
    p.ProductName AS ProductName,
    c.CategoryName AS CategoryName,
    c.[Description] AS CategoryDescription
FROM 
    Products p
JOIN 
    Categories c ON p.CategoryID = c.CategoryID;




