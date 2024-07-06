create database repasojoins;

use repasojoins

create table proovedor(
    provid int not null IDENTITY(1,1),
    nombre varchar (50) not null,
    limite_credito money not null,
    CONSTRAINT pk_proovedor 
    primary key (provid)
)

create table producto(
    prodid int not null IDENTITY(1,1),
    nombre varchar (100) not null,
    existencia int not NULL,
    precio money not null,
    proovedor int ,
    CONSTRAINT pk_producto
    primary key (prodid),
    constraint fk_producto_proovedor 
    FOREIGN key (proovedor)
    references proovedor (provid)
);

--insertar datos en las tablas 
insert into proovedor (nombre, limite_credito)
values ('proovedor1', 100000),
       ('proovedor2', 100000),
       ('proovedor3', 100000),
       ('proovedor4', 100000),
       ('proovedor5', 100000);

insert into producto(nombre, existencia, precio, proovedor)
values ('producto1', 34,45.6,1),
       ('producto2', 34,45.6,1),
       ('producto3', 34,45.6,2),
       ('producto4', 34,45.6,3);

select * from proovedor

select * from producto

--consultas inner join 
--seleccionar todos los productos que tiene proovedor 

select pr.nombre as 'nombre_producto', pr.precio as 'precio',
pr.existencia as 'existencia', p.nombre as 'proovedor'
from proovedor as p
inner join 
producto as pr 
on p.provid = pr.proovedor


--consultas con left join
--leftjoin toda la tabla izquierday los que coinciden con la tabla 
--mostrar todos los proovedores y sus respctivos productos

select pr.prodid, pr.nombre as 'nombre_producto', pr.precio as 'precio',
pr.existencia as 'existencia', p.provid, p.nombre as 'proovedor'
from proovedor as p
left join 
producto as pr 
on p.provid = pr.proovedor

--cambia el nombre de provedor
update proovedor 
set nombre = 'proovedor6'
where provid = 5;

select * from proovedor

update proovedor 
set nombre = 'proovedor5'
where provid = 5;

insert into proovedor (nombre, limite_credito)
values ('proovedor6', 450000);

--eliminar registro
delete fro proovedor
WHERE proovedor = 7;


--tambien sirva para cambiar el nombre de un registro
update proovedor 
set nombre = 'proovedor 6'
where provid = 6;

--utilizando right join
select pr.prodid, pr.nombre as 'nombre_producto', pr.precio as 'precio',
pr.existencia as 'existencia', p.provid, p.nombre as 'proovedor'
from proovedor as p
RIGHT join 
producto as pr 
on p.provid = pr.proovedor

insert into producto(nombre, precio, existencia, proovedor)
values ('producto5', 78.9,22,null)





SELECT *
from proovedor as pr 
LEFT JOIN producto as p 
on pr.provid = p.proovedor





select pr.prodid, pr.nombre as 'nombre_producto', pr.precio as 'precio',
pr.existencia as 'existencia', p.provid, p.nombre as 'proovedor'
from proovedor as p
full join 
producto as pr 
on p.provid = pr.proovedor


--selecionar todos los provedores que no tengan asignado productos


select pr.prodid 'Numero proveedor', p.nombre 'Proveedor',
pr.existencia as 'existencia', p.provid, p.nombre as 'proovedor'
from proovedor as p
LEFT join 
producto as pr 
on p.provid = pr.proovedor
where pr.prodid is null


-- selecionar todos los productos que no tiene proveedor 

select pr.nombre 'nombre', pr.precio, pr.existencia
from proovedor as p
RIGHT join 
producto as pr 
on p.provid = pr.proovedor
where pr.prodid is null






























