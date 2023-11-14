<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="resto_net_tpc.Pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-8">

            <asp:Repeater ID="repCategorias" runat="server">
                <ItemTemplate>
                    <asp:Button ID="btnCategoria" runat="server" Text='<% #Eval("Nombre") %>' 
                        CommandArgument='<% #Eval("Id") %>' CommandName="CategoriaId"
                        OnClick="btnCategoria_Click" />
                </ItemTemplate>
            </asp:Repeater>

            

        </div>


        <div class="col-4" style="background-color: darkolivegreen;">
            <h2>detalle</h2>

          

        </div>


    </div>



</asp:Content>
