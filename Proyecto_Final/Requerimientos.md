#  Requerimientos del Sistema de Gestión para ciber


---

## 👥 Clientes

- Cada cliente debe estar registrado con su información básica:
  - Nombre
  - Teléfono
  - Correo electrónico
- A cada cliente se le asigna un identificador único (`IDcliente`).
- Un cliente puede:
  - Usar diferentes computadoras a lo largo del tiempo.
  - Realizar varias compras (ventas).
  - Contratar servicios adicionales.
- Se almacena el historial de sesiones por cliente:
  - Fecha
  - Hora de inicio y fin
  - Costo total


## 💻 Computadoras

- Cada computadora se registra con:
  - `NumerodeEquipo` (único)
  - Tipo: Escritorio o Laptop
  - Sistema Operativo
  - Estado: Disponible, Ocupada, Mantenimiento
- Una computadora puede ser utilizada muchas veces por diferentes clientes.


## 🕒 Uso de Computadora

- Por cada sesión se debe registrar:
  - `IDuso`
  - Cliente que la realizó (`IDcliente`)
  - Computadora utilizada (`IDcomputadora`)
  - Fecha
  - Hora de inicio y fin
  - Tiempo total
  - Costo total
- Relaciones:
  - Una computadora puede estar involucrada en múltiples sesiones.
  - Un cliente puede tener múltiples sesiones.


## 🧍‍♂️ Empleados

- Registro de empleados con:
  - `IdEmpleado` (clave primaria)
  - Nombre
  - Teléfono
  - Turno
  - Puesto
- Los empleados pueden:
  - Registrar ventas
  - Registrar servicios adicionales


## 🧾 Ventas

- Representan transacciones del sistema.
- Cada venta registra:
  - `IDventa`
  - Cliente (`CkientesID`)
  - Fecha de la venta
  - Medio de pago (efectivo, tarjeta, etc.)
  - Total
- Un empleado puede realizar múltiples ventas.
- Una venta puede incluir uno o más productos y/o servicios adicionales.


## 📦 Productos

- Productos a la venta (snacks, bebidas, etc.) con:
  - `IdProductos` (clave primaria)
  - Nombre
  - Precio
  - Stock
- Los productos están vinculados a las ventas a través de la tabla `DETALLEVENTA`.


## 🧾 Detalle de Venta

- Por cada venta se registra el detalle:
  - `IDventa`
  - `ProductosID`
  - Cantidad
  - Subtotal
- Al realizar una venta, se descuenta automáticamente del stock del producto.


## 🛠️ Servicios Adicionales

- Servicios como impresiones, escaneos, fotocopias, etc.
- Cada servicio tiene:
  - `Idservicios`
  - Nombre
  - Precio
- Relacionados con ventas a través de `DETALLEVENTA`.
- Registrados por empleados mediante la relación `REGISTRA`.




