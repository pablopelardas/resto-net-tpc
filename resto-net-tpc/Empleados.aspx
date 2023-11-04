<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="resto_net_tpc.Empleados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <h2>Empleados</h2>
    </div>

    <div class="row">
        <asp:GridView ID="dgvEmpleados" runat="server"></asp:GridView>
    </div>

</asp:Content>
