create DATABASE pruebatriggersg3;
GO

use pruebatriggersg3

create table tabla1
(
    id int not null PRIMARY Key,
    nombre varchar (50) not null
);
GO

--TRIGGER
-- TRIGGER que verifica el evento que se ejecuto

create or alter TRIGGER tg_verificar_inserccion
on tabla1
after INSERT
AS
BEGIN
    PRINT 'Se ejecuto el evento insert en la tabla'
end;

insert into tabla1 
values (1,'Nombre1') 

GO



--TRIGGER
-- TRIGGER que verifica el evento que se ejecuto

create or alter TRIGGER tg_verificar_eliminacion
on tabla1
after delete 
AS
BEGIN
    PRINT 'Se ejecuto el evento delate en la tabla'
end;


delete tabla1
WHERE id=1


insert into tabla1
values (1,'Nombre1')
GO



--TRIGGER
-- TRIGGER que verifica el evento que se ejecuto


create or alter TRIGGER tg_verificar_actualizacion
on tabla1
after update
AS
BEGIN
    PRINT 'Se ejecuto el evento update en la tabla'
end;

update tabla1
set nombre= 'Nombre Nuevo'
where id = 1


-- Eliminar TRIGGER
DROP TRIGGER tg_verificar_inserccion
drop TRIGGER tg_verificar_eliminacion
drop TRIGGER tg_verificar_actualizacion

GO





create TRIGGER verificar_contenido_inserted
on tabla1
after insert 
as 
BEGIN
    -- ver lo valores de la tabla insert
    delete * 
    FROM INSERT;
END;
go


insert into tabla1
values (1,'Nombre2')
GO

insert into tabla1
values (2,'Nombre3')
GO

insert into tabla1
values (3,'Nombre4')
GO

insert into tabla1
VALUES (4,'Nombre5'),(5,'Nombre6')

--__________________________________________________________________________________________________________________________________


use Northwind

go

create or alter TRIGGER verificar_inserterd_categories
on Categories
after INSERT
AS
begin
    SELECT CategoryID, CategoryName, [Description]
    FROM inserted
END;

INSERT into Categories (CategoryID,CategoryName, [Description])
values ('CategoriaNueva','Pruebatriggers')

GO




CREATE or ALTER TRIGGER verificar_update_categories
on categories
after UPDATE
AS
BEGIN

    SELECT CategoryID, CategoryName, [Description]
    FROM inserted;

    SELECT CategoryID, CategoryName, [Description]
    FROM deleted;

END;
GO

BEGIN TRANSACTION

update Categories
set CategoryName = 'CategoriaOtra',
    [Description] = 'Si esta bien'
where CategoryID = 9;  


ROLLBACK

GO



DROP TRIGGER verificar_inserterd_categories
DROP TRIGGER verificar_update_categories
GO


CREATE or alter TRIGGER verificar_inserted_deleted
on categories
after INSERT,UPDATE,DELETE
AS
BEGIN
    IF exists (select 1 from inserted) and not exists (select 1 from deleted)
    BEGIN
        PRINT ('Existen datos en la tabla inserted, se ejecuto un insert ')
    END
    if exists (select 1 from deleted) AND not EXISTS (select 1 from inserted) and
    not EXISTS(select 1 from inserted)
    BEGIN
        PRINT ('Existen datos en la tabla deleted, se realizo un operacion')
    END
    else IF exists (select 1 from deleted) AND
    exists (select 1 from inserted)
    BEGIN
        PRINT 'Existen datos en las dos tablas, se realizo un update'
    END
END;

GO




insert into Categories (CategoryID,CategoryName, [Description])
values ('categoria10', 'pipon')




DROP TRIGGER verificar_inserted_deleted

--_____________________________________________________________________________________________________________________________________


-- crear un tigger es la base de datos pruebatriggers, para la tabal empleados, este trigger debe evitar que se inserten o modifiquen salarios mayores a 50,000

use pruebatriggersg3;
GO
CREATE table empleado (
    id int not NULL PRIMARY key,
    nombre varchar (50) not null,
    salario money not null
)

go

CREATE or alter TRIGGER verificar_salario
on empleado
after insert, UPDATE
as begin 
if exists (select 1 from inserted) AND
not exists (select 1 from deleted)
    begin 
        DECLARE @salarioNuevo money
        set @salarioNuevo = (select salario from inserted);

        if @salarioNuevo > 50000
        BEGIN
            raiserror ('el salario es mayor a 50000 y no esta pertido', 16,1)
        ROLLBACK TRANSACTION; 
        END
    END
END;
GO





DROP TRIGGER verificar_salario
GO



create or alter trigger verificar_salario
 on empleado
 after insert, update
 as
 begin
 if exists(select 1 from inserted)and
 not exists(select 1 from deleted)
 begin
 declare @salarioNuevo money
 set @salarioNuevo = (select salario from inserted)

 if @salarioNuevo >50000
 begin

 raiserror('el salario es mayor a 500000 y no esta permitido', 16,1);
 rollback transaction;
 end 
 end
 end;

GO


SELECT *
from [Order Details]







