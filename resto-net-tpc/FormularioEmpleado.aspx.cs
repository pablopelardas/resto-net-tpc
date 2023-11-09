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
        private bool isEditMode = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            // check if user id is set in query string
            isEditMode = Request.QueryString["id"] != null;
            if (!IsPostBack)
            {
                if (isEditMode)
                {
                    // get user id from query string
                    string id = Request.QueryString["id"];

                    // create instance of user class
                    Mesero mesero = new Mesero();
                    MeseroNegocio meseroNegocio = new MeseroNegocio();

                    // verify if id is int
                    int idInt = 0;
                    bool result = Int32.TryParse(id, out idInt);

                    if (!result)
                    {
                        Response.Redirect("Empleados.aspx", false);
                    }

                    // call method to get all details of user
                    mesero = meseroNegocio.obtener(idInt);

                    // check if user details found
                    if (mesero != null)
                    {
                        // assign user details to form fields
                        tBoxLegajo.Text = mesero.Legajo;
                        tBoxApellido.Text = mesero.Apellido.ToString();
                        tBoxNombre.Text = mesero.Nombre.ToString();
                        tBoxDNI.Text = mesero.Dni;
                        tBoxFechaNacimiento.Text = mesero.FechaNacimiento.ToString("yyyy-MM-dd");
                        tBoxFechaIngreso.Text = mesero.FechaIngreso.ToString("yyyy-MM-dd");
                        tBoxTelefono.Text = mesero.Telefono;
                        tBoxEmail.Text = mesero.Email;
                        tBoxDireccion.Text = mesero.Direccion;
                        tBoxLocalidad.Text = mesero.Localidad;
                        tBoxProvincia.Text = mesero.Provincia;
                        tBoxPass.Text = mesero.Pass;
                    }
                }
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Mesero mesero = new Mesero();
            MeseroNegocio meseroNegocio = new MeseroNegocio();

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
                if (isEditMode)
                {
                    mesero.Id = int.Parse(Request.QueryString["id"]);
                    meseroNegocio.modificar(mesero);
                }
                else
                meseroNegocio.agregar(mesero);
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