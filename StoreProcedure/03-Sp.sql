use Northwind
GO
--Parametros de salida
-- Store procedure

-- crear store procedure que calcule el area de un circulo

create or alter PROCEDURE sp_calcular_area_circulo
@radio FLOAT, -- parametro de entrada 
@area float OUTPUT --parametro de salida
AS
BEGIN
    set @area = PI() * (@radio * @radio)
end;
GO



declare @resultado FLOAT
EXEC sp_calcular_area_circulo 
@radio = 22.5, 
@area = @resultado

print "el valor del area es: " + CAST (@resultado as varchar);



--_______________________________________________________________________________________________



GO
create or alter proc obtener_info_empleado
@employeeid int = -1,
@apellido nvarchar(20) output,
@nombre nvarchar (10) output 
as 
begin 
if @employeeid <> -1
begin 
select @nombre = FirstName, @apellido = LastName  
from Employees
where EmployeeID = @employeeid
end
else
begin
print('el valor del empleado no es valido')
end
end
GO
--con employyeid
declare @firstname as nvarchar(10),
@lastname nvarchar(20)

exec obtener_info_empleado @employeeid = 1,@nombre = @firstname output,
@apellido = @lastname output
print ('el nombre es: '+ @firstname)
print ('el apellido es: '+ @lastname)
GO
--sin employyeid
declare @firstname as nvarchar(10),
@lastname nvarchar(20)

exec obtener_info_empleado
@nombre = @firstname output, @apellido = @lastname output
print ('el nombre es: '+ @firstname)
print ('el apellido es: '+ @lastname)
GO


--________________________________________________________________________________________________


-- Realizar un store procedure que guarda en una variable de salida el total de campos que ha de realizar un cliente dado en un rango de fechas 

GO

create or alter proc sp_obtener_informacion_empleado2
@employeeid int = -1,
@apellido nvarchar(20) output,
@nombre as nvarchar(10) output
AS
begin

   DECLARE @existe int
   set @existe=(select count(*) from Employees where EmployeeID =@employeeid)
   -- select @existe = count(*) from Employees where EmployeeID =@employeeid
   

   IF @existe > 0
   begin
    Select @nombre = FirstName, @apellido=lastname
    from Employees
    where EmployeeID = @employeeid
   end
   else
   begin
   if @existe = 0
   begin
      print 'El id del empleado no existe'
   end
  end
end

GO
-------------------------------------------------------------

declare @firstname as nvarchar(10),
@lastname nvarchar(20)

exec sp_obtener_informacion_empleado2
@nombre=@firstname output, @apellido = @lastname output

print ('El nombre es: ' + @firstname)
print ('El apellido es: ' + @lastname)


GO

--__________________________________________________________________________________________________________________________________________





    SELECT *
    FROM Orders
    WHERE CustomerID = 'VINET'





--__________________________________________________________________________________________________________________________________________


/*02-07-24*/
--store procedure (parametros de salida)
--crear un store procedure que calcule el area de un circulo

create or alter procedure sp_calcular_area_circulo
@radio float, --parametro de entrada
@area float output
As
begin
    set @area = PI() * @radio * @radio

end;

go

declare @resultado float
exec sp_calcular_area_circulo @radio = 22.3, @area = @resultado output

print 'el valor del area es: ' + cast(@resultado as varchar);



create or alter proc obtener_info_empleado
@employeeid int = -1,
@apellido nvarchar(20) output,
@nombre nvarchar (10) output 
as 
begin 
if @employeeid <> -1
begin 
select @nombre = FirstName, @apellido = LastName  
from Employees
where EmployeeID = @employeeid
end
else
begin
print('el valor del empleado no es valido')
end
end

--con employeeid
declare @firstname as nvarchar(10),
@lastname nvarchar(20)

exec obtener_info_empleado @employeeid = 1,@nombre = @firstname output,
@apellido = @lastname output
print ('el nombre es: '+ @firstname)
print ('el apellido es: '+ @lastname)

--sin employeeid
declare @firstname as nvarchar(10),
@lastname nvarchar(20)

exec obtener_info_empleado
@nombre = @firstname output, @apellido = @lastname output
print ('el nombre es: '+ @firstname)
print ('el apellido es: '+ @lastname)


--obtener el nombre de un empledado dado verificar si el empleado introdcido existe
create or alter proc obtener_info_empleado2
@employeeid int = -1,
@apellido nvarchar(20) output,
@nombre nvarchar (10) output 
as 
begin 

declare @existe int
set @existe=(select count(*) from Employees where EmployeeID= @employeeid)
--select @existe = count(*) from Employees where EmployeeID= @employeeid

if @employeeid <> -1 or @existe >0
begin 
select @nombre = FirstName, @apellido = LastName  
from Employees
where EmployeeID = @employeeid
end
else
begin
if @employeeid = -1 
begin
print('se debe introducir un valor')
end
else if @existe = 0
begin 
print ('el valor del empleado no existe en la tabla')
end
end
end

-----------------------------------------------------------------
declare @firstname as nvarchar(10),
@lastname nvarchar(20)

exec obtener_info_empleado2 @employeeid = 10,
@nombre = @firstname output,@apellido = @lastname output
print ('el nombre es: '+ @firstname)
print ('el apellido es: '+ @lastname)

--realizar un sp que guarde en una variable de salida el total de campos que ha realizado un cliente dado en un rango de fechas
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







































































