using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace resto_net_tpc
{
    public partial class Mesas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MesasNegocio mesasNegocio = new MesasNegocio();
         
            dgvMesas.DataSource = mesasNegocio.Listar();
            dgvMesas.DataBind();
        }

        protected void dgvMesas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Id = dgvMesas.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioEmpleado.aspx?id=" + Id, false);
        }
    }
}