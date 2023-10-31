-- DROP TABLES

USE "RESTO-NET-TPC";

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[factura_pagos]') AND type in (N'U'))
DROP TABLE [dbo].[factura_pagos]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[facturas]') AND type in (N'U'))
DROP TABLE [dbo].[facturas]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pedidos_detalle]') AND type in (N'U'))
DROP TABLE [dbo].[menu_insumos_pedidos]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[menu_insumos]') AND type in (N'U'))
DROP TABLE [dbo].[menu_insumos]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[menus]') AND type in (N'U'))
DROP TABLE [dbo].[menus]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insumos]') AND type in (N'U'))
DROP TABLE [dbo].[insumos]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[categorias]') AND type in (N'U'))
DROP TABLE [dbo].[categorias]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pedidos]') AND type in (N'U'))
DROP TABLE [dbo].[pedidos]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mesas_asignadas]') AND type in (N'U'))
DROP TABLE [dbo].[mesas_asignadas]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mesas]') AND type in (N'U'))
DROP TABLE [dbo].[mesas]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usuarios]') AND type in (N'U'))
DROP TABLE [dbo].[usuarios]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[empleados]') AND type in (N'U'))
DROP TABLE [dbo].[empleados]
GO