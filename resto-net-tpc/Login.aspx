<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="resto_net_tpc.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .container {
            display: flex;
        }
    </style>

    <div class="container">
        <div class="form-signin w-100 m-auto">

            <img class="mb-4" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHUtT_9jt5iFJct-Wrgz91DpNN9ceZOsdglA&usqp=CAU" alt="" width="72" height="57">

            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="floatingInput" placeholder="Usuario">
                <label for="floatingInput">Usuario</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" placeholder="Contraseña">
                <label for="floatingPassword">Contraseña</label>
            </div>


            <button class="btn btn-primary w-100 py-2" type="submit">Sign in</button>
        </div>
    </div>




</asp:Content>
