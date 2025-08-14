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
Select p.Num_Pedido,c.Empresa,R.Nombre,p.Importe

From Pedidos as p 
inner join Representantes as r
on r.Num_Empl=p.Rep
inner join Clientes as c
on c.Num_Cli=p.Cliente;