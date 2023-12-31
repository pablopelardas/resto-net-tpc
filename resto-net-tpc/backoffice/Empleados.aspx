﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="resto_net_tpc.Empleados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row" style="margin-top: 110px;">
        <div class="d-flex justify-content-center">
            <h2>Empleados</h2>
        </div>
    </div>

    <div class="row">
        <asp:GridView ID="dgvEmpleados" DataKeyNames="Id"
            CssClass="table table-dark" OnSelectedIndexChanged="dgvEmpleados_SelectedIndexChanged"
            AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Legajo" DataField="Legajo" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Fecha Ingreso" DataField="FechaIngreso" />
                <asp:BoundField HeaderText="Fecha Egreso" DataField="FechaEgreso" />
                <asp:BoundField HeaderText="Telefono" DataField="Telefono" />
                <asp:CommandField ShowSelectButton="true" SelectText="📝" />
            </Columns>
        </asp:GridView>

        <div>
            <a class="btn btn-primary" href="./FormularioEmpleado.aspx">Agregar</a>
        </div>
    </div>

</asp:Content>
