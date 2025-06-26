**Tabla cliente**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumCliente`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                        | -                                | Identificador del cliente               |
| `Nombre`        |N VARCHAR      | 20  | ❌  | ❌  | ❌   | -     | Solo letras A-Z, longitud >= 3             | -                                | Nombre completo del cliente  
Apellido1           |NVarchar     20     | ❌  | ❌  | ❌   |                      -                                    
apellido2            NVarchar      20      | ❌  | ❌  | ❌   |
| `Edad`          | INT          | -      | ❌  | ❌  | ❌   | ❌     | CHECK (Edad >= 18 AND Edad <= 120)         | -                                | Edad del cliente                        |
| `Correo`        | VARCHAR      | 150    | ❌  | ❌  | ❌   | ✅     | Formato de correo válido                   | -                                | Correo electrónico                      |
| `IdCiudad`      | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                        | Ciudades(IdCiudad)               | Ciudad a la que pertenece el cliente    |
