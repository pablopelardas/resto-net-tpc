<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="resto_net_tpc.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Hubo un problema</h1>
    <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>

    <%  if (Session["usuario"] == null)
        { %>
            <div>
                <a href="../Login.aspx" class="btn btn-primary">Volver a login</a>
            </div>
    <%  } %>

    <%  if (!(((Dominio.Usuario)Session["usuario"]).Perfil == Dominio.TipoUsuario.ADMIN))
        { %>
            <div>
                <a href="../MesasAsignadas.aspx" class="btn btn-primary">Volver a inicio</a>
            </div>
    <%  } %>


    
</asp:Content>
