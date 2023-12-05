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
    public partial class Empleados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Session.Add("error", "Debes loguearte para ingresar");
                Response.Redirect("../Error.aspx", false);
            }
            else if (!(((Usuario)Session["usuario"]).Perfil == TipoUsuario.ADMIN))
            {
                Session.Add("error", "No tienes permisos de administrador");
                Response.Redirect("../Error.aspx", false);
            }

            EmpleadoNegocio empleadoNegocio = new EmpleadoNegocio();
            dgvEmpleados.DataSource = empleadoNegocio.Listar();
            dgvEmpleados.DataBind();
        }

        protected void dgvEmpleados_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvEmpleados.SelectedDataKey.Value.ToString();
            Response.Redirect("./FormularioEmpleado.aspx?id=" + id, false);
        }
    }
}