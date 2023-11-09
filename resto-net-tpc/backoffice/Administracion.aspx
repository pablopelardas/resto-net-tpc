<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Administracion.aspx.cs" Inherits="resto_net_tpc.Administracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-3">
            <a href="/backoffice/Empleados.aspx">Administrar empleados</a>
        </div>        
        <div class="col-3">
            <a href="/backoffice/Mesas.aspx">Administrar Mesas</a>
        </div>
        <div>
            <a href="/backoffice/Insumos.aspx">Administrar insumos</a>
        </div>

    </div>

</asp:Content>

