--Crear Base de datos 
CREATE DATABASE restriccionesbdg1;

--utilizar la base de datos
USE restriccionesbdg1;
--creara la tabla categoria
CREATE TABLE categoria(
categoriaid int,
nombre nvarchar(30)

);

insert into categoria
values(1,'carnes frias');

select * FROM categoria;

insert into categoria
values(1,'vinos y Licores');

select * FROM categoria;

insert into categoria
values(null,'ropa');

select * FROM categoria;

drop table categoria;

create table categoria(
categoriaid int not null,
nombre nvarchar(30)not null,
constraint pk_categoria
primary key (categoriaid)
constraint unique_nombre
unique (nombre)

)

insert into categoria
values(1,'carnes frias');

select * FROM categoria;

insert into categoria
values (2,'vinos y licores');

select * FROM categoria;

insert into categoria
values (3,'ropa');

select * FROM categoria;

drop table categoria;

create table categoria(
categoriaid int not null,
nombre nvarchar(30)not null,
constraint pk_categoria
primary key (categoriaid),
constraint unique_nombre
unique(nombre));

create table producto(

productoid int not null,
nombreprod nvarchar(20)not null,
precio money not null,
existencia numeric(10,2)not null,
categoria int,
constraint pk_producto
primary key(productoid),
constraint unique_nombreprod
unique(nombreprod),
constraint chk_precio
check(precio >0 and precio<=4000),
constraint ckh_existencia
check(existencia>=0),
constraint fk_producto_categoria
foreign key(categoria)
references categoria (categoriaid)

)

insert into categoria
values(1,'carnes frias');

select * FROM categoria;

insert into categoria
values (2,'vinos y licores');

select * FROM categoria;

insert into categoria
values (3,'ropa');

insert into categoria
values (8,'ropa china');

select * FROM categoria;

insert into producto
values (1,'tonayan',4000,4,2);

insert into producto
values (2,'tonayan2',1250.6,40,2);

insert into producto
values (3,'Bucañas',200,8,2);

insert into producto
values (4,'Calzon chino',6.3,890,8);

select * from producto;

drop table producto;

select * 
from producto as p 
INNER JOIN categoria as c 
on c.categoriaid = p.categoria;

