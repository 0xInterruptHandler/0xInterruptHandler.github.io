USE BDHotel
GO


-- Insertar única empresa (@EmpresaHoteleraCodigo,@razon_social, @ruc, @direccion, @telefono_central)
 
INSERT INTO Empresa.EmpresaHotelera(
 EmpresaHoteleraCodigo, EmpresaRUC, EmpresaRazonSocial, EmpresaDireccion, EmpresaWeb, EmpresaRepresentante, EmpresaCargoRepresentante, EmpresaTelefonoCentral
)
VALUES (
	'EM01',               -- EmpresaHoteleraCodigo
    '939399399',          -- EmpresaRUC
    'Hotel La Avenida',   -- EmpresaRazonSocial
    'Av. nombre',         -- EmpresaDireccion
    NULL,                 -- EmpresaWeb (Valor no proporcionado, lo dejamos como NULL)
	'Carlos Pérez',       -- EmpresaRepresentante (Valor de representante, ejemplo ficticio)
    'Gerente General',    -- EmpresaCargoRepresentante (Cargo ficticio)
    '939399399')          -- EmpresaTelefonoCentral (Teléfono de contacto central)

 
-- Insertar registros en sucursal con el código de la empresa
INSERT INTO Empresa.Sucursal (SucursalCodigo, SucursalEmpresaHoteleraCodigo, SucursalNombre, SucursalCiudad, SucursalDistrito, SucursalDireccion, SucursalTelefono)
VALUES 
('S001', 'EM01', 'Sucursal Miraflores', 'Lima', 'Miraflores', 'Avenida José Larco 456', '5112345678'),
('S002', 'EM01', 'Sucursal Cusco', 'Cusco', 'Cusco', 'Avenida del Sol 789', '5123456789'),
('S003', 'EM01', 'Sucursal Arequipa', 'Arequipa', 'Arequipa', 'Calle Santa Catalina 123', '5134567890');
GO

-- Insertar registros en tipo_habitacion
INSERT INTO Empresa.TipoHabitacion (TipoHabitacionCodigo, TipoHabitacionTipo, TipoHabitacionCapacidad, TipoHabitacionDescripcion, TipoHabitacionPrecio)
VALUES
('T001', 'Individual', 1, 'Habitación individual estándar', 50.00),
('T002', 'Doble', 2, 'Habitación doble estándar', 70.00),
('T003', 'Suite', 2, 'Suite de lujo', 150.00),
('T004', 'Familiar', 5, 'Habitación familiar con una cama doble y tres camas simples', 130.00);
 GO

INSERT INTO Empresa.Habitaciones (
    HabitacionesCodigo, 
    HabitacionesTipoHabitacionCodigo, 
    HabitacionesSucursalCodigo, 
    HabitacionesPiso, 
    HabitacionesPuerta, 
    HabitacionesEstado
) 
VALUES 
(
    'H001',            -- Código único de la habitación
    'T001',            -- Código del tipo de habitación (clave foránea que hace referencia a la tabla TipoHabitacion)
    'S001',            -- Código de la sucursal (clave foránea que hace referencia a la tabla Sucursal)
    3,                 -- Piso de la habitación
    12,                -- Número de puerta de la habitación
    'A'                -- Estado de la habitación (A: Activa, I: Inactiva)
);


-- Insertar cargos para un hotel
INSERT INTO Empresa.Cargos (CargosCodigo, CargosNombre, CargosDescripcion)
VALUES
    ('C001', 'Recepcionista', 'Responsable de recibir a los huéspedes y gestionar el check-in y check-out.'),
    ('C002', 'Camarero', 'Encargado de servir alimentos y bebidas a los huéspedes en el restaurante o en sus habitaciones.'),
    ('C003', 'Gimnasio Instructor', 'Instructor de gimnasio que asesora a los huéspedes en el uso de las instalaciones deportivas.'),
    ('C004', 'Gerente de Hotel', 'Responsable de la gestión general del hotel, incluyendo la supervisión del personal y la toma de decisiones operativas.'),
    ('C005', 'Concierge', 'Asiste a los huéspedes con solicitudes especiales, reservas de restaurantes, transporte, y actividades turísticas.'),
    ('C006', 'Chef', 'Responsable de la preparación de los alimentos en la cocina del hotel.'),
    ('C007', 'Limpiador/a', 'Encargado de mantener limpias las habitaciones, baños, y las áreas comunes del hotel.'),
    ('C008', 'Seguridad', 'Responsable de la seguridad dentro del hotel, asegurando que los huéspedes y el personal se encuentren a salvo.'),
    ('C009', 'Barman', 'Encargado de preparar y servir bebidas en los bares del hotel.'),
    ('C010', 'Director de Marketing', 'Responsable de la estrategia de marketing y publicidad del hotel, y de la gestión de la reputación online.');
 GO
-- Insertar servicios ofrecidos por el hotel y relacionados con los cargos específicos
INSERT INTO Empresa.Servicios (ServiciosCodigo, ServiciosDescripcion, ServiciosPrecioVenta , ServiciosCargosCodigo)
VALUES
    ('SE001', 'Servicio de desayuno en habitación', 25.00 , 'C002'),  -- Camarero entrega servicio de desayuno
    ('SE002', 'Servicio de traslado al aeropuerto', 50.00 , 'C005'),  -- Concierge organiza el servicio de transporte
    ('SE003', 'Acceso al gimnasio', 20.00 , 'C003'),  -- Gimnasio Instructor gestiona el acceso y las clases
    ('SE004', 'Cena en el restaurante', 45.00 , 'C002'),  -- Camarero sirve en el restaurante
    ('SE005', 'Organización de excursiones turísticas', 75.00 , 'C005'),  -- Concierge organiza las excursiones
    ('SE006', 'Masaje en el spa', 90.00 , 'C006'),  -- (Por ejemplo, un cargo de spa que podría existir en el hotel)
    ('SE007', 'Alquiler de sala de reuniones', 150.00 , 'C004'),  -- Gerente de Hotel organiza y gestiona el alquiler de salas
    ('SE008', 'Cocktail en el bar', 12.00 , 'C009'),  -- Barman prepara y sirve cócteles en el bar
    ('S009', 'Limpieza diaria de habitación', 30.00 , 'C007');  -- Personal de Limpieza realiza la limpieza diaria de las habitaciones
 GO

-- Insertar países en la tabla Pais
INSERT INTO Identificacion.Pais (PaisCodigo, PaisNombre, PaisRegion)
VALUES
    ('PE', 'Perú', 'Sudamérica'),
    ('US', 'Estados Unidos', 'América del Norte'),
    ('ES', 'España', 'Europa'),
    ('FR', 'Francia', 'Europa'),
    ('CO', 'Colombia', 'Sudamérica'),
    ('BR', 'Brasil', 'Sudamérica'),
    ('AR', 'Argentina', 'Sudamérica'),
    ('MX', 'México', 'América del Norte'),
    ('CL', 'Chile', 'Sudamérica'),
    ('CR', 'Costa Rica', 'Centroamérica'),
    ('ID', 'Indonesia', 'Asia'),
    ('SG', 'Singapur', 'Asia'),
    ('IN', 'India', 'Asia'),
    ('LK', 'Sri Lanka', 'Asia'),
    ('MY', 'Malasia', 'Asia'),
    ('TH', 'Tailandia', 'Asia'),
    ('SA', 'Arabia Saudita', 'Asia'),
    ('JP', 'Japón', 'Asia'),
    ('KW', 'Kuwait', 'Asia'),
    ('TW', 'Taiwán', 'Asia');
 GO

 

-- Insertar tipos de documento en la tabla TipoDocumento (asociados a países)
INSERT INTO Identificacion.TipoDocumento (TipoDocumentoCodigo, TipoDocumentoDescripcion, TipoDocumentoPaisCodigo)
VALUES
    ('DNI00001', 'DNI', 'PE'),  -- DNI para Perú
    ('CE00002', 'Carnet Extranjería', 'PE'),  -- Carnet Extranjería para Perú
    ('PPT00003', 'Pasaporte', 'PE'),  -- Pasaporte para Perú

    ('SSN00001', 'Social Security Number', 'US'),  -- SSN para Estados Unidos
    ('PPT00002', 'Pasaporte', 'US'),  -- Pasaporte para Estados Unidos
    ('ITIN00001', 'Individual Taxpayer Identification Number', 'US'),  -- ITIN para Estados Unidos

    ('NIE00001', 'Número de Identidad de Extranjero', 'ES'),  -- NIE para España
    ('DNI00002', 'DNI', 'ES'),  -- DNI para España
    ('PPT00004', 'Pasaporte', 'ES'),  -- Pasaporte para España

    ('ID00001', 'Identification Card', 'FR'),  -- Carta de Identidad para Francia
    ('PPT00005', 'Pasaporte', 'FR'),  -- Pasaporte para Francia
    ('NIE00002', 'Número de Identidad de Extranjero', 'FR'),  -- NIE para Francia

    ('ID00002', 'Cédula de Ciudadanía', 'CO'),  -- Cédula de Ciudadanía para Colombia
    ('PPT00006', 'Pasaporte', 'CO'),  -- Pasaporte para Colombia
    ('CE00003', 'Carnet de Extranjería', 'CO'),  -- Carnet de Extranjería para Colombia

    ('CC00001', 'Cédula de Ciudadanía', 'BR'),  -- Cédula de Ciudadanía para Brasil
    ('PPT00007', 'Pasaporte', 'BR'),  -- Pasaporte para Brasil
    ('RG00001', 'Registro Geral', 'BR'),  -- Registro Geral para Brasil

    ('ID00003', 'Cédula de Identidad', 'AR'),  -- Cédula de Identidad para Argentina
    ('PPT00008', 'Pasaporte', 'AR'),  -- Pasaporte para Argentina
    ('LE00001', 'Libreta de Enrolamiento', 'AR'),  -- Libreta de Enrolamiento para Argentina

    ('TIE00001', 'Tarjeta de Identidad de Extranjero', 'MX'),  -- TIE para México
    ('PPT00009', 'Pasaporte', 'MX'),  -- Pasaporte para México
    ('CURP00001', 'Clave Única de Registro de Población', 'MX'),  -- CURP para México

    ('CI00001', 'Cédula de Identidad', 'CL'),  -- Cédula de Identidad para Chile
    ('PPT00010', 'Pasaporte', 'CL'),  -- Pasaporte para Chile
    ('RUT00001', 'Rol Único Tributario', 'CL'),  -- RUT para Chile

    ('ID00004', 'Cédula de Ciudadanía', 'CR'),  -- Cédula de Ciudadanía para Costa Rica
    ('PPT00011', 'Pasaporte', 'CR'),  -- Pasaporte para Costa Rica
    ('DIMEX00001', 'Documento de Identidad Migratorio de Extranjeros', 'CR'),  -- DIMEX para Costa Rica

    ('AFO00001', 'Afores Number', 'MX'),  -- Afores para México
    ('PPT00012', 'Pasaporte', 'MX'),  -- Pasaporte para México
    ('NIE00003', 'Número de Identificación de Extranjeros', 'MX'),  -- NIE para México

	('ID00005', 'Kartu Tanda Penduduk', 'ID'),  -- Kartu Tanda Penduduk para Indonesia
    ('PPT00013', 'Pasaporte', 'ID'),  -- Pasaporte para Indonesia

    ('NRIC00001', 'National Registration Identity Card', 'SG'),  -- NRIC para Singapur
    ('PPT00014', 'Pasaporte', 'SG'),  -- Pasaporte para Singapur

    ('AADHAAR00001', 'Aadhaar Card', 'IN'),  -- Aadhaar Card para India
    ('PPT00015', 'Pasaporte', 'IN'),  -- Pasaporte para India
    ('PAN00001', 'Permanent Account Number', 'IN'),  -- PAN Card para India

    ('ID00006', 'Cédula de Identidad', 'LK'),  -- Cédula de Identidad para Sri Lanka
    ('PPT00016', 'Pasaporte', 'LK'),  -- Pasaporte para Sri Lanka

    ('ID00007', 'Kartu Tanda Penduduk', 'MY'),  -- Kartu Tanda Penduduk para Malasia
    ('PPT00017', 'Pasaporte', 'MY'),  -- Pasaporte para Malasia

    ('TNP00001', 'Thai National ID Card', 'TH'),  -- Thai National ID Card para Tailandia
    ('PPT00018', 'Pasaporte', 'TH'),  -- Pasaporte para Tailandia

    ('HIC00001', 'Hajj Identification Card', 'SA'),  -- Hajj Identification para Arabia Saudita
    ('PPT00019', 'Pasaporte', 'SA'),  -- Pasaporte para Arabia Saudita

    ('ID00008', 'National Identification Card', 'JP'),  -- National ID para Japón
    ('PPT00020', 'Pasaporte', 'JP'),  -- Pasaporte para Japón

    ('CI00002', 'Cédula de Identidad', 'KW'),  -- Cédula de Identidad para Kuwait
    ('PPT00021', 'Pasaporte', 'KW'),  -- Pasaporte para Kuwait

    ('TID00001', 'Taiwan Identification Card', 'TW'),  -- Taiwan ID para Taiwán
    ('PPT00022', 'Pasaporte', 'TW');  -- Pasaporte para Taiwán
 GO

INSERT INTO Personal.Empleados (
    EmpleadosCodigo, 
    EmpleadosTipoDocumentoCodigo, 
    EmpleadosPaisCodigo, 
    EmpleadosSucursalCodigo, 
    EmpleadosCargosCodigo, 
    EmpleadosNumeroDocumento, 
    EmpleadosPaterno, 
    EmpleadosMaterno, 
    EmpleadosNombres, 
    EmpleadosFechaNacimiento, 
    EmpleadosDireccion, 
    EmpleadosSexo, 
    EmpleadosEstadoCivil, 
    EmpleadosEstado
)
VALUES 
(
    'E001',                        -- EmpleadosCodigo
    'DNI00001',                    -- EmpleadosTipoDocumentoCodigo
    'PE',                          -- EmpleadosPaisCodigo (Perú)
    'S001',                        -- EmpleadosSucursalCodigo
    'C001',                        -- EmpleadosCargosCodigo
    '1234567890',                  -- EmpleadosNumeroDocumenton
    'Perez',                       -- EmpleadosPaterno
    'Gonzales',                    -- EmpleadosMaterno
    'Juan',                        -- EmpleadosNombres
    '1985-05-15',                  -- EmpleadosFechaNacimiento
    'Av. Pino 123',                -- EmpleadosDireccion
    'M',                           -- EmpleadosSexo (M=Masculino, F=Femenino)
    'C',                           -- EmpleadosEstadoCivil (C=Casado, S=Soltero)
    'A'                            -- EmpleadosEstado (A=Activo, E=Eliminado)
);
 GO


 INSERT INTO Personal.Empleados (
    EmpleadosCodigo, 
    EmpleadosTipoDocumentoCodigo, 
    EmpleadosPaisCodigo, 
    EmpleadosSucursalCodigo, 
    EmpleadosCargosCodigo, 
    EmpleadosNumeroDocumento, 
    EmpleadosPaterno, 
    EmpleadosMaterno, 
    EmpleadosNombres, 
    EmpleadosFechaNacimiento, 
    EmpleadosDireccion, 
    EmpleadosSexo, 
    EmpleadosEstadoCivil, 
    EmpleadosEstado
)
VALUES 
(
    'E002',                        -- EmpleadosCodigo
    'DNI00001',                    -- EmpleadosTipoDocumentoCodigo
    'PE',                          -- EmpleadosPaisCodigo (Perú)
    'S001',                        -- EmpleadosSucursalCodigo
    'C004',                        -- EmpleadosCargosCodigo
    '1234567890',                  -- EmpleadosNumeroDocumenton
    'Gonzales',                       -- EmpleadosPaterno
    'perez',                    -- EmpleadosMaterno
    'Mario',                        -- EmpleadosNombres
    '1985-05-11',                  -- EmpleadosFechaNacimiento
    'Av. Pino 321',                -- EmpleadosDireccion
    'M',                           -- EmpleadosSexo (M=Masculino, F=Femenino)
    'C',                           -- EmpleadosEstadoCivil (C=Casado, S=Soltero)
    'A'                            -- EmpleadosEstado (A=Activo, E=Eliminado)
);
 GO

-- Insertar datos en la tabla Clientes
INSERT INTO Ventas.Clientes (
    ClientesCodigo,
    ClientesTipoDocumentoCodigo,
    ClientesPaisCodigo,
    ClientesNumeroDocumento,
    ClientesRazonSocial,
    ClientesRUC,
    ClientesNombre,
    ClientesApellidoPaterno,
    ClientesApellidoMaterno,
    ClientesCelular,
    ClientesEstado
)
VALUES
    ('CL001', 'DNI00001', 'PE', '1234567890', 'Juan Pérez', '12345678901', 'Juan', 'Pérez',  'Pérez2','987654321', 'A'),
    ('CL002', 'CE00002', 'PE', 'A234567890', 'María García', '23456789012', 'María', 'García','García2', '912345678', 'A'),
    ('CL003', 'PPT00003', 'PE', 'P123456789', 'Carlos López', '34567890123', 'Carlos', 'López', 'López2', '930876543', 'A');
 


 INSERT INTO Ventas.Categorias (CategoriasCodigo, CategoriasNombre, CategoriasDescripcion)
VALUES 
('CAT01', 'Electrónica', 'Categoría de productos electrónicos'),
('CAT02', 'Ropa', 'Categoría de productos de vestimenta');

INSERT INTO Ventas.Productos (ProductosCodigo, ProductosCategoriasCodigo, ProductosNombre, ProductosDescripcion, ProductosStock, ProductosPrecioVenta, ProductosPrecioCompra)
VALUES
('P001', 'CAT01', 'Laptop', 'Laptop de última generación', 50, 1500.00, 1200.00),
('P002', 'CAT02', 'Camiseta', 'Camiseta de algodón', 100, 20.00, 10.00);

INSERT INTO Ventas.Proveedor (ProveedorCodigo, ProveedorRUC, ProveedorRazonSocial, ProveedorNombre, ProveedorNumeroDocumento, ProveedorEstado)
VALUES
('PRV01', '12345678901', 'Proveedor S.A.', 'Proveedor S.A.', '12345678901', 'A');

INSERT INTO Ventas.IngresoProductos (IngresoProductosCodigo, IngresoProductosProveedorCodigo, IngresoProductosFecha, IngresoProductosImpuesto)
VALUES
('I0001', 'PRV01', GETDATE(), 18.0);

INSERT INTO Ventas.DetalleIngreso (DetalleIngresoCodigo, DetalleIngresoProductosCodigo, DetalleIngresoIngresoProductosCodigo, DetalleIngresoStockInicial, DetalleIngresoStockActual, DetalleIngresoPrecioCompra, DetalleIngresoPrecioVenta)
VALUES
('DI001', 'P001', 'I0001', 50, 50, 1200.00, 1500.00),
('DI002', 'P002', 'I0001', 100, 100, 10.00, 20.00);

-- Insertar una venta
INSERT INTO Ventas.Venta (VentaCodigo, VentaClientesCodigo, VentaEmpleadosCodigo, VentaTipoComprobante, VentaFechaHora, VentaSubtotal, VentaValorPorcentajeIGV)
VALUES ('V001', 'CL001', 'E001', 'Boleta', GETDATE(), 1540.00, 0.18);

-- Insertar productos en la venta
INSERT INTO Ventas.DetalleVentaProductos (DetalleVentaProductosCodigo, DetalleVentaProductosProductosCodigo, DetalleVentaProductosVentaCodigo, DetalleVentaProductosCantidad, DetalleVentaProductosPrecioVenta, DetalleVentaProductosDescuento)
VALUES
('DVP001', 'P001', 'V001', 1, 1500.00, 0.00),
('DVP002', 'P002', 'V001', 2, 20.00, 0.00);

-- Insertar servicios en la venta
INSERT INTO Ventas.DetalleVentaServicios (DetalleVentaServicios, DetalleVentaServiciosServiciosCodigo, DetalleVentaServiciosVentaCodigo, DetalleVentaServiciosServiciosPrecioVenta)
VALUES
('DVS001', 'SV001', 'V001', 100.00);

-- Insertar la boleta relacionada con la venta
INSERT INTO Ventas.Boleta (BoletaCodigo, BoletaVentaCodigo, BoletaSerie, BoletaNumeroComprobante, BoletaFecha, BoletaSubtotal, BoletaValorPorcentajeIGV, BoletaClienteCodigo, BoletaClienteRUC)
VALUES
('B001', 'V001', 'B01', '001', GETDATE(), 1540.00, 0.18, 'CL001', '12345678901');

-- Insertar la factura relacionada con la venta
INSERT INTO Ventas.Facturas (FacturasCodigo, FacturasNumeroSerie, FacturasNumeroFactura, FacturasVentaCodigo, FacturasFecha, FacturasSubtotal, FacturasValorPorcentajeIGV, FacturasClienteCodigo, FacturasClienteRUC)
VALUES
('F001', 'F01', '0001', 'V001', GETDATE(), 1540.00, 0.18, 'CL001', '12345678901');

 
 
EXEC spReservaInsertar 
    @ReservaClientesCodigo = 'CL001',              -- Código del cliente
    @ReservaEmpleadosCodigo = 'E001',               -- Código del empleado
    @ReservaHabitacionesCodigo = 'H001',            -- Código de la habitación
    @TipoPago = 'Efectivo',                         -- Tipo de pago
    @Observaciones = 'Reserva para vacaciones',     -- Observaciones
    @ReservaFechaInicio = '2024-12-10',             -- Fecha de inicio
    @ReservaFechaFin = '2024-12-15',                -- Fecha de fin
    @ReservaEstado = 'Activo',                      -- Estado de la reserva (por defecto 'Activo')
    @ReservaMontoPagadoActualmente = 100.00         -- Monto pagado hasta el momento
;

EXEC spReservaEditar 
    @ReservaCodigo = 'R001',                        -- Código de la reserva que deseas editar
    @ReservaClientesCodigo = 'CL001',                -- Código del cliente
    @ReservaEmpleadosCodigo = 'E001',                -- Código del empleado
    @ReservaHabitacionesCodigo = 'H001',             -- Código de la habitación
    @TipoPago = 'Efectivo',                          -- Tipo de pago
    @Observaciones = 'Reserva extendida por más días', -- Observaciones modificadas
    @ReservaFechaInicio = '2024-12-10',              -- Fecha de inicio
    @ReservaFechaFin = '2024-12-18',                 -- Fecha de fin extendida (agregando 3 días más)
    @ReservaEstado = 'Activo' ,                       -- Estado de la reserva (puede ser 'Activo', 'Terminado', etc.)
	@ReservaMontoPagadoActualmente = 123
;


EXEC spReservaInsertar 
    @ReservaClientesCodigo = 'CL002',              -- Código del cliente (nuevo cliente)
    @ReservaEmpleadosCodigo = 'E001',               -- Código del empleado (nuevo empleado)
    @ReservaHabitacionesCodigo = 'H001',            -- Código de la habitación (otra habitación)
    @TipoPago = 'Tarjeta',                          -- Tipo de pago (diferente de 'Efectivo')
    @Observaciones = 'Reserva para evento corporativo', -- Nueva observación
    @ReservaFechaInicio = '2024-12-20',             -- Fecha de inicio (cambio de fecha)
    @ReservaFechaFin = '2024-12-25',                -- Fecha de fin (cambio de fecha)
    @ReservaEstado = 'Activo',                      -- Estado de la reserva (por defecto 'Activo')
    @ReservaMontoPagadoActualmente = 200.00         -- Monto pagado hasta el momento
;

-- SELECT * FROM  Ventas.DetalleVentaProductos
--SELECT * FROM  Ventas.Venta
-- DELETE FROM  Ventas.Venta
--  DELETE FROM  Ventas.DetalleVentaProductos
------ Ejecutar procedimiento spVentaInsertar para registrar una venta
--EXEC spVentaInsertar 
--    @VentaCodigo = 'V001',	
--    @VentaClientesCodigo = 'CL001',
--    @VentaEmpleadosCodigo = 'E001',
--    @VentaTipoComprobante = 'Boleta',
--    @VentaSubtotal = 1540.00;


---- Ejecutar procedimiento spDetalleVentaProductoInsertar para insertar productos en la venta
--EXEC spDetalleVentaProductoInsertar 
 
--    @DetalleVentaProductosProductosCodigo = 'P001', -- obtener 1 vez  mediante boton '+'
--    @DetalleVentaProductosVentaCodigo = 'V001', 												-- Insertar manualmente 1 ves
--    @DetalleVentaProductosCantidad = 1, -- Insertar manualmente 1 ves
--    @DetalleVentaProductosPrecioVenta = 1500.00,  -- obtener 1 vez  mediante boton '+'
--    @DetalleVentaProductosDescuento = 0.00; -- Insertar manualmente 1 ves




--EXEC spDetalleVentaProductoInsertar 
 
--    @DetalleVentaProductosProductosCodigo = 'P001', -- obtener 1 vez  mediante boton '+'
--    @DetalleVentaProductosVentaCodigo = 'V001',												  -- Insertar manualmente 1 ves
--    @DetalleVentaProductosCantidad = 2,   -- Insertar manualmente 1 ves
--    @DetalleVentaProductosPrecioVenta = 20.00,  -- obtener 1 vez  mediante boton '+'
--    @DetalleVentaProductosDescuento = 0.00;  -- Insertar manualmente 1 ves
---- Ejecutar procedimiento spDetalleVentaServicioInsertar para insertar servicios en la venta



--EXEC spDetalleVentaServicioInsertar 
    
--    @DetalleVentaServiciosServiciosCodigo = 'SV001', -- obtener 1 vez  mediante boton '+'
--    @DetalleVentaServiciosVentaCodigo = 'V001',  												-- Insertar manualmente 1 ves
--    @DetalleVentaServiciosServiciosPrecioVenta = 100.00;  -- obtener 1 vez  mediante boton '+'
---- Ejecutar procedimiento spBoletaInsertar para insertar una boleta

--EXEC spFacturaInsertar
--    @FacturasVentaCodigo = 'V001',           -- Código de la venta
--    @FacturasSubtotal = 1500.00,            -- Subtotal de la factura
--    @FacturasValorPorcentajeIGV = 0.18,     -- Porcentaje del IGV
--    @FacturasClienteCodigo = 'CL001',        -- Código del cliente
--    @FacturasClienteRUC = '12345678901';    -- RUC del cliente

--EXEC spBoletaInsertar
--    @BoletaVentaCodigo = 'V001',             -- Código de la venta
--    @BoletaSubtotal = 500.00,                -- Subtotal de la boleta
--    @BoletaValorPorcentajeIGV = 0.18,        -- Porcentaje de IGV
--    @BoletaClienteCodigo = 'CL001',           -- Código del cliente
--    @BoletaClienteRUC = '98765432100';       -- RUC del cliente

--DELETE FROM Ventas.DetalleVentaProductos
--DELETE FROM Ventas.Boleta
--DELETE FROM Ventas.Facturas
--DELETE FROM Ventas.Venta

--SELECT *  FROM  Ventas.DetalleVentaProductos
--SELECT * FROM Ventas.Boleta
--SELECT * FROM Ventas.Facturas
--SELECT *  FROM Ventas.Venta


--USUARIO RECEPCIONISTA
DECLARE @UsuarioCodigo1 nchar(4) = 'U001';
DECLARE @UsuarioEmpleadoCodigo1 nchar(4) = 'E001';
DECLARE @Contrasenia1 varchar(50) = 'admin';
 

EXEC spUsuarioInsertar @UsuarioCodigo1, @UsuarioEmpleadoCodigo1, @Contrasenia1  ;

--DECLARE @UsuarioCodigo nchar(4) = 'U001';
--DECLARE @Contrasenia varchar(50) = 'admin';

--EXEC spUsuarioValidar @UsuarioCodigo, @Contrasenia ;


--DECLARE @UsuarioCodigo nchar(4) = 'U001'; -- Reemplaza 'U001' con el código del usuario que deseas verificar

--EXEC spTipoDeUsuarioVerificar @UsuarioCodigo;

 

--USUARIO ADMINISTRADOR
DECLARE @UsuarioCodigo2 nchar(4) = 'U002';
DECLARE @UsuarioEmpleadoCodigo2 nchar(4) = 'E002';
DECLARE @Contrasenia2 varchar(50) = 'admin';
 

EXEC spUsuarioInsertar @UsuarioCodigo2, @UsuarioEmpleadoCodigo2, @Contrasenia2  ;

--DECLARE @UsuarioCodigo nchar(4) = 'U002';
--DECLARE @Contrasenia varchar(50) = 'admin';

--EXEC spUsuarioValidar @UsuarioCodigo, @Contrasenia ;


--DECLARE @UsuarioCodigo nchar(4) = 'U002'; -- Reemplaza 'U001' con el código del usuario que deseas verificar

--EXEC spTipoDeUsuarioVerificar @UsuarioCodigo;



 