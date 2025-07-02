# 📘 Diccionario de Datos – Plantilla Hospital

**Doctor**

| Campo             | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones                     | Referencia | Descripción                      |
|-------------------|-------------|--------|-----|-----|------|-------|-----------------------------------|------------|----------------------------------|
| Cedula            | INT         | -      | Sí  | No  | No   | Sí    | > 0                               | -          | Cédula profesional               |
| Especialidad      | NVARCHAR    | 30     | No  | No  | No   | No    | Solo letras                       | -          | Especialidad médica              |
| Nombre            | VARCHAR     | 10     | No  | No  | No   | No    | Solo letras                       | -          | Nombre del doctor                |
| ApellidoPaterno   | VARCHAR     | 10     | No  | No  | No   | No    | Solo letras                       | -          | Apellido paterno                 |
| ApellidoMaterno   | NVARCHAR    | 10     | No  | No  | Sí   | No    | Solo letras                       | -          | Apellido materno                 |

**paciente**

| Campo             | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones                     | Referencia | Descripción                      |
|-------------------|-------------|--------|-----|-----|------|-------|-----------------------------------|------------|----------------------------------|
| IdPaciente        | NVARCHAR    | 30     | Sí  | No  | No   | Sí    | -                                 | -          | Identificador único              |
| Nombre            | NVARCHAR    | 10     | No  | No  | No   | No    | Solo letras                       | -          | Nombre del paciente              |
| ApellidoPaterno   | NVARCHAR    | 10     | No  | No  | No   | No    | Solo letras                       | -          | Apellido paterno                 |
| ApellidoMaterno   | NVARCHAR    | 10     | No  | No  | Sí   | No    | Solo letras                       | -          | Apellido materno                 |
| Sintomas          | NVARCHAR    | 50     | No  | No  | No   | No    | -                                 | -          | Síntomas del paciente            |

**atiende**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones                     | Referencia          | Descripción               |
|-----------------|-------------|--------|-----|-----|------|-------|-----------------------------------|---------------------|---------------------------|
| FechaAtencion   | DATE        | -      | No  | No  | No   | No    | <= CURRENT_DATE                   | -                   | Fecha de atención         |
| Diagnostico     | NVARCHAR    | 50     | No  | No  | No   | No    | -                                 | -                   | Diagnóstico médico        |
| NombrePaciente  | NVARCHAR    | 10     | No  | No  | No   | No    | Solo letras                       | -                   | Nombre del paciente       |
| Cedula          | INT         | -      | No  | Sí  | No   | No    | > 0                               | DOCTOR(Cedula)      | Doctor que atendió        |
| IdPaciente      | NVARCHAR    | 20     | No  | Sí  | No   | No    | -                                 | PACIENTE(IdPaciente)| Paciente atendido         
