<%@ Page Title="Catálogo de productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Tarea_ASP.NET_Web_Forms.Productos" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="py-3">Catálogo de productos</h2>

    <div class="row g-2 align-items-end mb-3">
        <div class="col-auto">
        <asp:Label runat="server" AssociatedControlID="txtBuscar"
                   Text="Buscar por nombre:" CssClass="form-label" />
        <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" />
        </div>
        <div class="col-auto">
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar"
                    CssClass="btn btn-primary" OnClick="btnBuscar_Click" />
        <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar"
                    CssClass="btn btn-outline-secondary" OnClick="btnLimpiar_Click" />
        </div>
    </div>

    <asp:SqlDataSource ID="dsProductos" runat="server"
    ConnectionString="<%$ ConnectionStrings:TecnoSurConnectionString %>"
    SelectCommand="SELECT IdProducto, Nombre, Descripcion, Precio, Stock
                   FROM Productos
                   WHERE Nombre LIKE '%' + @Nombre + '%'
                   ORDER BY Nombre">
    <SelectParameters>
        <asp:ControlParameter Name="Nombre"
                              ControlID="txtBuscar"
                              PropertyName="Text"
                              Type="String"
                              DefaultValue=""
                              ConvertEmptyStringToNull="False" />
    </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="gvProductos" runat="server"
        DataSourceID="dsProductos"
        DataKeyNames="IdProducto"
        AutoGenerateColumns="False"
        AllowSorting="True"
        AllowPaging="True"
        PageSize="5"
        CssClass="table table-striped table-bordered">
        <Columns>
            <asp:BoundField DataField="IdProducto"  HeaderText="#"           SortExpression="IdProducto" />
            <asp:BoundField DataField="Nombre"      HeaderText="Producto"    SortExpression="Nombre" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
            <asp:BoundField DataField="Precio"      HeaderText="Precio"      SortExpression="Precio"
                            DataFormatString="{0:N2}" />
            <asp:BoundField DataField="Stock"       HeaderText="Stock"       SortExpression="Stock" />
        </Columns>
        <EmptyDataTemplate>
            No hay productos cargados.
        </EmptyDataTemplate>
    </asp:GridView>

</asp:Content>
