<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mesas.aspx.cs" Inherits="resto_net_tpc.Mesas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="header bg-dark">
        <div class="container">
            <div class="btn-menu">
                <label for="btn-menu">☰</label>
            </div>

            <nav class="menu">
                <a href="#">Inicio</a>
                <a href="#">Nosotros</a>
                <a href="#">Blog</a>
                <a href="#">Contacto</a>
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
            </nav>
            <label for="btn-menu">✖️</label>
        </div>
    </div>

    <div class="row" style="margin-top: 110px;">
        <div class="d-flex justify-content-center">
            <h2>Mesas</h2>
        </div>
    </div>

    <div class="row">
        <asp:GridView ID="dgvMesas" DataKeyNames="Id"
            CssClass="table table-dark"
            OnSelectedIndexChanged="dgvMesas_SelectedIndexChanged"
            AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Número" DataField="Numero" />
                <asp:BoundField HeaderText="Capacidad" DataField="Capacidad" />
                <asp:TemplateField HeaderText="Estado">
                    <ItemTemplate>
                        <asp:Label ID="lblEstado" runat="server" Text='<%# Convert.ToBoolean(Eval("Estado")) ? "Activa" : "Inactiva" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowSelectButton="true" SelectText="📝" />
            </Columns>
        </asp:GridView>

        <div>
            <a class="btn btn-primary" href="./FormularioMesa.aspx">Agregar</a>
        </div>
    </div>

</asp:Content>
