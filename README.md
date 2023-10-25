# Trabajo Practico Cuatrimestral - Propuesta Resto

### Grupo
- Braian Alejandro Valor
- Maria Paula Livingston
- Pablo Martín Pelardas

## Características del programa
- ...

## Conexión a base de datos
Para poder utilizar todos nuestra propia connection string y no exponer nuestras credenciales en github decidimos utilizar un archivo de configuración que no está subido aqui.
Para poder levantar el proyecto con la base de datos hay que:

### 1. Crear el archivo connectionStrings.config
![image](https://github.com/pablopelardas/tp-web-equipo-25/assets/31576799/2fb4b72d-93f8-44ec-b15c-1dbe4f27b14d)

Ya que este es llamado en el Web.config
![image](https://github.com/pablopelardas/tp-web-equipo-25/assets/31576799/d2ed1760-b59b-4cf3-b730-c72033b5da70)


### 2. Escribir en el connectionStrings.config 
![image](https://github.com/pablopelardas/tp-winform-equipo-25/assets/31576799/9830afeb-c3e3-4852-a1d1-40257bfe2b39)

```
<connectionStrings>
  <add name="DefaultConnection" connectionString="TU_CONNECTION_STRING" providerName="System.Data.SqlClient" />
</connectionStrings>
```

NOTA: Si estas usando la connection string escapando la \ por ejemplo: .\\SQLEXPRESS;... Aca no es necesario, va con una barra sola -> .\SQLEXPRESS

## Imagenes Proyecto
