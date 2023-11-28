<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="resto_net_tpc.Pedidos" %>

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
                                        <asp:Button ID="btnInsumo" OnClick="btnInsumo_Click" runat="server" Text='<% #Eval("Nombre") %>' 
                                            CommandArgument='<% #Eval("Id") %>' CommandName="InsumoId" />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>


                        <div class="col-4">
                            <h2>Detalle Pedido</h2>

                            <%  if (PedidoActual != null)
                                {  %>
                                    <asp:GridView ID="dgvPedidoDetalle" CssClass="table" 
                                        AutoGenerateColumns="false" runat="server"
                                        DataKeyNames="Id" OnSelectedIndexChanged="dgvPedidoDetalle_SelectedIndexChanged" >
                                        <Columns>
                                            <asp:BoundField HeaderText="ID" DataField="Id" />
                                            <asp:BoundField HeaderText="Insumo Id" DataField="InsumoId" />
                                            <asp:BoundField HeaderText="Pedido Id" DataField="PedidoId" />
                                            <asp:BoundField HeaderText="Cantidad" DataField="Cantidad" />
                                            <asp:CommandField ShowSelectButton="true" SelectText="➕" ControlStyle-CssClass="text-decoration-none btn" />
                                            <asp:CommandField ShowSelectButton="true" SelectText="➖" ControlStyle-CssClass="text-decoration-none btn"  />
                                            <asp:CommandField ShowSelectButton="true" SelectText="🗑️" ControlStyle-CssClass="text-decoration-none btn btn-danger" />
                                        </Columns>
                                    </asp:GridView>
                                    
                                    <asp:Label ID="Label1" runat="server" Text="Total"></asp:Label>
                                    <asp:Button ID="btnCerrarPedido" CssClass="btn btn-danger" runat="server" Text="Cerrar pedido" />
                            <%  }  %>


                        </div>
                    </div>

            <%  }  %>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
