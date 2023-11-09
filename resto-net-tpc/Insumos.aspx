<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Insumos.aspx.cs" Inherits="resto_net_tpc.Insumos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="d-flex justify-content-center">
            <h2>Insumos</h2>
        </div>
    </div>

    <div class="row">
        <asp:GridView ID="dgvInsumos" CssClass="table table-dark" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Categoria" DataField="Categoria.Nombre" />
                <asp:BoundField HeaderText="Stock" DataField="Stock" />
                <asp:BoundField HeaderText="Stock minimo" DataField="StockMinimo" />
                <asp:BoundField HeaderText="Precio" DataField="Precio" />
                <asp:CommandField ShowSelectButton="true" SelectText="Editar" HeaderText="Modificar" />
            </Columns>
        </asp:GridView>
        <a href="FormularioInsumo.aspx">Agregar</a>
    </div>

</asp:Content>
