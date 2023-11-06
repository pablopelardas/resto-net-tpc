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
    public partial class FormularioEmpleado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            tBoxId.Enabled = false;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Mesero mesero = new Mesero();
            MeseroNegocio negocio = new MeseroNegocio();

            try
            {
                mesero.Legajo = tBoxLegajo.Text;
                mesero.Apellido = tBoxApellido.Text;
                mesero.Nombre = tBoxNombre.Text;
                mesero.Dni = tBoxDNI.Text;
                mesero.FechaNacimiento = DateTime.Parse(tBoxFechaNacimiento.Text);
                mesero.FechaIngreso = DateTime.Parse(tBoxFechaIngreso.Text);
                mesero.Telefono = tBoxTelefono.Text;
                mesero.Email = tBoxEmail.Text;
                mesero.Direccion = tBoxDireccion.Text;
                mesero.Localidad = tBoxLocalidad.Text;
                mesero.Provincia = tBoxProvincia.Text;
                mesero.Perfil = "mesero";
                mesero.Estado = 1;
                mesero.Pass = tBoxPass.Text;

                negocio.agregar(mesero);
                Response.Redirect("Empleados.aspx", false);
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