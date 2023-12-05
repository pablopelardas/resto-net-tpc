<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="resto_net_tpc.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Hubo un problema</h1>
    <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
    <div>
        <a href="../Login.aspx" class="btn btn-primary">Volver a login</a>
    </div>
</asp:Content>
