create or alter procedure usp_GetSubcategoryProducts (
@SubcategoryID INT
)
as 
BEGIN
    select p.ProductID ,p.Name 'Nombre', sum(pi.Quantity ) 'Full Inventario'
    FROM Production.Product as p
    INNER join Production.ProductInventory as pi
    on p.ProductID = pi.ProductID
    where ProductSubcategoryID = @SubcategoryID
    GROUP by p.Name, p.ProductID
    

end;


EXEC usp_GetSubcategoryProducts '1';

































go

CREATE OR ALTER PROCEDURE usp_GetSubcategoryProducts (
    @SubcategoryID INT
)
AS
BEGIN
    SELECT 
        p.ProductID,
        p.Name AS 'Nombre',
        SUM(pi.Quantity) AS 'Full Inventario'
    FROM 
        Production.Product AS p
    INNER JOIN 
        Production.ProductInventory AS pi ON p.ProductID = pi.ProductID
    WHERE 
        p.ProductSubcategoryID = @SubcategoryID
    GROUP BY 
        p.ProductID, p.Name;
END;

go

select p.ProductID ,p.Name 'Nombre', sum(pi.Quantity ) 'Full Inventario'
    FROM Production.Product as p
    INNER join Production.ProductInventory as pi
    on p.ProductID = pi.ProductID
    where ProductSubcategoryID = 1
    GROUP by p.Name


select count(pi.Quantity)
    FROM Production.Product as p
    INNER join Production.ProductInventory as pi
    on p.ProductID = pi.ProductID
    where ProductSubcategoryID = 1




select p.ProductID ,p.Name 'Nombre', (pi.Quantity + pi.Quantity) 'Full Inventario'
    FROM Production.Product as p
    INNER join Production.ProductInventory as pi
    on p.ProductID = pi.ProductID
    where ProductSubcategoryID = 1
    GROUP by 


    
select p.ProductID ,p.Name 'Nombre', (pi.Quantity ) as 'Full Inventario'
    FROM Production.Product as p
    INNER join Production.ProductInventory as pi
    on p.ProductID = pi.ProductID
    where p.ProductID = 1





SELECT *
FROM Production.ProductInventory



















go

CREATE PROCEDURE usp_GetSubcategoryProducts2 
(@SubcategoryID INT)
AS
BEGIN
    SELECT 
        p.ProductID,
        p.ProductName,
        SUM(i.Quantity) AS TotalInventory
    FROM 
        Production.Product as p
    JOIN 
        Production.ProductSubcategory as ps 
        ON p.ProductID = ps.
    JOIN 
        Production.Inventory i ON p.ProductID = i.ProductID


    WHERE 
        ps.ProductSubcategoryID = @SubcategoryID
    GROUP BY 
        p.ProductID, p.ProductName;
END;
GO









