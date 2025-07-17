#crear base de datos empresa 
CREATE DATABASE empresapatito;


use empresapatito;


create table empleados(
IDempleado int not null,
Nombre Varchar(100) not null,
puesto varchar(50) ,
fechaIngreso DAte,
Salario decimal(10,2),
constraint p_empleados
primary key(IDempleado)
);


#Agregar una columna en la tabla empleados 
alter table empleados 
add column CorreoElectronico varchar(100);


select * from empleados;

#modificar el tipo de dato de un campo
alter table empleados 
modify column Salario decimal (12,2) not null;


#Renombrar campo
alter table empleados 
rename column CorreoElectronico to Email;

#crear tabla departamento 
create table departamentos(
IDdepartamento int not null auto_increment primary key,
NombreD varchar(100)
);


#agregar un capo a la tabla departamento 
alter table  empleados
add IDdepartamento int not null;

#agregar clave foraneos 
alter table  empleados
add constraint fk_empleados_departamentos
foreign key(IDdepartamento)
references departamentos(IDdepartamento)

#eliminar auto_increment
alter table departamentos 
modify IDdepartamento int not null;

#eliminar una PK de empleados 
alter table empleados 
drop  primary key;


#eliminar la FK de la tabla empleados 
alter table empleados 
drop constraint fk_empleados_departamentos;


#eliminar la pk de departamento
alter table departamentos 
drop constraint PK__departam__9AE08B066C95C95F;


#crear un constraint de verificacion en salario 
alter table empleados 
add constraint chk_salario
check (Salario > 0.0);


#eliminar

Create table categoria(
id int not null primary key default -1,
Nombre varchar (20),
estaus char(1) default 'A'
);


insert into categoria 
Values (default, 'carnes','D');

select * from categoria;

insert into categoria 

Values (default, 'carnes',Default);

drop table categoria;


#eliminar la columna Email
alter table empleados 
drop column Email;


alter table empleados 
add constraint pk_empleados 
primary key (IDempleado);


alter table departamentos
add constraint pk_departamentos
primary key (IDedepartamentos);


#eliminar las tablas 
drop table empleados;


drop table departamentos;


drop table categoria;



#eliminar la base de datos 
drop database empresapatito;
