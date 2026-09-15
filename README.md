# TP ASP.NET Web Forms — TecnoSur S.A.

Trabajo práctico de la Unidad 2: **Web Forms con ADO.NET y DataSets**.
Sitio web de una distribuidora mayorista ficticia de equipamiento informático,
con catálogo de productos y registro de pedidos en línea.

**Alumno:** Matías G. Molina
**Profesor:** Ing. José Sabino de la Cruz

---

## Tecnologías

| | |
|---|---|
| Framework | ASP.NET Web Forms sobre .NET Framework 4.7.2 |
| Lenguaje | C# |
| Base de datos | SQL Server Express LocalDB (`TecnoSur.mdf` en `App_Data`) |
| Acceso a datos | ADO.NET — `SqlConnection`, `SqlCommand`, `SqlDataAdapter`, `SqlDataSource` |
| Estilos | Bootstrap 5 |
| IDE | Visual Studio 2026 |

---

## Cómo ejecutarlo

1. Clonar el repositorio.
2. Abrir `Tarea ASP.NET Web Forms.slnx` con Visual Studio.
3. Ejecutar con `Ctrl + F5`.

La base de datos (`TecnoSur.mdf` y `TecnoSur_log.ldf`) está versionada dentro de
`App_Data`, con las tablas creadas y datos de prueba cargados, así que **no hace
falta ejecutar ningún script**. La cadena de conexión apunta a LocalDB mediante
`|DataDirectory|`, por lo que funciona desde cualquier ruta.

Si fuera necesario recrear la base desde cero, el esquema completo y los datos
iniciales están en `Database/01-esquema-y-datos.sql`.

---

## Modelo de datos

```
Productos (1) ──────< (N) Pedidos
```

**Productos** — `IdProducto` (PK, IDENTITY), `Nombre`, `Descripcion`, `Precio` (NUMERIC 10,2), `Stock`

**Pedidos** — `IdPedido` (PK, IDENTITY), `NombreCliente`, `Email`, `Telefono`, `Direccion`,
`IdProducto` (FK → Productos), `Cantidad`, `FechaPedido` (DEFAULT GETDATE())

La relación es 1:N porque la consigna pide un producto por pedido. Un modelo real
sería N:M y requeriría una tabla intermedia `DetallePedido` con `Cantidad` y
`PrecioUnitario`.

---

## Resolución por punto de la consigna

**1. Habilitar Visual Studio para Web Forms (.NET Framework)**
Proyecto creado con la plantilla *ASP.NET Web Application (.NET Framework)*,
sub-plantilla **Web Forms**.

**2. Master Page con logo y navegación**
`Site.Master` con logo propio en SVG (`Images/logo.svg`), marca de la empresa,
navegación (Inicio / Productos / Nuevo pedido / Acerca de / Contacto) y pie de página.
`Default.aspx` con mensaje de bienvenida y `About.aspx` con los datos de la empresa.

**3. Base de datos en App_Data**
`TecnoSur.mdf` creada desde el Explorador de objetos de SQL Server, con las tablas
`Productos` y `Pedidos` (clave primaria, clave foránea, `IDENTITY` y `DEFAULT GETDATE()`)
y datos de prueba cargados.

**4. Listado de productos — ver / ordenar / buscar**
`Productos.aspx` con un **`GridView`** conectado mediante **`SqlDataSource`**.
Se eligió `GridView` (sucesor del `DataGrid` desde ASP.NET 2.0) porque resuelve el
ordenamiento y la paginación de forma declarativa con `AllowSorting` y `AllowPaging`.
La búsqueda por nombre usa `LIKE` con un `ControlParameter` enlazado al cuadro de texto.

**5. Alta de pedido**
`Pedido.aspx`. El `INSERT` se resolvió **por código en el evento del botón**, con
`SqlConnection`, `SqlCommand`, `SqlParameter` y `ExecuteNonQuery()`.
Validación en dos capas: controles `RequiredFieldValidator`, `RegularExpressionValidator`,
`RangeValidator` y `ValidationSummary` del lado del cliente, más la verificación de
`Page.IsValid` del lado del servidor antes de ejecutar el alta.
Todos los valores viajan como parámetros, nunca concatenados, para evitar inyección SQL.

---

## Estructura

```
Tarea ASP.NET Web Forms/
├── App_Data/           TecnoSur.mdf + log
├── Database/           Script de esquema y datos
├── Images/             Logo de la empresa
├── Site.Master         Página maestra
├── Default.aspx        Inicio (bienvenida)
├── About.aspx          Acerca de
├── Productos.aspx      Punto 4 — catálogo
├── Pedido.aspx         Punto 5 — alta de pedido
└── Web.config          Cadena de conexión
```
