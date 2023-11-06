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
            MeseroNegocio meseroNegocio = new MeseroNegocio();
            dgvEmpleados.DataSource = meseroNegocio.listar();
            dgvEmpleados.DataBind();
        }

        protected void dgvEmpleados_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Id = dgvEmpleados.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioEmpleado.aspx?id=" + Id, false);
        }
    }
}