-- Date: 2023/10/31 12:00:00

-- ============================================= EMPLEADOS =============================================

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarEmpleadoYUsuario]
    @apellido VARCHAR(50),
    @nombre VARCHAR(50),
    @dni VARCHAR(10),
    @fecha_nacimiento DATE,
    @fecha_ingreso DATE,
    @telefono VARCHAR(50),
    @email VARCHAR(50),
    @direccion VARCHAR(50),
    @localidad VARCHAR(50),
    @provincia VARCHAR(50),
    @perfil VARCHAR(20),
    @estado BIT,
    @contrasenia VARCHAR(50)
AS
BEGIN
    DECLARE @legajo VARCHAR(10);
    DECLARE @ultimoLegajo INT;

    -- Determinar el tipo de empleado (M para mesero, G para gerente)
    SET @legajo = 'E' + (CASE WHEN @perfil = 'gerente' THEN 'G' ELSE 'M' END);

    -- Buscar el último legajo de empleados del mismo tipo (M o G)
    SELECT TOP 1 @ultimoLegajo = CAST(SUBSTRING(legajo, 3, 4) AS INT)
    FROM empleados
    WHERE SUBSTRING(legajo, 1, 2) = @legajo
    ORDER BY CAST(SUBSTRING(legajo, 3, 4) AS INT) DESC;

    -- Incrementar el número del legajo
    SET @ultimoLegajo = ISNULL(@ultimoLegajo, 0) + 1;

    -- Formatear el número del legajo a 4 dígitos
    SET @legajo = @legajo + RIGHT('0000' + CAST(@ultimoLegajo AS VARCHAR), 4);

    -- Insertar el empleado
    INSERT INTO empleados (legajo, apellido, nombre, dni, fecha_nacimiento, fecha_ingreso, telefono, email, direccion, localidad, provincia, perfil, estado)
    VALUES (@legajo, @apellido, @nombre, @dni, @fecha_nacimiento, @fecha_ingreso, @telefono, @email, @direccion, @localidad, @provincia, @perfil, @estado);

    -- Obtener el ID del empleado recién insertado
    DECLARE @empleado_id INT;
    SET @empleado_id = SCOPE_IDENTITY();

    -- Insertar el usuario asociado al empleado
    INSERT INTO usuarios (empleado_id, contrasenia)
    VALUES (@empleado_id, @contrasenia);
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarEmpleado]
    @id INT,
    @legajo VARCHAR(10),
    @apellido VARCHAR(50),
    @nombre VARCHAR(50),
    @dni VARCHAR(10),
    @fecha_nacimiento DATE,
    @fecha_ingreso DATE,
    @telefono VARCHAR(50),
    @email VARCHAR(50),
    @direccion VARCHAR(50),
    @localidad VARCHAR(50),
    @provincia VARCHAR(50),
    @perfil VARCHAR(20),
    @estado BIT,
    @contrasenia VARCHAR(50) = NULL -- Parámetro opcional para la contraseña
AS
BEGIN
    -- Actualizar el empleado
    UPDATE empleados
    SET
        legajo = @legajo,
        apellido = @apellido,
        nombre = @nombre,
        dni = @dni,
        fecha_nacimiento = @fecha_nacimiento,
        fecha_ingreso = @fecha_ingreso,
        telefono = @telefono,
        email = @email,
        direccion = @direccion,
        localidad = @localidad,
        provincia = @provincia,
        perfil = @perfil,
        estado = @estado
    WHERE id = @id;

    -- Actualizar la contraseña del usuario si se proporciona un valor para "contrasenia"
    IF @contrasenia IS NOT NULL
    BEGIN
        UPDATE usuarios
        SET contrasenia = @contrasenia
        WHERE empleado_id = @id;
    END
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarEmpleado]
    @id INT
AS
BEGIN
    UPDATE empleados
    SET estado = 0, fecha_egreso = GETDATE(), deleted_at = GETDATE()
    WHERE id = @id;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerEmpleadoPorID]
    @id INT
AS
BEGIN
    SELECT *
    FROM empleados
    WHERE id = @id;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerTodosLosEmpleados]
AS
BEGIN
    SELECT * FROM empleados
    WHERE deleted_at IS NULL;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerEmpleadosEliminados]
AS
BEGIN
	SELECT * FROM empleados
    WHERE deleted_at IS NOT NULL;
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRestaurarEmpleado]
	@id INT
AS
BEGIN
	UPDATE empleados
	SET estado = 1, fecha_egreso = NULL, deleted_at = NULL
	WHERE id = @id;
END

-- ============================================= INSUMOS =============================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarInsumo]
    @categoria_id INT,
    @nombre VARCHAR(50),
    @stock INT,
    @stock_minimo INT,
    @precio DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO insumos (categoria_id, nombre, stock, stock_minimo, precio)
    VALUES (@categoria_id, @nombre, @stock, @stock_minimo, @precio)
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarInsumo]
    @id INT,
    @categoria_id INT,
    @nombre VARCHAR(50),
    @stock INT,
    @stock_minimo INT,
    @precio DECIMAL(10, 2)
AS
BEGIN
    UPDATE insumos
    SET
        categoria_id = @categoria_id,
        nombre = @nombre,
        stock = @stock,
        stock_minimo = @stock_minimo,
        precio = @precio
    WHERE id = @id
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarInsumo]
    @id INT
AS
BEGIN
    UPDATE insumos
    SET estado = 0, deleted_at = GETDATE()
    WHERE id = @id;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerTodosLosInsumos]
AS
BEGIN
    select i.id as id, i.nombre as nombre, categoria_id, c.nombre as categoria_nombre, stock, stock_minimo, precio, estado from insumos i Inner Join categorias c ON i.categoria_id = c.id where i.estado = 1
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerInsumoPorID]
 @id INT
AS
BEGIN
    select i.id as id, i.nombre as nombre, categoria_id, c.nombre as categoria_nombre, stock, stock_minimo, i.precio as precio, estado from insumos i Inner Join categorias c ON i.categoria_id = c.id where i.id = @id
END
GO

-- ============================================= CATEGORIAS =============================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarCategoria]
    @nombre VARCHAR(50)
AS
BEGIN
    INSERT INTO categorias (nombre)
    VALUES (@nombre);
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarCategoria]
    @id INT,
    @nombre VARCHAR(50)
AS
BEGIN
    UPDATE categorias
    SET nombre = @nombre
    WHERE id = @id;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarCategoria]
    @id INT
AS
BEGIN
    UPDATE categorias
    SET deleted_at = GETDATE()
    WHERE id = @id;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerTodasLasCategorias]
AS
BEGIN
	select id, nombre from categorias
END
GO

-- ============================================= MESAS =============================================

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarMesa]
    @numero INT,
    @capacidad INT,
    @estado BIT = 1
AS
BEGIN
    DECLARE @mesa_id INT;
    DECLARE @deleted_at DATETIME;

    SELECT @mesa_id = id, @deleted_at = deleted_at
    FROM mesas
	WHERE numero = @numero


    IF @mesa_id IS NOT NULL
    BEGIN
        IF @deleted_at IS NULL
        BEGIN
            RAISERROR('001:Ya existe una mesa con ese número', 16, 1);
        END
        ELSE
        BEGIN
            UPDATE mesas
            SET deleted_at = NULL, capacidad = @capacidad, estado = 1
            WHERE id = @mesa_id;
		END
    END
    ELSE
    BEGIN
        -- Si no existe una mesa eliminada con ese número, crear una nueva mesa
        INSERT INTO mesas (numero, capacidad, estado)
        VALUES (@numero, @capacidad, @estado);
    END
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarMesa]
    @id INT,
    @numero INT,
    @capacidad INT,
    @estado BIT = 1
AS
BEGIN
    DECLARE @mesa_id INT;
    DECLARE @deleted_at DATETIME;

    SELECT @mesa_id = id, @deleted_at = deleted_at
    FROM mesas
	WHERE numero = @numero

    IF @mesa_id IS NOT NULL
    BEGIN
        IF @deleted_at IS NULL
        BEGIN
            RAISERROR('001:Ya existe una mesa con ese número', 16, 1);
        END
        ELSE
        BEGIN
            UPDATE mesas
            SET numero = null
            WHERE id = @mesa_id;

            UPDATE mesas
            SET numero = @numero,
				capacidad = @capacidad,
				estado = @estado
			WHERE id = @id;
		END
    END
    ELSE
    BEGIN
    UPDATE mesas
    SET
        numero = @numero,
        capacidad = @capacidad,
        estado = @estado
    WHERE id = @id;
    END
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarMesa]
    @id INT
AS
BEGIN
    UPDATE mesas
    SET estado = 0, deleted_at = GETDATE()
    WHERE id = @id;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerMesaPorID]
    @id INT
AS
BEGIN
    SELECT *
    FROM mesas
    WHERE id = @id;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerTodasLasMesas]
AS
BEGIN
    SELECT *
    FROM mesas
    WHERE deleted_at IS NULL;
END
GO

-- ============================================= MESAS ASIGNADAS =============================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAsignarMesa]
    @mesa_id INT,
    @empleado_id INT,
    @fecha DATE,
    @turno VARCHAR(20)
AS
BEGIN
    INSERT INTO mesas_asignadas (mesa_id, empleado_id, fecha, turno)
    VALUES (@mesa_id, @empleado_id, @fecha, @turno);
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarMesaAsignada]
    @id INT,
    @mesa_id INT,
    @empleado_id INT,
    @fecha DATE,
    @turno VARCHAR(20)
AS
BEGIN
    UPDATE mesas_asignadas
    SET
        mesa_id = @mesa_id,
        empleado_id = @empleado_id,
        fecha = @fecha,
        turno = @turno
    WHERE id = @id;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarMesaAsignada]
    @id INT
AS
BEGIN
    UPDATE mesas_asignadas
    SET deleted_at = GETDATE()
    WHERE id = @id;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerMesaAsignadaPorId]
    @id INT
AS
BEGIN
    SELECT *
    FROM mesas_asignadas
    WHERE id = @id;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerTodasLasMesasAsignadas]
AS
BEGIN
    SELECT *
    FROM mesas_asignadas;
END


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerMesasAsignadasPorEmpleadoTurnoFecha]
    @empleado_id INT,
    @turno VARCHAR(20) = NULL,
    @fecha DATE
AS
BEGIN
    IF @turno IS NOT NULL
    BEGIN
        SELECT *
        FROM mesas_asignadas
        WHERE empleado_id = @empleado_id
        AND turno = @turno
        AND fecha = @fecha
        AND deleted_at IS NULL;
    END
    ELSE
    BEGIN
        IF @fecha IS NOT NULL
        BEGIN
            SELECT *
            FROM mesas_asignadas
            WHERE empleado_id = @empleado_id
            AND fecha = @fecha
            AND deleted_at IS NULL;
        END
        ELSE
        BEGIN
            SELECT *
            FROM mesas_asignadas
            WHERE empleado_id = @empleado_id
            AND deleted_at IS NULL;
        END
    END
END
GO

-- ============================================= PEDIDOS =============================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAbrirPedido]
    @mesa_asignada_id INT,
    @apertura DATE,
    @cierre DATE = NULL,
    @estado VARCHAR(20) = 'abierto'
AS
BEGIN
    INSERT INTO pedidos (mesa_asignada_id, apertura, cierre, estado)
    VALUES (@mesa_asignada_id, @apertura, @cierre, @estado);
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarPedido]
    @id INT,
    @mesa_asignada_id INT,
    @apertura DATE,
    @cierre DATE,
    @estado VARCHAR(20)
AS
BEGIN
    UPDATE pedidos
    SET
        mesa_asignada_id = @mesa_asignada_id,
        apertura = @apertura,
        cierre = @cierre,
        estado = @estado
    WHERE id = @id;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarPedido]
    @id INT
AS
BEGIN
    UPDATE pedidos
    SET deleted_at = GETDATE()
    WHERE id = @id;
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerPedidoPorID]
    @id INT
AS
BEGIN
    SELECT *
    FROM pedidos
    WHERE id = @id;
END
GO

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerTodosLosPedidos]
AS
BEGIN
    SELECT *
    FROM pedidos
    WHERE deleted_at IS NULL;
END
GO

-- ============================================= PEDIDOS DETALLE =============================================

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarDetallePedido]
    @menu_insumo_id INT,
    @pedido_id INT,
    @cantidad INT
AS
BEGIN
    INSERT INTO pedidos_detalle (menu_insumo_id, pedido_id, cantidad)
    VALUES (@menu_insumo_id, @pedido_id, @cantidad);
END
GO

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarDetallePedido]
    @id INT,
    @menu_insumo_id INT,
    @pedido_id INT,
    @cantidad INT
AS
BEGIN
    UPDATE pedidos_detalle
    SET
        menu_insumo_id = @menu_insumo_id,
        pedido_id = @pedido_id,
        cantidad = @cantidad
    WHERE id = @id;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarDetallePedido]
    @id INT
AS
BEGIN
    UPDATE pedidos_detalle
    SET deleted_at = GETDATE()
    WHERE id = @id;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerDetallePedidoPorID]
    @id INT
AS
BEGIN
    SELECT *
    FROM pedidos_detalle
    WHERE id = @id;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerDetallePedidoPorPedidoID]
    @pedido_id INT
AS
BEGIN
    SELECT *
    FROM pedidos_detalle
    WHERE pedido_id = @pedido_id
    AND deleted_at IS NULL;
END
GO

-- ============================================= FACTURAS =============================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarFactura]
    @pedido_id INT,
    @fecha DATE,
    @total DECIMAL(10,2)
AS
BEGIN
    INSERT INTO facturas (pedido_id, fecha, total)
    VALUES (@pedido_id, @fecha, @total);
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarFactura]
    @id INT,
    @pedido_id INT,
    @fecha DATE,
    @total DECIMAL(10,2)
AS
BEGIN
    UPDATE facturas
    SET
        pedido_id = @pedido_id,
        fecha = @fecha,
        total = @total
    WHERE id = @id;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarFactura]
    @id INT
AS
BEGIN
    UPDATE facturas
    SET deleted_at = GETDATE()
    WHERE id = @id;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerFacturaPorID]
    @id INT
AS
BEGIN
    SELECT *
    FROM facturas
    WHERE id = @id;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerTodasLasFacturas]
AS
BEGIN
    SELECT *
    FROM facturas
    WHERE deleted_at IS NULL;
END
GO

-- ============================================= FACTURAS PAGOS =============================================

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarPagoFactura]
    @factura_id INT,
    @metodo VARCHAR(20),
    @monto DECIMAL(10,2)
AS
BEGIN
    INSERT INTO factura_pagos (factura_id, metodo, monto)
    VALUES (@factura_id, @metodo, @monto);
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarPagoFactura]
    @id INT,
    @factura_id INT,
    @metodo VARCHAR(20),
    @monto DECIMAL(10,2)
AS
BEGIN
    UPDATE factura_pagos
    SET
        factura_id = @factura_id,
        metodo = @metodo,
        monto = @monto
    WHERE id = @id;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarPagoFactura]
    @id INT
AS
BEGIN
    UPDATE factura_pagos
    SET deleted_at = GETDATE()
    WHERE id = @id;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerPagoFacturaPorID]
    @id INT
AS
BEGIN
    SELECT *
    FROM factura_pagos
    WHERE id = @id;
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerPagosFacturaPorFacturaID]
    @factura_id INT
AS
BEGIN
    SELECT *
    FROM factura_pagos
    WHERE factura_id = @factura_id
    AND deleted_at IS NULL;
END
GO

