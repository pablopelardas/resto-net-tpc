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
                DateTime fechaNacimiento;
                DateTime fechaIngreso;
                if (!DateTime.TryParse(tBoxFechaNacimiento.Text, out fechaNacimiento))
                {
                    lblErrorFechaNacimiento.Text = "Fecha de nacimiento no es valida";
                    return;
                }

                if (!DateTime.TryParse(tBoxFechaIngreso.Text, out fechaIngreso))
                {
                    lblErrorFechaIngreso.Text = "Fecha de ingreso no es valida";
                    return;
                }


                empleado.Apellido = tBoxApellido.Text;
                empleado.Nombre = tBoxNombre.Text;
                empleado.Dni = tBoxDNI.Text;
                empleado.FechaNacimiento = fechaNacimiento;
                empleado.FechaIngreso = fechaIngreso;
                empleado.Telefono = tBoxTelefono.Text;
                empleado.Email = tBoxEmail.Text;
                empleado.Direccion = tBoxDireccion.Text;
                empleado.Localidad = tBoxLocalidad.Text;
                empleado.Provincia = tBoxProvincia.Text;
                empleado.Perfil = "mesero";
                empleado.Estado = 1;
                empleado.Pass = tBoxPass.Text;
                if (!ValidateEmpleado(empleado))
                    return;
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

        private bool ValidateEmpleado(Empleado empleado)
        {
            bool flag = true;
            try
            {
                if (empleado.Apellido == null || empleado.Apellido.Length == 0)
                {
                    lblErrorApellido.Text = "Apellido no puede estar vacio";
                    flag = false;
                }
                else lblErrorApellido.Text = "";
                if (empleado.Nombre == null || empleado.Nombre.Length == 0)
                {
                    lblErrorNombre.Text = "Nombre no puede estar vacio";
                    flag = false;
                }
                else lblErrorNombre.Text = "";
                if (empleado.Dni == null || empleado.Dni.Length == 0 || empleado.Dni.Length > 10)
                {
                    lblErrorDNI.Text = "DNI no puede estar vacio y debe tener menos de 10 caracteres";
                    flag = false;
                }
                else lblErrorDNI.Text = "";
                if (empleado.FechaNacimiento == null)
                {
                    lblErrorFechaNacimiento.Text = "Fecha de nacimiento no puede estar vacio";
                    flag = false;
                }
                else lblErrorFechaNacimiento.Text = "";
                if (empleado.Telefono == null || empleado.Telefono.Length == 0)
                {
                    lblErrorTelefono.Text = "Telefono no puede estar vacio";
                    flag = false;
                }
                else lblErrorTelefono.Text = "";
                if (empleado.Email == null || empleado.Email.Length == 0)
                {
                    lblErrorEmail.Text = "Email no puede estar vacio";
                    flag = false;
                }
                else lblErrorEmail.Text = "";
                if (!System.Text.RegularExpressions.Regex.IsMatch(empleado.Email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
                {
                    lblErrorEmail.Text = "Email no es valido";
                    flag = false;
                }
                else lblErrorEmail.Text = "";
                if (empleado.Direccion == null || empleado.Direccion.Length == 0)
                {
                    lblErrorDireccion.Text = "Direccion no puede estar vacio";
                    flag = false;
                }
                else lblErrorDireccion.Text = "";
                if (empleado.Localidad == null || empleado.Localidad.Length == 0)
                {
                    lblErrorLocalidad.Text = "Localidad no puede estar vacio";
                    flag = false;
                }
                else lblErrorLocalidad.Text = "";
                if (empleado.Provincia == null || empleado.Provincia.Length == 0)
                {
                    lblErrorProvincia.Text = "Provincia no puede estar vacio";
                    flag = false;
                }
                else lblErrorProvincia.Text = "";
                if (empleado.Pass == null || empleado.Pass.Length == 0)
                {
                    lblErrorPass.Text = "Contraseña no puede estar vacio";
                    flag = false;
                }
                else lblErrorPass.Text = "";

                return flag;
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