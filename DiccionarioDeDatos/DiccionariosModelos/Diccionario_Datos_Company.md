
# Diccionario de Datos - Ejercicio 5: COMPANY

**EMPLOYEE**

| Campo     | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones          | Referencia | Descripción                       |
|-----------|--------------|--------|-----|-----|------|--------|-------------------------|------------|-----------------------------------|
| SSN       | CHAR         | 9      | Sí  |     | No   | Sí     |                        |            | Número de Seguro Social           |
| FirstName | VARCHAR      | 50     |     |     | No   |        |                        |            | Nombre del empleado               |
| LastName  | VARCHAR      | 50     |     |     | No   |        |                        |            | Apellido del empleado             |
| Address   | VARCHAR      | 100    |     |     | No   |        |                        |            | Dirección del empleado            |
| Salary    | DECIMAL      | 10,2   |     |     | No   |        |                        |            | Salario del empleado              |
| Sex       | CHAR         | 1      |     |     | No   |        | [M,F]                  |            | Sexo del empleado                 |

**DEPARTMENT**

| Campo   | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción           |
|---------|--------------|--------|-----|-----|------|--------|----------------|------------|-----------------------|
| Number  | INT          |        | Sí  |     | No   | Sí     |                |            | ID del departamento   |
| Name    | VARCHAR      | 50     |     |     | No   | Sí     |                |            | Nombre del departamento |
| Location| VARCHAR      | 100    |     |     | No   |        |                |            | Ubicación principal   |

**PROJECT**

| Campo   | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción         |
|---------|--------------|--------|-----|-----|------|--------|----------------|------------|---------------------|
| Number  | INT          |        | Sí  |     | No   | Sí     |                |            | ID del proyecto     |
| Name    | VARCHAR      | 50     |     |     | No   |        |                |            | Nombre del proyecto |
| Location| VARCHAR      | 100    |     |     | No   |        |                |            | Ubicación del proyecto |

**DEPENDENT**

| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción              |
|--------------|--------------|--------|-----|-----|------|--------|----------------|------------|--------------------------|
| Name         | VARCHAR      | 50     | Sí  |     | No   |        |                |            | Nombre del dependiente   |
| Sex          | CHAR         | 1      |     |     | No   |        | [M,F]          |            | Sexo del dependiente     |
| BirthDay     | DATE         |        |     |     | No   |        |                |            | Fecha de nacimiento      |
| RelationShip | VARCHAR      | 30     |     |     | No   |        |                |            | Relación con el empleado |
| SSN_Employee | CHAR         | 9      |     | Sí  | No   |        |                | EMPLOYEE   | Empleado relacionado     |

**WORKS_FOR**

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia  | Descripción                 |
|-------------|--------------|--------|-----|-----|------|--------|----------------|-------------|-----------------------------|
| SSN         | CHAR         | 9      | Sí  | Sí  | No   |        |                | EMPLOYEE    | Empleado que trabaja para  |
| DeptNumber  | INT          |        | Sí  | Sí  | No   |        |                | DEPARTMENT  | Departamento asignado      |

**WORKS_ON**

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción                  |
|-------------|--------------|--------|-----|-----|------|--------|----------------|------------|------------------------------|
| SSN         | CHAR         | 9      | Sí  | Sí  | No   |        |                | EMPLOYEE   | Empleado involucrado        |
| ProjNumber  | INT          |        | Sí  | Sí  | No   |        |                | PROJECT    | Proyecto en el que trabaja  |
| Hours       | DECIMAL      | 5,2    |     |     | No   |        | >= 0           |            | Horas asignadas             |

**CONTROLS**

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia  | Descripción                    |
|-------------|--------------|--------|-----|-----|------|--------|--------------|-------------|--------------------------------|
| DeptNumber  | INT          | Sí  | Sí  | No   |        |        |              | DEPARTMENT  | Departamento que controla     |
| ProjNumber  | INT          | Sí  | Sí  | No   |        |        |              | PROJECT     | Proyecto controlado           |

**SUPERVISION**

| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción                  |
|--------------|--------------|--------|-----|-----|------|--------|----------------|------------|------------------------------|
| SupervisorSSN| CHAR         | 9      | Sí  | Sí  | No   |        |                | EMPLOYEE   | Supervisor                   |
| SubordinateSSN | CHAR       | 9      | Sí  | Sí  | No   |        |                | EMPLOYEE   | Empleado supervisado        |

**MANAGES**

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia  | Descripción                |
|-------------|--------------|--------|-----|-----|------|--------|----------------|-------------|----------------------------|
| SSN         | CHAR         | 9      | Sí  | Sí  | No   |        |                | EMPLOYEE    | Gerente del departamento   |
| DeptNumber  | INT          | Sí     | Sí  | No  |      |        |                | DEPARTMENT  | Departamento administrado  |
| StartDay    | DATE         |        |     |     | No   |        |                |             | Fecha de inicio de gestión |
