<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="resto_net_tpc.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Hubo un problema</h1>
    <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>

    <%-- Si no se encuentra logueado. --%>
    <%  if (Session["usuario"] == null)
        { %>
            <div>
                <a href="../Login.aspx" class="btn btn-primary">Volver a login</a>
            </div>
    <%  } %>

    <%-- Si se encuentra con la session activa y si es un administrador. --%>
    <%  if (Session["usuario"] != null && ((Dominio.Usuario)Session["usuario"]).Perfil == Dominio.TipoUsuario.ADMIN)
        { %>
            <div>
                <a href="backoffice/Administracion.aspx" class="btn btn-primary">Volver a inicio</a>
            </div>
    <%  } %>

    <%-- Si se encuentra con la session activa y si es un mesero. --%>
    <%  if (Session["usuario"] != null && ((Dominio.Usuario)Session["usuario"]).Perfil == Dominio.TipoUsuario.NORMAL)
        { %>
            <div>
                <a href="MesasAsignadas.aspx" class="btn btn-primary">Volver a inicio</a>
            </div>
    <%  } %>


</asp:Content>
