<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="resto_net_tpc.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .contenedor {
            display: flex;
            flex-direction: column;
            align-items: center;
            align-content: space-between
        }
    </style>

    <div class="row" style="margin-top: 10px;">
        <div class="form-signin w-100 m-auto contenedor">

            <img class="mb-4" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHUtT_9jt5iFJct-Wrgz91DpNN9ceZOsdglA&usqp=CAU" alt="" width="72" height="57">

            <div class="form-floating mb-3">
                <asp:TextBox ID="tBoxUsuario" placeholder="Usuario" CssClass="form-control" runat="server"></asp:TextBox>
                <label for="tBoxUsuario">Usuario</label>
            </div>

            <div class="form-floating mb-3">
                <asp:TextBox ID="tBoxContrasenia" TextMode="Password" placeholder="Contraseña" CssClass="form-control" runat="server"></asp:TextBox>
                <label for="tBoxContrasenia">Contraseña</label>
            </div>

            <div>
                <asp:Button ID="btnIngresar" OnClick="btnIngresar_Click" class="btn btn-primary" runat="server" Text="Ingresar" />
            </div>

            <div style="margin-top: 10px;">
                <a href="/Registro.aspx" class="btn btn-outline-secondary">Todavía no tenés un usuario? Registrate</a>
            </div>

        </div>
    </div>
</asp:Content>
