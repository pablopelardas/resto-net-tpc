USE "RESTO-NET-TPC"
GO

-- ================== EMPLEADOS ==================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spObtenerTodosLosEmpleados
AS
BEGIN
    SELECT * FROM empleados WHERE deleted_at IS NULL
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spAgregarEmpleadoYUsuario
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
    DECLARE @legajo VARCHAR(10)
    DECLARE @ultimoLegajo INT

    -- Determinar el tipo de empleado (M para mesero, G para gerente)
    SET @legajo = 'E' + (CASE WHEN @perfil = 'gerente' THEN 'G' ELSE 'M' END)

    -- Buscar el último legajo de empleados del mismo tipo (M o G)
    SELECT TOP 1 @ultimoLegajo = CAST(SUBSTRING(legajo, 3, 4) AS INT)
    FROM empleados
    WHERE SUBSTRING(legajo, 1, 2) = @legajo
    ORDER BY CAST(SUBSTRING(legajo, 3, 4) AS INT) DESC

    -- Incrementar el número del legajo
    SET @ultimoLegajo = ISNULL(@ultimoLegajo, 0) + 1

    -- Formatear el número del legajo a 4 dígitos
    SET @legajo = @legajo + RIGHT('0000' + CAST(@ultimoLegajo AS VARCHAR), 4)

    -- Insertar el empleado
    INSERT INTO empleados (legajo, apellido, nombre, dni, fecha_nacimiento, fecha_ingreso, telefono, email, direccion, localidad, provincia, perfil, estado)
    VALUES (@legajo, @apellido, @nombre, @dni, @fecha_nacimiento, @fecha_ingreso, @telefono, @email, @direccion, @localidad, @provincia, @perfil, @estado)

    -- Obtener el ID del empleado recién insertado
    DECLARE @empleado_id INT;
    SET @empleado_id = SCOPE_IDENTITY()

    -- Insertar el usuario asociado al empleado
    INSERT INTO usuarios (empleado_id, contrasenia)
    VALUES (@empleado_id, @contrasenia)
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spObtenerEmpleadoPorID
    @id INT
AS
BEGIN
    SELECT * FROM empleados WHERE id = @id
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spActualizarEmpleado
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
    WHERE id = @id

    -- Actualizar la contraseña del usuario si se proporciona un valor para "contrasenia"
    IF @contrasenia IS NOT NULL
    BEGIN
        UPDATE usuarios SET contrasenia = @contrasenia
        WHERE empleado_id = @id
    END
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spEliminarEmpleado
    @id INT
AS
BEGIN
    UPDATE empleados
    SET estado = 0, fecha_egreso = GETDATE(), deleted_at = GETDATE()
    WHERE id = @id
END
GO


-- ================== INSUMOS ==================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spObtenerTodosLosInsumos
AS
BEGIN
    select i.id as id, i.nombre as nombre, categoria_id, c.nombre as categoria_nombre, stock, stock_minimo, precio, estado from insumos i Inner Join categorias c ON i.categoria_id = c.id where i.estado = 1
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spAgregarInsumo
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
CREATE PROCEDURE spObtenerInsumoPorID
 @id INT
AS
BEGIN
    select i.id as id, i.nombre as nombre, categoria_id, c.nombre as categoria_nombre, stock, stock_minimo, i.precio as precio, estado from insumos i Inner Join categorias c ON i.categoria_id = c.id where i.id = @id
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spActualizarInsumo
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
CREATE PROCEDURE spEliminarInsumo
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
CREATE PROCEDURE spObtenerTodosLosInsumosPorCategoriaID
	@id int
AS
BEGIN
    select 
		i.id as id, i.nombre as nombre, categoria_id, c.nombre as categoria_nombre, stock, stock_minimo, precio, estado
	from insumos i
	Inner Join categorias c on i.categoria_id = c.id
	Where i.id IN (
		select id from insumos where categoria_id = @id
	) and i.estado = 1
END
GO


-- ================== CATEGORIAS ==================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spObtenerTodasLasCategorias
AS
BEGIN
	select id, nombre from categorias
END
GO


-- ================== MESAS ==================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spObtenerTodasLasMesas
AS
BEGIN
    SELECT * FROM mesas WHERE deleted_at IS NULL
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spAgregarMesa
    @numero INT,
    @capacidad INT
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
            RAISERROR('001:Ya existe una mesa con ese número', 16, 1)
        END
        ELSE
        BEGIN
            UPDATE mesas
            SET deleted_at = NULL, capacidad = @capacidad, estado = 1
            WHERE id = @mesa_id
		END
    END
    ELSE
    BEGIN
        -- Si no existe una mesa eliminada con ese número, crear una nueva mesa
        INSERT INTO mesas (numero, capacidad) VALUES (@numero, @capacidad)
    END
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spObtenerMesaPorID
    @id INT
AS
BEGIN
    SELECT * FROM mesas WHERE id = @id
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spActualizarMesa
    @id INT,
    @numero INT,
    @capacidad INT
AS
BEGIN
	UPDATE mesas SET numero = @numero, capacidad = @capacidad  WHERE id = @id
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spEliminarMesa
    @id INT
AS
BEGIN
    UPDATE mesas SET estado = 0, deleted_at = GETDATE() WHERE id = @id
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spObtenerTodasLasMesasNoAsignadas
AS
BEGIN
    SELECT * FROM mesas WHERE asignada = 0 and deleted_at IS NULL
END
GO


-- ================== MESAS ASIGNADAS ==================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spAsignarMesa
    @mesa_id INT,
    @empleado_id INT
AS
BEGIN
    INSERT INTO mesas_asignadas (mesa_id, empleado_id, fecha)
    VALUES (@mesa_id, @empleado_id, CAST(GETDATE() as date))

	update mesas set asignada = 1 where id = @mesa_id
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spObtenerTodasLasMesasAsignadas
AS
BEGIN
	select MA.id as id, MA.mesa_id as mesa_id, M.numero as numero, MA.empleado_id as empleado_id, E.legajo as legajo, fecha, MA.estado as estado 
	from mesas_asignadas MA
	Inner Join mesas M ON MA.mesa_id = M.id
	Inner Join empleados E ON MA.empleado_id = E.id
	WHERE MA.deleted_at IS NULL
END
Go


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spObtenerTodasLasMesasAsignadasPorId
	@id INT
AS
BEGIN
	select MA.id, M.numero, M.capacidad, MA.estado from mesas_asignadas MA 
	Inner Join mesas M ON MA.mesa_id = M.id
	Where MA.empleado_id = @id
END
Go


-- ================== PEDIDOS ==================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spAbrirPedido
    @mesa_asignada_id INT
AS
BEGIN
    INSERT INTO pedidos (mesa_asignada_id, apertura) VALUES (@mesa_asignada_id, GETDATE())
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spObtenerPedidoAbiertoPorID
    @idMesa INT
AS
BEGIN
	select * from pedidos where mesa_asignada_id = @idMesa and cierre is null and estado = 1
END
GO




-- ================== PEDIDOS DETALLE ==================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spObtenerDetallePedidoActual
	@pedido_id int
AS
BEGIN
   select pd.id, pd.insumo_id as insumo_id, pd.pedido_id, pd.cantidad from pedidos_detalle pd where pd.pedido_id = @pedido_id
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spAgregarDetallePedido
    @insumo_id INT,
    @pedido_id INT,
    @cantidad INT
AS
BEGIN
	if (select id from pedidos_detalle where insumo_id = @insumo_id and pedido_id = @pedido_id) is not null begin
		update pedidos_detalle set cantidad = cantidad + 1 where insumo_id = @insumo_id and pedido_id = @pedido_id
	end
	else begin
		INSERT INTO pedidos_detalle (insumo_id, pedido_id, cantidad)
		VALUES (@insumo_id, @pedido_id, @cantidad)
	end 
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spSumarCantidadInsumo
    @id INT
AS
BEGIN
	update pedidos_detalle set cantidad = cantidad + 1 where id = @id
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spRestarCantidadInsumo
    @id INT
AS
BEGIN
	update pedidos_detalle set cantidad = cantidad - 1 where id = @id
END
GO

--GO
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[spActualizarDetallePedido]
--    @id INT,
--    @menu_insumo_id INT,
--    @pedido_id INT,
--    @cantidad INT
--AS
--BEGIN
--    UPDATE pedidos_detalle
--    SET
--        menu_insumo_id = @menu_insumo_id,
--        pedido_id = @pedido_id,
--        cantidad = @cantidad
--    WHERE id = @id;
--END
--GO


--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[spEliminarDetallePedido]
--    @id INT
--AS
--BEGIN
--    UPDATE pedidos_detalle
--    SET deleted_at = GETDATE()
--    WHERE id = @id;
--END
--GO

--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[spObtenerDetallePedidoPorID]
--    @id INT
--AS
--BEGIN
--    SELECT *
--    FROM pedidos_detalle
--    WHERE id = @id;
--END
--GO


--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[spObtenerDetallePedidoPorPedidoID]
--    @pedido_id INT
--AS
--BEGIN
--    SELECT *
--    FROM pedidos_detalle
--    WHERE pedido_id = @pedido_id
--    AND deleted_at IS NULL;
--END
--GO

-- ============================================= FACTURAS =============================================
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[spAgregarFactura]
--    @pedido_id INT,
--    @fecha DATE,
--    @total DECIMAL(10,2)
--AS
--BEGIN
--    INSERT INTO facturas (pedido_id, fecha, total)
--    VALUES (@pedido_id, @fecha, @total);
--END
--GO


--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[spActualizarFactura]
--    @id INT,
--    @pedido_id INT,
--    @fecha DATE,
--    @total DECIMAL(10,2)
--AS
--BEGIN
--    UPDATE facturas
--    SET
--        pedido_id = @pedido_id,
--        fecha = @fecha,
--        total = @total
--    WHERE id = @id;
--END
--GO


--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[spEliminarFactura]
--    @id INT
--AS
--BEGIN
--    UPDATE facturas
--    SET deleted_at = GETDATE()
--    WHERE id = @id;
--END
--GO


--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[spObtenerFacturaPorID]
--    @id INT
--AS
--BEGIN
--    SELECT *
--    FROM facturas
--    WHERE id = @id;
--END
--GO


--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[spObtenerTodasLasFacturas]
--AS
--BEGIN
--    SELECT *
--    FROM facturas
--    WHERE deleted_at IS NULL;
--END
--GO

-- ============================================= FACTURAS PAGOS =============================================

--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[spAgregarPagoFactura]
--    @factura_id INT,
--    @metodo VARCHAR(20),
--    @monto DECIMAL(10,2)
--AS
--BEGIN
--    INSERT INTO factura_pagos (factura_id, metodo, monto)
--    VALUES (@factura_id, @metodo, @monto);
--END
--GO


--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[spActualizarPagoFactura]
--    @id INT,
--    @factura_id INT,
--    @metodo VARCHAR(20),
--    @monto DECIMAL(10,2)
--AS
--BEGIN
--    UPDATE factura_pagos
--    SET
--        factura_id = @factura_id,
--        metodo = @metodo,
--        monto = @monto
--    WHERE id = @id;
--END
--GO


--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[spEliminarPagoFactura]
--    @id INT
--AS
--BEGIN
--    UPDATE factura_pagos
--    SET deleted_at = GETDATE()
--    WHERE id = @id;
--END
--GO


--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[spObtenerPagoFacturaPorID]
--    @id INT
--AS
--BEGIN
--    SELECT *
--    FROM factura_pagos
--    WHERE id = @id;
--END
--GO


--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE PROCEDURE [dbo].[spObtenerPagosFacturaPorFacturaID]
--    @factura_id INT
--AS
--BEGIN
--    SELECT *
--    FROM factura_pagos
--    WHERE factura_id = @factura_id
--    AND deleted_at IS NULL;
--END
--GO

