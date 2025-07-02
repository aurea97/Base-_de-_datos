**Tabla cliente**



| Campo             | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones                     | Referencia | Descripción                      |
|-------------------|-------------|--------|-----|-----|------|-------|-----------------------------------|------------|----------------------------------|
| CURP              | NVARCHAR    | 18     | Sí  | No  | No   | Sí    | Formato CURP válido               | -          | Identificador único              |
| Telefono          | NVARCHAR    | 10     | No  | No  | Sí   | No    | Solo números                     | -          | Teléfono del cliente             |
| Nombre            | VARCHAR     | 10     | No  | No  | No   | No    | Solo letras                      | -          | Nombre del cliente               |
| ApellidoPaterno   | VARCHAR     | 10     | No  | No  | No   | No    | Solo letras                      | -          | Apellido paterno                 |
| ApellidoMaterno   | NVARCHAR    | 10     | No  | No  | Sí   | No    | Solo letras                      | -          | Apellido materno                 |
| Direccion         | NVARCHAR    | 20     | No  | No  | Sí   | No    | -                                 | -          | Dirección del cliente            |
| IdCliente         | INT         | -      | No  | No  | No   | Sí    | > 0                               | -          | ID del cliente                   |

**Renta**

| Campo          | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones            | Referencia       | Descripción               |
|----------------|-------------|--------|-----|-----|------|-------|--------------------------|------------------|---------------------------|
| FechaInicio    | DATE        | -      | No  | No  | No   | No    | >= CURRENT_DATE          | -                | Fecha inicio renta        |
| FechaTermino   | DATE        | -      | No  | No  | No   | No    | > FechaInicio            | -                | Fecha fin renta           |
| IdCliente      | INT         | -      | No  | Sí  | No   | No    | > 0                      | CLIENTS(IdCliente)| Cliente asociado          |
| IdVehiculo     | INT         | -      | No  | Sí  | No   | No    | > 0                      | Vehiculos(IdVehiculo)| Vehículo rentado        |
| IdRenta        | NVARCHAR    | 20     | Sí  | No  | No   | Sí    | -                        | -                | ID único de renta         |

**vehiculos**

| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones       | Referencia       | Descripción        |
|--------------|-------------|--------|-----|-----|------|-------|---------------------|------------------|--------------------|
| Placa        | NVARCHAR    | 20     | No  | No  | No   | Sí    | Formato válido      | -                | Placa del vehículo |
| Marca        | NVARCHAR    | 10     | No  | No  | No   | No    | Solo letras         | -                | Marca              |
| Modelo       | NVARCHAR    | 10     | No  | No  | No   | No    | Letras y números    | -                | Modelo             |
| Año          | DATE        | -      | No  | No  | No   | No    | <= CURRENT_DATE     | -                | Año fabricación    |
| IdVehiculo   | INT         | -      | Sí  | No  | No   | Sí    | > 0                  | -                | ID vehículo        |
| IdSucursal   | INT         | -      | No  | Sí  | No   | No    | > 0                  | SUCURSAL(IdSucursal)| Sucursal         |

**sucursal**

| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción |
|--------------|-------------|--------|-----|-----|------|-------|---------------|------------|-------------|
| NumSucursal  | INT         | -      | Sí  | No  | No   | Sí    | > 0           | -          | Número sucursal |
| Nombre       | NVARCHAR    | 20     | No  | No  | No   | No    | Solo letras   | -          | Nombre sucursal |
| Ubicacion    | NVARCHAR    | 40     | No  | No  | No   | No    | -             | -          | Ubicación   |
| IdSucursal   | INT         | -      | No  | No  | No   | Sí    | > 0           | -          | ID sucursal |
| IdVehiculo   | INT         | -      | No  | Sí  | No   | No    | > 0           | Vehiculos(IdVehiculo) | Vehículo |
