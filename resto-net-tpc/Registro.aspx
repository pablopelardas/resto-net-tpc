<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="resto_net_tpc.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .contenedor {
            display: flex;
            flex-direction: column;
            align-items: center;
            align-content: space-between;
            max-width: 580px;
        }
        .input {
            max-width: 580px;
            align-self: center;
        }
    </style>

    <div class="container" style="margin-top: 10px;">

        <div class="text-center">
            <img class="mb-4" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHUtT_9jt5iFJct-Wrgz91DpNN9ceZOsdglA&usqp=CAU" alt="" width="72" height="57">
        </div>

        <div class="contenedor" style="margin-bottom:20px">
            <h2>Registro de nuevo usuario</h2>
        </div>

        <div class="form-signin w-100 m-auto contenedor">

        <div class="form-floating mb-3 w-100">
            <input type="text" class="form-control input" id="floatingNombre" placeholder="Nombre">
            <label for="floatingNombre">Nombre</label>
        </div>
        <div class="form-floating mb-3 w-100">
            <input type="text" class="form-control input" id="floatingApellido" placeholder="Apellido">
            <label for="floatingApellido">Apellido</label>
        </div>

        <div class="form-floating mb-3 w-100">
            <input type="email" class="form-control input" id="floatingEmail" placeholder="Email">
            <label for="floatingEmail">Email</label>
        </div>
        <div class="form-floating mb-3 w-100">
            <input type="text" class="form-control input" id="floatingUsuario" placeholder="Usuario">
            <label for="floatingUsuario">Usuario</label>
        </div>
        <div class="form-floating mb-3 w-100">
            <input type="password" class="form-control input" id="floatingPassword" placeholder="Contraseña">
            <label for="floatingPassword">Contraseña</label>
        </div>


        <div style="margin-top: 20px;">
            <a href="/backoffice/Administracion.aspx" class="btn btn-primary">Crear Usuario</a>
        </div>

        <div style="margin-top: 10px;">
            <a href="/Login.aspx" class="btn btn-outline-secondary">Ya tenés un usuario? Ingresá</a>
        </div>

    </div>

     </div>





</asp:Content>