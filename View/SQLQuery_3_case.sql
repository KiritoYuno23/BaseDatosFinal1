-- CASE se puede utilizar en cualquier instrucción o
-- cláusula que permite una expresión válida.
-- Por ejemplo, puede utilizar CASE en instrucciones como
---SELECT, UPDATE, DELETE y SET,
--  y en cláusulas como <select_list>, IN, WHERE, ORDER BY y HAVING.


-- Sintaxis

-- Simple CASE expression:
-- CASE input_expression
--      WHEN when_expression THEN result_expression [ ...n ]
--      [ ELSE else_result_expression ]
-- END

-- -- Searched CASE expression:
-- CASE
--      WHEN Boolean_expression THEN result_expression [ ...n ]
--      [ ELSE else_result_expression ]
-- END


-- A. Uso de una instrucción SELECT con una expresión CASE sencilla

-- En una instrucción SELECT, una expresión CASE sencilla solo permite una
-- comprobación de igualdad; no se pueden hacer otras comparaciones.
-- En este ejemplo se utiliza la expresión CASE para cambiar la presentación de categorías
-- de línea de productos con el fin de hacerla más comprensible.


use AdventureWorks2019;


create view v_Reporte_Producto as 
select ProductNumber, [Name], ProductLine,
    case ProductLine
        when 'R' then 'Road'
        when 'M' then 'Mountain'
        when 'T' then 'Touring'
        when 'S' then 'Other sale items'
        else 'Not for sale'
        end as Categoria
From Production.Product


select ProductNumber, [Name], ProductLine,
    [Categoria] = case ProductLine
        when 'R' then 'Road'
        when 'M' then 'Mountain'
        when 'T' then 'Touring'
        when 'S' then 'Other sale items'
        else 'Not for sale'
        end 
From Production.Product


SELECT*
from v_Reporte_Producto 


SELECT *
from Production.Product;


select ProductNumber 'NumeroProducto', [Name] 'NombreProducto',
    [Categoria] = case ProductLine
        when 'R' then 'Road'
        when 'M' then 'Mountain'
        when 'T' then 'Touring'
        when 'S' then 'Other sale items'
        else 'Not for sale'
    end, ListPrice 'Precio',

    CASE
        WHEN ListPrice = 0.0 THEN 'Mfg item - not for resale'
        WHEN ListPrice < 50.0 THEN 'Under $50'
        WHEN ListPrice >= 50.0 THEN 'Under $250'
        WHEN ListPrice >= 250.0 THEN 'Under $1000'
        else'Over $1000'
    end as 'Price Range'
From Production.Product

-- isnull (función)

SELECT v.AccountNumber, v.name,
isnull(v.PurchasingWebServerURL, 'NO URL') as 'Sitio web'
from [Purchasing].[Vendor] as v

SELECT v.AccountNumber, v.name, ISNULL(v.PurchasingWebServerURL, 'NO URL') 'SitioWeb'
from [Purchasing].[Vendor] as v


SELECT v.PurchasingWebServerURL
from [Purchasing].[Vendor] as v

-- iif 

SELECT iif(1=1, 'Verdadero', 'Falso') as 'Resultado'


select  IiF (LEN('SQL SERVER') = 10, 'OK', 'NO OKAY' ) 'Resultado'

select e.LoginID, e.JobTitle, e.Gender, iif(e.Gender = 'M', 'Hombre', 'Mujer') as 'Genero'
from HumanResources.Employee as e



SELECT *
from #StudentsC1

IF OBJECT_ID (N'tempdb..#StudentsC1') is not NULL
begin
    drop table #StudentsC1;
end

CREATE TABLE #StudentsC1(
    StudentID       INT
    ,StudentName    VARCHAR(50)
    ,StudentStatus  BIT
);

INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(3,'Rogelio Rojas',0)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(4,'Mariana Rosas',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(5,'Roman Zavaleta',1)





IF OBJECT_ID(N'tempdb..#StudentsC2') is not NULL
begin
drop table #StudentsC2
END


CREATE TABLE #StudentsC2(
    StudentID       INT
    ,StudentName    VARCHAR(50)
    ,StudentStatus  BIT
);


INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero Rendón',1)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora Ríos',0)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(6,'Mario Gonzalez Pae',1)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(7,'Alberto García Morales',1)



SELECT *
from #StudentsC1

SELECT *
from #StudentsC2


SELECT *
FROM #StudentsC1 as s1
INNER join #StudentsC2 as s2
on s1.StudentID = s2.StudentID


INSERT into #StudentsC2
SELECT s1.StudentID, s1.StudentName, s1.StudentStatus
FROM #StudentsC1 as s1
LEFT join #StudentsC2 as s2
on s1.StudentID = s2.StudentID
WHERE s2.StudentID is null

SELECT COUNT(*) from #StudentsC2

SELECT *
FROM #StudentsC1 as s1
INNER join #StudentsC2 as s2
on s1.StudentID = s2.StudentID

UPDATE s2
set 
s2.StudentName = s1.StudentName, 
s2.StudentStatus = s1.StudentStatus
SELECT *
FROM #StudentsC1 as s1
INNER join #StudentsC2 as s2
on s1.StudentID = s2.StudentID






