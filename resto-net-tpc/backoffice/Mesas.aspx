<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mesas.aspx.cs" Inherits="resto_net_tpc.Mesas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
