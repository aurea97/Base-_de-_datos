create database Automoviles;
Go

use Automoviles;
Go

CREATE TABLE SUCURSAL (
    NumSucursal INT NOT NULL,
    Nombre NVARCHAR(20) NOT NULL,
    Ubicacion NVARCHAR(40) NOT NULL,
    idsucursal INT NOT NULL,
    idVehiculo INT,
    CONSTRAINT PK_SUCURSAL PRIMARY KEY (idsucursal)
);
GO

CREATE TABLE CLIENTS (
    CURP NVARCHAR(18),
    Telefono NVARCHAR(10) NOT NULL,
    Nombre VARCHAR(10) NOT NULL,
    ApellidoPaterno VARCHAR(10) NOT NULL,
    ApellidoMaterno NVARCHAR(10) NOT NULL,
    Direccion NVARCHAR(20) NOT NULL,
    IdCliente INT NOT NULL,
    CONSTRAINT PK_CLIENTS PRIMARY KEY (IdCliente)
);
GO

CREATE TABLE Vehiculos (
    placa NVARCHAR(20) NOT NULL,
    Marca NVARCHAR(10) NOT NULL,
    Modelo NVARCHAR(10) NOT NULL,
    Año DATE NOT NULL,
    IdVehiculo INT NOT NULL,
    idsucursal INT,
    CONSTRAINT PK_Vehiculos PRIMARY KEY (IdVehiculo),
    CONSTRAINT FK_Vehiculos_SUCURSAL FOREIGN KEY (idsucursal) REFERENCES SUCURSAL(idsucursal)
);
GO

ALTER TABLE SUCURSAL
ADD CONSTRAINT FK_SUCURSAL_Vehiculo FOREIGN KEY (idVehiculo) REFERENCES Vehiculos(IdVehiculo);
GO

CREATE TABLE RENTA (
    FechaInicio DATE NOT NULL,
    FechaTermino DATE NOT NULL,
    Idcliente INT NOT NULL,
    idVehiculo INT NOT NULL,
    idrenta NVARCHAR(20) NOT NULL,
    CONSTRAINT PK_RENTA PRIMARY KEY (idrenta),
    CONSTRAINT FK_RENTA_CLIENTS FOREIGN KEY (Idcliente) REFERENCES CLIENTS(IdCliente),
    CONSTRAINT FK_RENTA_Vehiculos FOREIGN KEY (idVehiculo) REFERENCES Vehiculos(IdVehiculo)
);
GO