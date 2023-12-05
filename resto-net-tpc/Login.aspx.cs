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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {
                usuario.Empleado = new Empleado();
                usuario.Empleado.Legajo = tBoxUsuario.Text;
                usuario.Contrasenia = tBoxContrasenia.Text;

                if (negocio.BuscarUsuario(usuario))
                {
                    if (usuario.Perfil == TipoUsuario.ADMIN)
                    {
                        Session.Add("usuario", usuario);
                        Response.Redirect("backoffice/Administracion.aspx", false);
                    }
                    else if (usuario.Perfil == TipoUsuario.NORMAL)
                    {
                        Session.Add("usuario", usuario);
                        Response.Redirect("MesasAsignadas.aspx", false);
                    }
                }
                else
                {
                    Session.Add("error", "Usuario o contraseña incorretos");
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
            }
        }
    }
}