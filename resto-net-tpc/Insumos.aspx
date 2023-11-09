<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Insumos.aspx.cs" Inherits="resto_net_tpc.Insumos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="d-flex justify-content-center">
            <h2>Insumos</h2>
        </div>
    </div>

    <div class="row">
        <asp:GridView ID="dgvInsumos" runat="server"></asp:GridView>
    </div>

</asp:Content>
