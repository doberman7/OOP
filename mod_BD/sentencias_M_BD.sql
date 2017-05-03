--Agrega a la tabla de Orders una nueva orden relacionándola con un cliente existente.
INSERT INTO Orders (customerID,OrderDate, RequiredDate,  ShippedDate)
VALUES (5,"2017-05-02", "2017-05-26", "2017-05-22");
 --Adicionalmente para esta nueva orden crea dos registros en la tabla de OrderDetails. Por ahora no importan los datos invéntalos
INSERT INTO OrderDetails(orderID,productID,UnitPrice,Quantity)
VALUES (21,5,1.39,30);

--Primero crear un nuevo cliente en la tabla Customers. (Inventa los datos)
INSERT INTO Customers(CompanyName)
VALUES ("NewClient");
--Has una consulta para saber cuales son las ordenes de la empresa Floor Co.
SELECT Customers.CompanyName, * FROM Orders
LEFT JOIN Customers
	ON Orders.CustomerID=Customers.CustomerID
WHERE Customers.CompanyName="Floor Co.";
--Version alternativa de la busqueda
--ID's=18 y 20
SELECT * FROM Orders
LEFT JOIN Customers
	ON Orders.CustomerID=Customers.CustomerID
WHERE OrderDate > "2013" AND Customers.CompanyName="Floor Co."
;
--Finalmente deberás cambiar a las ordenes de 2013 su valor de CustomerID
UPDATE Orders
SET CustomerID=6
WHERE CustomerID=3 AND OrderDate > "2013";
--Constulta
SELECT * FROM Orders
WHERE CustomerID=6 AND OrderDate > "2013";
--imagina que quieres borrar al cliente Slots Carpet, sus orders y OrderDetails
--esta es la consulta
SELECT Customers.CompanyName,Customers.CustomerID,orders.orderID,OrderDetails.OrderDetailID FROM customers
LEFT JOIN orders ON customers.customerID=orders.customerID
LEFT JOIN OrderDetails ON orders.orderID =OrderDetails.orderID
WHERE customers.companyname="Slots Carpet";
--resultado de la consulta
--CompanyName   CustomerID  OrderID     OrderDetailID
------------  ----------  ----------  -------------
--Slots Carpet  5           13          29
--Slots Carpet  5           17          36
--Slots Carpet  5           17          37
--Slots Carpet  5           17          38
--Slots Carpet  5           21          48

--ejecucion de los borrados
DELETE FROM OrderDetails WHERE OrderID= 13;
DELETE FROM OrderDetails WHERE OrderID=17;
DELETE FROM OrderDetails WHERE OrderID=21;
DELETE FROM Orders WHERE CustomerID=5;
DELETE FROM Customers WHERE CustomerID=5;
