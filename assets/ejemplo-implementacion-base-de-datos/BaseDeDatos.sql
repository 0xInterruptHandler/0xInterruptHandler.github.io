 
xp_create_subdir 'E:\HotelData'
go
xp_create_subdir 'E:\HotelReports'
go
xp_create_subdir 'E:\HotelLogs'
go
 
Create database BDHotel
    ON PRIMARY
    (
	name	   = 'HotelReservas', 
	filename   = 'E:\HotelData\HotelReservas.mdf',
	Size	   = 50MB, MaxSize = 30GB, 
	Filegrowth = 100MB
	),
    (
	name       = 'HotelClientes', 
	filename   = 'E:\HotelData\HotelClientes.ndf',
	Size       = 50MB, 
	MaxSize    = 30GB, 
	Filegrowth = 100MB
	),
    FILEGROUP HOSPEDAJE
    (
	name       = 'HotelHabitaciones', 
	filename   = 'E:\HotelReports\HotelHabitaciones.ndf',
	Size       = 30MB, 
	MaxSize    = 80GB, 
	Filegrowth = 100MB
	),
    (
	name       = 'HotelServicios', 
	filename   = 'E:\HotelLogs\HotelServicios.ndf',
	Size       = 80MB, 
	Filegrowth = 100MB
	),
    FILEGROUP RECURSOS_HUMANOS
    (
	name       = 'HotelRRHH', 
	filename   = 'E:\HotelReports\HotelRRHH.ndf',
	Size       = 30MB, 
	MaxSize    = 80GB, 
	Filegrowth = 100MB
	),
    (
	name       = 'HotelRRHH_Archivos', 
	filename   = 'E:\HotelLogs\HotelRRHH_Archivos.ndf',
	Size       = 80MB, 
	Filegrowth = 100MB
	)
LOG ON
    (
	name       = 'HotelLog', 
	filename   = 'E:\HotelLogs\HotelLog.ldf',
	Size       = 80MB, 
	Filegrowth = 100MB
	)
 GO
USE BDHotel
GO



if not exists (select * from sys.schemas where name = 'Empresa')  
Begin  
Execute('CREATE SCHEMA Empresa')  
End  
GO

IF NOT EXISTS (SELECT * FROM Sys.Schemas WHERE name = 'Seguridad')
BEGIN
EXECUTE('CREATE SCHEMA Seguridad')
END
GO

IF NOT EXISTS (SELECT * FROM SYS.SCHEMAS WHERE name = 'Personal')
BEGIN
EXECUTE('CREATE SCHEMA Personal')
END
GO

IF NOT EXISTS (SELECT * FROM SYS.SCHEMAS WHERE name = 'Ventas')
BEGIN
EXECUTE('CREATE SCHEMA Ventas')
END 
GO

IF NOT EXISTS (SELECT * FROM SYS.SCHEMAS WHERE name = 'Identificacion')
BEGIN
EXECUTE('CREATE SCHEMA Identificacion')
END
GO
 

CREATE TABLE Empresa.EmpresaHotelera (
	EmpresaHoteleraCodigo nchar(4),


	EmpresaRUC nchar(11),
	EmpresaRazonSocial nvarchar(100),
 
	EmpresaDireccion nvarchar(100),
	EmpresaWeb nvarchar(80),
	EmpresaRepresentante nvarchar(60),
	EmpresaCargoRepresentante nvarchar(60),
    EmpresaTelefonoCentral nvarchar(80),

	CONSTRAINT EmpresaHoteleraPK PRIMARY KEY(EmpresaHoteleraCodigo)
) 
GO
 
CREATE TABLE Empresa.Sucursal (
    
    SucursalCodigo nchar(4),
	SucursalEmpresaHoteleraCodigo nchar(4)  DEFAULT 1, --SOLO SE PERMITIRÁ UN HOTEL

    SucursalNombre nvarchar(255),
    SucursalCiudad nvarchar(255),
    SucursalDistrito nvarchar(255),
    SucursalDireccion nvarchar(255),
    SucursalTelefono nvarchar(255),
	SucursalEstado  nchar(1) constraint SucursalEstadoDF Default 'A',

	CONSTRAINT SucursalPK PRIMARY KEY(SucursalCodigo),

    CONSTRAINT SucursalEmpresaHoteleraFK FOREIGN KEY (SucursalEmpresaHoteleraCodigo) 
		REFERENCES Empresa.EmpresaHotelera(EmpresaHoteleraCodigo) 
) 
GO
 
CREATE TABLE Empresa.TipoHabitacion (
    TipoHabitacionCodigo nchar(4),

    TipoHabitacionTipo nvarchar(255),
    TipoHabitacionCapacidad INT,
    TipoHabitacionDescripcion nvarchar(255),
    TipoHabitacionPrecio DECIMAL(10, 2),
	TipoHabitacionEstado nchar(1) constraint TipoHabitacionEstadoDF Default 'A',

	CONSTRAINT TipoHabitacionPK PRIMARY KEY(TipoHabitacionCodigo)
) 
 
 
CREATE TABLE Empresa.Habitaciones (
    
    HabitacionesCodigo nchar(4),
	HabitacionesTipoHabitacionCodigo nchar(4),
	HabitacionesSucursalCodigo nchar(4),

    HabitacionesPiso INT,
    HabitacionesPuerta INT, --  Piso 1 : 100 101 102 Piso2 : 201 202 203 Piso 3: 301 302 303
	HabitacionesEstado  nchar(1) constraint HabitacionesEstadoDF Default 'A',
	CONSTRAINT HabitacionesSucursalPisoPuertaUQ UNIQUE (HabitacionesSucursalCodigo, HabitacionesPiso, HabitacionesPuerta),


    CONSTRAINT HabitacionesPK PRIMARY KEY(HabitacionesCodigo),
	
	CONSTRAINT HabitacionesEstadoCK CHECK (HabitacionesEstado = 'A' or HabitacionesEstado = 'O'),
 
	CONSTRAINT HabitacionesSucursalFK FOREIGN KEY (HabitacionesSucursalCodigo) 
		REFERENCES Empresa.Sucursal (SucursalCodigo) ON UPDATE CASCADE,
    CONSTRAINT HabitacionesTipoHabitacionFK FOREIGN KEY (HabitacionesTipoHabitacionCodigo) 
		REFERENCES Empresa.TipoHabitacion (TipoHabitacionCodigo),

) 
GO
  
CREATE TABLE Empresa.Cargos (
    CargosCodigo nchar(4),
    CargosNombre VARCHAR(255),
    CargosDescripcion VARCHAR(255),
	CargosEstado  nchar(1) constraint CargosEstadoDF Default 'A', -- Cargo Activo (A) o Eliminado (E)
	CONSTRAINT CargosEstadoCK CHECK (CargosEstado = 'A' or CargosEstado = 'E'),
	CONSTRAINT CargosPK PRIMARY KEY(CargosCodigo)
) 
GO
 
CREATE TABLE Identificacion.Pais
(
    PaisCodigo NCHAR(3) PRIMARY KEY,      -- Código del país (ej. 'PE' para Perú, 'US' para Estados Unidos)
	PaisNombre NVARCHAR(100) NOT NULL,    -- Nombre del país (ej. 'Perú', 'Estados Unidos')
    PaisRegion NVARCHAR(50)               -- Región geográfica (opcional)
)
GO

 
CREATE TABLE Identificacion.TipoDocumento
(
    TipoDocumentoCodigo NCHAR(19),                     -- Código del tipo de documento
    TipoDocumentoPaisCodigo NCHAR(3),                 -- Código del país (relacionado con la tabla Pais)
	TipoDocumentoDescripcion NVARCHAR(100) NOT NULL,  -- Descripción del tipo de documento (ej. 'DNI', 'Pasaporte')
	CONSTRAINT TipoDocumentoPK PRIMARY KEY (TipoDocumentoCodigo),
    CONSTRAINT TipoDocumentoPaisFK FOREIGN KEY (TipoDocumentoPaisCodigo)
        REFERENCES Identificacion.Pais (PaisCodigo)
)
GO
 
 

CREATE TABLE Personal.Empleados
	(
	EmpleadosCodigo nchar(4),
	EmpleadosTipoDocumentoCodigo nchar(19),
	EmpleadosPaisCodigo nchar(3),
 	EmpleadosSucursalCodigo nchar(4),
    EmpleadosCargosCodigo nchar(4),
	EmpleadosCelular nvarchar(255),
	EmpleadosNumeroDocumento NVARCHAR(10) not null,  
	EmpleadosPaterno nvarchar(80) not null, 
	EmpleadosMaterno nvarchar(80) not null, 
	EmpleadosNombres nvarchar(80) not null, 
	EmpleadosNombreCompleto As Upper(concat_ws(Space(1),EmpleadosPaterno, EmpleadosMaterno,EmpleadosNombres)),  
		EmpleadosFechaNacimiento Date constraint EmpleadosFechaNacimientoDF Default GetDate(),
	EmpleadosAnios AS
		iif(Dateadd(YEAR,Datediff(YEAR, EmpleadosFechaNacimiento,GetDate()),EmpleadosFechaNacimiento)> GetDate(),
		Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())-1,
		Datediff(YEAR, EmpleadosFechaNacimiento,GetDate()))	,
	EmpleadosMeses As
		iif (
		DateAdd (
			MONTH,
			DateDiff(MONTH,
				Dateadd(YEAR,
					iif(Dateadd(YEAR,Datediff(YEAR, EmpleadosFechaNacimiento,GetDate()),EmpleadosFechaNacimiento)> GetDate(),
						Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())-1,
						Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())),
					EmpleadosFechaNacimiento)
			, GetDate()), --  Cantidad de meses 
			Dateadd(
			YEAR,
				iif(Dateadd(YEAR,Datediff(YEAR, EmpleadosFechaNacimiento,GetDate()),EmpleadosFechaNacimiento)> GetDate(),
				Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())-1,
				Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())),	
			EmpleadosFechaNacimiento)) > GetDate(),
			DateDiff(MONTH,
				Dateadd(YEAR,
					iif(Dateadd(YEAR,Datediff(YEAR, EmpleadosFechaNacimiento,GetDate()),EmpleadosFechaNacimiento)> GetDate(),
						Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())-1,
						Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())),
					EmpleadosFechaNacimiento)
			, GetDate()) -1,
			DateDiff(MONTH,
				Dateadd(YEAR,
					iif(Dateadd(YEAR,Datediff(YEAR, EmpleadosFechaNacimiento,GetDate()),EmpleadosFechaNacimiento)> GetDate(),
						Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())-1,
						Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())),
					EmpleadosFechaNacimiento)
			, GetDate()))
		,
	EmpleadosDias As
		DateDiff(DAY,
			(DateAdd ( MONTH, iif ( DateAdd ( MONTH, DateDiff(MONTH, Dateadd(YEAR,
					iif(Dateadd(YEAR,Datediff(YEAR, EmpleadosFechaNacimiento,GetDate()),EmpleadosFechaNacimiento)> GetDate(),
						Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())-1,
						Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())),EmpleadosFechaNacimiento) , GetDate()), --  Cantidad de meses 
			Dateadd( YEAR, 
				iif(Dateadd(YEAR,Datediff(YEAR, EmpleadosFechaNacimiento,GetDate()),EmpleadosFechaNacimiento)> GetDate(),
				Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())-1,
				Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())),	 EmpleadosFechaNacimiento)) > GetDate(),
			DateDiff(MONTH, Dateadd(YEAR,
					iif(Dateadd(YEAR,Datediff(YEAR, EmpleadosFechaNacimiento,GetDate()),EmpleadosFechaNacimiento)> GetDate(),
						Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())-1,
						Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())), EmpleadosFechaNacimiento) , GetDate()) -1,
			DateDiff(MONTH, Dateadd(YEAR,
					iif(Dateadd(YEAR,Datediff(YEAR, EmpleadosFechaNacimiento,GetDate()),EmpleadosFechaNacimiento)> GetDate(),
						Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())-1,
						Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())), EmpleadosFechaNacimiento) , GetDate())) ,
			( DateAdd(YEAR,
				iif(Dateadd(YEAR,Datediff(YEAR, EmpleadosFechaNacimiento,GetDate()),EmpleadosFechaNacimiento)> GetDate(),
				Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())-1,
				Datediff(YEAR, EmpleadosFechaNacimiento,GetDate())) ,EmpleadosFechaNacimiento) )  )), GetDate()),
	EmpleadosDireccion nvarchar(100), 
	EmpleadosSexo nchar(1), 
	EmpleadosEstadoCivil nchar(1), 
	EmpleadosEstado nchar(1) constraint EmpleadosEstadoDF Default 'A',
		CONSTRAINT EmpleadosEstadoCK CHECK (EmpleadosEstado = 'A' or EmpleadosEstado = 'E'),
	CONSTRAINT EmpleadosEstadoCivilCK CHECK (EmpleadosEstadoCivil = 'S' or EmpleadosEstadoCivil = 'C'),


	CONSTRAINT EmpleadosPK PRIMARY KEY (EmpleadosCodigo),

    CONSTRAINT EmpleadosCargosFK FOREIGN KEY (EmpleadosCargosCodigo) 
		REFERENCES Empresa.Cargos(CargosCodigo),
 	CONSTRAINT EmpleadosTipoDocumentoFK FOREIGN KEY (EmpleadosTipoDocumentoCodigo)
		REFERENCES  Identificacion.TipoDocumento(TipoDocumentoCodigo),
	CONSTRAINT EmpleadosPaisFK FOREIGN KEY (EmpleadosPaisCodigo)
		REFERENCES Identificacion.Pais(PaisCodigo),
    CONSTRAINT EmpleadosSucursalFK FOREIGN KEY (EmpleadosSucursalCodigo) 
		REFERENCES Empresa.Sucursal (SucursalCodigo) ON UPDATE CASCADE ON DELETE CASCADE,
)
GO
 
 
 Create table Seguridad.Usuarios
	(
	UsuariosCodigo nchar(4),
	UsuariosEmpleadosCodigo nchar(4),
	UsuariosPassword varbinary(200),
	UsuariosEstado nchar(1) constraint UsuariosEstadoDF Default 'A',
	constraint UsuariosEstadoCK Check (UsuariosEstado = 'A' or UsuariosEstado = 'E'),

	constraint UsuariosPK Primary key (UsuariosCodigo),

	constraint UsuariosEmpleadosFK Foreign key (UsuariosEmpleadosCodigo)
		references  Personal.Empleados(EmpleadosCodigo)
	)
go




CREATE TABLE Ventas.Clientes (
	ClientesCodigo nchar(5),
	ClientesRUC nchar(11),
	ClientesRazonSocial nvarchar(100) not null ,
	ClientesNumeroDocumento NVARCHAR(10) not null,  

	ClientesTipoDocumentoCodigo nchar(19),
	ClientesPaisCodigo nchar(3),


 
	ClientesFechaRegistro Date constraint ClientesFechaCreacionDF Default GetDate(),
    ClientesNombre nvarchar(255),
    ClientesApellidoPaterno nvarchar(255),
	ClientesApellidoMaterno nvarchar(255),
	ClientesNombreCompleto As Upper(concat_ws(Space(1),ClientesApellidoPaterno, ClientesApellidoMaterno,ClientesNombre)),
    ClientesCelular nvarchar(255),
	ClientesEstado nchar(1) constraint ClientesEstadoDF Default 'A',


	constraint ClientesEstadoCK Check (ClientesEstado = 'A' or ClientesEstado = 'E'),
	constraint ClientesDescripcionUQ Unique (ClientesRazonSocial),
	CONSTRAINT ClientesTipoDocumentoCodigoK FOREIGN KEY (ClientesTipoDocumentoCodigo)
		REFERENCES  Identificacion.TipoDocumento(TipoDocumentoCodigo),
	CONSTRAINT ClientesPaisFK FOREIGN KEY (ClientesPaisCodigo)
		REFERENCES Identificacion.Pais(PaisCodigo),
	CONSTRAINT ClientesPK PRIMARY KEY (ClientesCodigo),
)
GO


CREATE TABLE Ventas.Reserva (
	-- identificaciones
    ReservaCodigo NCHAR(4),                        -- Código único de la reserva
    ReservaClientesCodigo NCHAR(5),                 -- Código del cliente (clave foránea)
    ReservaEmpleadosCodigo NCHAR(4),                -- Código del empleado que gestionó la reserva (clave foránea)
    ReservaHabitacionesCodigo NCHAR(4),            -- Código de la habitación reservada (clave foránea)

	-- informacion
	TipoPago VARCHAR(50),                           -- Tipo de pago: Efectivo, Tarjeta, Transferencia, etc.
    Observaciones NVARCHAR(255),                    -- Observaciones o notas adicionales sobre la reserva
    FechaCreacion DATETIME DEFAULT GETDATE(),       -- Fecha de creación de la reserva (por defecto es la fecha actual)
    FechaModificacion DATETIME DEFAULT GETDATE(),   -- Fecha de la última modificación


	-- esencial en la funcionalidad
    MontoTotal DECIMAL(11,2),                       -- Monto total de la reserva
	ReservaMontoPagadoActualmente DECIMAL(11,2),   -- Monto pagado hasta el momento
    ReservaFechaInicio DATE,                              -- Fecha de inicio de la reserva
    ReservaFechaFin DATE,                                 -- Fecha de fin de la reserva
    ReservaEstado VARCHAR(255) DEFAULT 'Activo',    -- Estado de la reserva: Activo, Terminado, Cancelado, etc.
	/*
	Caso en el que pide por ejemplo 4 dias y luego se queda 3 y el monto total ya no corresponde.
	solucion:
	1. Actualizar la fecha de fin
	2. Con lo anterior, actualizar a su vez el monto total
	3. Cuando el huesped indica check out, ahi recien se realiza el pago.
	*/
 
    CONSTRAINT ReservaPK PRIMARY KEY (ReservaCodigo),
    constraint ReservaEstadoCK Check (ReservaEstado = 'Activo' or ReservaEstado = 'Terminado'),
	
	CONSTRAINT ReservaHabitacionesCodigoFK FOREIGN KEY (ReservaHabitacionesCodigo) 
        REFERENCES Empresa.Habitaciones (HabitacionesCodigo),
    CONSTRAINT ReservaEmpleadosFK FOREIGN KEY (ReservaEmpleadosCodigo) 
        REFERENCES Personal.Empleados (EmpleadosCodigo) ON UPDATE CASCADE,
    CONSTRAINT ReservaClientesFK FOREIGN KEY (ReservaClientesCodigo) 
        REFERENCES Ventas.Clientes (ClientesCodigo) ON UPDATE CASCADE ON DELETE SET NULL
) 
GO


CREATE TABLE Empresa.Servicios
(
	-- identificadores
    ServiciosCodigo nchar(10)  ,
	ServiciosCargosCodigo nchar(4),                 -- Código de cargo relacionado con el servicio
	
	-- informacion
    ServiciosDescripcion nvarchar(100) NOT NULL,   -- Descripción del servicio

	-- Esencial en funcionalidad
    ServiciosPrecioVenta numeric(9, 2) NOT NULL,    -- Precio de la venta del servicio
	ServiciosEstado nchar(1) constraint ServiciosEstadoDF Default 'A',
	

	constraint ServiciosEstadoCK Check (ServiciosEstado = 'A' or ServiciosEstado = 'E'), 
	CONSTRAINT ServiciosPK PRIMARY KEY(ServiciosCodigo),
	CONSTRAINT ServiciosCargosFK FOREIGN KEY (ServiciosCargosCodigo) 
		REFERENCES Empresa.Cargos(CargosCodigo)
) 
GO

Create table  Ventas.Categorias
(
	CategoriasCodigo nchar(5),
 
	CategoriasNombre NVARCHAR(50) NOT NULL UNIQUE,
	CategoriasDescripcion nvarchar(100) not null ,
	CategoriasFechaCreacion Date constraint CategoriasFechaCreacionDF Default GetDate(),
	CategoriasEstado nchar(1) constraint CategoriasEstadoDF Default 'A',

	constraint CategoriasDescripcionUQ Unique (CategoriasDescripcion),
	constraint CategoriasFechaCreacionCK Check (CategoriasFechaCreacion<= GetDate()),
	constraint CategoriasEstadoCK Check (CategoriasEstado = 'A' or CategoriasEstado = 'E'),
	CONSTRAINT CategoriasPK Primary key (CategoriasCodigo)
)
GO

CREATE TABLE Ventas.Productos (
    -- identificacion
    ProductosCodigo NCHAR(5),
    ProductosCategoriasCodigo nchar(5),

    -- informacion
    ProductosNombre NVARCHAR(100) NOT NULL UNIQUE,
    ProductosDescripcion nvarchar(80) NOT NULL,
    ProductosFechaCreacion DATE CONSTRAINT ProductosFechaCreacionDF DEFAULT GETDATE(),
    ProductosFechaVencimiento DATE CONSTRAINT ProductosFechaVencimientoDF DEFAULT GETDATE(), -- Cambio aquí
    ProductosEstado nchar(1) CONSTRAINT ProductosEstadoDF DEFAULT 'A', 

    -- esencial para la funcionalidad
    ProductosStock NUMERIC(9, 2) CONSTRAINT ProductosStockDF DEFAULT 0,
    ProductosPrecioVenta NUMERIC(9, 2) CONSTRAINT ProductosPrecioDF DEFAULT 0,
    ProductosPrecioCompra NUMERIC(9, 2) CONSTRAINT ProductosCompraDF DEFAULT 0,

    CONSTRAINT ProductosPrecioCK CHECK (ProductosPrecioVenta >= 0),
    CONSTRAINT ProductosFechaCreacionCK CHECK (ProductosFechaCreacion <= GETDATE()), 
    CONSTRAINT ProductosEstadoCK CHECK (ProductosEstado = 'A' OR ProductosEstado = 'E' OR ProductosEstado = 'D'), 
    CONSTRAINT ProductosStockCK CHECK (ProductosStock >= 0),
    CONSTRAINT ProductosDescripcionUQ UNIQUE (ProductosDescripcion),
    CONSTRAINT ProductosPK PRIMARY KEY (ProductosCodigo),
    CONSTRAINT ProductosCategoriasFK FOREIGN KEY (ProductosCategoriasCodigo)
        REFERENCES Ventas.Categorias(CategoriasCodigo)
)
GO


CREATE TABLE Ventas.Proveedor (
    ProveedorCodigo  NCHAR(5),  -- Identificador único para el proveedor
    ProveedorRUC nchar(11),
    ProveedorRazonSocial nvarchar(100),
    ProveedorNombre NVARCHAR(100) NOT NULL,  -- Nombre del proveedor
    ProveedorTipoDocumento NVARCHAR(20) NULL,  -- Tipo de documento (por ejemplo, RUC, DNI)
    ProveedorNumeroDocumento NVARCHAR(20) NOT NULL,  -- Número de documento (por ejemplo, RUC, DNI)
    ProveedorDireccion NVARCHAR(100) NULL,  -- Dirección del proveedor
    ProveedorTelefono NVARCHAR(20) NULL,  -- Teléfono del proveedor
    ProveedorEmail NVARCHAR(50) NULL,  -- Correo electrónico del proveedor
    ProveedorWeb NVARCHAR(50) NULL,
    ProveedorEstado nchar(1) CONSTRAINT ProveedorEstadoDF DEFAULT 'A', -- (A) activo o (E) Eliminado
    CONSTRAINT ProveedorEstadoCK CHECK (ProveedorEstado = 'A' or ProveedorEstado = 'E'),
    CONSTRAINT ProveedorCodigoPK PRIMARY KEY(ProveedorCodigo)
)
GO

CREATE TABLE Ventas.IngresoProductos (
    IngresoProductosCodigo NCHAR(5),
    IngresoProductosProveedorCodigo NCHAR(5),
    IngresoProductosTipoComprobante NVARCHAR(20) NOT NULL DEFAULT 'Factura',
    IngresoProductosFecha DATETIME NOT NULL,
    IngresoProductosImpuesto DECIMAL(4,2) NOT NULL,
    CONSTRAINT IngresoProductosPK PRIMARY KEY (IngresoProductosCodigo),
    CONSTRAINT IngresoProductosProveedorCodigoFK FOREIGN KEY (IngresoProductosProveedorCodigo) 
        REFERENCES Ventas.Proveedor(ProveedorCodigo)
)
GO

CREATE TABLE Ventas.DetalleIngreso (
    DetalleIngresoCodigo NVARCHAR(5),
    DetalleIngresoProductosCodigo NCHAR(5),
    DetalleIngresoIngresoProductosCodigo NCHAR(5),
    DetalleIngresoStockInicial INT,
    DetalleIngresoStockActual INT,
    DetalleIngresoFechaProduccion DATE,
    DetalleIngresoFechaVencimiento DATE,
    DetalleIngresoPrecioCompra DECIMAL(11,2) NOT NULL,
    DetalleIngresoPrecioVenta DECIMAL(11,2) NOT NULL,
    CONSTRAINT DetalleIngresoPK PRIMARY KEY(DetalleIngresoCodigo),
    CONSTRAINT DetalleIngresoIngresoProductosFK FOREIGN KEY (DetalleIngresoIngresoProductosCodigo) 
        REFERENCES Ventas.IngresoProductos(IngresoProductosCodigo),
    CONSTRAINT DetalleIngresoProductosFK FOREIGN KEY (DetalleIngresoProductosCodigo) 
        REFERENCES Ventas.Productos(ProductosCodigo)  -- Corregir si el nombre de columna es diferente
)
GO

-- Tabla Venta
CREATE TABLE Ventas.Venta (
    VentaCodigo NCHAR(5),
    VentaClientesCodigo NCHAR(5),
    VentaEmpleadosCodigo NCHAR(4),
    VentaTipoComprobante NVARCHAR(20) NOT NULL DEFAULT 'Boleta',
    VentaFechaHora DATETIME DEFAULT GETDATE(),
	
    VentaSubtotal DECIMAL(9, 2),

    VentaValorPorcentajeIGV DECIMAL(9, 4),        -- Porcentaje de IGV (por ejemplo 0.18 para 18%)  
    VentaMontoIGV AS (VentaSubtotal * VentaValorPorcentajeIGV), -- Cálculo automático del IGV
    VentaTotal  AS (VentaSubtotal + (VentaSubtotal * VentaValorPorcentajeIGV)), -- Total de la factura con IGV incluido

    CONSTRAINT VentaCodigoPK PRIMARY KEY (VentaCodigo),
    CONSTRAINT VentaTipoComprobanteCK CHECK (VentaTipoComprobante = 'Boleta' or VentaTipoComprobante = 'Factura'),
    CONSTRAINT VentaClientesFK FOREIGN KEY (VentaClientesCodigo) 
        REFERENCES Ventas.Clientes(ClientesCodigo), -- Asegúrate de que esta tabla exista
    CONSTRAINT VentaEmpleadosFK FOREIGN KEY (VentaEmpleadosCodigo) 
        REFERENCES Personal.Empleados(EmpleadosCodigo)  -- Asegúrate de que esta tabla exista
)
GO

CREATE TABLE Ventas.DetalleVentaProductos (
    DetalleVentaProductosCodigo NCHAR(7),  -- codigo de la tabla
    DetalleVentaProductosProductosCodigo NCHAR(5),  -- codigo de producto
    DetalleVentaProductosVentaCodigo NCHAR(5), -- codigo venta
    DetalleVentaProductosCantidad INTEGER NOT NULL,
    DetalleVentaProductosPrecioVenta DECIMAL(11,2) NOT NULL,
    DetalleVentaProductosDescuento DECIMAL(11,2) NOT NULL,
    CONSTRAINT DetalleVentaProductosPK PRIMARY KEY (DetalleVentaProductosCodigo),
    CONSTRAINT DetalleVentaProductosVentaFK FOREIGN KEY (DetalleVentaProductosVentaCodigo) 
        REFERENCES Ventas.Venta(VentaCodigo) ON DELETE CASCADE,
    CONSTRAINT DetalleVentaProductosProductosFK FOREIGN KEY (DetalleVentaProductosProductosCodigo) 
        REFERENCES Ventas.Productos(ProductosCodigo)
)
GO

CREATE TABLE Ventas.DetalleVentaServicios (
    DetalleVentaServicios NCHAR(7),  -- codigo de la tabla
    DetalleVentaServiciosServiciosCodigo NCHAR(10),  -- codigo de los servicios
    DetalleVentaServiciosVentaCodigo NCHAR(5), -- codigo de la venta
    DetalleVentaServiciosServiciosPrecioVenta NUMERIC(9, 2) NOT NULL,    -- Precio de la venta del servicio
    CONSTRAINT DetalleVentaServiciosPK PRIMARY KEY (DetalleVentaServicios),
    CONSTRAINT DetalleVentaServiciosVentaCodigoFK FOREIGN KEY (DetalleVentaServiciosVentaCodigo) 
        REFERENCES Ventas.Venta(VentaCodigo) ON DELETE CASCADE
)
GO

-- Tabla Boleta
CREATE TABLE Ventas.Boleta (
    BoletaCodigo NCHAR(5),                          -- Identificador único de la boleta (Generado automáticamente)
    BoletaVentaCodigo NCHAR(5),                      -- Referencia a la venta
    BoletaSerie NVARCHAR(5) NOT NULL,                -- Serie de la boleta (Ingresado por el usuario)
    BoletaNumeroComprobante NVARCHAR(10) NOT NULL,   -- Número del comprobante de la boleta (Ingresado por el usuario)
    BoletaFecha DATETIME DEFAULT GETDATE(),          -- Fecha actual
   
    BoletaSubtotal DECIMAL(9, 2),                    -- Subtotal de la boleta
    BoletaValorPorcentajeIGV DECIMAL(9, 4),           -- Porcentaje de IGV
    BoletaMontoIGV AS (BoletaSubtotal * BoletaValorPorcentajeIGV),  -- Cálculo automático del IGV
    BoletaVentaTotal AS (BoletaSubtotal + (BoletaSubtotal * BoletaValorPorcentajeIGV)),          -- Total de la boleta con IGV incluido

    BoletaClienteCodigo NCHAR(5) NOT NULL,           -- Referencia al cliente (obtenido de la tabla Venta)
    BoletaClienteRUC NVARCHAR(20),                   -- RUC del cliente (de la tabla Clientes)
    
    CONSTRAINT BoletaPK PRIMARY KEY (BoletaCodigo),
    CONSTRAINT BoletaVentaCodigoFK FOREIGN KEY (BoletaVentaCodigo) 
        REFERENCES Ventas.Venta(VentaCodigo),       -- Relacionamos la boleta con la venta
    CONSTRAINT BoletaClienteCodigoFK FOREIGN KEY (BoletaClienteCodigo) 
        REFERENCES Ventas.Clientes(ClientesCodigo)  -- Relacionamos el cliente de la boleta con la tabla Clientes
)
GO

-- Tabla Facturas
CREATE TABLE Ventas.Facturas (
    FacturasCodigo NCHAR(5),                        -- Generado automáticamente
    FacturasNumeroSerie NCHAR(4),                    -- Serie de la factura (Ingresado por el usuario)
    FacturasNumeroFactura NCHAR(7),                  -- Número de la factura (Ingresado por el usuario)
    FacturasVentaCodigo NCHAR(5),                    -- Referencia a la venta
    FacturasFecha DATE DEFAULT GETDATE(),            -- Fecha de la factura (por defecto la fecha actual)
    
    FacturasSubtotal DECIMAL(9, 2),                  -- Subtotal de la factura
    FacturasValorPorcentajeIGV DECIMAL(9, 4),         -- Porcentaje de IGV
    FacturasMontoIGV AS (FacturasSubtotal * FacturasValorPorcentajeIGV),  -- Cálculo automático del IGV
    FacturasVentaTotal AS (FacturasSubtotal + (FacturasSubtotal * FacturasValorPorcentajeIGV)),           -- Total de la factura con IGV incluido

    FacturasClienteCodigo NCHAR(5) NOT NULL,         -- Referencia al cliente (obtenido de la tabla Venta)
    FacturasClienteRUC NVARCHAR(20),                 -- RUC del cliente (de la tabla Clientes)

    CONSTRAINT FacturasPK PRIMARY KEY (FacturasNumeroSerie, FacturasNumeroFactura),
    CONSTRAINT FacturasVentaCodigoFK FOREIGN KEY (FacturasVentaCodigo) 
        REFERENCES Ventas.Venta(VentaCodigo),       -- Relacionamos la factura con la venta
    CONSTRAINT FacturasClienteCodigoFK FOREIGN KEY (FacturasClienteCodigo) 
        REFERENCES Ventas.Clientes(ClientesCodigo)  -- Relacionamos el cliente de la factura con la tabla Clientes
)
GO





 

 