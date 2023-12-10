<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Insumos.aspx.cs" Inherits="resto_net_tpc.Insumos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row" style="margin-top: 110px;">
        <div class="d-flex justify-content-center">
            <h2>Insumos</h2>
        </div>
    </div>

    <div class="row">
        <asp:GridView ID="dgvInsumos" DataKeyNames="Id"
            OnSelectedIndexChanged="dgvInsumos_SelectedIndexChanged"
            CssClass="table table-dark" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Categoria" DataField="Categoria.Nombre" />
                <asp:BoundField HeaderText="Stock" DataField="Stock" />
                <asp:BoundField HeaderText="Stock minimo" DataField="StockMinimo" />
                <asp:BoundField HeaderText="Precio" DataField="Precio" />
                <asp:CommandField ShowSelectButton="true" SelectText="📝" />
            </Columns>
        </asp:GridView>

        <div>
            <a class="btn btn-primary" href="./FormularioInsumo.aspx">Agregar</a>
        </div>
    </div>

</asp:Content>
