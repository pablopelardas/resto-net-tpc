<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioEmpleado.aspx.cs" Inherits="resto_net_tpc.FormularioEmpleado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row"  style="margin-top: 110px;">
        <div class="col-6 d-flex flex-column align-items-end">

            <div class="mb-3">
                <asp:Label ID="lblLegajo" CssClass="form-label" runat="server" Text="Legajo"></asp:Label>
                <asp:TextBox ID="tBoxLegajo" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:Label ID="lblErrorLegajo" CssClass="error-label" runat="server" Text=""></asp:Label>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblApellido" CssClass="form-label" runat="server" Text="Apellido"></asp:Label>
                <asp:TextBox ID="tBoxApellido" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:Label ID="lblErrorApellido" CssClass="error-label" runat="server" Text=""></asp:Label>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblNombre" CssClass="form-label" runat="server" Text="Nombre"></asp:Label>
                <asp:TextBox ID="tBoxNombre" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:Label ID="lblErrorNombre" CssClass="error-label" runat="server" Text=""></asp:Label>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblDNI" CssClass="form-label" runat="server" Text="DNI"></asp:Label>
                <asp:TextBox ID="tBoxDNI" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:Label ID="lblErrorDNI" CssClass="error-label" runat="server" Text=""></asp:Label>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblPass" CssClass="form-label" runat="server" Text="Contraseña"></asp:Label>
                <asp:TextBox ID="tBoxPass" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                <asp:Label ID="lblErrorPass" CssClass="error-label" runat="server" Text=""></asp:Label>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblTelefono" CssClass="form-label" runat="server" Text="Telefono"></asp:Label>
                <asp:TextBox ID="tBoxTelefono" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:Label ID="lblErrorTelefono" CssClass="error-label" runat="server" Text=""></asp:Label>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblEmail" CssClass="form-label" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="tBoxEmail" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:Label ID="lblErrorEmail" CssClass="error-label" runat="server" Text=""></asp:Label>
            </div>

            <div class="mt-4 mb-3">
                <asp:Label ID="lblErrorGeneral" CssClass="error-label" runat="server" Text=""></asp:Label>
            </div>

        </div>

        <div class="col-6 d-flex flex-column align-items-start mt-3">


            <div class="mb-3">
                <asp:Label ID="lblDireccion" CssClass="form-label" runat="server" Text="Direccion"></asp:Label>
                <asp:TextBox ID="tBoxDireccion" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:Label ID="lblErrorDireccion" CssClass="error-label" runat="server" Text=""></asp:Label>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblLocalidad" CssClass="form-label" runat="server" Text="Localidad"></asp:Label>
                <asp:TextBox ID="tBoxLocalidad" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:Label ID="lblErrorLocalidad" CssClass="error-label" runat="server" Text=""></asp:Label>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblProvincia" CssClass="form-label" runat="server" Text="Provincia"></asp:Label>
                <asp:TextBox ID="tBoxProvincia" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:Label ID="lblErrorProvincia" CssClass="error-label" runat="server" Text=""></asp:Label>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblFechaNacimiento" CssClass="form-label" runat="server" Text="Fecha de nacimiento"></asp:Label>
                <asp:TextBox ID="tBoxFechaNacimiento" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:Label ID="lblErrorFechaNacimiento" CssClass="error-label" runat="server" Text=""></asp:Label>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblFechaIngreso" CssClass="form-label" runat="server" Text="Fecha de ingreso"></asp:Label>
                <asp:TextBox ID="tBoxFechaIngreso" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:Label ID="lblErrorFechaIngreso" CssClass="error-label" runat="server" Text=""></asp:Label>
            </div>
        </div>

    </div>

    <div class=" d-flex flex-column align-items-center">
        <div class="mb-3">
            <asp:Button ID="btnAceptar" OnClick="btnAceptar_Click" CssClass="btn btn-primary" runat="server" Text="Aceptar" />
            <a href="Empleados.aspx" class="btn btn-secondary">Cancelar</a>
            <asp:Button ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-danger" runat="server" Text="Eliminar" />
        </div>
    </div>


    <style>
        .error-label {
            color: red;
        }
    </style>

</asp:Content>

