<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Tarea_ASP.NET_Web_Forms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row py-4" aria-labelledby="tituloBienvenida">
            <div class="col">
                <h1 id="tituloBienvenida">Bienvenido a TecnoSur S.A.</h1>
                <p class="lead">
                    Distribuidora mayorista de equipamiento informático con base en Salta.
                    Desde este sitio puede consultar nuestro catálogo de productos y registrar su pedido en línea.
                </p>
                <p>
                    <a href="~/Productos" runat="server" class="btn btn-primary btn-md">Ver catálogo de productos &raquo;</a>
                    <a href="~/Pedido" runat="server" class="btn btn-outline-secondary btn-md">Realizar un pedido</a>
                </p>
            </div>
        </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="tituloCatalogo">
                <h2 id="tituloCatalogo">Catálogo</h2>
                <p>
                    Consulte el listado completo de productos disponibles, con su precio y stock actualizado.
                    Puede ordenar la grilla por cualquier columna y buscar por nombre.
                </p>
                <p><a class="btn btn-outline-primary" href="~/Productos" runat="server">Ir al catálogo &raquo;</a></p>
            </section>
            <section class="col-md-4" aria-labelledby="tituloPedidos">
                <h2 id="tituloPedidos">Pedidos</h2>
                <p>
                    Complete el formulario con sus datos y el producto que desea adquirir.
                    El pedido queda registrado y nuestro equipo comercial coordina la entrega.
                </p>
                <p><a class="btn btn-outline-primary" href="~/Pedido" runat="server">Cargar pedido &raquo;</a></p>
            </section>
            <section class="col-md-4" aria-labelledby="tituloEmpresa">
                <h2 id="tituloEmpresa">La empresa</h2>
                <p>
                    Conozca nuestra trayectoria, nuestra forma de trabajo y los canales de contacto
                    disponibles para clientes y proveedores.
                </p>
                <p><a class="btn btn-outline-primary" href="~/About" runat="server">Acerca de nosotros &raquo;</a></p>
            </section>
        </div>
    </main>

</asp:Content>
