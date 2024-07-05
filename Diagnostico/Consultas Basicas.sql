--Consultas simples (consultas a una sola tabla )

use Northwind;

-- seleccionar toods los customers clientes 

select * from Customers

-- proyeccion 
select CustomerID, CompanyName, City, Country
from Customers

-- seleciona 10 registros de los clientes 
select top 10 CustomerID, CompanyName, City, Country
from Customers

-- alias de columna 
-- country as pais 
-- country pais 
-- country 'pais'
-- country as 'pais'
-- Country as 'pais de las maravillas'

select CustomerID as 'Numero Cliente', CompanyName 'Nombre Empresa', City as 'Ciudad', Country 'Pais'
from Customers

-- alias de tablas

select Customers.CustomerID, Customers.CompanyName, Customers.City, Customers.Country
from Customers


select c.CustomerID, c.CompanyName, c.City, c.Country
from Customers as c

select c.CustomerID, c.CompanyName, c.City, c.Country
from Customers c



-- Campo calculado 

select * from Products

select ProductName 'Nombre Producto', UnitsInStock as 'Existencia', UnitPrice 'Precio Unitario', (p.UnitPrice * p.UnitsInStock)as 'Costo Inventario'
from Products as p

-- Filtrar datos 
-- operadores where y operadores relacionales 
/* and or 
	<   menor que 
	>   Mayor que
	<=	Menor o Igual 
	<>	Diferente
	!=	Diferente
	=	Igual a
*/

select  * from Customers

-- seleccionar todos los clientes de alemania 

select * 
from Customers
where Country = 'Germany'


-- seleccionar todos los productos que tengan uns stock mayor a 20
-- mostrando solamnte el nombre del producto, el precio y la exitencia 

select pr.ProductName 'Nombre Producto', pr.UnitPrice 'Precio', pr.UnitsInStock 'Stock'
from Products as pr
where pr.UnitsInStock > 20
order by 1 desc

select pr.ProductName 'Nombre Producto', pr.UnitPrice 'Precio', pr.UnitsInStock 'Stock'
from Products as pr
where pr.UnitsInStock > 20
order by pr.ProductName desc




-- asc acendente 
-- desc decendiente 

-- seleccionar todos los clientes orednados de forma acendente por pais y dentro del pais oredenados de forma decendiente por ciudad


select * from Customers 
where Country = 'Germany'
order by Country asc ,city desc


-- eleiminar valores repetidos de una consulta

-- Seleccionar los paises de los clientes 

select Country
from Customers
order by 1 asc



select COUNT(Country)
from Customers


-- consultas de agragado 
-- solo regresan un registro
-- count(x)         cuenta las filas  
-- cant (campo)
-- saum()
-- 

select distinct country from Customers
order by 1 asc

select count (distinct country)
from Customers


-- seleciona todos los productos donde el precio es mayor o igual a 18
select * from Products as p
where p.UnitPrice >= 18.0

select * from Products as p
where p.UnitPrice <> 18.0


select count(*) from Products as p
where p.UnitPrice >= 18.0


-- seleccionar todos los productos que tengan a precio
-- entre 18 y 25 dolares

select * from Products 
where UnitPrice >= 18  and UnitPrice <= 25

-- between rango and entre
select * from Products 
where UnitPrice  between 18  and  25




-- seleccionar todos los productos que no tengan a precio
-- entre 18 y 25 dolares
select * from Products 
where UnitPrice  not between 18  and  25


select * from Products 
where not(UnitPrice >= 18  and UnitPrice <= 25)


-- seleccionar todos los productos donde el precio sea mayor a 38 y sus existencia sea mayor = 22

select * from Products
where UnitPrice > 38 and UnitsInStock >= 22



-- seleccionar todos los clientes de alemania mexico y francia 
select * from Customers as c
where c.Country= 'Germany' or c.Country= 'Mexico' or c.Country ='France'


select * from Customers as c
where c.Country in ('Germany','Mexico','France')

-- selecionar todos los clientes que no tenga region
select * from Customers as c
where Region is null

-- selecionar todos los clientes que tenga region
select * from Customers as c
where Region is not null


-- Seleciona todas las ordenes enviadas enviadas de julio de 1996 a abril de 1998 para empleados buchan, leverling, devolio
select * from Orders as o
where o.ShippedDate between '1996-07-03' and '1997-04-30' 
and o.EmployeeID in (5,3,1)



select e.LastName as 'Empleado', o.ShippedDate as 'Fecha de Entrega'
from Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
where o.ShippedDate between '1996-07-03' and '1997-04-30' 
and e.LastName in ('Leverling','Buchanan','Davolio')



















































