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
    public partial class FormularioInsumo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CategoriaNegocio negocio = new CategoriaNegocio();
                ddlCategoria.DataSource = negocio.Listar();
                ddlCategoria.DataTextField = "Nombre";
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataBind();
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            InsumoNegocio negocio = new InsumoNegocio();
            Insumo insumo = new Insumo();

            try
            {
                insumo.Nombre = tBoxNombre.Text;
                insumo.Categoria = new Categoria();
                insumo.Categoria.Id = int.Parse(ddlCategoria.SelectedItem.Value);
                insumo.Stock = int.Parse(tBoxStock.Text);
                insumo.StockMinimo = int.Parse(tBoxStockMinimo.Text);
                insumo.Precio = decimal.Parse(tBoxPrecio.Text);

                negocio.Agregar(insumo);
                Response.Redirect("Insumos.aspx", false);
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