using Data;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class PedidoDetalleNegocio
    {
        public List<PedidoDetalle> Listar(int id)
        {
			List<PedidoDetalle> lista = new List<PedidoDetalle>();
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.SetProcedure("spObtenerDetallePedidoActual");
				datos.SetParameter("@pedido_id", id);
				datos.ReadData();

				while (datos.Reader.Read())
				{
					PedidoDetalle aux = new PedidoDetalle();

					aux.Id = (int)datos.Reader["id"];
					aux.InsumoId = (int)datos.Reader["insumo_id"];
					aux.PedidoId = (int)datos.Reader["pedido_id"];
					aux.Cantidad = (int)datos.Reader["cantidad"];

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

		public void Agregar(PedidoDetalle pedidoDetalle)
		{
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.SetProcedure("spAgregarDetallePedido");
				datos.SetParameter("@insumo_id", pedidoDetalle.InsumoId);
				datos.SetParameter("@pedido_id", pedidoDetalle.PedidoId);
				datos.SetParameter("@cantidad", pedidoDetalle.Cantidad);

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

		public void SumarInsumo(int id)
		{
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.SetProcedure("spSumarCantidadInsumo");
				datos.SetParameter("@id", id);

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
