-- Funciones de fecha

-- Seleccionar los años, dias , mes y cuatrimentes
-- Funcion que devuelve una parte de la fecha

SELECT GETDATE()

2024-06-06 13:24:09.257

SELECT DATEPART (year, '2024-06-06') as 'Año',
DATEPART (MONTH, 2024-06-06) as 'mes',
DATEPART(QUARTER, '2024-06-06') as 'cuatrimestre',
DATEPART(WEEK ,'2024-06-06') as 'semana',
DATEPART(weekday, '2024-06-06') 'Dia'


SELECT DATEPART (year, OrderDate) as 'Año',
DATEPART (MONTH,  OrderDate) as 'mes',
DATEPART(QUARTER,  OrderDate) as 'cuatrimestre',
DATEPART(WEEK , OrderDate) as 'semana',
DATEPART(weekday,  OrderDate) 'Dia'
from orders



-- funcion que regresa el nombre de un mes o semana dia
set LANGUAGE spanish 

SELECT DATENAME(MONTH, GETDATE())as mes 
SELECT DATENAME(day, GETDATE())as dia 
SELECT DATENAME(weekday, GETDATE())as dia 

SELECT datename (year, OrderDate) as 'Año',
datename (MONTH,  OrderDate) as 'mes',
datename(QUARTER,  OrderDate) as 'cuatrimestre',
datename(WEEK , OrderDate) as 'semana',
datename(weekday,  OrderDate) 'Dia'
from orders 


-- funcion para obtener la diferencia entre años meses dias etc

SELECT DATEDIFF (year, '1983-04-06', GETDATE()) as 'Tiempo de vejez'


-- seleccionar el numero de dias trascurridos entre la fecha de pedido y la fecha de entrega 
SELECT * from ORDERs 

SELECT DATEDIFF (day, OrderDate, ShippedDate) as 'Tiempo trascurrido'
from ORDERs




















-- Funciones de fecha























