  Select  r.Num_Empl as [Numero Empleado],
 r.Nombre as [Nombre Empleado],
 r.Fecha_Contrato as [Fecha de Contrato],
 r.Cuota as [cuota de venta],
 r.Ventas as [Ventas Totales],
 o.Ciudad as [Ciudad DE la oficina],
 r.Jefe as [Numero de jefe]
   from Representantes as r
 inner join oficinas as o
 on o.oficina=r.oficina_Rep
 where  (o.Ciudad in ('Daimiel','Navarra','Castellon')) or 
 (r.jefe is null and Fecha_Contrato >='1988-06-01' ) or
 (r.Ventas > Cuota and  r.Ventas <=60000 );

 -- Listar todos los pedidos, mostrando el numero de pedido , 
 --su importe y el nombre y el limite de credito del cliente 
 Select C.Empresa, P.Importe, C.Limite_Credito, P.Num_Pedido
 From Clientes as C
 inner join Pedidos as P 
 on P.Cliente=C.Num_Cli;

 Use BDEJEMPLO2;

 --listar las oficinas con un objetivo superior a 60000
 --mostrando el numbre de la ciudad,nombre del representante y su puesto 
 Select o.Ciudad as [Oficina],
 r.Nombre as [Representante],
 r.Puesto as [Puesto],
 o.Objetivo as [Objetivo de ventas]
 From Oficinas  AS o
 INNER JOIN Representantes AS r 
 ON o.Jef = r.Num_Empl
 where o.Objetivo > 600000;

 --Listra tododos lo pedidos mostrando el numero de pedidos,el importe
 --el nombre y limite de credito del cliente 

 Select pe.Num_Pedido as [Numero pedido],
 pe.Importe as [Importe],
 c.Empresa as [Cliente],
 c.Limite_Credito as [Limite de credito]
 From Pedidos AS pe
 inner join Clientes as c
 on pe.Cliente= c.Num_Cli;


 --Listar cada representante mostrando su nombre. la ciudad
 --y la region en que trabajan 
 Select r.Nombre as [Nombre Representante],
 o.Ciudad as [Oficina],
 o.Region as [Region]
 From Representantes AS r
 inner join Oficinas as o
 on o.Oficina=r.Oficina_Rep;

 --Listar la oficinas(ciudad),nombre y puestos de sus jefes 
 Select r.Nombre as [Nombre Representante],
 o.Ciudad as [Oficina],
 o.Region as [Region]
 From Representantes as r
 inner join Oficinas as o
 on o.Jef=r.Num_Empl;

 --Listra todos los pedidos,mostrando el numero de pedido,el importe y
 --la cantidad de cada producto 
 Select  pe.Num_Pedido as [Numero de Pedido],
 pe.Importe as [Importe],
 pr.Descripcion as [Descripcion],
 pr.Stock as [Cantidad]
 From Pedidos as pe
 inner join Productos as pr
 on pr.Id_fab=pe.Fab and pr.Id_producto = pe.Producto;

 --listar los nombres de los empleados y los nombres de sus jefes 

 Select emple.Nombre as [Empleado],
 jef.Nombre as [Jefes]
 From Representantes as jef
 Inner join Representantes as emple
 on jef.Num_Empl= emple.Jefe;

 select * from Representantes;

 --listar los pedisos con un importe superior a 25000 incluyendo
 --el numero de pedido,el importe, el nombre del representante que tomo nota del pedido y 
 --el nombre del cliente 
 Select p.Num_Pedido , p.Importe, r.Nombre,c.Empresa
From Pedidos as p 
inner join Representantes as r
on r.Num_Empl=p.Rep
inner join Clientes as c
on c.Num_Cli=p.Cliente
where p.Importe > 25000;

--Listar los pediso superiores a 25000 mostrando el numero de pedido
--el nombre del cliente que lo encargo el el nombre del representate asignado al cliente y 
--el importe 
use BDEJEMPLO2;
Go

Select p.Num_Pedido as [Numero de pedido],
c.Empresa as [Cliente ],
r.Nombre as [Representante cliente],
p.Importe as [	i	mporte]
From Representantes as r 
inner join Clientes as c
on r.Num_Empl= c.Rep_Cli
inner join Pedidos as p
on c.Num_Cli=p.Cliente 
where p.Importe > 25000;

use BDg1Join;
GO

select * from
Categoria;

select * from Producto;

--inner join 
Select * from Categoria as c
inner join Producto as p
on c.CategoriaID=p.Categoria;

--left join o left outer join
--la primera tabla que aparece en la lista en el from es la tabla isquierda 

Select * from Categoria as c
left outer join Producto as p
on c.CategoriaID=p.Categoria;

--mostrar todas la categorias ue no tengan productos asignados 
Select c.CategoriaID,c.Nombre from Categoria as c
left outer join Producto as p
on c.CategoriaID=p.Categoria
where p.Categoria is null;

/*
right  toma todos los datos de la tabla derecha  t todos los que oinciden con la tabla
isquierda y nos que no coinsiden los pone en null
*/


Select * from Categoria as c
right  join Producto as p
on c.CategoriaID=p.Categoria;

--selecciona todos aquellos productos que no tienen categoria asignada 
Select p.Nombre as [Nombre del producto],
p.Precio as [Precio]
from Categoria as c
right  join Producto as p
on c.CategoriaID=p.Categoria
where Categoria is null;

/*
full join optiene los datos de la tabla izquierda y derecha y todos 
las oinsidencias enr¿tre las dos 
*/

Select * from Categoria as c
full  join Producto as p
on c.CategoriaID=p.Categoria;

Select * from Categoria as c
cross  join Producto as p;


select *
from Categoria as c,
Producto as p 
where c.CategoriaID=p.Categoria;


/*
Agregacion
count(*)- cuenta las final
count(campo)-cuenta las finas per no los null
mn()-optiene el valor minimo de un campo
max()-optiene el mañor maximo de un capo
avg()-optiene la media aritmetoca o el promedio 
sum()-optiene el total o la sumatoria

*/

use Northwind;

--cuantos clientes tengo 
select COUNT(*) as [Numero de clientes] from Customers;

--cuantas ventas se han realizado
select count(*) from Orders;

--cuantas ventas se realizaron en 1996
select count(*) from Orders where
DATEPART(YEAR,OrderDate) = 1996;

--seleccionar la venta de la fecha mas antigua que se hizo 

select MIN(OrderDate) as [Fecha primera venta] from Orders;

--seleccionar el total que se a vendido

select SUM(UnitPrice * Quantity) as [Total de ventas]
from [Order Details];

--seleccionar el total de ventas entre 1996 y 1997
select SUM(UnitPrice * Quantity) as [Total de ventas]
from [Order Details] as ad
inner join Orders as o
on o.OrderID= ad.OrderID
where DATEPART(YEAR,o.OrderDate) between 1996 and 1997;


select SUM(UnitPrice * Quantity) as [Total de ventas]
from [Order Details] as ad
inner join Orders as o
on o.OrderID= ad.OrderID
where DATEPART(YEAR,o.OrderDate) between 1996 and 1997
and o.CustomerID = 'AROUT';

-- las ventas totales hechas a cad uno de nuestros clientes
select o.CustomerID as [Clientes],SUM(UnitPrice * Quantity) as [Total de ventas]
from [Order Details] as ad
inner join Orders as o
on o.OrderID= ad.OrderID
inner join Customers as c
on c.CustomerID=o.CustomerID
where DATEPART(YEAR,o.OrderDate) between 1996 and 1997
Group by o.CustomerID;