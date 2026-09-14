<%@ Page Title="Acerca de" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Tarea_ASP.NET_Web_Forms.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="titulo" class="py-4">
        <h2 id="titulo">Acerca de TecnoSur S.A.</h2>
        <p class="lead">Distribuidora mayorista de equipamiento informático.</p>

        <p>
            TecnoSur S.A. es una empresa ficticia creada con fines académicos para el desarrollo
            de este trabajo práctico de ASP.NET Web Forms. Se dedica a la comercialización mayorista
            de computadoras, periféricos y accesorios de red en el noroeste argentino.
        </p>

        <h3>Nuestros datos</h3>
        <ul>
            <li><strong>Razón social:</strong> TecnoSur S.A.</li>
            <li><strong>Domicilio:</strong> Av. Belgrano 1234, Salta Capital</li>
            <li><strong>Teléfono:</strong> (0387) 400-0000</li>
            <li><strong>Correo:</strong> ventas@tecnosur.example</li>
            <li><strong>Horario de atención:</strong> lunes a viernes de 9 a 18 h</li>
        </ul>

        <h3>Cómo trabajamos</h3>
        <p>
            Los pedidos ingresados desde este sitio se registran en nuestra base de datos y son
            revisados por el área comercial dentro de las 24 horas hábiles siguientes.
        </p>
    </main>
</asp:Content>
