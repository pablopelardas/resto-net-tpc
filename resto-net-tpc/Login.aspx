<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="resto_net_tpc.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-4">
            <h2>Login</h2>
            <div class="card">
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Usuario</label>
                    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="Usuario">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput2" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="exampleFormControlInput2" placeholder="Contraseña">
                </div>
                <button type="button" class="btn btn-primary">Primary</button>

            </div>
        </div>
    </div>

</asp:Content>
