<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioInsumo.aspx.cs" Inherits="resto_net_tpc.FormularioInsumo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-12 d-flex flex-column align-items-center">
            <div class="mb-3">
                <asp:Label ID="lblNombre" CssClass="form-label" runat="server" Text="Nombre"></asp:Label>
                <asp:TextBox ID="tBoxNombre" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblCategoria" CssClass="form-label" runat="server" Text="Categoria"></asp:Label>
                <asp:DropDownList ID="ddlCategoria" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblStock" CssClass="form-label" runat="server" Text="Stock"></asp:Label>
                <asp:TextBox ID="tBoxStock" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblStockMinimo" CssClass="form-label" runat="server" Text="Stock minimo"></asp:Label>
                <asp:TextBox ID="tBoxStockMinimo" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblPrecio" CssClass="form-label" runat="server" Text="Precio"></asp:Label>
                <asp:TextBox ID="tBoxPrecio" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
         
           
            <div class="mb-3">
                <asp:Button ID="btnAceptar" OnClick="btnAceptar_Click" CssClass="btn btn-primary" runat="server" Text="Aceptar" />
                <a href="Insumos.aspx" class="btn btn-secondary">Cancelar</a>
                <asp:Button ID="btnEliminar" CssClass="btn btn-danger" runat="server" Text="Eliminar" />
            </div>


        </div>
    </div>

</asp:Content>
