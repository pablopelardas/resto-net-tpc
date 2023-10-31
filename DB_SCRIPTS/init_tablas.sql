IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'RESTO-NET-TPC')
BEGIN
  CREATE DATABASE "RESTO-NET-TPC";
END;
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
    PRIMARY KEY (id),
    UNIQUE (legajo),
    UNIQUE (dni),
    UNIQUE (email),
    UNIQUE (telefono),
    CHECK (estado IN (0,1)),
    CHECK (fecha_nacimiento <= fecha_ingreso),
    CHECK (fecha_egreso IS NULL OR fecha_ingreso <= fecha_egreso),
    CHECK (fecha_egreso IS NULL OR estado = 0),
    CHECK (fecha_egreso IS NOT NULL OR estado = 1),
);

CREATE TABLE usuarios
(
    id int IDENTITY(1,1) NOT NULL,
    empleado_id int NOT NULL,
    contrasenia VARCHAR(50) NOT NULL,
    perfil VARCHAR(20) NOT NULL DEFAULT 'empleado',
    PRIMARY KEY (id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id),
    UNIQUE (empleado_id),
    CHECK (perfil IN ('empleado', 'administrador')),
);

CREATE TABLE mesas
(
    id int IDENTITY(1,1) NOT NULL,
    numero int NOT NULL,
    capacidad int NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'libre',
    PRIMARY KEY (id),
    UNIQUE (numero),
    CHECK (estado IN ('libre', 'ocupada', 'reservada')),
);

CREATE table mesas_asignadas
(
    id int IDENTITY(1,1) NOT NULL,
    mesa_id int NOT NULL,
    empleado_id int NOT NULL,
    fecha DATE NOT NULL,
    turno VARCHAR(20) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (mesa_id) REFERENCES mesas(id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id),
    UNIQUE (mesa_id, fecha),
    CHECK (turno IN ('almuerzo', 'cena')),
);

CREATE TABLE pedidos
(
    id int IDENTITY(1,1) NOT NULL,
    mesa_asignada_id int NOT NULL,
    apertura DATE NOT NULL,
    cierre DATE NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'pendiente',
    PRIMARY KEY (id),
    FOREIGN KEY (mesa_asignada_id) REFERENCES mesas_asignadas(id),
    UNIQUE (mesa_asignada_id, apertura),
    CHECK (cierre IS NULL OR estado = 'entregado'),
    CHECK (estado IN ('pendiente', 'en preparacion', 'listo', 'entregado', 'cancelado')),
);

CREATE TABLE categorias
(
    id int IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (nombre),
);

CREATE TABLE insumos
(
    id int IDENTITY(1,1) NOT NULL,
    categoria_id int NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    stock int NOT NULL,
    stock_minimo int NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES categorias(id),
    UNIQUE (nombre),
    CHECK (stock >= 0),
    CHECK (stock_minimo >= 0),
    CHECK (stock >= stock_minimo),
    CHECK (precio > 0)
);

CREATE TABLE menus
(
    id int IDENTITY(1,1) NOT NULL,
    fecha DATE NOT NULL,
    turno VARCHAR(20) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (fecha, turno),
    CHECK (turno IN ('almuerzo', 'cena')),
);

CREATE TABLE menu_insumos
(
    id int IDENTITY(1,1) NOT NULL,
    menu_id int NOT NULL,
    insumo_id int NOT NULL,
    cantidad int NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (menu_id) REFERENCES menus(id),
    FOREIGN KEY (insumo_id) REFERENCES insumos(id),
    UNIQUE (menu_id, insumo_id),
    CHECK (cantidad > 0),
    CHECK (precio > 0),
);

CREATE TABLE menu_insumos_pedidos
(
    id int IDENTITY(1,1) NOT NULL,
    menu_insumo_id int NOT NULL,
    pedido_id int NOT NULL,
    cantidad int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (menu_insumo_id) REFERENCES menu_insumos(id),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    UNIQUE (menu_insumo_id, pedido_id),
    CHECK (cantidad > 0),
);

CREATE TABLE facturas
(
    id int IDENTITY(1,1) NOT NULL,
    pedido_id int NOT NULL,
    fecha DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    UNIQUE (pedido_id),
    CHECK (total > 0),
);

CREATE TABLE factura_pagos
(
    id int IDENTITY(1,1) NOT NULL,
    factura_id int NOT NULL,
    metodo VARCHAR(20) NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (factura_id) REFERENCES facturas(id),
    UNIQUE (factura_id, metodo),
    CHECK (metodo IN ('efectivo', 'tarjeta')),
    CHECK (monto > 0),
);

