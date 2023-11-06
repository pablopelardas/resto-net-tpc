using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Dominio;

namespace Negocio
{
    public class MeseroNegocio
    {
        // Falta validar los null del metodo listar.
        public List<Mesero> listar()
        {
            List<Mesero> lista = new List<Mesero>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetProcedure("spObtenerTodosLosEmpleados");
                datos.ReadData();

                while (datos.Reader.Read())
                {
                    Mesero aux = new Mesero();

                    aux.Id = (int)datos.Reader["id"];
                    aux.Legajo = (string)datos.Reader["legajo"];
                    aux.Apellido = (string)datos.Reader["apellido"];
                    aux.Nombre = (string)datos.Reader["nombre"];
                    aux.Dni = (string)datos.Reader["dni"];
                    aux.FechaNacimiento = (DateTime)datos.Reader["fecha_nacimiento"];
                    aux.FechaIngreso = (DateTime)datos.Reader["fecha_ingreso"];
                    aux.FechaEgreso = !(datos.Reader["fecha_egreso"] is DBNull) ? (DateTime)datos.Reader["fecha_egreso"] : DateTime.Parse("1/1/1000");
                    aux.Telefono = (string)datos.Reader["telefono"];
                    aux.Email = (string)datos.Reader["email"];
                    aux.Direccion = (string)datos.Reader["direccion"];
                    aux.Localidad = (string)datos.Reader["localidad"];
                    aux.Provincia = (string)datos.Reader["provincia"];
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

        public void agregar(Mesero mesero)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetProcedure("spAgregarEmpleadoYUsuario");
                datos.SetParameter("@legajo", mesero.Legajo);
                datos.SetParameter("@apellido", mesero.Apellido);
                datos.SetParameter("@nombre", mesero.Nombre);
                datos.SetParameter("@dni", mesero.Dni);
                datos.SetParameter("@fecha_nacimiento", mesero.FechaNacimiento);
                datos.SetParameter("@fecha_ingreso", mesero.FechaIngreso);
                datos.SetParameter("@telefono", mesero.Telefono);
                datos.SetParameter("@email", mesero.Email);
                datos.SetParameter("@direccion", mesero.Direccion);
                datos.SetParameter("@localidad", mesero.Localidad);
                datos.SetParameter("@provincia", mesero.Provincia);
                datos.SetParameter("@perfil", mesero.Perfil);
                datos.SetParameter("@estado", mesero.Estado);
                datos.SetParameter("@contrasenia", mesero.Perfil);

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
