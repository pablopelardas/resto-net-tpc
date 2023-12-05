using Data;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public bool BuscarUsuario(Usuario usuario)
        {
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.SetProcedure("spBuscarUsuario");
				datos.SetParameter("@usuario", usuario.Empleado.Legajo);
				datos.SetParameter("@contrasenia", usuario.Contrasenia);

				datos.ReadData();
				while (datos.Reader.Read())
				{
					usuario.Id = (int)datos.Reader["id"];
					usuario.Perfil = (int)datos.Reader["perfil"] == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
					return true;
				}
				return false;
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
