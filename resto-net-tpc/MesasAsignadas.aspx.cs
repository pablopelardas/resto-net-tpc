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
    public partial class MesasAsignadas : System.Web.UI.Page
    {
        public List<Mesa> ListaMesasAsignadas { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Session.Add("error", "Debes loguearte para ingresar");
                Response.Redirect("Error.aspx", false);
            }
            else if (!(((Usuario)Session["usuario"]).Perfil == TipoUsuario.NORMAL))
            {
                Session.Add("error", "Debes loguearte como mesero");
                Response.Redirect("Error.aspx", false);
            }

            MesasAsignadasNegocio negocio = new MesasAsignadasNegocio();
            ListaMesasAsignadas = negocio.ListarMesasAsignadasPorId(((Usuario)Session["usuario"]).Id);
        }
    }
}