using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace resto_net_tpc
{
    public partial class Pedidos : System.Web.UI.Page
    {
        public Pedido PedidoActual { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            PedidoNegocio pedidoNegocio = new PedidoNegocio();
            CategoriaNegocio negocio = new CategoriaNegocio();
            try
            {
                if (!IsPostBack)
                {
                    repCategorias.DataSource = negocio.Listar();
                    repCategorias.DataBind();
                }

                int idmesa = Request.QueryString["id"] != null ? int.Parse(Request.QueryString["id"].ToString()) : -1;
                if (idmesa != -1 && !IsPostBack)
                {
                    if (pedidoNegocio.BuscarPedidoAbierto(idmesa) == true)
                    {
                        PedidoActual = pedidoNegocio.ObtenerPedidoAbierto(idmesa);
                    }
                    else
                    {
                        PedidoActual = null;
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw ex;
            }

        }

        protected void btnCategoria_Click(object sender, EventArgs e)
        {
            InsumoNegocio negocio = new InsumoNegocio();
            try
            {
                int id = int.Parse(((Button)sender).CommandArgument);
                repInsumosPorCategoria.DataSource = negocio.ListarInsumosPorCategoria(id);
                repInsumosPorCategoria.DataBind();

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw ex;
                // Redireccionar a pagina de error..
            }
        }

        protected void btnIniciarPedido_Click(object sender, EventArgs e)
        {
            PedidoNegocio negocio = new PedidoNegocio();
            try
            {
                int idmesa = Request.QueryString["id"] != null ? int.Parse(Request.QueryString["id"].ToString()) : -1;
                if (idmesa != -1)
                {
                    negocio.IniciarPedido(idmesa);
                    PedidoActual = negocio.ObtenerPedidoAbierto(idmesa);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw ex;
                // Redireccionar a pagina de error..
            }
        }
    }
}