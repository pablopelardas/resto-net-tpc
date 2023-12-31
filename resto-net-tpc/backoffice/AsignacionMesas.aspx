﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AsignacionMesas.aspx.cs" Inherits="resto_net_tpc.backoffice.AsignacionMesas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <%  if (ListaMesasNoAsignadas != null)
                { %>
                    <%-- Muestra las mesas y empleados disponibles. --%>
                    <%  if (ListaMesasNoAsignadas.Count() != 0)
                        { %>
                            <div class="d-flex justify-content-center gap-4" style="margin-top: 110px;">
                                <div>
                                    <label>Mesas disponibles</label>
                                    <asp:DropDownList ID="ddlMesasDisponibles" CssClass="btn btn-outline-dark dropdown-toggle" runat="server"></asp:DropDownList>
                                </div>
                                <div>
                                    <label>Empleados disponibles</label>
                                    <asp:DropDownList ID="ddlEmpleadosDisponibles" CssClass="btn btn-outline-dark dropdown-toggle" runat="server"></asp:DropDownList>
                                </div>
                                <asp:Button ID="btnAsignar" OnClick="btnAsignar_Click" CssClass="btn btn-primary" runat="server" Text="Asignar" />
                            </div>
                     <% }
                        else
                        { %>
                            <div style="margin-top: 110px;">
                                <div class="alert alert-danger d-flex justify-content-between my-2 position-static" role="alert">
                                    Todas las mesas se encuentran asignadas.
                                </div>
                            </div>
                     <% } %>
            <%  } %>

             <%  if (MesaLiberada == false)
                 { %>
                     <div>
                         <div class="alert alert-danger d-flex justify-content-between my-2 position-static" role="alert">
                             No se puede liberar una mesa que se encuentra ocupada.
                         </div>
                     </div>
             <%  } %>

            <%-- Muestra las mesas asignadas a cada empleado. --%>
            <div class="row mt-4" style="margin-top: 110px;">
                <div class="d-flex justify-content-center">
                    <h2>Mesas asignadas</h2>
                </div>
            </div>

            <div class="row">
                <asp:GridView ID="dgvMesasAsignadas" CssClass="table" AutoGenerateColumns="false" runat="server"
                    DataKeyNames="IdMesaAsignada" OnSelectedIndexChanged="dgvMesasAsignadas_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="N° Mesa" DataField="Numero" />
                        <asp:BoundField HeaderText="Empleado" DataField="Empleado.Legajo" />
                        <asp:BoundField HeaderText="Fecha" DataField="Fecha" />
                        <asp:BoundField HeaderText="Estado" DataField="EstadoMesaAsignada" />
                        <asp:CommandField ShowSelectButton="true" ControlStyle-CssClass="text-decoration-none btn btn-danger" SelectText="Liberar" />
                    </Columns>
                </asp:GridView>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
