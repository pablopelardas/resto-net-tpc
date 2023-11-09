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
    public partial class FormularioMesa : System.Web.UI.Page
    {
        private bool isEditMode = false;
        private int id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            // check if user id is set in query string
            btnEliminar.Visible = false;
            isEditMode = Request.QueryString["id"] != null;
            if (!IsPostBack)
            {
                Session.Remove("currentMesa");
                chkEstado.Checked = true;
            }
            if (isEditMode)
            {
                btnEliminar.Visible = true;
                bool result = Int32.TryParse(Request.QueryString["id"], out id);
                if (!result || id < 0)
                {
                    Response.Redirect("Mesas.aspx", false);
                }
                if (!IsPostBack)
                {
                    // create instance of user class
                    MesasNegocio mesasNegocio = new MesasNegocio();

                    Mesa mesa = null;

                    try
                    {
                        // call method to get all details of user
                        mesa = mesasNegocio.Obtener(id);

                        // check if user details found
                        if (mesa != null)
                        {
                            txtNumero.Text = mesa.Numero.ToString();
                            txtCapacidad.Text = mesa.Capacidad.ToString();
                            chkEstado.Checked = mesa.Estado;
                            Session.Add("currentMesa", mesa);
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
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            MesasNegocio mesasNegocio = new MesasNegocio();
            Mesa mesa = new Mesa();

            try
            {
                int cap = 0;
                if (!int.TryParse(txtCapacidad.Text, out cap))
                {
                    lblError.Text = "Capacidad debe ser un numero";
                    return;
                }
                mesa.Capacidad = cap;
                int num = 0;
                if (!int.TryParse(txtNumero.Text, out num))
                {
                    lblError.Text = "Numero debe ser un numero";
                    return;
                }
                mesa.Numero = num;
                mesa.Estado = chkEstado.Checked;
                if (id >= 0)
                {

                    mesa.Id = int.Parse(Request.QueryString["id"]);
                    mesasNegocio.Modificar(mesa);
                }
                else
                    mesasNegocio.Agregar(mesa);
                Response.Redirect("Mesas.aspx", false);
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("Ya existe una mesa"))
                {
                    lblError.Text = "Ya existe una mesa con ese numero";
                }
                else
                {
                    Session.Add("error", ex);
                    throw ex;
                    // Redireccionar a pagina de error..
                }
            }
        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            MesasNegocio mesasNegocio = new MesasNegocio();
            try
            {
                mesasNegocio.Eliminar(id);
                Response.Redirect("Mesas.aspx", false);
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