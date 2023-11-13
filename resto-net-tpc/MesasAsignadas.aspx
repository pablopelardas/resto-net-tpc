<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MesasAsignadas.aspx.cs" Inherits="resto_net_tpc.MesasAsignadas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="d-flex flex-column align-items-center mt-2">
            <h2>Mesas asignadas</h2>
        </div>
    </div>

    <div class="row row-cols-md-4 g-4 mt-0">

        <%  foreach (Dominio.Mesa mesa in ListaMesasAsignadas)
            {
        %>
                <div class="col">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title"><%: mesa.Numero %></h5>
                            <p class="card-text"><%: mesa.Capacidad %></p>
                            <p class="card-text"><%: mesa.Ocupacion %></p>
                            <a href="Pedidos.aspx" class="btn">Abir</a>
                        </div>
                    </div>
                </div>
        <%  } %>   

    </div>

</asp:Content>
