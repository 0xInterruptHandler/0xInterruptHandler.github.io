USE BDHotel
GO

CREATE PROCEDURE spEmpresaHoteleraConsultar
AS
BEGIN
SELECT *  FROM Empresa.EmpresaHotelera
END
GO

CREATE PROCEDURE spEmpresaHoteleraEditar
    @EmpresaHoteleraCodigo nchar(4),
    @EmpresaRUC nchar(11),
    @EmpresaRazonSocial nvarchar(100),
    @EmpresaDireccion nvarchar(100),
    @EmpresaWeb nvarchar(80),
    @EmpresaFono nvarchar(80),
    @EmpresaRepresentante nvarchar(60),
    @EmpresaCargoRepresentante nvarchar(60),
    @EmpresaTelefonoCentral nvarchar(255)
AS
BEGIN
    UPDATE Empresa.EmpresaHotelera
    SET
        EmpresaRUC = @EmpresaRUC,
        EmpresaRazonSocial = @EmpresaRazonSocial,
        EmpresaDireccion = @EmpresaDireccion,
        EmpresaWeb = @EmpresaWeb ,
        EmpresaRepresentante = @EmpresaRepresentante,
        EmpresaCargoRepresentante = @EmpresaCargoRepresentante,
        EmpresaTelefonoCentral = @EmpresaTelefonoCentral
    WHERE
        EmpresaHoteleraCodigo = @EmpresaHoteleraCodigo;
END
GO





CREATE PROCEDURE spUsuarioValidar 
    @UsuarioCodigo nchar(4),
    @Contrasenia varchar(50)
AS
BEGIN
    SELECT 
        U.UsuariosCodigo
    FROM Seguridad.Usuarios AS U
    WHERE U.UsuariosCodigo = @UsuarioCodigo
    AND U.UsuariosEstado = 'A'  
    AND CONVERT(varchar(50), DECRYPTBYPASSPHRASE('admin', U.UsuariosPassword)) = @Contrasenia;
END;
GO

 
CREATE PROCEDURE spTipoDeUsuarioVerificar
@UsuarioCodigo nchar(4)
AS
    BEGIN
        SELECT 
            C.CargosNombre AS TipoUsuario 
        FROM Personal.Empleados E
        INNER JOIN Empresa.Cargos C ON E.EmpleadosCargosCodigo = C.CargosCodigo
        WHERE E.EmpleadosCodigo = (SELECT UsuariosEmpleadosCodigo FROM Seguridad.Usuarios WHERE UsuariosCodigo = @UsuarioCodigo);
    END
 
GO

CREATE PROCEDURE spUsuarioInsertar
@UsuarioCodigo nchar(4),
@UsuarioEmpleadoCodigo nchar(4),
@Contrasenia varchar(50) 
AS 
BEGIN
    INSERT INTO Seguridad.Usuarios(UsuariosCodigo, UsuariosEmpleadosCodigo, UsuariosPassword)
    values (
        @UsuarioCodigo,
        @UsuarioEmpleadoCodigo,
        ENCRYPTBYPASSPHRASE('admin', @Contrasenia)
    )
END
GO




CREATE PROCEDURE spClienteConsultar
AS
BEGIN
     SELECT  
		*
	 FROM Ventas.Clientes 
END
GO
CREATE PROCEDURE spClienteInsertar 
    @ClientesCodigo NCHAR(5),
    @ClientesRUC NCHAR(11),
    @ClientesRazonSocial NVARCHAR(100),
    @ClientesNumeroDocumento NVARCHAR(10),
    @ClientesTipoDocumentoCodigo NCHAR(19),
    @ClientesPaisCodigo NCHAR(3),
    @ClientesNombre NVARCHAR(255),
    @ClientesApellidoPaterno NVARCHAR(255),
    @ClientesApellidoMaterno NVARCHAR(255),
    @ClientesCelular NVARCHAR(255),
    @ClientesEstado NCHAR(1) = 'A'  -- Valor por defecto 'A'
AS
BEGIN
    INSERT INTO Ventas.Clientes (
        ClientesCodigo, 
        ClientesRUC, 
        ClientesRazonSocial, 
        ClientesNumeroDocumento, 
        ClientesTipoDocumentoCodigo, 
        ClientesPaisCodigo, 
        ClientesNombre, 
        ClientesApellidoPaterno, 
        ClientesApellidoMaterno, 
        ClientesCelular, 
        ClientesEstado
    )
    VALUES (
        @ClientesCodigo, 
        @ClientesRUC, 
        @ClientesRazonSocial, 
        @ClientesNumeroDocumento, 
        @ClientesTipoDocumentoCodigo, 
        @ClientesPaisCodigo, 
        @ClientesNombre, 
        @ClientesApellidoPaterno, 
        @ClientesApellidoMaterno, 
        @ClientesCelular, 
        @ClientesEstado
    );
END;
GO
CREATE PROCEDURE spClienteEditar 
    @ClientesCodigo NCHAR(5),
    @ClientesRUC NCHAR(11),
    @ClientesRazonSocial NVARCHAR(100),
    @ClientesNumeroDocumento NVARCHAR(10),
    @ClientesTipoDocumentoCodigo NCHAR(19),
    @ClientesPaisCodigo NCHAR(3),
    @ClientesNombre NVARCHAR(255),
    @ClientesApellidoPaterno NVARCHAR(255),
    @ClientesApellidoMaterno NVARCHAR(255),
    @ClientesCelular NVARCHAR(255),
    @ClientesEstado NCHAR(1) = 'A'  -- Valor por defecto 'A'
AS
BEGIN
    UPDATE Ventas.Clientes
    SET 
        ClientesRUC = @ClientesRUC,
        ClientesRazonSocial = @ClientesRazonSocial,
        ClientesNumeroDocumento = @ClientesNumeroDocumento,
        ClientesTipoDocumentoCodigo = @ClientesTipoDocumentoCodigo,
        ClientesPaisCodigo = @ClientesPaisCodigo,
        ClientesNombre = @ClientesNombre,
        ClientesApellidoPaterno = @ClientesApellidoPaterno,
        ClientesApellidoMaterno = @ClientesApellidoMaterno,
        ClientesCelular = @ClientesCelular,
        ClientesEstado = @ClientesEstado
    WHERE 
        ClientesCodigo = @ClientesCodigo;
END;
GO


CREATE PROCEDURE spClienteBuscarPorNumeroDocumento
    @ClientesNumeroDocumento NVARCHAR(10)
AS
BEGIN
    SELECT 
        ClientesCodigo, 
        ClientesRUC, 
        ClientesRazonSocial, 
        ClientesNumeroDocumento, 
        ClientesTipoDocumentoCodigo, 
        ClientesPaisCodigo, 
        ClientesNombre, 
        ClientesApellidoPaterno, 
        ClientesApellidoMaterno, 
        ClientesCelular, 
        ClientesEstado
    FROM Ventas.Clientes
    WHERE ClientesNumeroDocumento = @ClientesNumeroDocumento;
END;
GO

CREATE PROCEDURE spClienteBuscarPorRUC
    @ClientesRUC NCHAR(11)
AS
BEGIN
    SELECT 
        ClientesCodigo, 
        ClientesRUC, 
        ClientesRazonSocial, 
        ClientesNumeroDocumento, 
        ClientesTipoDocumentoCodigo, 
        ClientesPaisCodigo, 
        ClientesNombre, 
        ClientesApellidoPaterno, 
        ClientesApellidoMaterno, 
        ClientesCelular, 
        ClientesEstado
    FROM Ventas.Clientes
    WHERE ClientesRUC = @ClientesRUC;
END;
GO




 
CREATE PROCEDURE spEmpleadoConsultar
 
AS
BEGIN
     SELECT  
	 *
	 FROM Personal.Empleados  
 
END
GO
CREATE PROCEDURE spEmpleadoInsertar 
    @EmpleadosCodigo NCHAR(4),
    @EmpleadosTipoDocumentoCodigo NCHAR(19),
    @EmpleadosPaisCodigo NCHAR(3),
    @EmpleadosSucursalCodigo NCHAR(4),
    @EmpleadosCargosCodigo NCHAR(4),
    @EmpleadosCelular NVARCHAR(255),
    @EmpleadosNumeroDocumento NVARCHAR(10),
    @EmpleadosPaterno NVARCHAR(80),
    @EmpleadosMaterno NVARCHAR(80),
    @EmpleadosNombres NVARCHAR(80),
    @EmpleadosFechaNacimiento DATE,
    @EmpleadosSexo NCHAR(1),
    @EmpleadosEstadoCivil NCHAR(1),
    @EmpleadosDireccion NVARCHAR(100),
    @EmpleadosEstado NCHAR(1) = 'A'  -- Valor por defecto 'A'
AS
BEGIN
    INSERT INTO Personal.Empleados (
        EmpleadosCodigo, 
        EmpleadosTipoDocumentoCodigo, 
        EmpleadosPaisCodigo, 
        EmpleadosSucursalCodigo, 
        EmpleadosCargosCodigo, 
        EmpleadosCelular, 
        EmpleadosNumeroDocumento, 
        EmpleadosPaterno, 
        EmpleadosMaterno, 
        EmpleadosNombres, 
        EmpleadosFechaNacimiento, 
        EmpleadosSexo, 
        EmpleadosEstadoCivil, 
        EmpleadosDireccion, 
        EmpleadosEstado
    )
    VALUES (
        @EmpleadosCodigo, 
        @EmpleadosTipoDocumentoCodigo, 
        @EmpleadosPaisCodigo, 
        @EmpleadosSucursalCodigo, 
        @EmpleadosCargosCodigo, 
        @EmpleadosCelular, 
        @EmpleadosNumeroDocumento, 
        @EmpleadosPaterno, 
        @EmpleadosMaterno, 
        @EmpleadosNombres, 
        @EmpleadosFechaNacimiento, 
        @EmpleadosSexo, 
        @EmpleadosEstadoCivil, 
        @EmpleadosDireccion, 
        @EmpleadosEstado
    );
END;
GO
CREATE PROCEDURE spEmpleadoEditar 
    @EmpleadosCodigo NCHAR(4),
    @EmpleadosTipoDocumentoCodigo NCHAR(19),
    @EmpleadosPaisCodigo NCHAR(3),
    @EmpleadosSucursalCodigo NCHAR(4),
    @EmpleadosCargosCodigo NCHAR(4),
    @EmpleadosCelular NVARCHAR(255),
    @EmpleadosNumeroDocumento NVARCHAR(10),
    @EmpleadosPaterno NVARCHAR(80),
    @EmpleadosMaterno NVARCHAR(80),
    @EmpleadosNombres NVARCHAR(80),
    @EmpleadosFechaNacimiento DATE,
    @EmpleadosSexo NCHAR(1),
    @EmpleadosEstadoCivil NCHAR(1),
    @EmpleadosDireccion NVARCHAR(100),
    @EmpleadosEstado NCHAR(1) = 'A'  -- Valor por defecto 'A'
AS
BEGIN
    UPDATE Personal.Empleados
    SET 
        EmpleadosTipoDocumentoCodigo = @EmpleadosTipoDocumentoCodigo,
        EmpleadosPaisCodigo = @EmpleadosPaisCodigo,
        EmpleadosSucursalCodigo = @EmpleadosSucursalCodigo,
        EmpleadosCargosCodigo = @EmpleadosCargosCodigo,
        EmpleadosCelular = @EmpleadosCelular,
        EmpleadosNumeroDocumento = @EmpleadosNumeroDocumento,
        EmpleadosPaterno = @EmpleadosPaterno,
        EmpleadosMaterno = @EmpleadosMaterno,
        EmpleadosNombres = @EmpleadosNombres,
        EmpleadosFechaNacimiento = @EmpleadosFechaNacimiento,
        EmpleadosSexo = @EmpleadosSexo,
        EmpleadosEstadoCivil = @EmpleadosEstadoCivil,
        EmpleadosDireccion = @EmpleadosDireccion,
        EmpleadosEstado = @EmpleadosEstado
    WHERE 
        EmpleadosCodigo = @EmpleadosCodigo;
END;
GO

CREATE PROCEDURE spEmpleadoBuscarPorCodigo
    @EmpleadosCodigo NCHAR(4)
AS
BEGIN
    -- Seleccionar empleado por código
    SELECT 
        EmpleadosCodigo,
        EmpleadosTipoDocumentoCodigo,
        EmpleadosPaisCodigo,
        EmpleadosSucursalCodigo,
        EmpleadosCargosCodigo,
        EmpleadosCelular,
        EmpleadosNumeroDocumento,
        EmpleadosPaterno,
        EmpleadosMaterno,
        EmpleadosNombres,
        EmpleadosFechaNacimiento,
        EmpleadosSexo,
        EmpleadosEstadoCivil,
        EmpleadosDireccion,
        EmpleadosEstado
    FROM Personal.Empleados
    WHERE EmpleadosCodigo = @EmpleadosCodigo;
END;
GO

CREATE PROCEDURE spEmpleadoBuscarPorNumeroDocumento
    @EmpleadosNumeroDocumento NVARCHAR(10)
AS
BEGIN
    -- Seleccionar empleado por número de documento
    SELECT 
        EmpleadosCodigo,
        EmpleadosTipoDocumentoCodigo,
        EmpleadosPaisCodigo,
        EmpleadosSucursalCodigo,
        EmpleadosCargosCodigo,
        EmpleadosCelular,
        EmpleadosNumeroDocumento,
        EmpleadosPaterno,
        EmpleadosMaterno,
        EmpleadosNombres,
        EmpleadosFechaNacimiento,
        EmpleadosSexo,
        EmpleadosEstadoCivil,
        EmpleadosDireccion,
        EmpleadosEstado
    FROM Personal.Empleados
    WHERE EmpleadosNumeroDocumento = @EmpleadosNumeroDocumento;
END;
GO





CREATE PROCEDURE spSucursalConsultar
 
AS
BEGIN
     SELECT *
	 FROM Empresa.Sucursal  
END
GO
CREATE PROCEDURE spSucursalInsertar
    @SucursalCodigo nchar(4),
    @SucursalEmpresaHoteleraCodigo nchar(4) = '1',  
    @SucursalNombre nvarchar(255),
    @SucursalCiudad nvarchar(255),
    @SucursalDistrito nvarchar(255),
    @SucursalDireccion nvarchar(255),
    @SucursalTelefono nvarchar(255),
    @SucursalEstado nchar(1) = 'A'  -- Default to 'A'
AS
BEGIN
 
    INSERT INTO Empresa.Sucursal
    (
        SucursalCodigo,
        SucursalEmpresaHoteleraCodigo,
        SucursalNombre,
        SucursalCiudad,
        SucursalDistrito,
        SucursalDireccion,
        SucursalTelefono,
        SucursalEstado
    )
    VALUES
    (
        @SucursalCodigo,
        @SucursalEmpresaHoteleraCodigo,
        @SucursalNombre,
        @SucursalCiudad,
        @SucursalDistrito,
        @SucursalDireccion,
        @SucursalTelefono,
        @SucursalEstado
    );
END
GO
CREATE PROCEDURE spSucursalEditar
    @SucursalCodigo nchar(4),
    @SucursalEmpresaHoteleraCodigo nchar(4) = '1',   
    @SucursalNombre nvarchar(255),
    @SucursalCiudad nvarchar(255),
    @SucursalDistrito nvarchar(255),
    @SucursalDireccion nvarchar(255),
    @SucursalTelefono nvarchar(255),
    @SucursalEstado nchar(1) = 'A'   
AS
BEGIN
 
    UPDATE Empresa.Sucursal
    SET
        SucursalEmpresaHoteleraCodigo = @SucursalEmpresaHoteleraCodigo,
        SucursalNombre = @SucursalNombre,
        SucursalCiudad = @SucursalCiudad,
        SucursalDistrito = @SucursalDistrito,
        SucursalDireccion = @SucursalDireccion,
        SucursalTelefono = @SucursalTelefono,
        SucursalEstado = @SucursalEstado
    WHERE SucursalCodigo = @SucursalCodigo;
 
END 
GO
CREATE PROCEDURE spSucursalEliminar
    @SucursalCodigo nchar(4),
    @SucursalEstado nchar(1) = 'A'   
AS
BEGIN
    UPDATE Empresa.Sucursal
    SET
        SucursalEstado = @SucursalEstado
    WHERE SucursalCodigo = @SucursalCodigo;
 
END 
GO
 


CREATE PROCEDURE spTipoDocumentoConsultar
AS
BEGIN
     SELECT  * 
	 FROM Identificacion.TipoDocumento  
END
GO
CREATE PROCEDURE spCodigoPaisBuscar
    @TipoDocumentoPaisCodigo VARCHAR(50)  -- Código del tipo de documento
AS
BEGIN
    SELECT 
	TD.TipoDocumentoPaisCodigo,
	TD.TipoDocumentoCodigo,
	P.PaisNombre,
	TD.TipoDocumentoDescripcion 
    FROM Identificacion.TipoDocumento AS TD
	JOIN Identificacion.Pais AS P
	ON P.PaisCodigo = TD.TipoDocumentoPaisCodigo
    WHERE TD.TipoDocumentoPaisCodigo LIKE '%' + @TipoDocumentoPaisCodigo + '%' 
END
GO
CREATE PROCEDURE spNombrePaisBuscar
    @PaisNombre VARCHAR(50)
AS
BEGIN
    SELECT 
	TD.TipoDocumentoPaisCodigo,
	TD.TipoDocumentoCodigo,
	P.PaisNombre,
	TD.TipoDocumentoDescripcion 
    FROM TipoDocumento AS TD
	JOIN Pais as P
	ON TD.TipoDocumentoPaisCodigo = P.PaisCodigo
    WHERE P.PaisNombre LIKE '%' + @PaisNombre + '%' 
END
GO
 

CREATE PROCEDURE spPaisInsertar
    @PaisCodigo NCHAR(3),
    @PaisNombre NVARCHAR(100),
    @PaisRegion NVARCHAR(50) = NULL   
AS
BEGIN
 
    INSERT INTO Identificacion.Pais
    (
        PaisCodigo,
        PaisNombre,
        PaisRegion
    )
    VALUES
    (
        @PaisCodigo,
        @PaisNombre,
        @PaisRegion
    );
 
END 
GO
CREATE PROCEDURE spPaisEditar
    @PaisCodigo NCHAR(3),
    @PaisNombre NVARCHAR(100),
    @PaisRegion NVARCHAR(50) = NULL   
AS
BEGIN
 
    UPDATE Identificacion.Pais
    SET
        PaisNombre = @PaisNombre,
        PaisRegion = @PaisRegion
    WHERE PaisCodigo = @PaisCodigo;
 
END 
GO




 
CREATE PROCEDURE spCargosConsultar
AS
BEGIN
     SELECT 
	 C.CargosCodigo,
	 C.CargosNombre, 
	 C.CargosDescripcion 
	 FROM Empresa.Cargos AS C
END
GO
CREATE PROCEDURE spCargosInsertar
    @CargosCodigo nchar(4),
    @CargosNombre VARCHAR(255),
    @CargosDescripcion VARCHAR(255),
    @CargosEstado nchar(1) = 'A'  -- Default to 'A'
AS
BEGIN
 
    INSERT INTO Empresa.Cargos
    (
        CargosCodigo,
        CargosNombre,
        CargosDescripcion,
        CargosEstado
    )
    VALUES
    (
        @CargosCodigo,
        @CargosNombre,
        @CargosDescripcion,
        @CargosEstado
    );
 
END 
GO
CREATE PROCEDURE spCargosEditar
    @CargosCodigo nchar(4),
    @CargosNombre VARCHAR(255),
    @CargosDescripcion VARCHAR(255),
    @CargosEstado nchar(1) = 'A'   
AS
BEGIN
 
    UPDATE Empresa.Cargos
    SET
        CargosNombre = @CargosNombre,
        CargosDescripcion = @CargosDescripcion,
        CargosEstado = @CargosEstado
    WHERE CargosCodigo = @CargosCodigo;
 
END;
GO



CREATE PROCEDURE spReservaConsultar
AS
BEGIN
	SELECT *
	FROM Ventas.Reserva  

	
    -- Actualizar estado de la reserva si la fecha de fin es mayor a la fecha actual
    UPDATE Ventas.Reserva
    SET ReservaEstado = 'Terminado'   
    WHERE ReservaFechaFin > GETDATE()  ;

    -- Actualizar estado de la habitación a 'O' (Ocupada)
    UPDATE Empresa.Habitaciones
    SET HabitacionesEstado = 'O'  -- 'O' significa ocupada
    WHERE HabitacionesCodigo IN (SELECT ReservaHabitacionesCodigo FROM Ventas.Reserva WHERE ReservaEstado = 'A');

END
GO
 
 

CREATE PROCEDURE spReservaInsertar
    @ReservaClientesCodigo NCHAR(5),
    @ReservaEmpleadosCodigo NCHAR(4),
    @ReservaHabitacionesCodigo NCHAR(4),
    @TipoPago VARCHAR(50),
    @Observaciones NVARCHAR(255),
    @ReservaFechaInicio DATE,
    @ReservaFechaFin DATE,
    @ReservaEstado VARCHAR(255) = 'Activo', -- Valor por defecto 'Activo'
	@ReservaMontoPagadoActualmente DECIMAL   
AS
BEGIN
    DECLARE @PrecioHabitacion DECIMAL(10, 2);
    DECLARE @CantidadNoches INT;
    DECLARE @MontoTotal DECIMAL(11, 2);
    DECLARE @ReservaCodigo NCHAR(4);
    DECLARE @UltimoCodigo INT;
    
    -- Obtener el precio de la habitación
    SELECT @PrecioHabitacion = TipoHabitacionPrecio
    FROM Empresa.Habitaciones h
    JOIN Empresa.TipoHabitacion th ON h.HabitacionesTipoHabitacionCodigo = th.TipoHabitacionCodigo
    WHERE h.HabitacionesCodigo = @ReservaHabitacionesCodigo;
    
    -- Calcular la cantidad de noches
    SET @CantidadNoches = DATEDIFF(DAY, @ReservaFechaInicio, @ReservaFechaFin);
    
    -- Calcular el monto total
    SET @MontoTotal = @CantidadNoches * @PrecioHabitacion;

    -- Obtener el último código de reserva para generar el siguiente
    SELECT TOP 1 @UltimoCodigo = CAST(SUBSTRING(ReservaCodigo, 2, 3) AS INT)
    FROM Ventas.Reserva
    ORDER BY ReservaCodigo DESC;

    -- Si no hay reservas, empezar desde 1
    IF @UltimoCodigo IS NULL
    BEGIN
        SET @UltimoCodigo = 0;
    END

    -- Generar el nuevo código de reserva
    SET @ReservaCodigo = 'R' + FORMAT(@UltimoCodigo + 1, '000');

    -- Insertar la reserva
    INSERT INTO Ventas.Reserva (
        ReservaCodigo, 
        ReservaClientesCodigo, 
        ReservaEmpleadosCodigo, 
        ReservaHabitacionesCodigo, 
        TipoPago, 
        Observaciones, 
		ReservaMontoPagadoActualmente,   -- Agregar el monto pagado hasta el momento
        MontoTotal, 
        ReservaFechaInicio, 
        ReservaFechaFin, 
        ReservaEstado
    )
    VALUES (
        @ReservaCodigo, 
        @ReservaClientesCodigo, 
        @ReservaEmpleadosCodigo, 
        @ReservaHabitacionesCodigo, 
        @TipoPago, 
        @Observaciones, 
		@ReservaMontoPagadoActualmente,  -- Agregar el monto pagado
        @MontoTotal, 
        @ReservaFechaInicio, 
        @ReservaFechaFin, 
        @ReservaEstado
    );
END;
GO


CREATE PROCEDURE spReservaEditar
    @ReservaCodigo NCHAR(4),
    @ReservaClientesCodigo NCHAR(5),
    @ReservaEmpleadosCodigo NCHAR(4),
    @ReservaHabitacionesCodigo NCHAR(4),
    @TipoPago VARCHAR(50),
    @Observaciones NVARCHAR(255),
    @ReservaFechaInicio DATE,
    @ReservaFechaFin DATE,
    @ReservaEstado VARCHAR(255) = 'Activo', -- Valor por defecto 'Activo'
	@ReservaMontoPagadoActualmente DECIMAL(11,2)
AS
BEGIN
    DECLARE @PrecioHabitacion DECIMAL(10, 2);
    DECLARE @CantidadNoches INT;
    DECLARE @MontoTotal DECIMAL(11, 2);
    
    -- Obtener el precio de la habitación
    SELECT @PrecioHabitacion = TipoHabitacionPrecio
    FROM Empresa.Habitaciones h
    JOIN Empresa.TipoHabitacion th ON h.HabitacionesTipoHabitacionCodigo = th.TipoHabitacionCodigo
    WHERE h.HabitacionesCodigo = @ReservaHabitacionesCodigo;
    
    -- Calcular la cantidad de noches
    SET @CantidadNoches = DATEDIFF(DAY, @ReservaFechaInicio, @ReservaFechaFin);
    
    -- Calcular el monto total
    SET @MontoTotal = @CantidadNoches * @PrecioHabitacion;
    
    -- Actualizar la reserva
    UPDATE Ventas.Reserva
    SET 
        ReservaClientesCodigo = @ReservaClientesCodigo,
        ReservaEmpleadosCodigo = @ReservaEmpleadosCodigo,
        ReservaHabitacionesCodigo = @ReservaHabitacionesCodigo,
        TipoPago = @TipoPago,
        Observaciones = @Observaciones,
        MontoTotal = @MontoTotal, -- Actualizar el MontoTotal
        ReservaFechaInicio = @ReservaFechaInicio,
        ReservaFechaFin = @ReservaFechaFin,
        ReservaEstado = @ReservaEstado,
        FechaModificacion = GETDATE(), -- Actualizar la fecha de modificación a la fecha actual
		ReservaMontoPagadoActualmente = @ReservaMontoPagadoActualmente
    WHERE 
        ReservaCodigo = @ReservaCodigo;
END;
GO





CREATE PROCEDURE spProveedorConsultar
AS
BEGIN
	SELECT *
	FROM Ventas.Proveedor  
END
GO
CREATE PROCEDURE spProveedorInsertar
    @ProveedorCodigo NCHAR(5),
    @ProveedorRUC NCHAR(11),
    @ProveedorRazonSocial NVARCHAR(100),
    @ProveedorNombre NVARCHAR(100),
    @ProveedorTipoDocumento NVARCHAR(20) = NULL,  -- Valor por defecto NULL
    @ProveedorNumeroDocumento NVARCHAR(20),
    @ProveedorDireccion NVARCHAR(100) = NULL,     -- Valor por defecto NULL
    @ProveedorTelefono NVARCHAR(20) = NULL,       -- Valor por defecto NULL
    @ProveedorEmail NVARCHAR(50) = NULL,          -- Valor por defecto NULL
    @ProveedorWeb NVARCHAR(50) = NULL,            -- Valor por defecto NULL
    @ProveedorEstado NCHAR(1) = 'A'               -- Valor por defecto 'A' (Activo)
AS
BEGIN
    -- Insertar un nuevo proveedor
    INSERT INTO Ventas.Proveedor (
        ProveedorCodigo, 
        ProveedorRUC, 
        ProveedorRazonSocial, 
        ProveedorNombre, 
        ProveedorTipoDocumento, 
        ProveedorNumeroDocumento, 
        ProveedorDireccion, 
        ProveedorTelefono, 
        ProveedorEmail, 
        ProveedorWeb, 
        ProveedorEstado
    )
    VALUES (
        @ProveedorCodigo, 
        @ProveedorRUC, 
        @ProveedorRazonSocial, 
        @ProveedorNombre, 
        @ProveedorTipoDocumento, 
        @ProveedorNumeroDocumento, 
        @ProveedorDireccion, 
        @ProveedorTelefono, 
        @ProveedorEmail, 
        @ProveedorWeb, 
        @ProveedorEstado
    );
END;
GO
CREATE PROCEDURE spProveedorEditar
    @ProveedorCodigo NCHAR(5),  -- El código del proveedor a editar
    @ProveedorRUC NCHAR(11),
    @ProveedorRazonSocial NVARCHAR(100),
    @ProveedorNombre NVARCHAR(100),
    @ProveedorTipoDocumento NVARCHAR(20) = NULL,  -- Valor por defecto NULL
    @ProveedorNumeroDocumento NVARCHAR(20),
    @ProveedorDireccion NVARCHAR(100) = NULL,     -- Valor por defecto NULL
    @ProveedorTelefono NVARCHAR(20) = NULL,       -- Valor por defecto NULL
    @ProveedorEmail NVARCHAR(50) = NULL,          -- Valor por defecto NULL
    @ProveedorWeb NVARCHAR(50) = NULL,            -- Valor por defecto NULL
    @ProveedorEstado NCHAR(1) = 'A'               -- Valor por defecto 'A' (Activo)
AS
BEGIN
    -- Actualizar un proveedor existente
    UPDATE Ventas.Proveedor
    SET 
        ProveedorRUC = @ProveedorRUC,
        ProveedorRazonSocial = @ProveedorRazonSocial,
        ProveedorNombre = @ProveedorNombre,
        ProveedorTipoDocumento = @ProveedorTipoDocumento,
        ProveedorNumeroDocumento = @ProveedorNumeroDocumento,
        ProveedorDireccion = @ProveedorDireccion,
        ProveedorTelefono = @ProveedorTelefono,
        ProveedorEmail = @ProveedorEmail,
        ProveedorWeb = @ProveedorWeb,
        ProveedorEstado = @ProveedorEstado
    WHERE 
        ProveedorCodigo = @ProveedorCodigo;
END;
GO






 

CREATE PROCEDURE spCategoriaConsultar
AS
BEGIN
	SELECT *
	FROM Ventas.Categorias  
END
GO
CREATE PROCEDURE spCategoriaInsertar
    @CategoriasCodigo NCHAR(5),
    @CategoriasNombre NVARCHAR(50),
    @CategoriasDescripcion NVARCHAR(100),
    @CategoriasEstado NCHAR(1) = 'A'  -- Valor por defecto 'A' (Activo)
AS
BEGIN
    -- Insertar una nueva categoría
    INSERT INTO Ventas.Categorias (
        CategoriasCodigo, 
        CategoriasNombre, 
        CategoriasDescripcion, 
        CategoriasEstado
    )
    VALUES (
        @CategoriasCodigo, 
        @CategoriasNombre, 
        @CategoriasDescripcion, 
        @CategoriasEstado
    );
END;
GO
CREATE PROCEDURE spCategoriaEditar
    @CategoriasCodigo NCHAR(5),  -- El código de la categoría a editar
    @CategoriasNombre NVARCHAR(50),
    @CategoriasDescripcion NVARCHAR(100),
    @CategoriasEstado NCHAR(1) = 'A'  -- Valor por defecto 'A' (Activo)
AS
BEGIN
    -- Actualizar una categoría existente
    UPDATE Ventas.Categorias
    SET 
        CategoriasNombre = @CategoriasNombre,
        CategoriasDescripcion = @CategoriasDescripcion,
        CategoriasEstado = @CategoriasEstado
    WHERE 
        CategoriasCodigo = @CategoriasCodigo;
END;
GO






CREATE PROCEDURE spProductoConsultar
AS
BEGIN
	SELECT *
	FROM Ventas.Productos  
END
GO
CREATE PROCEDURE spProductoInsertar
    @ProductosCodigo NCHAR(5),
    @ProductosCategoriasCodigo NCHAR(5),
    @ProductosNombre NVARCHAR(100),
    @ProductosDescripcion NVARCHAR(80),
    @ProductosFechaVencimiento DATE,
    @ProductosEstado NCHAR(1) = 'A',  -- Valor por defecto 'A' (Activo)
    @ProductosStock NUMERIC(9, 2) = 0, 
    @ProductosPrecioVenta NUMERIC(9, 2) = 0, 
    @ProductosPrecioCompra NUMERIC(9, 2) = 0
AS
BEGIN
    -- Insertar un nuevo producto
    INSERT INTO Ventas.Productos (
        ProductosCodigo, 
        ProductosCategoriasCodigo,
        ProductosNombre, 
        ProductosDescripcion, 
        ProductosFechaCreacion,
        ProductosFechaVencimiento, 
        ProductosEstado, 
        ProductosStock, 
        ProductosPrecioVenta, 
        ProductosPrecioCompra
    )
    VALUES (
        @ProductosCodigo, 
        @ProductosCategoriasCodigo, 
        @ProductosNombre, 
        @ProductosDescripcion, 
        GETDATE(), 
        @ProductosFechaVencimiento, 
        @ProductosEstado, 
        @ProductosStock, 
        @ProductosPrecioVenta, 
        @ProductosPrecioCompra
    );
END;
GO
CREATE PROCEDURE spProductoEditar
    @ProductosCodigo NCHAR(5),  -- El código del producto a editar
    @ProductosCategoriasCodigo NCHAR(5),
    @ProductosNombre NVARCHAR(100),
    @ProductosDescripcion NVARCHAR(80),
    @ProductosFechaVencimiento DATE,
    @ProductosEstado NCHAR(1) = 'A',  -- Valor por defecto 'A' (Activo)
    @ProductosStock NUMERIC(9, 2) = 0, 
    @ProductosPrecioVenta NUMERIC(9, 2) = 0, 
    @ProductosPrecioCompra NUMERIC(9, 2) = 0
AS
BEGIN
    -- Actualizar un producto existente
    UPDATE Ventas.Productos
    SET 
        ProductosCategoriasCodigo = @ProductosCategoriasCodigo,
        ProductosNombre = @ProductosNombre,
        ProductosDescripcion = @ProductosDescripcion,
        ProductosFechaVencimiento = @ProductosFechaVencimiento,
        ProductosEstado = @ProductosEstado,
        ProductosStock = @ProductosStock,
        ProductosPrecioVenta = @ProductosPrecioVenta,
        ProductosPrecioCompra = @ProductosPrecioCompra
    WHERE 
        ProductosCodigo = @ProductosCodigo;
END;
GO


CREATE PROCEDURE spHabitacionConsultar
AS
BEGIN
	SELECT *
	FROM Empresa.Habitaciones  
END
GO


CREATE PROCEDURE spTipoHabitacionConsultar
AS
BEGIN
	SELECT *
	FROM Empresa.TipoHabitacion  
END
GO
CREATE PROCEDURE spTipoHabitacionInsertar
    @TipoHabitacionCodigo NCHAR(4),
    @TipoHabitacionTipo NVARCHAR(255),
    @TipoHabitacionCapacidad INT,
    @TipoHabitacionDescripcion NVARCHAR(255),
    @TipoHabitacionPrecio DECIMAL(10, 2),
    @TipoHabitacionEstado NCHAR(1) = 'A' -- Estado por defecto 'A' (Activo)
AS
BEGIN
    -- Insertar un nuevo tipo de habitación
    INSERT INTO Empresa.TipoHabitacion (
        TipoHabitacionCodigo,
        TipoHabitacionTipo,
        TipoHabitacionCapacidad,
        TipoHabitacionDescripcion,
        TipoHabitacionPrecio,
        TipoHabitacionEstado
    )
    VALUES (
        @TipoHabitacionCodigo,
        @TipoHabitacionTipo,
        @TipoHabitacionCapacidad,
        @TipoHabitacionDescripcion,
        @TipoHabitacionPrecio,
        @TipoHabitacionEstado
    );
END;
GO
CREATE PROCEDURE spTipoHabitacionEditar
    @TipoHabitacionCodigo NCHAR(4),  -- El código del tipo de habitación a editar
    @TipoHabitacionTipo NVARCHAR(255),
    @TipoHabitacionCapacidad INT,
    @TipoHabitacionDescripcion NVARCHAR(255),
    @TipoHabitacionPrecio DECIMAL(10, 2),
    @TipoHabitacionEstado NCHAR(1) = 'A'  -- Valor por defecto 'A' (Activo)
AS
BEGIN
    -- Actualizar un tipo de habitación existente
    UPDATE Empresa.TipoHabitacion
    SET 
        TipoHabitacionTipo = @TipoHabitacionTipo,
        TipoHabitacionCapacidad = @TipoHabitacionCapacidad,
        TipoHabitacionDescripcion = @TipoHabitacionDescripcion,
        TipoHabitacionPrecio = @TipoHabitacionPrecio,
        TipoHabitacionEstado = @TipoHabitacionEstado
    WHERE 
        TipoHabitacionCodigo = @TipoHabitacionCodigo;
END;
GO
  




   


CREATE PROCEDURE spServicioConsultar
AS
BEGIN
    SELECT *
	FROM Empresa.Servicios 
END;
GO
CREATE PROCEDURE spServicioInsertar
    @ServiciosCodigo NCHAR(10),
    @ServiciosCargosCodigo NCHAR(4),
    @ServiciosDescripcion NVARCHAR(100),
    @ServiciosPrecioVenta NUMERIC(9, 2),
    @ServiciosEstado NCHAR(1) = 'A'  -- Estado por defecto 'A' (Activo)
AS
BEGIN
    -- Insertar un nuevo servicio
    INSERT INTO Empresa.Servicios (
        ServiciosCodigo,
        ServiciosCargosCodigo,
        ServiciosDescripcion,
        ServiciosPrecioVenta,
        ServiciosEstado
    )
    VALUES (
        @ServiciosCodigo,
        @ServiciosCargosCodigo,
        @ServiciosDescripcion,
        @ServiciosPrecioVenta,
        @ServiciosEstado
    );
END;
GO
CREATE PROCEDURE spServicioEditar
    @ServiciosCodigo NCHAR(10),  -- El código del servicio a editar
    @ServiciosCargosCodigo NCHAR(4),
    @ServiciosDescripcion NVARCHAR(100),
    @ServiciosPrecioVenta NUMERIC(9, 2),
    @ServiciosEstado NCHAR(1) = 'A'  -- Valor por defecto 'A' (Activo)
AS
BEGIN
    -- Actualizar un servicio existente
    UPDATE Empresa.Servicios
    SET 
        ServiciosCargosCodigo = @ServiciosCargosCodigo,
        ServiciosDescripcion = @ServiciosDescripcion,
        ServiciosPrecioVenta = @ServiciosPrecioVenta,
        ServiciosEstado = @ServiciosEstado
    WHERE 
        ServiciosCodigo = @ServiciosCodigo;
END;
GO


CREATE PROCEDURE spIngresoProductosConsultar
AS
BEGIN 
SELECT * FROM  Ventas.IngresoProductos
END
GO

 CREATE PROCEDURE spIngresoProductoInsertar
    @IngresoProductosCodigo NCHAR(5),
    @IngresoProductosProveedorCodigo NCHAR(5),
    @IngresoProductosTipoComprobante NVARCHAR(20) = 'Factura',  -- Tipo de comprobante, por defecto 'Factura'
    @IngresoProductosFecha DATETIME,
    @IngresoProductosImpuesto DECIMAL(4,2)
AS
BEGIN
    -- Insertar un nuevo ingreso de productos
    INSERT INTO Ventas.IngresoProductos (
        IngresoProductosCodigo,
        IngresoProductosProveedorCodigo,
        IngresoProductosTipoComprobante,
        IngresoProductosFecha,
        IngresoProductosImpuesto
    )
    VALUES (
        @IngresoProductosCodigo,
        @IngresoProductosProveedorCodigo,
        @IngresoProductosTipoComprobante,
        @IngresoProductosFecha,
        @IngresoProductosImpuesto
    );
END;
GO

CREATE PROCEDURE spIngresoProductoEditar
    @IngresoProductosCodigo NCHAR(5),  -- El código del ingreso de producto a editar
    @IngresoProductosProveedorCodigo NCHAR(5),
    @IngresoProductosTipoComprobante NVARCHAR(20) = 'Factura',  -- Tipo de comprobante, por defecto 'Factura'
    @IngresoProductosFecha DATETIME,
    @IngresoProductosImpuesto DECIMAL(4,2)
AS
BEGIN
    -- Actualizar un ingreso de producto existente
    UPDATE Ventas.IngresoProductos
    SET 
        IngresoProductosProveedorCodigo = @IngresoProductosProveedorCodigo,
        IngresoProductosTipoComprobante = @IngresoProductosTipoComprobante,
        IngresoProductosFecha = @IngresoProductosFecha,
        IngresoProductosImpuesto = @IngresoProductosImpuesto
    WHERE 
        IngresoProductosCodigo = @IngresoProductosCodigo;
END;
GO
 

CREATE PROCEDURE spDetalleVentaConsultar
AS
BEGIN 
SELECT * FROM  Ventas.Venta AS V
JOIN Ventas.DetalleVentaProductos AS DVP
ON DVP.DetalleVentaProductosVentaCodigo = V.VentaCodigo
END
GO


CREATE PROCEDURE spDetalleIngresoConsultar
AS
BEGIN 
SELECT * FROM  Ventas.DetalleIngreso
END
GO


CREATE PROCEDURE spDetalleIngresoInsertar
    @DetalleIngresoCodigo NVARCHAR(5),
    @DetalleIngresoProductosCodigo NCHAR(5),
    @DetalleIngresoIngresoProductosCodigo NCHAR(5),
    @DetalleIngresoStockInicial INT,
    @DetalleIngresoStockActual INT,
    @DetalleIngresoFechaProduccion DATE,
    @DetalleIngresoFechaVencimiento DATE,
    @DetalleIngresoPrecioCompra DECIMAL(11,2),
    @DetalleIngresoPrecioVenta DECIMAL(11,2)
AS
BEGIN
    INSERT INTO Ventas.DetalleIngreso (
        DetalleIngresoCodigo,
        DetalleIngresoProductosCodigo,
        DetalleIngresoIngresoProductosCodigo,
        DetalleIngresoStockInicial,
        DetalleIngresoStockActual,
        DetalleIngresoFechaProduccion,
        DetalleIngresoFechaVencimiento,
        DetalleIngresoPrecioCompra,
        DetalleIngresoPrecioVenta
    )
    VALUES (
        @DetalleIngresoCodigo,
        @DetalleIngresoProductosCodigo,
        @DetalleIngresoIngresoProductosCodigo,
        @DetalleIngresoStockInicial,
        @DetalleIngresoStockActual,
        @DetalleIngresoFechaProduccion,
        @DetalleIngresoFechaVencimiento,
        @DetalleIngresoPrecioCompra,
        @DetalleIngresoPrecioVenta
    );
END;
GO
 


CREATE PROCEDURE spDetalleIngresoEditar
    @DetalleIngresoCodigo NVARCHAR(5),
    @DetalleIngresoProductosCodigo NCHAR(5),
    @DetalleIngresoIngresoProductosCodigo NCHAR(5),
    @DetalleIngresoStockInicial INT,
    @DetalleIngresoStockActual INT,
    @DetalleIngresoFechaProduccion DATE,
    @DetalleIngresoFechaVencimiento DATE,
    @DetalleIngresoPrecioCompra DECIMAL(11,2),
    @DetalleIngresoPrecioVenta DECIMAL(11,2)
AS
BEGIN
    UPDATE Ventas.DetalleIngreso
    SET 
        DetalleIngresoProductosCodigo = @DetalleIngresoProductosCodigo,
        DetalleIngresoIngresoProductosCodigo = @DetalleIngresoIngresoProductosCodigo,
        DetalleIngresoStockInicial = @DetalleIngresoStockInicial,
        DetalleIngresoStockActual = @DetalleIngresoStockActual,
        DetalleIngresoFechaProduccion = @DetalleIngresoFechaProduccion,
        DetalleIngresoFechaVencimiento = @DetalleIngresoFechaVencimiento,
        DetalleIngresoPrecioCompra = @DetalleIngresoPrecioCompra,
        DetalleIngresoPrecioVenta = @DetalleIngresoPrecioVenta
    WHERE 
        DetalleIngresoCodigo = @DetalleIngresoCodigo;
END;
GO

CREATE PROCEDURE spDetalleVentaProductoInsertar
    @DetalleVentaProductosProductosCodigo NCHAR(5),
    @DetalleVentaProductosVentaCodigo NCHAR(5),
    @DetalleVentaProductosCantidad INTEGER,
    @DetalleVentaProductosPrecioVenta DECIMAL(11,2),
    @DetalleVentaProductosDescuento DECIMAL(11,2)
AS
BEGIN
    DECLARE @UltimoCodigo INT;
    DECLARE @NuevoCodigo NCHAR(7);

    -- Obtener el último código de DetalleVentaProductos generado
    SELECT TOP 1 @UltimoCodigo = CAST(SUBSTRING(DetalleVentaProductosCodigo, 4, 3) AS INT)
    FROM Ventas.DetalleVentaProductos
    ORDER BY DetalleVentaProductosCodigo DESC;

    -- Si no hay registros previos, empezar desde 1
    IF @UltimoCodigo IS NULL
    BEGIN
        SET @UltimoCodigo = 0;
    END

    -- Generar el nuevo código de DetalleVentaProducto (DVP001, DVP002, etc.)
    SET @NuevoCodigo = 'DVP' + FORMAT(@UltimoCodigo + 1, '000');

    -- Insertar el nuevo detalle de venta de producto
    INSERT INTO Ventas.DetalleVentaProductos (
        DetalleVentaProductosCodigo,
        DetalleVentaProductosProductosCodigo,
        DetalleVentaProductosVentaCodigo,
        DetalleVentaProductosCantidad,
        DetalleVentaProductosPrecioVenta,
        DetalleVentaProductosDescuento
    )
    VALUES (
        @NuevoCodigo,   -- Código generado automáticamente
        @DetalleVentaProductosProductosCodigo,
        @DetalleVentaProductosVentaCodigo,
        @DetalleVentaProductosCantidad,
        @DetalleVentaProductosPrecioVenta,
        @DetalleVentaProductosDescuento
    );

    UPDATE Ventas.Productos
    SET ProductosStock = ProductosStock - @DetalleVentaProductosCantidad
    WHERE ProductosCodigo = @DetalleVentaProductosProductosCodigo;

	
END;
GO

CREATE PROCEDURE spVentaInsertar
    @VentaCodigo NCHAR(5),
    @VentaClientesCodigo NCHAR(5),
    @VentaEmpleadosCodigo NCHAR(4),
    @VentaTipoComprobante NVARCHAR(20),
 
    @VentaSubtotal DECIMAL(9,2)
AS
BEGIN
    -- Declarar la variable @VentaValorPorcentajeIGV si quieres usarla internamente
    DECLARE @VentaValorPorcentajeIGV DECIMAL(9,4);
    
    -- Asignar el valor del IGV
    SET @VentaValorPorcentajeIGV = 0.18;

    -- Insertar la venta
    INSERT INTO Ventas.Venta (
        VentaCodigo,
        VentaClientesCodigo,
        VentaEmpleadosCodigo,
        VentaTipoComprobante,
 
        VentaSubtotal,
        VentaValorPorcentajeIGV
    )
    VALUES (
        @VentaCodigo,
        @VentaClientesCodigo,
        @VentaEmpleadosCodigo,
        @VentaTipoComprobante,
 
        @VentaSubtotal,
        @VentaValorPorcentajeIGV
    );
END;
GO


CREATE PROCEDURE spVentaEditar
    @VentaCodigo NCHAR(5),
    @VentaClientesCodigo NCHAR(5),
    @VentaEmpleadosCodigo NCHAR(4),
    @VentaTipoComprobante NVARCHAR(20),
    @VentaFechaHora DATETIME,
    @VentaSubtotal DECIMAL(9,2),
    @VentaValorPorcentajeIGV DECIMAL(9,4)
AS
BEGIN
    UPDATE Ventas.Venta
    SET 
        VentaClientesCodigo = @VentaClientesCodigo,
        VentaEmpleadosCodigo = @VentaEmpleadosCodigo,
        VentaTipoComprobante = @VentaTipoComprobante,
        VentaFechaHora = @VentaFechaHora,
        VentaSubtotal = @VentaSubtotal,
        VentaValorPorcentajeIGV = @VentaValorPorcentajeIGV
    WHERE 
        VentaCodigo = @VentaCodigo;
END;
GO



CREATE PROCEDURE spProductosConsultar
AS
BEGIN 
SELECT 
P.ProductosCodigo,
P.ProductosStock,
P.ProductosPrecioVenta
FROM  Ventas.Productos AS P
END
GO

CREATE PROCEDURE spDetalleVentaProductosConsultar
AS
BEGIN 
SELECT * FROM  Ventas.DetalleVentaProductos
END
GO



CREATE PROCEDURE spDetalleVentaProductoEditar
    @DetalleVentaProductosCodigo NCHAR(7),
    @DetalleVentaProductosProductosCodigo NCHAR(5),
    @DetalleVentaProductosVentaCodigo NCHAR(5),
    @DetalleVentaProductosCantidad INTEGER,
    @DetalleVentaProductosPrecioVenta DECIMAL(11,2),
    @DetalleVentaProductosDescuento DECIMAL(11,2)
AS
BEGIN
    UPDATE Ventas.DetalleVentaProductos
    SET 
        DetalleVentaProductosProductosCodigo = @DetalleVentaProductosProductosCodigo,
        DetalleVentaProductosVentaCodigo = @DetalleVentaProductosVentaCodigo,
        DetalleVentaProductosCantidad = @DetalleVentaProductosCantidad,
        DetalleVentaProductosPrecioVenta = @DetalleVentaProductosPrecioVenta,
        DetalleVentaProductosDescuento = @DetalleVentaProductosDescuento
    WHERE 
        DetalleVentaProductosCodigo = @DetalleVentaProductosCodigo;
END;
GO

 



CREATE PROCEDURE spDetalleVentaServiciosConsultar
AS
BEGIN 
SELECT * FROM  Ventas.DetalleVentaServicios
END
GO


CREATE PROCEDURE spDetalleVentaServicioInsertar
    @DetalleVentaServiciosServiciosCodigo NCHAR(10),
    @DetalleVentaServiciosVentaCodigo NCHAR(5),
    @DetalleVentaServiciosServiciosPrecioVenta NUMERIC(9,2)
AS
BEGIN
    DECLARE @UltimoCodigo INT;
    DECLARE @NuevoCodigo NCHAR(7);

    -- Obtener el último código de DetalleVentaServicios generado
    SELECT TOP 1 @UltimoCodigo = CAST(SUBSTRING(DetalleVentaServicios, 4, 3) AS INT)
    FROM Ventas.DetalleVentaServicios
    ORDER BY DetalleVentaServicios DESC;

    -- Si no hay registros previos, empezar desde 1
    IF @UltimoCodigo IS NULL
    BEGIN
        SET @UltimoCodigo = 0;
    END

    -- Generar el nuevo código de DetalleVentaServicios (DVS001, DVS002, etc.)
    SET @NuevoCodigo = 'DVS' + FORMAT(@UltimoCodigo + 1, '000');

    -- Insertar el nuevo detalle de venta de servicio
    INSERT INTO Ventas.DetalleVentaServicios (
        DetalleVentaServicios,
        DetalleVentaServiciosServiciosCodigo,
        DetalleVentaServiciosVentaCodigo,
        DetalleVentaServiciosServiciosPrecioVenta
    )
    VALUES (
        @NuevoCodigo,   -- Código generado automáticamente
        @DetalleVentaServiciosServiciosCodigo,
        @DetalleVentaServiciosVentaCodigo,
        @DetalleVentaServiciosServiciosPrecioVenta
    );
END;
GO


CREATE PROCEDURE spDetalleVentaServicioEditar
    @DetalleVentaServicios NCHAR(7),
    @DetalleVentaServiciosServiciosCodigo NCHAR(10),
    @DetalleVentaServiciosVentaCodigo NCHAR(5),
    @DetalleVentaServiciosServiciosPrecioVenta NUMERIC(9,2)
AS
BEGIN
    UPDATE Ventas.DetalleVentaServicios
    SET 
        DetalleVentaServiciosServiciosCodigo = @DetalleVentaServiciosServiciosCodigo,
        DetalleVentaServiciosVentaCodigo = @DetalleVentaServiciosVentaCodigo,
        DetalleVentaServiciosServiciosPrecioVenta = @DetalleVentaServiciosServiciosPrecioVenta
    WHERE 
        DetalleVentaServicios = @DetalleVentaServicios;
END;
GO



CREATE PROCEDURE spBoletaConsultar
AS
BEGIN 
SELECT * FROM  Ventas.Boleta
END
GO

CREATE PROCEDURE spReporteComprobante
    @VentaCodigo NCHAR(5)
AS
BEGIN
    -- Recuperar los datos de la venta
    SELECT 
        v.VentaCodigo,
        v.VentaClientesCodigo,
        v.VentaEmpleadosCodigo,
        v.VentaTipoComprobante,
        v.VentaFechaHora,
        v.VentaSubtotal,
        v.VentaValorPorcentajeIGV,
        v.VentaMontoIGV,
        v.VentaTotal,
        c.ClientesNombre,  -- Asumiendo que hay una tabla de Clientes
        e.EmpleadosNombreCompleto  -- Asumiendo que hay una tabla de Empleados
    FROM 
        Ventas.Venta v
        JOIN Ventas.Clientes c ON v.VentaClientesCodigo = c.ClientesCodigo
        JOIN Personal.Empleados e ON v.VentaEmpleadosCodigo = e.EmpleadosCodigo
    WHERE 
        v.VentaCodigo = @VentaCodigo;

    -- Recuperar los detalles de la venta (productos, cantidades, precios, etc.)
    SELECT 
        d.DetalleVentaProductosCodigo,
        d.DetalleVentaProductosProductosCodigo,
        p.ProductosNombre,  -- Asumiendo que hay una tabla de Productos
        d.DetalleVentaProductosCantidad,
        d.DetalleVentaProductosPrecioVenta,
        d.DetalleVentaProductosDescuento
    FROM 
        Ventas.DetalleVentaProductos d
        JOIN Ventas.Productos p ON d.DetalleVentaProductosProductosCodigo = p.ProductosCodigo
    WHERE 
        d.DetalleVentaProductosVentaCodigo = @VentaCodigo;
END
GO




CREATE PROCEDURE spBoletaInsertar
    @BoletaVentaCodigo NCHAR(5),
    @BoletaSubtotal DECIMAL(9, 2),
    @BoletaValorPorcentajeIGV DECIMAL(9, 4),
    @BoletaClienteCodigo NCHAR(5),
    @BoletaClienteRUC NVARCHAR(20)
AS
BEGIN
    DECLARE @BoletaCodigo NCHAR(5);
    DECLARE @UltimoCodigo INT;
    DECLARE @BoletaSerie NVARCHAR(5) = 'B01';  -- Serie predeterminada
    DECLARE @BoletaNumeroComprobante NVARCHAR(10) = '001';  -- Número de comprobante predeterminado

    -- Obtener el último código de boleta con la misma serie para generar el siguiente
    SELECT TOP 1 @UltimoCodigo = CAST(SUBSTRING(BoletaCodigo, 2, 3) AS INT)
    FROM Ventas.Boleta
    WHERE BoletaSerie = @BoletaSerie
    ORDER BY BoletaCodigo DESC;

    -- Si no hay boletas con esa serie, empezar desde 1
    IF @UltimoCodigo IS NULL
    BEGIN
        SET @UltimoCodigo = 0;
    END

    -- Generar el nuevo código de boleta (por ejemplo, B01001, B01002, ...)
    SET @BoletaCodigo = @BoletaSerie + FORMAT(@UltimoCodigo + 1, '000');

    -- Insertar la boleta
    INSERT INTO Ventas.Boleta (
        BoletaCodigo,
        BoletaVentaCodigo,
        BoletaSerie,
        BoletaNumeroComprobante,
        BoletaFecha,
        BoletaSubtotal,
        BoletaValorPorcentajeIGV,
        BoletaClienteCodigo,
        BoletaClienteRUC
    )
    VALUES (
        @BoletaCodigo,
        @BoletaVentaCodigo,
        @BoletaSerie,
        @BoletaNumeroComprobante,
        GETDATE(),  -- Fecha actual
        @BoletaSubtotal,
        @BoletaValorPorcentajeIGV,
        @BoletaClienteCodigo,
        @BoletaClienteRUC
    );
END;
GO



CREATE PROCEDURE spBoletaEditar
    @BoletaCodigo NCHAR(5),
    @BoletaVentaCodigo NCHAR(5),
    @BoletaSerie NVARCHAR(5),
    @BoletaNumeroComprobante NVARCHAR(10),
    @BoletaSubtotal DECIMAL(9, 2),
    @BoletaValorPorcentajeIGV DECIMAL(9, 4),
    @BoletaClienteCodigo NCHAR(5),
    @BoletaClienteRUC NVARCHAR(20)
AS
BEGIN
    UPDATE Ventas.Boleta
    SET 
        BoletaVentaCodigo = @BoletaVentaCodigo,
        BoletaSerie = @BoletaSerie,
        BoletaNumeroComprobante = @BoletaNumeroComprobante,
        BoletaSubtotal = @BoletaSubtotal,
        BoletaValorPorcentajeIGV = @BoletaValorPorcentajeIGV,
        BoletaClienteCodigo = @BoletaClienteCodigo,
        BoletaClienteRUC = @BoletaClienteRUC
    WHERE 
        BoletaCodigo = @BoletaCodigo;
END;
GO



CREATE PROCEDURE spFacturaConsultar
AS
BEGIN 
SELECT * FROM  Ventas.Facturas
END
GO




CREATE PROCEDURE spFacturaEditar
    @FacturasCodigo NCHAR(5),
    @FacturasNumeroSerie NCHAR(4),
    @FacturasNumeroFactura NCHAR(7),
    @FacturasVentaCodigo NCHAR(5),
    @FacturasSubtotal DECIMAL(9, 2),
    @FacturasValorPorcentajeIGV DECIMAL(9, 4),
    @FacturasClienteCodigo NCHAR(5),
    @FacturasClienteRUC NVARCHAR(20)
AS
BEGIN
    UPDATE Ventas.Facturas
    SET 
        FacturasNumeroSerie = @FacturasNumeroSerie,
        FacturasNumeroFactura = @FacturasNumeroFactura,
        FacturasVentaCodigo = @FacturasVentaCodigo,
        FacturasSubtotal = @FacturasSubtotal,
        FacturasValorPorcentajeIGV = @FacturasValorPorcentajeIGV,
        FacturasClienteCodigo = @FacturasClienteCodigo,
        FacturasClienteRUC = @FacturasClienteRUC
    WHERE 
        FacturasCodigo = @FacturasCodigo;
END;
GO


CREATE PROCEDURE spFacturaInsertar
    @FacturasVentaCodigo NCHAR(5),
    @FacturasSubtotal DECIMAL(9, 2),
    @FacturasValorPorcentajeIGV DECIMAL(9, 4),
    @FacturasClienteCodigo NCHAR(5),
    @FacturasClienteRUC NVARCHAR(20)
AS
BEGIN
    DECLARE @FacturasCodigo NCHAR(5);
    DECLARE @UltimoNumeroFactura INT;
    DECLARE @FacturasNumeroSerie NCHAR(4) = 'A01';  -- Serie predeterminada
    DECLARE @FacturasNumeroFactura NVARCHAR(4);

    -- Obtener el último número de factura para generar el siguiente
    SELECT TOP 1 @UltimoNumeroFactura = CAST(FacturasNumeroFactura AS INT)
    FROM Ventas.Facturas
    WHERE FacturasNumeroSerie = @FacturasNumeroSerie
    ORDER BY FacturasNumeroFactura DESC;

    -- Si no hay facturas con esa serie, empezar desde 0001
    IF @UltimoNumeroFactura IS NULL
    BEGIN
        SET @UltimoNumeroFactura = 0;
    END

    -- Generar el nuevo número de factura
    SET @FacturasNumeroFactura = FORMAT(@UltimoNumeroFactura + 1, '0000');

    -- Generar el código de factura
    SET @FacturasCodigo = 'F' + @FacturasNumeroSerie + @FacturasNumeroFactura;

    -- Insertar la factura
    INSERT INTO Ventas.Facturas (
        FacturasCodigo,
        FacturasNumeroSerie,
        FacturasNumeroFactura,
        FacturasVentaCodigo,
        FacturasFecha,
        FacturasSubtotal,
        FacturasValorPorcentajeIGV,
        FacturasClienteCodigo,
        FacturasClienteRUC
    )
    VALUES (
        @FacturasCodigo,
        @FacturasNumeroSerie,
        @FacturasNumeroFactura,
        @FacturasVentaCodigo,
        GETDATE(),  -- Fecha actual
        @FacturasSubtotal,
        @FacturasValorPorcentajeIGV,
        @FacturasClienteCodigo,
        @FacturasClienteRUC
    );
END;
GO













  

 


  