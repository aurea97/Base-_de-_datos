create database ejercicio1999;

use ejercicio1999;


create table Empleado (
empleadoID int not null auto_increment,
Nombre nvarchar(15) not null,
apellido1 nvarchar(15) not null,
apellido2 nvarchar(15),
direccion nvarchar(50) not null,
salario decimal(10,2) not null,
jef int ,
departamento int not null,
constraint pk_empleado 
Primary key(empleadoID),
constraint chk_salario
check (salario between 200 and 50000),
constraint fk_empleado_jef
foreign key (jef)
References empleado(empleadoID)
on delete no action
on update no action
);


create table Departamento(
DepartamentoID int not null auto_increment,
nombredepto nvarchar(15) not null,
estatus char(2) not null ,
administrador int not null,
constraint departamento_pk 
primary key (DepartamentoID),
constraint unique_nombredepto
unique(nombredepto),
constraint chk_estatus
check (estatus in('SI','NO')),
constraint fk_empleado_depto
foreign key (administrador)
references Empleado(empleadoID)
);


alter table Empleado
add constraint fk_empleado_depto1
foreign key (departamento)
references Departamento(DepartamentoID);


create table Ubicacion(
ubicacionID int not null auto_increment,
ubicacion nvarchar(15) not null,
iddepto int not null,
constraint pk_ubicacion
primary key (ubicacionID),
constraint unique_deptoo
unique(iddepto),
constraint fk_departamento_ubi
foreign key (iddepto)
References Departamento(DepartamentoID)
);
