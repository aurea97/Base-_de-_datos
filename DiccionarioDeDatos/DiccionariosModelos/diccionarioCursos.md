# 📘 Diccionario de Datos – Plantilla Cursos

**estudiante**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción |
|-----------------|-------------|--------|-----|-----|------|-------|---------------|------------|-------------|
| NumEstudiante   | INT         | -      | Sí  | No  | No   | Sí    | > 0           | -          | Número estudiante |
| Nombre         | NVARCHAR    | 50     | No  | No  | No   | No    | Solo letras   | -          | Nombre      |
| ApellidoPaterno| NVARCHAR    | 50     | No  | No  | No   | No    | Solo letras   | -          | Apellido paterno |
| ApellidoMaterno| NVARCHAR    | 50     | No  | No  | Sí   | No    | Solo letras   | -          | Apellido materno |
| Matricula      | NVARCHAR    | 50     | No  | No  | No   | Sí    | Alfanumérico  | -          | Matrícula   |

**curso**

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción |
|-------------|-------------|--------|-----|-----|------|-------|---------------|------------|-------------|
| NumCurso    | INT         | -      | Sí  | No  | No   | Sí    | > 0           | -          | Número curso |
| NombreCurso | NVARCHAR    | 30     | No  | No  | No   | No    | Solo letras   | -          | Nombre curso |
| CodigoCurso | INT         | -      | No  | No  | No   | Sí    | > 0           | -          | Código curso |

**inscripcion**

| Campo          | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia            | Descripción |
|----------------|-------------|--------|-----|-----|------|-------|---------------|-----------------------|-------------|
| NumEstudiante  | INT         | -      | Sí  | Sí  | No   | No    | > 0           | ESTUDIANTE(NumEstudiante) | Estudiante |
| NumCurso       | INT         | -      | Sí  | Sí  | No   | No    | > 0           | CURSO(NumCurso)       | Curso       |
| FechaInscripcion | DATE     | -      | No  | No  | No   | No    | >= CURRENT_DATE | -                   | Fecha inscripción |
