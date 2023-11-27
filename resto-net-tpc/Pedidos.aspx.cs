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

                    cargarPedidoDetalle();
                }
                int idmesa = Request.QueryString["id"] != null ? int.Parse(Request.QueryString["id"].ToString()) : -1;
                if (idmesa != -1)
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

        protected void btnInsumo_Click(object sender, EventArgs e)
        {
            PedidoDetalle aux = new PedidoDetalle();
            PedidoDetalleNegocio negocio = new PedidoDetalleNegocio();
            try
            {
                aux.InsumoId = int.Parse(((Button)sender).CommandArgument);
                aux.PedidoId = PedidoActual.Id;
                aux.Cantidad = 1;

                negocio.agregar(aux);
                cargarPedidoDetalle();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw ex;
                // Redireccionar a pagina de error..
            }
        }

        protected void cargarPedidoDetalle()
        {
            PedidoDetalleNegocio pedidoDetalleNegocio = new PedidoDetalleNegocio();
            try
            {
                if (buscarPedidoPorMesa())
                {
                    dgvPedidoDetalle.DataSource = pedidoDetalleNegocio.Listar(PedidoActual.Id);
                    dgvPedidoDetalle.DataBind();
                }                   
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected bool buscarPedidoPorMesa()
        {
            PedidoNegocio pedidoNegocio = new PedidoNegocio();
            try
            {
                bool encontro = false;
                int idmesa = Request.QueryString["id"] != null ? int.Parse(Request.QueryString["id"].ToString()) : -1;
                if (idmesa != -1)
                {
                    if (pedidoNegocio.BuscarPedidoAbierto(idmesa) == true)
                    {
                        PedidoActual = pedidoNegocio.ObtenerPedidoAbierto(idmesa);
                        encontro =  true;
                    }
                    else
                    {
                        PedidoActual = null;
                        encontro = false;
                    }
                }
                return encontro;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}