using Data;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class PedidoNegocio
    {
        public void IniciarPedido(int idmesa)	
        {
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.SetProcedure("spAbrirPedido");
				datos.SetParameter("@mesa_asignada_id", idmesa);

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

		public bool BuscarPedidoAbierto(int idmesa)
		{
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.SetProcedure("spObtenerPedidoAbiertoPorID");
				datos.SetParameter("@idMesa", idmesa);
				datos.ReadData();

                bool existe = datos.Reader.Read();
               
                return existe;
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

		public Pedido ObtenerPedidoAbierto(int idmesa)
		{
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetProcedure("spObtenerPedidoAbiertoPorID");
                datos.SetParameter("@idMesa", idmesa);
                datos.ReadData();

                datos.Reader.Read();
                Pedido pedido = new Pedido();

                pedido.Id = (int)datos.Reader["id"];
                pedido.MesaAsignadaId = (int)datos.Reader["mesa_asignada_id"];
                pedido.Apertura = (DateTime)datos.Reader["apertura"];
                pedido.Cierre = !(datos.Reader["cierre"] is DBNull) ? (DateTime)datos.Reader["cierre"] : DateTime.Parse("1/1/1000");
                pedido.Estado = (bool)datos.Reader["estado"];

                return pedido;
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

		public void CerrarPedido(int idmesa)
		{
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.SetProcedure("spCerrarPedido");
				datos.SetParameter("@mesa_asignada_id", idmesa);

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
