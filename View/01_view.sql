create database VistasPractica;

use VistasPractica;

-- create una vista de la siguinet consulta

create VIEW vista 
SELECT c.CategoryName 'nombre categiria',
p.ProductName 'nombre producto',

FROM northwind.dbo.products as p 



create VIEW VIEW_categorias_productos
as

SELECT c.CategoryName 'nombre categoria',
p.ProductName 'nombre producto',
p.unitprice 'precio',
p.unitsinstock 'Existencia'
from Northwind.dbo.Categories as c
INNER join Northwind.dbo.products as p 
on c.CategoryID = p.CategoryID





select *, (precio * existencia) as [precio inventario]
from VIEW_categorias_productos
where [nombre categoria] in ('Beverages', 'Condiments')
order by [nombre categoria] desc;

SELECT * 
from Northwind.dbo.Categories as c


-- seleccionar la suma del presio del inventario agrupado por categoria

create or alter VIEW_categorias_productos
as


SELECT CategoryName 'Categoria',  sum(Unitprice * UnitsInStock) 'Suma precio inventario'
from VIEW_categorias_productos
group by 














