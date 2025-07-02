SQL
-- Lenguaje sql-LDD(create,alter,drop)
--crear la base de datos empresa

CREATE DATABASE empresa;
GO

--utilizar la base de datos creada 
USE empresa;
GO

--crear la tabla empleados
CREATE TABLE empleados(
idempleado int not null,
nombre varchar(100) not null,
puesto varchar(50) not null,
fechaIngreso date,
salario money not null,
CONSTRAINT pk_empleados 
PRIMARY KEY (idempleado)
);

CREATE TABLE productos (
productoid int primary key,
nombreProducto nvarchar(50) not null,
existencia int not null,
precioUnitario money not null
);
GO

create table productos2 (
productoID int not null identity(1,1),
nombreProducto nvarchar(50) not null,
existencia int not null,
precio money not null,
constraint pk_productos2
primary key(productoID),
constraint unique_nombreproducto
unique(nombreProducto),
constraint chk_existencia
check (existencia > 0 and existencia<=1000),
constraint chk_precio
check(precio>0.0)
);
GO

--insertar un producto en productos sin identity
insert into productos (
productoid ,
nombreProducto ,
existencia ,
precioUnitario 
)
Values(1,'burritos de frijoles',65,20.99);
GO



select * from productos;
GO

--insertar en la tabla productos 2
insert into productos2 (
nombreProducto ,
existencia ,
precio 
)
Values('burritos chorizo verde2',100,21.0);
GO

insert into productos2 (
nombreProducto ,
existencia ,
precio 
)
Values('chorizo',65,20.99);
GO

select * from productos2;


insert into productos2 (
nombreProducto ,
existencia ,
precio 
)
Values('burritos de frijol',999,60);
GO