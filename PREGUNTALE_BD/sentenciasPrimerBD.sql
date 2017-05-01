--El total de ordenes del cliente con el ID 3
--https://www.javatpoint.com/sqlite/images/sqlite-sum-function4.png
SELECT COUNT(CustomerID)  FROM Orders
WHERE CustomerID = 3
;

--El total de ordenes del cliente con el ContactName igual a 'Jim Wood'
--https://wizpert.com/wizdom/how-to-write-a-join-query-in-sql
SELECT Customers.ContactName,COUNT(Orders.CustomerID) FROM Orders
 INNER JOIN Customers
    ON Orders.CustomerID=Customers.CustomerID
    WHERE Customers.ContactName = 'Jim Wood'
;

--El total de ordenes del cliente con CompanyName igual a 'Slots Carpet'
SELECT Customers.CompanyName,COUNT(Orders.CustomerID) FROM Orders
INNER JOIN Customers
   ON Orders.CustomerID=Customers.CustomerID
   WHERE Customers.CompanyName = 'Slots Carpet'
;

--El total de ordenes de cada compañía ordenado de manera descendente
SELECT Customers.CompanyName,COUNT(Orders.OrderID) FROM Orders
INNER JOIN Customers
  ON Orders.CustomerID=Customers.CustomerID
  GROUP BY Customers.CompanyName
  ORDER BY COUNT(Orders.OrderID) DESC
;
--El total de ordenes de cada compañía ordenado de manera ascendente
SELECT Customers.CompanyName, COUNT(Orders.OrderID) FROM Orders
  INNER JOIN Customers
    ON Orders.CustomerID=Customers.CustomerID
  GROUP BY Customers.CompanyName
  ORDER BY COUNT(Orders.OrderID) ASC;

--La compañía con el mayor número de ordenes
SELECT Customers.CompanyName, COUNT(Orders.OrderID) FROM Orders
  INNER JOIN Customers
    ON Orders.CustomerID=Customers.CustomerID
  GROUP BY Customers.CompanyName
  ORDER BY COUNT(Orders.OrderID) DESC--ordenar por medio de la cuenta en TABLE "orders", columna "orderID"
  LIMIT 1;--limit el display a un valor, dado que esta ordenado en forma descendente, el resultado funciona.

  --7)La suma total de piezas que fueron ordenadas por cada compañía.
  --OrderDetails,Orders,
  SELECT CompanyName,SUM(OrderDetails.Quantity) FROM  Customers
  LEFT JOIN Orders
    ON Customers.CustomerID=Orders.CustomerID
  LEFT JOIN OrderDetails
    ON OrderDetails.OrderID=Orders.OrderID
    GROUP BY Customers.CompanyName
    ORDER BY SUM(OrderDetails.Quantity) DESC
  ;
--8)El monto total en pesos de la orden con ID 4
SELECT orderID ,UnitPrice*Quantity FROM OrderDetails
WHERE orderID=4
GROUP BY OrderID
;
--9)El monto total en pesos de cada orden
--CORROBORAR CON ABEL
SELECT orderID ,UnitPrice*Quantity FROM OrderDetails
GROUP BY OrderID
;
--10)La consulta del inciso anterior pero únicamente mostrando aquellas ordenes que sean mayores a $1,000.00 pesos
--CORROBORAR CON ABEL
SELECT orderID , UnitPrice*Quantity FROM OrderDetails
WHERE UnitPrice*Quantity > 1000
GROUP BY OrderID
;
--El total de piezas en cada orden
SELECT OrderID, SUM(Quantity) FROM OrderDetails
GROUP BY OrderID
;
--SCHEMA:
CREATE TABLE Customers (
 CustomerID INTEGER PRIMARY KEY
,CompanyName VARCHAR(60)
,ContactName VARCHAR(40)
,ContactTitle VARCHAR(60)
,Address VARCHAR(60)
,City VARCHAR(60)
,State VARCHAR(2)
);
CREATE TABLE Orders(
OrderID INTEGER PRIMARY KEY
,CustomerID INTEGER
,OrderDate VARCHAR(25)
,RequiredDate VARCHAR(25)
,ShippedDate VARCHAR(25)
);
CREATE TABLE OrderDetails (
 OrderDetailID INTEGER PRIMARY KEY
,OrderID INTEGER
,ProductID INTEGER
,UnitPrice REAL
,Quantity INTEGER
);
