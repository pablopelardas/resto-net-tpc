using Dominio;
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
        public List<Mesa> ListaMesasNoAsignadas { get; set; }

        public bool MesaLiberada = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["usuario"] == null)
                {
                    Session.Add("error", "Debes loguearte para ingresar");
                    Response.Redirect("../Error.aspx", false);
                }
                else if (!(((Usuario)Session["usuario"]).Perfil == TipoUsuario.ADMIN))
                {
                    Session.Add("error", "No tienes permisos de administrador");
                    Response.Redirect("../Error.aspx", false);
                }

                if (!IsPostBack)
                {
                    cargarDesplegables();
                }

                cargarMesasAsignadas();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void cargarDesplegables()
        {
            MesasNegocio mesasNegocio = new MesasNegocio();
            EmpleadoNegocio empleadoNegocio = new EmpleadoNegocio();
            try
            {
                ListaMesasNoAsignadas = mesasNegocio.ListarMesasNoAsignadas();

                ddlMesasDisponibles.DataSource = ListaMesasNoAsignadas;
                ddlMesasDisponibles.DataTextField = "Numero";
                ddlMesasDisponibles.DataValueField = "Id";
                ddlMesasDisponibles.DataBind();

                ddlEmpleadosDisponibles.DataSource = empleadoNegocio.ListarEmpleadosNoAdmin();
                ddlEmpleadosDisponibles.DataTextField = "Legajo";
                ddlEmpleadosDisponibles.DataValueField = "Id";
                ddlEmpleadosDisponibles.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
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

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            MesasAsignadasNegocio negocio = new MesasAsignadasNegocio();
            try
            {
                int idMesa = int.Parse(ddlMesasDisponibles.SelectedItem.Value);
                int idEmpleado = int.Parse(ddlEmpleadosDisponibles.SelectedItem.Value);

                negocio.Asignar(idMesa, idEmpleado);
                cargarDesplegables();
                cargarMesasAsignadas();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("../Error.aspx", false);
            }
        }

        protected void dgvMesasAsignadas_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(dgvMesasAsignadas.SelectedDataKey.Value.ToString());
            liberarMesaAsignada(id);
            cargarDesplegables();
            cargarMesasAsignadas();
        }

        protected void liberarMesaAsignada(int id)
        {
            MesasAsignadasNegocio negocio = new MesasAsignadasNegocio();
            PedidoNegocio pedidoNegocio = new PedidoNegocio();
            try
            {
                // 1.Tengo el registro de la mesa asignada que quiero liberar.
                MesaAsignada mesaAsignada = negocio.BuscarMesaAsignada(id);

                // 2.Buscar si hay un pedido con esa mesa asignada.
                bool pedidoAbierto = pedidoNegocio.BuscarPedidoAbierto(mesaAsignada.IdMesaAsignada);

                if (pedidoAbierto == false && mesaAsignada.EstadoMesaAsignada == "libre")
                {
                    negocio.LiberarMesaAsignada(mesaAsignada.IdMesaAsignada, mesaAsignada.Id);
                }
                else
                {
                    MesaLiberada = false;
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("../Error.aspx", false);
            }
        }
    }
}