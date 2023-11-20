using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace resto_net_tpc.backoffice
{
    public partial class AsignacionMesas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MesasNegocio mesasNegocio = new MesasNegocio();
            EmpleadoNegocio empleadoNegocio = new EmpleadoNegocio();

            try
            {
                if (!IsPostBack)
                {
                    ddlMesasDisponibles.DataSource = mesasNegocio.Listar();
                    ddlMesasDisponibles.DataTextField = "Numero";
                    ddlMesasDisponibles.DataValueField = "Id";
                    ddlMesasDisponibles.DataBind();

                    ddlEmpleadosDisponibles.DataSource = empleadoNegocio.Listar();
                    ddlEmpleadosDisponibles.DataTextField = "Legajo";
                    ddlEmpleadosDisponibles.DataValueField = "Id";
                    ddlEmpleadosDisponibles.DataBind();
                }

                cargarMesasAsignadas();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            MesasAsignadasNegocio negocio = new MesasAsignadasNegocio();
            try
            {
                int idMesa = int.Parse(ddlMesasDisponibles.SelectedItem.Value);
                int idEmpleado = int.Parse(ddlEmpleadosDisponibles.SelectedItem.Value);

                negocio.Asignar(idMesa, idEmpleado);
                cargarMesasAsignadas();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw ex;
                //Redireccionar..
            }
        }

        protected void cargarMesasAsignadas()
        {
            MesasAsignadasNegocio mesasAsignadasNegocio = new MesasAsignadasNegocio();
            try
            {
                dgvMesasAsignadas.DataSource = mesasAsignadasNegocio.Listar();
                dgvMesasAsignadas.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}