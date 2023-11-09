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
    public class InsumoNegocio
    {
        public List<Insumo> Listar()
        {
			List<Insumo> lista = new List<Insumo>();
			AccesoDatos datos = new AccesoDatos();

			try
			{
				datos.SetProcedure("spObtenerTodosLosInsumos");
				datos.ReadData();

				while (datos.Reader.Read())
				{
					Insumo aux = new Insumo();

					aux.Id = (int)datos.Reader["id"];
					aux.Nombre = (string)datos.Reader["nombre"];
					aux.Categoria = new Categoria();
					aux.Categoria.Id = (int)datos.Reader["categoria_id"];
					aux.Categoria.Nombre = (string)datos.Reader["categoria_nombre"];
					aux.Stock = (int)datos.Reader["stock"];
					aux.StockMinimo = (int)datos.Reader["stock_minimo"];
					aux.Precio = (decimal)datos.Reader["precio"];
					aux.Estado = (bool)datos.Reader["estado"];

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

		public void Agregar(Insumo insumo)
		{
			AccesoDatos datos = new AccesoDatos();

			try
			{
				datos.SetProcedure("spAgregarInsumo");
				datos.SetParameter("@categoria_id", insumo.Categoria.Id);
				datos.SetParameter("@nombre", insumo.Nombre);
				datos.SetParameter("@stock", insumo.Stock);
				datos.SetParameter("@stock_minimo", insumo.StockMinimo);
				datos.SetParameter("@precio", insumo.Precio);

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

		public Insumo BuscarInsumo(int id)
		{
			AccesoDatos datos = new AccesoDatos();

			try
			{
				datos.SetProcedure("spObtenerInsumoPorID");
				datos.SetParameter("@id", id);
				datos.ReadData();

                Insumo aux = new Insumo();
                datos.Reader.Read();

                aux.Id = (int)datos.Reader["id"];
                aux.Nombre = (string)datos.Reader["nombre"];
                aux.Categoria = new Categoria();
                aux.Categoria.Id = (int)datos.Reader["categoria_id"];
                aux.Categoria.Nombre = (string)datos.Reader["categoria_nombre"];
                aux.Stock = (int)datos.Reader["stock"];
                aux.StockMinimo = (int)datos.Reader["stock_minimo"];
                aux.Precio = (decimal)datos.Reader["precio"];
                aux.Estado = (bool)datos.Reader["estado"];

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

		public void Modificar()
		{

		}
    }
}
