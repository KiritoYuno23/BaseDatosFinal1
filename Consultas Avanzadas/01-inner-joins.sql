-- Consultas Avanzadas
select c.CategoryName As 'Nombre Categoria', 
p.ProductName as 'Nombre Producto', 
p.UnitPrice as 'Precio', 
p.UnitsInStock as 'Existencia'
from 
Categories AS c
inner join Products As p
on c.CategoryID = p.CategoryID
where CategoryName  in ('Beverages', 'Produce')

-- Ejercicio 1: Obtener el nombre del cliente y el nombre del empleado 
-- del representante de ventas de cada pedido.

SELECT o.orderid as 'Numero de orden',
o.orderdate as 'Fecha de orden',c.CompanyName as 'Nombre del Cliente',
CONCAT(e.firstname, ' ', e.lastname) as 'Nombre del Empleado' 
FROM 
Employees as e
INNER JOIN 
Orders AS o
on  e.EmployeeID = o.EmployeeID
INNER JOIN 
customers as c
on o.CustomerID = c.CustomerID;





--Ejercicio 2: Mostrar el nombre del producto, el nombre del proveedor y el precio unitario de cada producto.

SELECT p.ProductName as 'Nombre del Producto',
s.CompanyName as 'Nombre del Proveedor', 
p.UnitPrice as 'Precio'
FROM Products AS p
INNER JOIN Suppliers as s
on p.SupplierID = s.SupplierID;


select p.ProductName, s.CompanyName, p.UnitPrice
from (
    SELECT SupplierID, ProductName, UnitPrice
    FROM Products
) AS p
Inner join 
Suppliers as s
on p.SupplierID = s.SupplierID;


select p.ProductName, s.CompanyName, p.UnitPrice
from (
    SELECT SupplierID, ProductName, UnitPrice
    FROM Products
) AS p
Inner join
( 
    select SupplierID, CompanyName from Suppliers
) AS s
on p.SupplierID = s.SupplierID;

--Ejercicio 3: Listar el nombre del cliente, el ID del pedido y la fecha del pedido para cada pedido.

select o.OrderID as 'Número de Orden',
c.CompanyName as 'Nombre del Cliente', 
o.OrderDate as 'Fecha de orden', 
year(o.OrderDate) as 'AÑO de Compra',
month(o.OrderDate) as 'MES de Compra', 
day(o.OrderDate) as 'DIA de Compra' 
from Customers as c
INNER JOIN Orders as o
on c.CustomerID = o.CustomerID;


----------------------------------------------------------------------------------------------------

select o.OrderID as 'Número de Orden',
c.CompanyName as 'Nombre del Cliente', 
o.OrderDate as 'Fecha de orden', 
year(o.OrderDate) as 'AÑO de Compra',
month(o.OrderDate) as 'MES de Compra', 
day(o.OrderDate) as 'DIA de Compra' 
from  (
    select CustomerID, CompanyName from Customers
)as c
INNER JOIN
( select CustomerID, OrderID, OrderDate from Orders ) as o
on c.CustomerID = o.CustomerID;


--Ejercicio 4: Obtener el nombre del empleado, el título del cargo y el territorio del empleado para cada empleado.

select concat(e.FirstName, ' ', e.LastName) as 'Nombre del Empleado',
e.Title as 'Cargo', t.TerritoryDescription AS 'Territorio'
from EmployeeTerritories as et
inner join Employees as e
on et.EmployeeID = e.EmployeeID
INNER JOIN Territories as t
on t.TerritoryID = et.TerritoryID;

---------------------------------------------------------------------
select concat(e.FirstName, ' ', e.LastName) as 'Nombre del Empleado',
e.Title as 'Cargo', t.TerritoryDescription AS 'Territorio'
from (
    select TerritoryID, EmployeeID from EmployeeTerritories
) as et
inner join
(select EmployeeID, FirstName, LastName, Title from Employees) as e
on et.EmployeeID = e.EmployeeID
INNER JOIN (select TerritoryID, TerritoryDescription  from Territories) as t
on t.TerritoryID = et.TerritoryID;

-- Ejercicio de Reto:

-- Seleccionar todas las ordenes mostrando el empleado que la realizo, el cliente al que se le vendio, 
-- el nombre de los productos, sus categorias, el precio que se vendio, las unidades vendidas y el importe,
-- de enero de 1997 a feb de 1998

-- Employee
-- Customers
-- Products
-- Categories
-- Order Details
-- orders


select CONCAT(FirstName, ' ', LastName ) as 'Empleado',
c.CompanyName as 'Cliente', p.ProductName as 'Nombre del producto',
ca.CategoryName as 'Categoria', od.UnitPrice as 'Precio', 
od.Quantity as 'Cantidad', (od.UnitPrice * od.Quantity) as 'importe'
From Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join customers as c
on o.CustomerID = c.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on p.ProductID = od.ProductID
inner join Categories as ca
on ca.CategoryID = p.CategoryID
where o.OrderDate between '1997-01-01' and '1998-02-28' 
and ca.CategoryName in ('Beverages') 
order by c.CompanyName 

-- Cuanto dinero he vendido de la categoria beverages

select sum(od.UnitPrice * od.Quantity) as 'Total de Ventas' 
from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
inner join Orders as o
on o.OrderID = od.OrderID
where o.OrderDate between '1997-01-01' and '1998-02-28' 
and c.CategoryName in ('Beverages'); 
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


--Ejercicio 4: Obtener el nombre del empleado, el título del cargo y el departamento del empleado para cada empleado.

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