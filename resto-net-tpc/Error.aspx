<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="resto_net_tpc.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Si no se encuentra logueado. --%>
    <%  if (Session["usuario"] == null)
        { %>
            <div>
                <h1>Hubo un problema</h1>
                <label><%: MensajeError %></label>
            </div>
            <div>
                <% Session.Remove("error"); %>
                <a href="../Login.aspx" class="btn btn-primary">Volver a login</a>
            </div>
    <%  } %>

    <%-- Si se encuentra con la session activa y si es un administrador. --%>
    <%  if (Session["usuario"] != null && ((Dominio.Usuario)Session["usuario"]).Perfil == Dominio.TipoUsuario.ADMIN)
        { %>
            <div>
                <h1>Hubo un problema</h1>
                <label><%: MensajeError %></label>
            </div>

            <div>
                <% Session.Remove("error"); %>
                <a href="backoffice/Administracion.aspx" class="btn btn-primary">Volver a inicio</a>
            </div>
    <%  } %>

    <%-- Si se encuentra con la session activa y si es un mesero. --%>
    <%  if (Session["usuario"] != null && ((Dominio.Usuario)Session["usuario"]).Perfil == Dominio.TipoUsuario.NORMAL)
        { %>
            <div>
                <h1>Hubo un problema</h1>
                <label><%: MensajeError %></label>
            </div>
            <div>
                <% Session.Remove("error"); %>
                <a href="MesasAsignadas.aspx" class="btn btn-primary">Volver a inicio</a>
            </div>
    <%  } %>

</asp:Content>
