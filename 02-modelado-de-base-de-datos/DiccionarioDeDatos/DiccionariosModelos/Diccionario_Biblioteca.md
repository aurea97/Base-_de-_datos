# 📘 Diccionario de Datos – Plantilla Biblioteca

**Libro**

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción |
|---------------|-------------|--------|-----|-----|------|-------|---------------|------------|-------------|
| Autor        | NVARCHAR    | 20     | No  | No  | No   | No    | Solo letras   | -          | Autor       |
| Titulo       | NVARCHAR    | 30     | No  | No  | No   | No    | -             | -          | Título      |
| CantidadLibro| VARCHAR     | 10     | No  | No  | No   | No    | Solo números  | -          | Cantidad    |
| NumeroISBN   | VARCHAR     | -      | No  | No  | No   | Sí    | Formato ISBN  | -          | ISBN        |
| NumLibro     | INT         | -      | Sí  | No  | No   | Sí    | > 0           | -          | ID libro    |

**presta**

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia      | Descripción |
|-------------|-------------|--------|-----|-----|------|-------|---------------|-----------------|-------------|
| IdPresta    | INT         | -      | Sí  | No  | No   | Sí    | > 0           | -               | ID préstamo |
| NumLibro    | INT         | -      | No  | Sí  | No   | No    | > 0           | Libro(NumLibro) | Libro       |
| NumLector   | INT         | -      | No  | Sí  | No   | No    | > 0           | LECTOR(NumLector) | Lector     |
| Titulo      | NVARCHAR    | 30     | No  | No  | No   | No    | -             | -               | Título      |
| Autor       | NVARCHAR    | 20     | No  | No  | No   | No    | Solo letras   | -               | Autor       |
| NombreLector| NVARCHAR    | 20     | No  | No  | No   | No    | Solo letras   | -               | Nombre lector |

**lector**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción |
|-----------------|-------------|--------|-----|-----|------|-------|---------------|------------|-------------|
| NumLector       | INT         | -      | Sí  | No  | No   | Sí    | > 0           | -          | ID lector   |
| NumMembresia    | NVARCHAR    | 30     | No  | No  | No   | Sí    | Alfanumérico  | -          | Membresía   |
| Nombre          | NVARCHAR    | 10     | No  | No  | No   | No    | Solo letras   | -          | Nombre      |
| ApellidoPaterno | NVARCHAR    | 10     | No  | No  | No   | No    | Solo letras   | -          | Apellido paterno |
| ApellidoMaterno | NVARCHAR    | 10     | No  | No  | Sí   | No    | Solo letras   | -          | Apellido materno |
