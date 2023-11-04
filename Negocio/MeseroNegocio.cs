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
        }
    }
}
