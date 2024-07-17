--las transacciones son fundamentales para asegurar la consistencia y 
--la integridad de los datos 

--Transaccion es una unidad de trabajo que se ejecuta de manera completamente 
--exictosa o no se ejecura en absoluto 

-- begin transaction: inicia una nueva transaccion
-- commiit transaction : confirma todo los cambios relaizados durante la 
--trnsaccion
--rollback transaction: revierte todo los cambios realizados durante 
-- la transaccion


SELECT *
from Categories 


BEGIN TRANSACTION


INSERT into Categories (CategoryName, [Description])
VALUEs ('Categoria11', 'Los remediales')

ROLLBACK TRANSACTION


COMMIT TRANSACTION


































