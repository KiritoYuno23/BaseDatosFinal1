
-- Crear base de datos para demostra el uso de left join

create DATABASE pruebajoin;

-- utilizar la base de datos 

use pruebajoins;

-- crear tabla aategorias

create table categorias(
    categoriaid int not null identity(1,1),
    nombre VARCHAR(50) not null default 'No Categoria',
    CONSTRAINT pk_categoria
    PRIMARY key (categoriaid)
);
-- Create tabla producto
CREATE table producto(
    productoid int not null IDENTITY(1,1),
    nombre varchar (50) not null,
    existencia int not null,
    precio money not null,
    categoriaid int,
    CONSTRAINT pk_producto
    primary KEY (productoid),
    CONSTRAINT unico_nombre
    UNIQUE(nombre),
    constraint fk_producto_categorias
    FOREIGN key (categoriaid)
    REFERENCES categorias(categoriaid)
);

-- agregar registros ala atabla categoria
INSERT into categorias(nombre)
VALUES ('LB'), 
        ('Lacteos'), ('Ropa'), ('bebida'), ('Carnes Frias');

-- Agragar registros 

INSERT into producto (nombre, existencia, precio, categoriaid)
values ('Refrigerador', 3, 1000.0, 1),
    ('Estufa', 3, 9000.04, 1),
    ('crema', 2, 10.0, 2),
    ('Yohurt', 3, 1000.0, 2);


SELECT * 
from producto



SELECT * 
from producto as p 
INNER join categorias as c 
on p.categoriaid = c.categoriaid


SELECT * 
from producto as p 
left JOIN categorias as c 
on p.categoriaid = c.categoriaid


-- selecionar todas las categorias que no tiene asignado productos 
SELECT * 
from categorias as c 
left join producto as p 
on p.categoriaid = c.categoriaid


SELECT c.categoriaid , c.nombre
from categorias as c 
left join producto as p 
on p.categoriaid = c.categoriaid
WHERE p.productoid is not null

-- right join
SELECT * 
from categorias as c 
RIGHT join producto as p 
on p.categoriaid = c.categoriaid


SELECT * 
from producto as p 
RIGHT JOIN categorias as c 
on p.categoriaid = c.categoriaid


-- full join

SELECT * 
from categorias as c 
full join producto as p 
on p.categoriaid = c.categoriaid


SELECT * 
from producto as p 
full JOIN categorias as c 
on p.categoriaid = c.categoriaid


-- Crear una base de datos llamada ejercicio join 
-- crear una tabla llama empleados tomando como base la tbala employees de nortwind (no tomoara todos los campos )
-- llenara tabla con una constlta a la atabala empleyees
-- agregar nuevos datos a la tabla empleados por lo menos dos 
-- actualizar la tabña empleados con los nuevos registrod, la cual llenara una nueva tabñla llamada dim_ prodycto 


create database  EjercicioJoin;

use EjercicioJoin;

SELECT * from northwind.dbo.employees

select top 0 EmployeeID as 'EmpleadoID',
        CONCAT (FirstName, ' ', LastName) as 'NombreCompleto',
        title as 'Titulo',
        hiredate as 'FechaContratacion'
    into EjercicioJoin.dbo.empleados
from northwind.dbo.employees;



INSERT into EjercicioJoin.dbo.empleados (NombreCompleto, Titulo, FechaContratacion)
select 
        CONCAT (FirstName, ' ', LastName) as 'NombreCompleto',
        title as 'Titulo',
        hiredate as 'FechaContratacion'
from northwind.dbo.employees;


select top 0*
into EjercicioJoin.dbo.dimempleados
from EjercicioJoin.dbo.empleados

