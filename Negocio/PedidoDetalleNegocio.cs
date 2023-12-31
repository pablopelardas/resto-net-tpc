﻿using Data;
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
					aux.Insumo = new Insumo();
					aux.Insumo.Precio = (decimal)datos.Reader["precio"];
					aux.Insumo.Nombre = (string)datos.Reader["nombre"];

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

		public void RestarInsumo(int id)
		{
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetProcedure("spRestarCantidadInsumo");
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

        public void Eliminar(int id)
		{
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetProcedure("spEliminarDetallePedidoId");
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

		public decimal ObtenerTotalPedidoDetalleID(int id)
		{
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.SetProcedure("spObtenerTotalDetallePedidoID");
				datos.SetParameter("@id", id);
				datos.ReadData();

				datos.Reader.Read();
				decimal aux;

				aux = (decimal)datos.Reader["Total"];
				return aux;
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
