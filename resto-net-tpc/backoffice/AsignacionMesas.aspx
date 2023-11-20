<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AsignacionMesas.aspx.cs" Inherits="resto_net_tpc.backoffice.AsignacionMesas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="header bg-dark">
        <div class="container">
            <div class="btn-menu">
                <label for="btn-menu">☰</label>
            </div>

            <nav class="menu">
                <a href="../backoffice/Administracion.aspx">Inicio</a>
            </nav>
        </div>
    </div>
    <div class="capa"></div>
    <input type="checkbox" id="btn-menu">
    <div class="container-menu">
        <div class="cont-menu">
            <nav>
                <a href="../backoffice/Empleados.aspx">Empleados</a>
                <a href="../backoffice/Insumos.aspx">Insumos</a>
                <a href="../backoffice/Mesas.aspx">Mesas</a>
                <a href="../backoffice/AsignacionMesas.aspx">Asignar Mesas</a>
            </nav>
            <label for="btn-menu">✖️</label>
        </div>
    </div>


    <%-- Muestra las mesas y empleados disponibles --%>
    <div class="d-flex justify-content-center gap-4" style="margin-top: 110px;">
        <div>
            <label>Mesas disponibles</label>
            <asp:DropDownList ID="ddlMesasDisponibles" CssClass="btn btn-outline-dark dropdown-toggle" runat="server"></asp:DropDownList>
        </div>
        <div>
            <label>Empleados disponibles</label>
            <asp:DropDownList ID="ddlEmpleadosDisponibles" CssClass="btn btn-outline-dark dropdown-toggle" runat="server"></asp:DropDownList>
        </div>
        <asp:Button ID="btnAsignar" CssClass="btn btn-primary" runat="server" Text="Asignar" />
    </div>

    <div class="row mt-4">
        <div class="d-flex justify-content-center">
            <h2>Mesas asignadas</h2>
        </div>
    </div>



    <%-- Muestra los empleados disponibles --%>
    <div class="row">
        <asp:GridView ID="dgvEmpleadosDisponibles" DataKeyNames="Id"
            CssClass="table table-dark" runat="server"
            AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Legajo" DataField="Legajo" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" />
            </Columns>
        </asp:GridView>


    </div>







</asp:Content>
