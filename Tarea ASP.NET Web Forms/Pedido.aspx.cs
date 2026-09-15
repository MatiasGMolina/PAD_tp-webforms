using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Tarea_ASP.NET_Web_Forms
{
    public partial class Pedido : System.Web.UI.Page
    {
        private string Cadena
        {
            get
            {
                return ConfigurationManager
                    .ConnectionStrings["TecnoSurConnectionString"].ConnectionString;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProductos();
            }
        }

        private void CargarProductos()
        {
            DataTable tabla = new DataTable();

            using (SqlConnection conexion = new SqlConnection(Cadena))
            using (SqlCommand comando = new SqlCommand(
                       "SELECT IdProducto, Nombre FROM Productos ORDER BY Nombre", conexion))
            using (SqlDataAdapter adaptador = new SqlDataAdapter(comando))
            {
                adaptador.Fill(tabla);
            }

            ddlProductos.DataSource = tabla;
            ddlProductos.DataTextField = "Nombre";
            ddlProductos.DataValueField = "IdProducto";
            ddlProductos.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string sql = @"INSERT INTO Pedidos
                               (NombreCliente, Email, Telefono, Direccion, IdProducto, Cantidad)
                           VALUES
                               (@NombreCliente, @Email, @Telefono, @Direccion, @IdProducto, @Cantidad)";

            try
            {
                using (SqlConnection conexion = new SqlConnection(Cadena))
                using (SqlCommand comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.Add("@NombreCliente", SqlDbType.VarChar, 100).Value =
                        txtNombre.Text.Trim();
                    comando.Parameters.Add("@Email", SqlDbType.VarChar, 100).Value =
                        txtEmail.Text.Trim();
                    comando.Parameters.Add("@Telefono", SqlDbType.VarChar, 30).Value =
                        string.IsNullOrWhiteSpace(txtTelefono.Text)
                            ? (object)DBNull.Value : txtTelefono.Text.Trim();
                    comando.Parameters.Add("@Direccion", SqlDbType.VarChar, 200).Value =
                        string.IsNullOrWhiteSpace(txtDireccion.Text)
                            ? (object)DBNull.Value : txtDireccion.Text.Trim();
                    comando.Parameters.Add("@IdProducto", SqlDbType.Int).Value =
                        int.Parse(ddlProductos.SelectedValue);
                    comando.Parameters.Add("@Cantidad", SqlDbType.Int).Value =
                        int.Parse(txtCantidad.Text);

                    conexion.Open();
                    int filas = comando.ExecuteNonQuery();
                    conexion.Close();

                    if (filas == 1)
                    {
                        MostrarMensaje("Pedido registrado correctamente. ¡Gracias por su compra!",
                                       "alert alert-success");
                        LimpiarFormulario();
                    }
                    else
                    {
                        MostrarMensaje("No se pudo registrar el pedido.", "alert alert-warning");
                    }
                }
            }
            catch (SqlException ex)
            {
                MostrarMensaje("Error al guardar el pedido: " + ex.Message, "alert alert-danger");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
            lblMensaje.Visible = false;
        }

        private void LimpiarFormulario()
        {
            txtNombre.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            txtDireccion.Text = string.Empty;
            txtCantidad.Text = "1";
            ddlProductos.SelectedIndex = 0;
        }

        private void MostrarMensaje(string texto, string clase)
        {
            lblMensaje.Text = texto;
            lblMensaje.CssClass = clase;
            lblMensaje.Visible = true;
        }
    }
}