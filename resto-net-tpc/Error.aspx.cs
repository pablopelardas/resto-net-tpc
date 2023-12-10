using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace resto_net_tpc
{
    public partial class Error : System.Web.UI.Page
    {
        public string MensajeError { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["error"] != null)
                MensajeError = Session["error"].ToString();
        }
    }
}