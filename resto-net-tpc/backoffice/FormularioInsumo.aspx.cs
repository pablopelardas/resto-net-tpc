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
        public int Id { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Configuracion inicial de la pantalla.
            if (!IsPostBack)
            {
                CategoriaNegocio negocio = new CategoriaNegocio();
                ddlCategoria.DataSource = negocio.Listar();
                ddlCategoria.DataTextField = "Nombre";
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataBind();
            }

            // Si esta modificando.
            Id = Request.QueryString["id"] != null ? int.Parse(Request.QueryString["id"]) : -1;
            if (Id != -1 && !IsPostBack)
            {
                Insumo insumo = new Insumo();
                InsumoNegocio negocio = new InsumoNegocio();

                insumo = negocio.BuscarInsumo(Id);

                tBoxNombre.Text = insumo.Nombre;
                ddlCategoria.SelectedValue = insumo.Categoria.Id.ToString();
                tBoxStock.Text = insumo.Stock.ToString();
                tBoxStockMinimo.Text = insumo.StockMinimo.ToString();
                tBoxPrecio.Text = insumo.Precio.ToString();
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

                if (Id != -1)
                {
                    insumo.Id = Id;
                    negocio.Modificar(insumo);
                }
                else
                {
                    negocio.Agregar(insumo);
                }

                Response.Redirect("Insumos.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw ex;
                // Redireccionar a pagina de error..
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            InsumoNegocio negocio = new InsumoNegocio();
            
            try
            {
                negocio.Eliminar(Id);
                Response.Redirect("Insumos.aspx", false);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}