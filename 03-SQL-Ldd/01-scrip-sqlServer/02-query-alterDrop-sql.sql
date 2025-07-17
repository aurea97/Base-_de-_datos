--crear base de datos empresa 
CREATE DATABASE empresapatito;
GO

use empresapatito;
GO

create table empleados(
IDempleado int not null,
Nombre Varchar(100) not null,
puesto varchar(50) ,
fechaIngreso DAte,
Salario decimal(10,2),
constraint p_empleados
primary key(IDempleado)
);
GO

--Agregar una columna en la tabla empleados 
alter table empleados 
add CorreoElectronico varchar(100);
go

select * from empleados;

--modificar el tipo de dato de un campo
alter table empleados 
alter column Salario money not null;
Go

--Renombrar campo
exec sp_rename 'empleados.CorreoElectronico',
'Email', 'COLUMN';
go

--crear tabla departamento 
create table departamentos(
IDdepartamento int not null identity(1,1) primary key,
NombreD varchar(100),

);
GO

--agregar un capo a la tabla departamento 
alter table  empleados
add IDdepartamento int not null;

--agregar clave foraneos 
alter table  empleados
add constraint fk_empleados_departamentos
foreign key(IDdepartamento)
references departamentos(IDdepartamento)
go

--eliminar una PK de empleados 
alter table empleados 
drop constraint p_empleados;
go

--eliminar la FK de la tabla empleados 
alter table empleados 
drop constraint fk_empleados_departamentos;
GO

--eliminar la pk de departamento
alter table departamentos 
drop constraint PK__departam__9AE08B066C95C95F;
Go

--crear un constraint de verificacion en salario 
alter table empleados 
add constraint chk_salario
check (Salario > 0.0);
GO

--eliminar

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


--eliminar la columna Email
alter table empleados 
drop column Email;


alter table empleados 
add constraint pk_empleados 
primary key (IDempleado);
GO

alter table departamentos
add constraint pk_departamentos
primary key (IDedepartamentos);
GO

--eliminar las tablas 
drop table empleados;
GO

drop table departamentos;
GO

drop table categoria;
GO


--eliminar la base de datos 
drop database empresapatito;
Go