using Data;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class CategoriaNegocio
    {
        public List<Categoria> Listar()
        {
			List<Categoria> lista = new List<Categoria>();
			AccesoDatos datos = new AccesoDatos();

			try
			{
				datos.SetProcedure("spObtenerTodasLasCategorias");
				datos.ReadData();

				while (datos.Reader.Read())
				{
					Categoria aux = new Categoria();

					aux.Id = (int)datos.Reader["id"];
					aux.Nombre = (string)datos.Reader["nombre"];

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
    }
}
