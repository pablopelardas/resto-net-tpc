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
        private int id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            // check if user id is set in query string
            tBoxLegajo.Enabled = false;
            toggleLegajo(false);
            isEditMode = Request.QueryString["id"] != null;
            if (isEditMode)
            {
                bool result = Int32.TryParse(Request.QueryString["id"], out id);
                if (!result || id < 0)
                {
                    Response.Redirect("Empleados.aspx", false);
                }
                if (!IsPostBack)
                {
                    // create instance of user class
                    Empleado empleado = new Empleado();
                    EmpleadoNegocio empleadoNegocio = new EmpleadoNegocio();

                    try
                    {
                        // call method to get all details of user
                        empleado = empleadoNegocio.Obtener(id);

                        // check if user details found
                        if (empleado != null)
                        {
                            // assign user details to form fields
                            tBoxLegajo.Text = empleado.Legajo.ToString();
                            tBoxApellido.Text = empleado.Apellido.ToString();
                            tBoxNombre.Text = empleado.Nombre.ToString();
                            tBoxDNI.Text = empleado.Dni;
                            tBoxFechaNacimiento.Text = empleado.FechaNacimiento.ToString("yyyy-MM-dd");
                            tBoxFechaIngreso.Text = empleado.FechaIngreso.ToString("yyyy-MM-dd");
                            tBoxTelefono.Text = empleado.Telefono;
                            tBoxEmail.Text = empleado.Email;
                            tBoxDireccion.Text = empleado.Direccion;
                            tBoxLocalidad.Text = empleado.Localidad;
                            tBoxProvincia.Text = empleado.Provincia;
                            tBoxPass.Text = empleado.Pass;
                            toggleLegajo(true);
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

        private void toggleLegajo(bool visible)
        {
            tBoxLegajo.Visible = visible;
            lblLegajo.Visible = visible;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Empleado empleado = new Empleado();
            EmpleadoNegocio empleadoNegocio = new EmpleadoNegocio();

            try
            {
                empleado.Apellido = tBoxApellido.Text;
                empleado.Nombre = tBoxNombre.Text;
                empleado.Dni = tBoxDNI.Text;
                empleado.FechaNacimiento = DateTime.Parse(tBoxFechaNacimiento.Text);
                empleado.FechaIngreso = DateTime.Parse(tBoxFechaIngreso.Text);
                empleado.Telefono = tBoxTelefono.Text;
                empleado.Email = tBoxEmail.Text;
                empleado.Direccion = tBoxDireccion.Text;
                empleado.Localidad = tBoxLocalidad.Text;
                empleado.Provincia = tBoxProvincia.Text;
                empleado.Perfil = "mesero";
                empleado.Estado = 1;
                empleado.Pass = tBoxPass.Text;
                if (id >= 0)
                {
                    empleado.Id = int.Parse(Request.QueryString["id"]);
                    empleado.Legajo = tBoxLegajo.Text;
                    empleadoNegocio.Modificar(empleado);
                }
                else
                empleadoNegocio.Agregar(empleado);
                Response.Redirect("Empleados.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw ex;
                // Redireccionar a pagina de error..
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            EmpleadoNegocio meseroNegocio = new EmpleadoNegocio();
            try
            {
                meseroNegocio.Eliminar(id);
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