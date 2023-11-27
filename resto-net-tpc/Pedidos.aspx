﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="resto_net_tpc.Pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <%  if (PedidoActual == null)
                {  %>
                    <div class="row">
                        <div class="alert alert-info" role="alert">
                            <p>La mesa seleccionada no posee un pedido en ejecucion. Para iniciar pulse:</p>
                            <asp:Button ID="btnIniciarPedido" CssClass="btn btn-primary" OnClick="btnIniciarPedido_Click" runat="server" Text="Iniciar pedido" />
                        </div>
                    </div>
            <%  }
                else if (PedidoActual != null)
                {  %>

                    <div class="d-flex justify-content-between">
                        <label>N° Pedido <%: PedidoActual.Id %></label>
                        <label>Hora de inicio: <%: PedidoActual.Apertura.ToString("HH:mm tt") %> </label>
                    </div>


                    <div class="row">
                        <div class="col-8">
                            <div class="mt-2">
                                <asp:Repeater ID="repCategorias" runat="server">
                                    <ItemTemplate>
                                        <asp:Button ID="btnCategoria" runat="server" Text='<% #Eval("Nombre") %>'
                                            CommandArgument='<% #Eval("Id") %>' CommandName="CategoriaId"
                                            OnClick="btnCategoria_Click" />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="mt-2">
                                <asp:Repeater ID="repInsumosPorCategoria" runat="server">
                                    <ItemTemplate>
                                        <asp:Button ID="btnInsumo" runat="server" Text='<% #Eval("Nombre") %>' />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>


                        <div class="col-4" style="background-color: darkolivegreen;">
                            <h2>Detalle Pedido</h2>

                            <asp:GridView ID="dgvPedidoDetalle" runat="server"></asp:GridView>

                        </div>
                    </div>

            <%  }  %>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
