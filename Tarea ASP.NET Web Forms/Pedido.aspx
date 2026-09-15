<%@ Page Title="Nuevo pedido" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pedido.aspx.cs" Inherits="Tarea_ASP.NET_Web_Forms.Pedido" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="py-3">Nuevo pedido</h2>

    <asp:ValidationSummary ID="vsPedido" runat="server"
                           CssClass="alert alert-danger"
                           HeaderText="Revisá los siguientes campos:" />

    <asp:Label ID="lblMensaje" runat="server" Visible="false" />

    <div class="row mb-3">
        <div class="col-md-6">
            <label class="form-label">Nombre y apellido *</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" MaxLength="100" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNombre"
                ErrorMessage="El nombre es obligatorio." Text="*"
                CssClass="text-danger" Display="Dynamic" />
        </div>
        <div class="col-md-6">
            <label class="form-label">Correo electrónico *</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" MaxLength="100" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                ErrorMessage="El correo es obligatorio." Text="*"
                CssClass="text-danger" Display="Dynamic" />
            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail"
                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]{2,}$"
                ErrorMessage="El correo no tiene un formato válido." Text="*"
                CssClass="text-danger" Display="Dynamic" />
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-md-6">
            <label class="form-label">Teléfono</label>
            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" MaxLength="30" />
        </div>
        <div class="col-md-6">
            <label class="form-label">Dirección de entrega</label>
            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" MaxLength="200" />
        </div>
    </div>

    <div class="row mb-4">
        <div class="col-md-6">
            <label class="form-label">Producto *</label>
            <asp:DropDownList ID="ddlProductos" runat="server" CssClass="form-select"
                              AppendDataBoundItems="true">
                <asp:ListItem Text="-- Seleccione un producto --" Value="" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlProductos"
                InitialValue=""
                ErrorMessage="Debe seleccionar un producto." Text="*"
                CssClass="text-danger" Display="Dynamic" />
        </div>
        <div class="col-md-6">
            <label class="form-label">Cantidad *</label>
            <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" Text="1" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCantidad"
                ErrorMessage="La cantidad es obligatoria." Text="*"
                CssClass="text-danger" Display="Dynamic" />
            <asp:RangeValidator runat="server" ControlToValidate="txtCantidad"
                MinimumValue="1" MaximumValue="100" Type="Integer"
                ErrorMessage="La cantidad debe ser un número entero entre 1 y 100." Text="*"
                CssClass="text-danger" Display="Dynamic" />
        </div>
    </div>

    <asp:Button ID="btnGuardar" runat="server" Text="Guardar pedido"
                CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
    <asp:Button ID="btnCancelar" runat="server" Text="Limpiar"
                CssClass="btn btn-outline-secondary" OnClick="btnCancelar_Click"
                CausesValidation="false" />

</asp:Content>
