<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mesas.aspx.cs" Inherits="resto_net_tpc.Mesas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-8">

            <h2>Mesas</h2>

            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Nº</th>
                        <th scope="col">Capacidad</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Accion</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>4</td>
                        <td>Disponible</td>
                        <td><a href="#" class="btn btn-primary">Iniciar pedido</a></td>
                    </tr>
                    <tr>
                        <th scope="row">5</th>
                        <td>2</td>
                        <td>Ocupada</td>
                        <td><a href="#" class="btn btn-primary">Iniciar pedido</a></td>
                    </tr>
                    <tr>
                        <th scope="row">7</th>
                        <td>4</td>
                        <td>Disponible</td>
                        <td><a href="#" class="btn btn-primary">Iniciar pedido</a></td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>

</asp:Content>
