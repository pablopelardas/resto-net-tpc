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
            // le paso un ID fijo hasta hacer el login y obtener el id del usuario que ingrese.
            MesasAsignadasNegocio negocio = new MesasAsignadasNegocio();
            ListaMesasAsignadas = negocio.ListarMesasAsignadasPorId(4);
        }
    }
}