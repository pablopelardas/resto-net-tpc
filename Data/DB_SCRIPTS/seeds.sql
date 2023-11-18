USE "RESTO-NET-TPC"
--seed empleados 
INSERT INTO empleados
    (legajo, nombre, apellido, dni, fecha_nacimiento, fecha_ingreso, fecha_egreso, telefono, email, direccion, localidad, provincia, perfil, estado)
VALUES
    ('AA0001SC', 'Admin', 'Admin', '00000000', '1990-01-01', '2010-01-01', NULL, '00000000', 'admin@gmail.com', 'Calle Falsa 123', 'Springfield', 'Springfield','gerente', 1),
    ('EE0001SC', 'Empleado', 'Empleado', '11111111', '1990-01-01', '2010-01-01', NULL, '11111111', 'empleado@gmail.com', 'Calle Falsa 123', 'Springfield', 'Springfield', 'mesero', 1),
    ('EE0002SC', 'Empleado', 'Empleado', '22222222', '1990-01-01', '2010-01-01', NULL, '22222222', 'empleado2@gmail.com', 'Calle Falsa 123', 'Springfield', 'Springfield', 'mesero', 1)

--seed usuarios
INSERT INTO usuarios
    (empleado_id, contrasenia)
VALUES
    (1, 'admin'),
    (2, 'empleado'),
    (3, 'empleado2');

--seed mesas
INSERT INTO mesas
    (numero, capacidad)
VALUES
    (1, 4),
    (2, 6 ),
    (3, 8 ),
    (4, 4 ),
    (5, 2 ),
    (6, 2 ),
    (7, 2 ),
    (8, 8 ),
    (9, 4 ),
    (10, 2 );

--seed categorias
INSERT INTO categorias
    (nombre)
VALUES
    ('bebidas'),
    ('entradas'),
    ('platos principales'),
    ('postres'),
    ('vinos'),
    ('cervezas'),
    ('tragos'),
    ('licores'),
    ('cafes'),
    ('otros');

--seed insumos
-- Generar 50 insumos con nombres y valores predefinidos
INSERT INTO insumos (categoria_id, nombre, stock, stock_minimo, precio)
VALUES
    -- Bebidas
    (1, 'Coca-Cola', 100, 20, 2.5),
    (1, 'Pepsi', 80, 15, 2.0),
    (1, 'Agua Mineral', 60, 10, 1.5),
    (1, 'Sprite', 90, 18, 2.0),
    (1, 'Agua con Gas', 70, 12, 2.0),

    -- Entradas
    (2, 'Papas Fritas', 120, 25, 4.0),
    (2, 'Rollitos Primavera', 60, 10, 3.0),
    (2, 'Bruschetta', 40, 8, 5.0),
    (2, 'Nachos con Queso', 70, 15, 6.0),
    (2, 'Sopa de Tomate', 50, 12, 4.5),

    -- Platos principales
    (3, 'Hamburguesa', 80, 20, 8.0),
    (3, 'Pollo a la Parmesana', 70, 15, 9.0),
    (3, 'Salmón a la Parrilla', 45, 10, 12.0),
    (3, 'Tacos de Carne', 60, 15, 7.5),

    -- Postres
    (4, 'Cheesecake', 40, 8, 6.0),
    (4, 'Tiramisú', 50, 10, 5.5),
    (4, 'Flan', 30, 6, 4.0),
    (4, 'Helado de Chocolate', 60, 12, 3.0),
    (4, 'Helado de Vainilla', 55, 11, 3.0),

    -- Vinos
    (5, 'Vino Tinto', 20, 5, 15.0),
    (5, 'Vino Blanco', 18, 4, 14.0),
    (5, 'Vino Rosado', 22, 6, 13.0),
    (5, 'Champán', 30, 8, 20.0),
    (5, 'Vino Espumoso', 25, 7, 18.0),

    -- Cervezas
    (6, 'Cerveza IPA', 40, 10, 5.0),
    (6, 'Cerveza Lager', 35, 8, 4.5),
    (6, 'Cerveza Stout', 50, 12, 6.0),
    
    -- Tragos
    (7, 'Margarita', 12, 3, 7.0),
    (7, 'Mojito', 14, 4, 8.0),
    (7, 'Daiquiri', 10, 2, 6.0),
    
    -- Licores
    (8, 'Whisky', 18, 5, 10.0),
    (8, 'Ron', 20, 5, 9.0),
    (8, 'Tequila', 16, 4, 8.0),
    (8, 'Brandy', 15, 4, 7.5),
    
    -- Cafes
    (9, 'Café Americano', 30, 6, 2.0),
    (9, 'Café Espresso', 35, 7, 2.5),
    (9, 'Café Latte', 40, 8, 3.0),
    (9, 'Café Mocha', 45, 9, 3.5),
    (9, 'Café Frappé', 50, 10, 4.0),

    -- Otros
    (10, 'Pan de Ajo', 25, 5, 4.0);

