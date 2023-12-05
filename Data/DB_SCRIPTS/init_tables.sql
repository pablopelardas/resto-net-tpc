IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'RESTO-NET-TPC')
BEGIN
  CREATE DATABASE "RESTO-NET-TPC"
END
GO

USE "RESTO-NET-TPC"
GO

CREATE TABLE empleados
(
    id int IDENTITY(1,1) NOT NULL,
    legajo VARCHAR(10) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    dni VARCHAR(10) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_ingreso DATE NOT NULL,
    fecha_egreso DATE NULL,
    telefono VARCHAR(50) NULL,
    email VARCHAR(50) NULL,
    direccion VARCHAR(50) NULL,
    localidad VARCHAR(50) NULL,
    provincia VARCHAR(50) NULL,
    estado BIT NOT NULL,
    deleted_at DATETIME NULL DEFAULT NULL,
    updated_at DATETIME NULL DEFAULT GETDATE(),
    PRIMARY KEY (id),
    UNIQUE (legajo),
    UNIQUE (dni),
    UNIQUE (email),
    UNIQUE (telefono),
    CHECK (estado IN (0,1)),
    CHECK (fecha_nacimiento <= fecha_ingreso),
    CHECK (fecha_egreso IS NULL OR fecha_ingreso <= fecha_egreso),
    CHECK (fecha_egreso IS NULL OR estado = 0),
    CHECK (fecha_egreso IS NOT NULL OR estado = 1)
)
GO

CREATE TABLE usuarios
(
    id int IDENTITY(1,1) NOT NULL,
    empleado_id int NOT NULL,
    contrasenia VARCHAR(50) NOT NULL,
    perfil int NOT NULL,
    deleted_at DATETIME NULL DEFAULT NULL,
    updated_at DATETIME NULL DEFAULT GETDATE(),
    PRIMARY KEY (id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id),
    UNIQUE (empleado_id)
)
GO

create TABLE mesas
(
    id int IDENTITY(1,1) NOT NULL,
    numero int NOT NULL,
    capacidad int NOT NULL,
    asignada bit not null DEFAULT 0,
    estado BIT NOT NULL DEFAULT 1,
    deleted_at DATETIME NULL DEFAULT NULL,
    updated_at DATETIME NULL DEFAULT GETDATE(),
    PRIMARY KEY (id),
    UNIQUE (numero)
)
GO

CREATE TABLE mesas_asignadas
(
    id int IDENTITY(1,1) NOT NULL,
    mesa_id int NOT NULL,
    empleado_id int NOT NULL,
    fecha DATETIME NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'libre',
    deleted_at DATETIME NULL DEFAULT NULL,
    updated_at DATETIME NULL DEFAULT GETDATE(),
    PRIMARY KEY (id),
    FOREIGN KEY (mesa_id) REFERENCES mesas(id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id),
    UNIQUE (mesa_id, fecha),
    CHECK (estado IN ('libre', 'ocupada', 'reservada'))
)
GO


CREATE TABLE categorias
(
    id int IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    deleted_at DATETIME NULL DEFAULT NULL,
    updated_at DATETIME NULL DEFAULT GETDATE(),
    PRIMARY KEY (id),
    UNIQUE (nombre)
)
GO

CREATE TABLE insumos
(
    id int IDENTITY(1,1) NOT NULL,
    categoria_id int NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    stock int NOT NULL,
    stock_minimo int NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    estado BIT NOT NULL DEFAULT 1,
    deleted_at DATETIME NULL DEFAULT NULL,
    updated_at DATETIME NULL DEFAULT GETDATE(),
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES categorias(id),
    UNIQUE (nombre),
    CHECK (stock >= 0),
    CHECK (stock_minimo >= 0),
    CHECK (stock >= stock_minimo),
    CHECK (precio > 0)
)
GO


CREATE TABLE pedidos
(
    id int IDENTITY(1,1) NOT NULL,
    mesa_asignada_id int NOT NULL,
    apertura DATETIME NOT NULL,
    cierre DATETIME NULL,
    estado BIT NOT NULL DEFAULT 1,
    deleted_at DATETIME NULL DEFAULT NULL,
    updated_at DATETIME NULL DEFAULT GETDATE(),
    PRIMARY KEY (id),
    FOREIGN KEY (mesa_asignada_id) REFERENCES mesas_asignadas(id),
    UNIQUE (mesa_asignada_id, apertura)
)
GO

CREATE TABLE pedidos_detalle
(
    id int IDENTITY(1,1) NOT NULL,
    insumo_id int NOT NULL,
    pedido_id int NOT NULL,
    cantidad int NOT NULL,
    deleted_at DATETIME NULL DEFAULT NULL,
    updated_at DATETIME NULL DEFAULT GETDATE(),
    PRIMARY KEY (id),
    FOREIGN KEY (insumo_id) REFERENCES insumos(id),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    UNIQUE (insumo_id, pedido_id),
    CHECK (cantidad > 0)
)
GO



