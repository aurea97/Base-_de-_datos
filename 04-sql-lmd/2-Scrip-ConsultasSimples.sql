--lenguaje sql-lmd
--consultas simples 


--seleccionar todos los clientes 
SELECT * 
FROM customers;

--seleccionar todos los clientes pero solamente mostrando,}
--la clave,el nombre del cliente,cuidad y pais (proyeccion)

SELECT custumersID,companyName,city,country
FROM customers;

--alias de columna 
SELECT custumersID AS NumeroCliente,companyName AS 'Nombre Cliente' ,city  ciudad,country AS [ciudad chida]
FROM customers;

--campos calculados: seleccionar las ordenes de compra mostrando los producctos,
--la cantidad bendida,precio,decuento y total

Select ProductID AS [Nombre Producto], [UnitPrice] AS [Precio],
Quantity AS [Cantidad],Discount AS [Descuento], 
(UnitPrice * Quantity ) AS [Importe Sin Descuento]
(UnitPrice * Quantity * (1 - Discount)) AS [Importe]
FROM [order Details];

--seleccionar las ordenes de compra mostrando el cliente al que se le vendio 
--el empleado que la realizo, la fecha de la orden , el trasportista,
--y lla fecha de la orden hay que dividirla en año, mes,dia trimestre.

select orderID AS [Numero de orden],orderDate as [Fecha deorden],
customerID AS [Clientes],employeeID AS [Empleado], 
ShipVia AS [Trasportista],
YEAR(orderDate) AS [Año de la compra],
MONTH(orderDate) AS [Mes de la compra],
Day(orderDate) AS [Dia de la compra]
From orders;

select orderID AS [Numero de orden],orderDate as [Fecha deorden],
customerID AS [Clientes],employeeID AS [Empleado], 
ShipVia AS [Trasportista],
DATEPART(orderDate) AS [Año de la compra],
DATEPART(mm,orderDate) AS [Mes de la compra],
DATEPART(d,orderDate) AS [Dia de la compra],
DATEPART(qq, orderdate) AS [Trimestre],
DATEPART(week,orderdate) AS [Semana],
DATEPART(weekday, orderdate) AS [Dia de la semana],
DATENAME(WEEKDAy,orderdate) AS [Nombre Dia]
From orders 
ORDER BY 9 ;

--seleccionar todos los productos que su precio
--sea mayor a 40.3 (mostrar el numero del producto, nombre del producto
--y el precio unitario)
select ProductID AS [Numero de Producto],
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
from Products
WHERE ProductName = 'Carnarvon Tigers';


--diferente
select ProductID AS [Numero de Producto],
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
from Products
WHERE ProductName <> 'Carnarvon Tigers';

select ProductID AS [Numero de Producto],
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
from Products
WHERE ProductName != 'Carnarvon Tigers';


--seleccionar todas las ordenes que sean de brazil
--rio de janeiro mostrando solo el numero de orden,
--la fecha de orden, pais de envio,cuidad y su trasportista

select 
orderID AS [Numero orden],
orderDate AS [Fecha de orden],
ShipContry AS [Pais envio],
ShipVia AS [Trasportsta]
FROM orders
where ShipCity = 'Rio de Janeiro' and ShipContry = 'Brazil';

--INNER JOIN 


select 
o.orderID AS [Numero orden],
o.orderDate AS [Fecha de orden],
o.ShipContry AS [Pais envio],
o.ShipVia AS [Trasportsta],
s.ShipperID AS [Numero de Trasportista],
s.CompanyName AS [Trasportista]
FROM orders AS 0
INNER JOIN Shippers AS s
on s.ShipperID = o.ShipVia
where ShipCity = 'Rio de Janeiro' and ShipContry = 'Brazil';


--Seleccionar todas las ordenes 
--mostrando lo mismo que la consulata anterior 
--pero todas aquellas que no tengan region de envio
select 
o.orderID AS [Numero orden],
o.orderDate AS [Fecha de orden],
o.ShipContry AS [Pais envio],
o.ShipVia AS [Trasportsta],
s.ShipperID AS [Numero de Trasportista],
s.CompanyName AS [Trasportista]
FROM orders AS 0
INNER JOIN Shippers AS s
on s.ShipperID = o.ShipVia
where ShipperRegion is not null;

--seleccionar todas las ordenes enviadas a Brazil,Alemania y mexico
--que tengan region
-de forma desendente por el shipcontry
select 
o.orderID AS [Numero orden],
o.orderDate AS [Fecha de orden],
o.ShipContry AS [Pais envio],
o.ShipVia AS [Trasportsta],
s.ShipperID AS [Numero de Trasportista],
s.CompanyName AS [Trasportista]
FROM orders AS 0
INNER JOIN Shippers AS s
on s.ShipperID = o.ShipVia
where (ShipContry = 'Brazil' or ShipContry = 'Germany' or ShipContry = 'Mexico')
and ShipRegion is not null ;


--order by --> ordena los datos de forma ascendente y descendente,
--seleccionar  los empleados ordenados por su pais 

SELECT (titleofcourtesy + '' FirstName + '' + LasName) AS [Nombre completo], contry as [Pais], city as [Ciudad]
FROM Employees;

SELECT CONCAT(titleofcourtesy , '' FirstName , '' , LasName) AS [Nombre completo], contry as [Pais], city as [Ciudad]
FROM Employees
order by contry ASC;

SELECT CONCAT(titleofcourtesy , '' FirstName , '' , LasName) AS [Nombre completo], contry as [Pais], city as [Ciudad]
FROM Employees
order by 2 DESC;

SELECT CONCAT(titleofcourtesy , '' FirstName , '' , LasName) AS [Nombre completo], contry as [Pais], city as [Ciudad]
FROM Employees
order by CONCAT(titleofcourtesy , '' FirstName , '' , LasName) AS [Nombre completo] ASC;


SELECT CONCAT(titleofcourtesy , '' FirstName , '' , LasName) AS [Nombre completo], contry as [Pais], city as [Ciudad]
FROM Employees
order by [Nombre completo] ASC;


SELECT CONCAT(titleofcourtesy , '' FirstName , '' , LasName) AS [Nombre completo], contry as [Pais], city as [Ciudad]
FROM Employees
order by country,city ;


SELECT CONCAT(titleofcourtesy , '' FirstName , '' , LasName) AS [Nombre completo], contry as [Pais], city as [Ciudad]
FROM Employees
order by country DESC,city ;

SELECT CONCAT(titleofcourtesy , '' FirstName , '' , LasName) AS [Nombre completo], contry as [Pais], city as [Ciudad]
FROM Employees
order by country ASC,city DESC;

SELECT CONCAT(titleofcourtesy , '' FirstName , '' , LasName) AS [Nombre completo], contry as [Pais], city as [Ciudad]
FROM Employees
order by 2 ASC,3 DESC;

SELECT CONCAT(titleofcourtesy , '' FirstName , '' , LasName) AS [Nombre completo], contry as [Pais], city as [Ciudad]
FROM Employees
order by 2 ASC,contry DESC;

--seleccionar todos los paises diferentes de mis clientes
SELECT DISTINCT country, city
FROM custumers
where city= 'buenos aires';

SELECT DISTINCT country, city,companyname
FROM custumers
order by 1 asc;

select distinct Categoryid
from products;

use bdejemplo2;
GO

--seleccionar cuantos puestos diferentes tiene los representantes
SELECT DISTINCT Puesto 
FROM Representantes;

--cuantos puestos diferentes tiene los representantes
--funciones de agregado (las funciones dde aggregado solo regresan un solo registro ademas que se debe de )
--las mas comunes son count(*), count(campo), max(),min(),sum(),avg()

select count(Distinct Puesto) as [Numero de puesto]
From Representantes;

--seleccionar el precio minimo de los productos 

Select min(precio) AS [Precio Mnimo]
FROM productos
order by precio asc;

--listar las oficinas cuyas vendas estan por debajo del 80% de sus objetivos 
--se muestre la cuidad,ventas y el objetivo 

select cuidad,ventas, objetivo,(.8 * objetivos) AS [80% del objetivo]
From oficina
where ventas <(.8 * objetivos );

--seleccionar los primeros 5 registros de los pedidos 

Select Top 5 numpedidos,fecha,producto,cantidad , importe 
From pedidos
order by 5 desc;

--test de rango (BETWEEN)
--hallar los pedisos del ultimo trimeste de 1989
select Num_Pedido,Fecha_Pedido,Fab,Producto,Importe
from pedidos 
where Fecha_Pedido Between '1989-10-01 ' and '1989-12-31'
order by Fecha_Pedido desc;

select Num_Pedido,Fecha_Pedido,Fab,Producto,Importe
from pedidos 
where Fecha_Pedido >= '1989-10-01 ' and Fecha_Pedido <=  '1989-12-31'
order by Fecha_Pedido desc;

select Num_Pedido,Fecha_Pedido,Fab,Producto,Importe
from pedidos 
where datepart( quarter ,Fecha_Pedido ) =4
order by Fecha_Pedido desc;

--hallar los pedidos que tiene un importe entre 30000 y 39999.9

select Num_Pedido,Fecha_Pedido,Fab,Producto,Importe
from pedidos 
where importe between 30000 and 39999.9
order by Fecha_Pedido desc;

--listar los representantes cuyas ventas se encuentran entre el 80% y el 120% de su cuota

select num_Emp1,Nombre,Puesto,cuota,ventas
from Representantes
where ventas not between (cuota * 0.8) and (cuota * 1.2);

select num_Emp1,Nombre,Puesto,cuota,ventas
from Representantes
where not(ventas >= (cuota * 0.8) and ventas<=(cuota * 1.2));

--Tes de pertenecia conjuntos (IN)
--hallar lod pedidos de 4 representantes en concreto 
select num_Pedido,Fecha_Pedido,IMPORTE,REP
from Pedidos
 where REP in (107,109,101,103);

 select num_Pedido,Fecha_Pedido,IMPORTE,REP
from Pedidos
 where REP=107 or REP=109 or REP=101 or REP=103;

 select num_Pedido,Fecha_Pedido,IMPORTE,REP
from Pedidos
 where REP not in (107,109,101,103);

 select num_Pedido,Fecha_Pedido,IMPORTE,REP
from Pedidos
 where not ( REP=107 or REP=109 or REP=101 or REP=103);

 --test de encage de patrones (LIKE)
 SELECT *
 From clientes
 where Empresa LIKE 'A%';

 SELECT *
 From clientes
 where Empresa LIKE 'Ac%';

 SELECT *
 From clientes
 where Empresa LIKE '%L';

 SELECT *
 From clientes
 where Empresa LIKE '%%er%';

 use  BDEJEMPLO2;
 use Northwind;

 Select *
 From Clientes
 where Empresa Like '[A-D]%';

 Select *
 From Clientes
 Where Empresa like '_ilas';

 Select *
 From Clientes
 Where Empresa like '____';


 Select *
 From Clientes
 Where Empresa like '[^ADF]%';

 --hallar todos los representantes que o bien:
 --a)trabajan en daimiel(22),Navarra(11), o Castellon(12); o bien
 --b)no tienen jefe y estan contratados desde junio de 1988; o
 --c)superan su cuota pero tiene ventas de 6000 o menos

 Select Nombre, Fecha_Contrato,Puesto
 From Representantes
 where  (Oficina_Rep in (22,11,12)) or 
 (jefe is null and Fecha_Contrato >='1988-06-01' ) or
 (Ventas > Cuota and  Ventas <=60000 );

 select r.Num_Empl as [Numero Empleado],
 r.Nombre as [Nombre Empleado],
 r.Fecha_Contrato as [Fecha de Contrato],
 r.Cuota as [cuota de venta],
 r.Ventas as [Ventas Totales],
 o.Ciudad as [Ciudad DE la oficina]
 from Representantes as r
 inner join oficinas as o
 on o.oficinas=r.oficina_Rep
 ;

 