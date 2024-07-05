Declare @x int
set @x = 10 
PRINT'El valor de x es ' + CAST(@x as varchar)
IF @x >= 0
PRINT 'El numero es positivo'
ELSE
BEGIN
PRINT 'El nuemro es negativo'
END

declare @i as int set @i =1
WHILE (@i<=10)
BEGIN
PRINT cast (@i as varchar)
set @i = @i+1
end



-- crear un sp

create PROCEDURE Procedure_Ciclo
as

declare @x INT
set @x=10

print 'El valor de x es: '+ cast(@x as VARCHAR)

if @x >=0
BEGIN
print 'El numero es positivo'
END
ELSE
BEGIN
PRINT 'El numero es negativo'
END

DECLARE @i as INT set @i=1
while (@i<=10)
BEGIN
print cast (@i as VARCHAR)
set @i=@i+1
end

go


-- sp reporte 

select c.CompanyName as 'Nombre del cliente', 
sum(od.Quantity * od.UnitPrice) as 'Total'
from Customers as c 
INNER JOIN Orders as o 
on c.CustomerID = o.OrderID
INNER JOIN [Order Details] as od 
on od.OrderID = o.OrderID
WHERE DATEPART(YEAR, o.OrderDate)=1996
GROUP by c.CompanyName                      



create or ALTER PROCEDURE sp_ventasporclientes
-- parametros 
    @year as INT
as 
BEGIN
    select c.CompanyName as 'Nombre del cliente', 
    sum(od.Quantity * od.UnitPrice) as 'Total'
    from Customers as c 
    INNER JOIN Orders as o 
    on c.CustomerID = o.OrderID
    INNER JOIN [Order Details] as od 
    on od.OrderID = o.OrderID
    WHERE DATEPART(YEAR, o.OrderDate) = @year 
    GROUP by c.CompanyName   
end


--ejecutar sp

EXEC sp_ventasporclientes 1996

execute sp_ventasporclientes 1996

exec sp_ventasporclientes @year = 1996

go
-- realizar un proccedure que muestre un reporte de ventas por cliente y producto (agrupado), de un rango de fechas 


create or ALTER PROCEDURE sp_reporteventas
-- parametros 
    @fechainicio as INT,
    @fechasalida as int 
as 
BEGIN
    select *
    from Customers as c 
    INNER JOIN Orders as o 
    on c.CustomerID = o.OrderID
    INNER JOIN [Order Details] as od 
    on od.OrderID = o.OrderID
    WHERE o.OrderDate = @fechainicio and o.OrderDate = @fechasalida
    GROUP by c.CompanyName   
end
go


--ejercicio 2: Realizar un procedure que inserete un cleinte nuevo


create or ALTER PROCEDURE agregar_cliente
-- parametros entrada 
           @CustomerID nchar(5),
           @CompanyName nvarchar(40),
           @ContactName nvarchar(30) = null,
           @ContactTitle nvarchar(30) = null,
           @Address nvarchar(60) = null,
           @City nvarchar(15) = null,
           @Region nvarchar(15) = null,
           @PostalCode nvarchar(10) = null,
           @Country nvarchar(15) = null,
           @Phone nvarchar(24) = null,
           @Fax nvarchar(24) = null
as 
BEGIN
    INSERT INTO [dbo].[Customers]
           ([CustomerID]
           ,[CompanyName]
           ,[ContactName]
           ,[ContactTitle]
           ,[Address]
           ,[City]
           ,[Region]
           ,[PostalCode]
           ,[Country]
           ,[Phone]
           ,[Fax])
     VALUES
            (@CustomerID
           ,@CompanyName
           ,@ContactName
           ,@ContactTitle
           ,@Address
           ,@City
           ,@Region
           ,@PostalCode
           ,@Country
           ,@Phone
           ,@Fax)        
end
go

SELECT* from Customers

BEGIN TRANSACTION

EXEC agregar_cliente
           @CustomerID = 'GTIG3',
           @CompanyName = 'Patito de hule',
           @ContactName = 'Edith Campos',
           @ContactTitle = 'Tutora',
           @Address = 'Calle del infierno',
           @City = 'Tula',
           @Region = 'Sur',
           @PostalCode = '42800',
           @Country = 'Mexico',
           @Phone = '33-345678'
go



SELECT *
from Customers
WHERE CustomerID = 'GTIG3'






