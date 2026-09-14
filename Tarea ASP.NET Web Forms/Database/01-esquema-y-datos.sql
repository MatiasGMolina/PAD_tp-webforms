-- =====================================================================
-- TecnoSur S.A. - TP ASP.NET Web Forms
-- Esquema completo y datos iniciales
-- Motor: SQL Server Express LocalDB
-- Ejecutar sobre la base TecnoSur.mdf (carpeta App_Data)
-- =====================================================================

-- Se borran primero las tablas hijas, por las claves foraneas
IF OBJECT_ID('dbo.Pedidos', 'U') IS NOT NULL DROP TABLE dbo.Pedidos;
IF OBJECT_ID('dbo.Productos', 'U') IS NOT NULL DROP TABLE dbo.Productos;
GO

CREATE TABLE dbo.Productos
(
    IdProducto  INT             IDENTITY (1, 1) NOT NULL,
    Nombre      VARCHAR (100)   NOT NULL,
    Descripcion VARCHAR (250)   NULL,
    Precio      NUMERIC (10, 2) NOT NULL,
    Stock       INT             NOT NULL,
    CONSTRAINT PK_Productos PRIMARY KEY (IdProducto)
);
GO

CREATE TABLE dbo.Pedidos
(
    IdPedido      INT           IDENTITY (1, 1) NOT NULL,
    NombreCliente VARCHAR (100) NOT NULL,
    Email         VARCHAR (100) NOT NULL,
    Telefono      VARCHAR (30)  NULL,
    Direccion     VARCHAR (200) NULL,
    IdProducto    INT           NOT NULL,
    Cantidad      INT           NOT NULL,
    FechaPedido   DATETIME      NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_Pedidos PRIMARY KEY (IdPedido),
    CONSTRAINT FK_Pedidos_Productos FOREIGN KEY (IdProducto)
        REFERENCES dbo.Productos (IdProducto)
);
GO

INSERT INTO dbo.Productos (Nombre, Descripcion, Precio, Stock) VALUES
('Notebook Lenovo IdeaPad 3',  'Ryzen 5, 16 GB RAM, SSD 512 GB',        950000.00, 12),
('Monitor Samsung 24"',        'Full HD 1920x1080, 75 Hz, HDMI',        185000.00, 25),
('Teclado mecanico Redragon',  'Switches azules, retroiluminado RGB',    48500.00, 40),
('Mouse inalambrico Logitech', 'M280, 1000 DPI, receptor USB',           21900.00, 60),
('Disco SSD Kingston 480 GB',  'SATA III, 500 MB/s lectura',             52000.00, 30),
('Router TP-Link Archer C6',   'Doble banda AC1200, 4 antenas',          67800.00, 18),
('Impresora Epson L3250',      'Multifuncion, sistema continuo, WiFi',  415000.00,  7),
('Auriculares HyperX Cloud',   'Over-ear con microfono, 3.5 mm',        112000.00, 15);
GO

INSERT INTO dbo.Pedidos (NombreCliente, Email, Telefono, Direccion, IdProducto, Cantidad) VALUES
('Laura Gimenez', 'laura.gimenez@ejemplo.com', '3875551234', 'Caseros 850, Salta',   1, 1),
('Carlos Ruiz',   'cruiz@ejemplo.com',         '3874449876', 'Alvarado 1200, Salta', 3, 2);
GO
