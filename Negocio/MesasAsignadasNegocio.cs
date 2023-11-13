using Data;
using Dominio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class MesasAsignadasNegocio
    {
        public List<Mesa> ListarMesasAsignadasPorId(int id)
        {
			AccesoDatos datos = new AccesoDatos();
            List<Mesa> lista = new List<Mesa>();

			try
			{
				datos.SetProcedure("spObtenerTodasLasMesasAsignadasPorId");
				datos.SetParameter("@id", id);
				datos.ReadData();

                while (datos.Reader.Read())
                {
                    Mesa aux = new Mesa();

                    aux.Id = (int)datos.Reader["id"];
                    aux.Numero = (int)datos.Reader["numero"];
                    aux.Capacidad = (int)datos.Reader["capacidad"];
                    aux.Ocupacion = (string)datos.Reader["estado"];

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
