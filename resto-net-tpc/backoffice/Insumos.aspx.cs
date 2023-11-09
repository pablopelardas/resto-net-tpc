using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace resto_net_tpc
{
    public partial class Insumos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            InsumoNegocio negocio = new InsumoNegocio();
            dgvInsumos.DataSource = negocio.Listar();
            dgvInsumos.DataBind();
        }

        protected void dgvInsumos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvInsumos.SelectedDataKey.Value.ToString();
            Response.Redirect("./FormularioInsumo.aspx?id=" + id, false);
        }
    }
}