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
        protected void Page_Load(object sender, EventArgs e)
        {
            CategoriaNegocio negocio = new CategoriaNegocio();
            try
            {
                if (!IsPostBack)
                {
                    repCategorias.DataSource = negocio.Listar();
                    repCategorias.DataBind();
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
    }
}