<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mesas.aspx.cs" Inherits="resto_net_tpc.Mesas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="d-flex justify-content-center">
            <h2>Mesas</h2>
        </div>
    </div>

    <div class="row">
        <asp:GridView ID="dgvMesas" DataKeyNames="Id"
            CssClass="table table-dark" OnSelectedIndexChanged="dgvMesas_SelectedIndexChanged"
            AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Número" DataField="Numero" />
                <asp:BoundField HeaderText="Capacidad" DataField="Capacidad" />
                <asp:BoundField HeaderText="Estado" DataField="Estado" />
                <asp:CommandField ShowSelectButton="true" SelectText="Editar" HeaderText="Modificar" />
            </Columns>
        </asp:GridView>
        <a href="FormularioEmpleado.aspx">Agregar</a>
    </div>

</asp:Content>
