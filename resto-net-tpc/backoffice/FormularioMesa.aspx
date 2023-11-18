<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioMesa.aspx.cs" Inherits="resto_net_tpc.FormularioMesa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-12 d-flex flex-column align-items-center">
            <div class="mb-3">
                <asp:Label ID="lblNumero" CssClass="form-label" runat="server" Text="Número"></asp:Label>
                <asp:TextBox ID="txtNumero" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblCapacidad" CssClass="form-label" runat="server" Text="Capacidad"></asp:Label>
                <asp:TextBox ID="txtCapacidad" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mt-4 mb-3">
                <asp:Label ID="lblError" CssClass="error-label" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>

    <div class=" d-flex flex-column align-items-center">
        <div class="mb-3">
            <asp:Button ID="btnAceptar" OnClick="btnAceptar_Click" CssClass="btn btn-primary" runat="server" Text="Aceptar" />
            <a href="Mesas.aspx" class="btn btn-secondary">Cancelar</a>
            <asp:Button ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-danger" runat="server" Text="Eliminar" />
        </div>
    </div>

</asp:Content>
