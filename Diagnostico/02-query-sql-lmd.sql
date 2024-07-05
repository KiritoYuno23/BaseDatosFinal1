use [bdventas2];

select * from [Northwind].dbo.customers;
go
select * from cliente;
go



-- Insertar en la tabla cliente
insert into cliente 
(rfc,curp,nombres,apellido1, apellido2)
values('jlhg19830406x9x', 'JLHG19830406',
'Alfreds Futterkiste','xytfdd', 'Futterkiste')
Go
-- Inserta varios clientes en una sola instrucci�n
insert into cliente 
(rfc,curp,nombres,apellido1, apellido2)
values('jlhg19830406x9z', 'rtyye19830406',
'Ana Trujillo Emparedados y helados','xytfdd', 'Futterkiste'),
('jlhg19830406x9q', 'rtyye19830407',
'Ana Trujillo Emparedados y helados','xytfdd', 'Futterkiste'),
('jlhg19830406x9w', 'rtyye19830408',
'Ana Trujillo Emparedados y helados','xytfdd', 'Futterkiste');
go

-- Elimina los  datos de la tabla cliente
delete cliente
go
delete from cliente
go

-- Comando para reiniciar el identity de una tabla
DBCC CHECKIDENT (cliente, RESEED, 0)
go

-- Crea una tabla a partir de una consulta
select top 0 employeeid as 'empleadoId', LastName as 'Apellido', 
FirstName as 'PrimerNombre', 
BirthDate as 'FechaNacimiento', 
HireDate as 'FechaContratacion',
[address] as 'Direccion', 
city as 'Ciudad', 
region, PostalCode as 'CodigoPostal', 
country as 'Pais'
into empleado2
from northwind.dbo.employees
go

-- Elimina la tabla empleado
drop table empleado2
go

-- Altera una tabla agregandole un constraint de primary key 
alter table empleado2
add constraint pk_empleado2
primary key(empleadoid)
go

-- Insertar datos a partir de una consulta 
insert into empleado2 (empleadoId, Apellido,PrimerNombre,
FechaNacimiento,FechaContratacion,Direccion,
Ciudad,region,CodigoPostal,Pais)
select employeeid as 'empleadoId', LastName as 'Apellido', 
FirstName as 'PrimerNombre', 
BirthDate as 'FechaNacimiento', 
HireDate as 'FechaContratacion',
[address] as 'Direccion', 
city as 'Ciudad', 
region, PostalCode as 'CodigoPostal', 
country as 'Pais'
from Northwind.dbo.Employees
go
 
select * from empleado2;


select * from cliente;
select * from empleado;

insert into empleado (nombre, apellido1, apellido2,curp,rfc,
numeroexterno, calle, salario, numeronomina)
values('Alan', 'Santiago', 'Molina', 'ALM456789', 'ALMN34354',
23, 'Calle del Infierno', 67890.9, 12345),
('Yamileth','Mejia', 'Rangel', 'YMR780145H', 'rtyygh89', 
NULL,'Calle del Hambre',76899.17, 23456),
('moises','Santiago', 'Isidro', 'MSI780145H', 'ESDVgh89', 
NULL,'Calle de la Gordura',20000, 98765);

insert into ordencompra
values (getDate(),'2024-06-10', 1, 3 ),
       (GETDATE(), '2024-07-11', 3, 4)

select * from producto

select * from Northwind.dbo.Products

select * from proveedor
select * from Northwind.dbo.Suppliers

insert into proveedor
select supplierId,CompanyName, PostalCode, 'Calle de la Sol', city, 
2345 as cp, 'www.prueba.com.mx' as 'paginaweb' 
from Northwind.dbo.Suppliers

delete from proveedor

select * from proveedor

select * from producto
select * from producto

insert into producto (numerocontrol, descripcion, precio, 
[status], existencia, proveedorid) 
select ProductID, ProductName, 
UnitPrice, Discontinued,
UnitsInStock, SupplierID  
from Northwind.dbo.Products


select * from ordencompra

insert into detalleCompra
values (2, 2, 20, 
(select precio from producto where numerocontrol =2))

select * from detalleCompra

update producto
set precio = 20.2
where numerocontrol = 1

select * from producto
where numerocontrol = 1

insert into detalleCompra
values (1, 3, 30, 
(select precio from producto where numerocontrol =1))

-- Seleccionar las ordenes de compra realizadas al producto1
Select *, (cantidad * preciocompra) as importe 
from detalleCompra
where productoid = 1

-- seleccionar el total a pagar de la ordenes que contienen
-- el producto1

select sum(cantidad * preciocompra) as 'total'
from detalleCompra
where productoid = 1


-- Selecciona la fecha actual del sistema
select getdate()

select * from ordencompra
