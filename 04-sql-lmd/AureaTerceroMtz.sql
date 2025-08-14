CREATE DATABASE RecursosHumanos;
Go
use RecursosHumanos;
GO

CREATE TABLE Usuarios(
idUsuarios  int not null identity(1,1),
idEmpleados int not null,
Usuarios varchar(50) not null,
constraseñaHash varchar(225) not null,
Rol varchar(20) not null,
constraint pk_Usuarios
Primary Key(idUsuarios),
constraint fk_Usuarios_Empleados
Foreign  key (idEmpleados)
references Empleados(idEmpleado),
constraint unique_usuario
unique(Usuarios),
constraint ch_rol
check(Rol in('Admin','RRHH','Colsulta'))
);
GO

Create table Empleados(
idEmpleado int not null identity(1,1),
Nombre varchar(100) not null,
ApellidoPaterno varchar(100) not null,
ApellidoMaterno varchar(100),
CURP char(18) not null,
FechaNacimiento date not null,
FechaIngreso date not null,
IdDepartamento int not null,
IdPuesto int not null,
Genero char(1),
EstadoEmpleado varchar(20),
constraint pk_Empleados 
Primary key (idEmpleado),
constraint unique_curb
unique(CURP ),
constraint ch_genero
check(Genero in('M','F')),
constraint ch_estado
check(EstadoEmpleado in('Activo','Inactivo','Suspendido')),
Constraint fk_dep
Foreign  key (IdDepartamento)
references Departamentos(IdDepartamentos),
Constraint fk_pues
Foreign  key (IdPuesto )
references Puesto(idPuesto),


);
Go

Create table Puesto (
idPuesto int not null identity(1,1),
Nombre varchar(100) not null,
SueldoBase decimal(10,2) not null,
constraint pk_puesto 
primary key(idPuesto ),
constraint unique_nombre
unique(Nombre),
constraint ch_sueldobase
check(SueldoBase >0),
constraint fk_dep_emple


);
Go

create table Asistencia(
idAsistencia int not null identity(1,1),
idEmpleado int not null,
Fecha date not null,
HoraEntrada time(7),
HoraSalida time(7),
constraint pk_Asistencia
Primary key(idAsistencia),
);
GO

create table incidencias(
idInsidencias int not null identity(1,1),
idEmpleado int not null,
Fecha date not null,
Tipoinsidencia varchar(50),
Descripcion varchar(225) not null,
constraint ch_tipo
check(Tipoinsidencia in('Falta','Permiso','Retardo','Vacaciones','Incapacidad')),
constraint pk_incidencia
Primary Key(idInsidencias)
);
GO

create table Departamentos(
IdDepartamentos int not null identity(1,1),
Nombre varchar(100)not null,
constraint pk_departamentos
primary key(IdDepartamentos),
constraint unique_nombre
unique(Nombre)
);
Go