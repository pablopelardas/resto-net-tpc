﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioEmpleado.aspx.cs" Inherits="resto_net_tpc.FormularioEmpleado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-6">

            <div class="mb-3">
                <asp:Label ID="lblId" CssClass="form-label" runat="server" Text="Id"></asp:Label>
                <asp:TextBox ID="tBoxId" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblLegajo" CssClass="form-label" runat="server" Text="Legajo"></asp:Label>
                <asp:TextBox ID="tBoxLegajo" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblApellido" CssClass="form-label" runat="server" Text="Apellido"></asp:Label>
                <asp:TextBox ID="tBoxApellido" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblNombre" CssClass="form-label" runat="server" Text="Nombre"></asp:Label>
                <asp:TextBox ID="tBoxNombre" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblDNI" CssClass="form-label" runat="server" Text="DNI"></asp:Label>
                <asp:TextBox ID="tBoxDNI" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblFechaNacimiento" CssClass="form-label" runat="server" Text="Fecha de nacimiento"></asp:Label>
                <asp:TextBox ID="tBoxFechaNacimiento" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblFechaIngreso" CssClass="form-label" runat="server" Text="Fecha de ingreso"></asp:Label>
                <asp:TextBox ID="tBoxFechaIngreso" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblTelefono" CssClass="form-label" runat="server" Text="Telefono"></asp:Label>
                <asp:TextBox ID="tBoxTelefono" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblEmail" CssClass="form-label" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="tBoxEmail" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblDireccion" CssClass="form-label" runat="server" Text="Direccion"></asp:Label>
                <asp:TextBox ID="tBoxDireccion" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblLocalidad" CssClass="form-label" runat="server" Text="Localidad"></asp:Label>
                <asp:TextBox ID="tBoxLocalidad" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblProvincia" CssClass="form-label" runat="server" Text="Provincia"></asp:Label>
                <asp:TextBox ID="tBoxProvincia" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblPerfil" CssClass="form-label" runat="server" Text="Perfil"></asp:Label>
                <asp:TextBox ID="tBoxPerfil" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblPass" CssClass="form-label" runat="server" Text="Contraseña"></asp:Label>
                <asp:TextBox ID="tBoxPass" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnAceptar" CssClass="btn btn-primary" runat="server" Text="Aceptar" />
                <a href="Empleados.aspx" class="btn btn-danger">Cancelar</a>
            </div>


        </div>
    </div>

</asp:Content>