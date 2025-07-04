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

--crear dos tablas con razon de cardinalidad de 1 a n con participacion total,esto quiero decir que la foren key es not null
CREATE TABLE categoria(
CategoriaId int not null identity(1,1),
NombreCategoria nvarchar(20) not null,
constraint pk_categoria
PRIMARY KEY(CategoriaId),
CONSTRAINT unique_nombrecategoria
UNIQUE(NombreCategoria)
);
GO

create table productos3(
ProductosId int not null identity(1,1),
NombreProducto nvarchar(20) not null,
Existencia int not null,
precioUnitario money not null,
CategoriaId int not null,
CONSTRAINT pk_productos3
Primary key (ProductosId),
CONSTRAINT chk_existencia3
CHECK (Existencia >0 and Existencia<=1000),
CONSTRAINT chk_preciounitario
CHECK (PrecioUnitario >0.0 ),
CONSTRAINT unique_nombreproducto3
UNIQUE(NombreProducto),
CONSTRAINT fk_productos3_categoria
FOREIGN KEY(CategoriaId)
REFERENCES categoria(CategoriaId)
);
GO



--crear dos tablas con razon de cardinalidad de 1 a n con participacion total,esto quiero decir que la foren key es not null
CREATE TABLE categoria2(
Id int not null identity(1,1),
NombreCategoria nvarchar(20) not null,
constraint pk_categoria1
PRIMARY KEY(Id),
CONSTRAINT unique_nombrecategoria1
UNIQUE(NombreCategoria)
);
GO

create table productos4(
ProductosId int not null identity(1,1),
NombreProducto nvarchar(20) not null,
Existencia int not null,
precioUnitario money not null,
CategoriaId int not null,
CONSTRAINT pk_productos4
Primary key (ProductosId),
CONSTRAINT chk_existencia4
CHECK (Existencia >0 and Existencia<=1000),
CONSTRAINT chk_preciounitario2
CHECK (PrecioUnitario >0.0 ),
CONSTRAINT unique_nombreproducto4
UNIQUE(NombreProducto),
CONSTRAINT fk_productos4_categoria3
FOREIGN KEY(CategoriaId)
REFERENCES categoria2(Id)
);
GO


CREATE  Table tabla1(
tabla1ID int not null identity(1,1) ,
tablaID2 int not null ,
NombreTabla1 nvarchar(20) not null,
CONSTRAINT pk_tabla1
primary key(tabla1ID,tablaID2 )
);
GO

CREATE TABLE tabla2(
tabla2ID int not null identity(1,1),
tabla1ID int ,
tablaID2 int ,
NombreTabla2 nvarchar (20),
CONSTRAINT pk_tabla2
primary key (tabla2ID),
constraint fk_tabla2_tabla1
FOREIGN KEY (tabla1ID,tablaID2)
References tabla1(tabla1ID,tablaID2)
);
Go

--crear tablas con una razon de cardinalidad 1a 1
CREATE TABLE employee (
id int not null identity(1,1),
nombre nvarchar(20)not null,
ap1 nvarchar(20)not null,
ap2 nvarchar(20)not null,
sexo nvarchar(2)not null,
salario money not null,
constraint pk_emplo
primary key(id)
);

create table department(
id int not null identity(1,1),
nombre nvarchar(20)not null,
ubicacion nvarchar(20)not null,
employeid int not null,
constraint pk_deparment
primary key (id),
constraint fk_employee_deparment
foreign key(employeid)
references employee(id),
constraint unique_employ
UNIQUE(employeid) 

);