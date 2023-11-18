using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using Data;
using Dominio;

namespace Negocio
{
    public class EmpleadoNegocio
    {
        public List<Empleado> Listar()
        {
            List<Empleado> lista = new List<Empleado>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetProcedure("spObtenerTodosLosEmpleados");
                datos.ReadData();

                while (datos.Reader.Read())
                {
                    Empleado aux = new Empleado();

                    aux.Id = (int)datos.Reader["id"];
                    aux.Legajo = (string)datos.Reader["legajo"];
                    aux.Apellido = (string)datos.Reader["apellido"];
                    aux.Nombre = (string)datos.Reader["nombre"];
                    aux.Dni = (string)datos.Reader["dni"];
                    aux.FechaNacimiento = (DateTime)datos.Reader["fecha_nacimiento"];
                    aux.FechaIngreso = (DateTime)datos.Reader["fecha_ingreso"];
                    aux.FechaEgreso = !(datos.Reader["fecha_egreso"] is DBNull) ? (DateTime)datos.Reader["fecha_egreso"] : DateTime.Parse("1/1/1000");
                    aux.Telefono =  !(datos.Reader["telefono"] is DBNull) ? (string)datos.Reader["telefono"] : "xxxxxxxxxx";
                    aux.Email = !(datos.Reader["email"] is DBNull) ? (string)datos.Reader["email"] : "xxxxxxxxxx";
                    aux.Direccion = !(datos.Reader["direccion"] is DBNull) ? (string)datos.Reader["direccion"] : "xxxxxxxxxx";
                    aux.Localidad = !(datos.Reader["localidad"] is DBNull) ? (string)datos.Reader["localidad"] : "xxxxxxxxxx";
                    aux.Provincia = !(datos.Reader["provincia"] is DBNull) ? (string)datos.Reader["provincia"] : "xxxxxxxxxx";
                    aux.Perfil = (string)datos.Reader["perfil"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CloseConnection();
            }
        }

        public void Agregar(Empleado empleado)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetProcedure("spAgregarEmpleadoYUsuario");
                datos.SetParameter("@apellido", empleado.Apellido);
                datos.SetParameter("@nombre", empleado.Nombre);
                datos.SetParameter("@dni", empleado.Dni);
                datos.SetParameter("@fecha_nacimiento", empleado.FechaNacimiento);
                datos.SetParameter("@fecha_ingreso", empleado.FechaIngreso);
                datos.SetParameter("@telefono", empleado.Telefono);
                datos.SetParameter("@email", empleado.Email);
                datos.SetParameter("@direccion", empleado.Direccion);
                datos.SetParameter("@localidad", empleado.Localidad);
                datos.SetParameter("@provincia", empleado.Provincia);
                datos.SetParameter("@perfil", empleado.Perfil);
                datos.SetParameter("@estado", empleado.Estado);
                datos.SetParameter("@contrasenia", empleado.Perfil);

                datos.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CloseConnection();
            }
        }

        public Empleado Obtener(int Id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.SetProcedure("spObtenerEmpleadoPorId");
                accesoDatos.SetParameter("@id", Id);
                accesoDatos.ReadData();
                
                Empleado empleado = new Empleado();
                // get first row from reader
                accesoDatos.Reader.Read();

                empleado.Id = (int)accesoDatos.Reader["id"];
                empleado.Legajo = (string)accesoDatos.Reader["legajo"];
                empleado.Apellido = (string)accesoDatos.Reader["apellido"];
                empleado.Nombre = (string)accesoDatos.Reader["nombre"];
                empleado.Dni = (string)accesoDatos.Reader["dni"];
                empleado.FechaNacimiento = (DateTime)accesoDatos.Reader["fecha_nacimiento"];
                empleado.FechaIngreso = (DateTime)accesoDatos.Reader["fecha_ingreso"];
                empleado.FechaEgreso = !(accesoDatos.Reader["fecha_egreso"] is DBNull) ? (DateTime)accesoDatos.Reader["fecha_egreso"] : DateTime.Parse("1/1/1000");
                empleado.Telefono = (string)accesoDatos.Reader["telefono"];
                empleado.Email = (string)accesoDatos.Reader["email"];
                empleado.Direccion = (string)accesoDatos.Reader["direccion"];
                empleado.Localidad = (string)accesoDatos.Reader["localidad"];
                empleado.Provincia = (string)accesoDatos.Reader["provincia"];
                empleado.Perfil = (string)accesoDatos.Reader["perfil"];



                return empleado;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                accesoDatos.CloseConnection();
            }
        }

        public void Modificar(Empleado empleado)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetProcedure("spActualizarEmpleado");
                datos.SetParameter("@id", empleado.Id);
                datos.SetParameter("@legajo", empleado.Legajo);
                datos.SetParameter("@apellido", empleado.Apellido);
                datos.SetParameter("@nombre", empleado.Nombre);
                datos.SetParameter("@dni", empleado.Dni);
                datos.SetParameter("@fecha_nacimiento", empleado.FechaNacimiento);
                datos.SetParameter("@fecha_ingreso", empleado.FechaIngreso);
                datos.SetParameter("@telefono", empleado.Telefono);
                datos.SetParameter("@email", empleado.Email);
                datos.SetParameter("@direccion", empleado.Direccion);
                datos.SetParameter("@localidad", empleado.Localidad);
                datos.SetParameter("@provincia", empleado.Provincia);
                datos.SetParameter("@perfil", empleado.Perfil);
                datos.SetParameter("@estado", empleado.Estado);
                datos.SetParameter("@contrasenia", empleado.Pass);

                datos.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CloseConnection();
            }
        }   

        public void Eliminar(int Id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetProcedure("spEliminarEmpleado");
                datos.SetParameter("@id", Id);

                datos.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CloseConnection();
            }
        }
    }
}
