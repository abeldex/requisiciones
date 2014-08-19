using BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation_Layer
{
    public partial class Principal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblFecha.Text = System.DateTime.Today.ToShortDateString();
                string userName = "";
                userName = HttpContext.Current.User.Identity.Name;
                string rol = "";
                string nombre = "";
                usuario user = new usuario();
                user.USUARIO = userName;
                rol = user.Obtener_ROL().Rows[0][0].ToString();
                nombre = user.Obtener_ROL().Rows[0][1].ToString();
                lblName.Text = nombre;
                lblNombre.Text = userName;
                //DataList1.DataBind();
                if (rol == "ADMINISTRADOR")
                {
                    Response.Redirect("Administracion.aspx");
                }
                validar_boton_enviar();
            }
            
        }

        protected void validar_boton_enviar()
        {
            if (GridListaPedidos.Rows.Count == 0)
                btnEnviar.Enabled = false;
            else
                btnEnviar.Enabled = true;
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            lblCategoria.Text = "PAPELERIA";
            GridView3.DataBind();
        }

        protected void btnCartuchos_Click(object sender, EventArgs e)
        {
            lblCategoria.Text = "CARTUCHOS";
            GridView3.DataBind();
        }

        protected void btnMantenimiento_Click(object sender, EventArgs e)
        {
            lblCategoria.Text = "MANTENIMIENTO";
            GridView3.DataBind();
        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = 0;
            int articulo = 0;
            try
            {
                index = Convert.ToInt32(e.CommandArgument);
                articulo = Convert.ToInt32(GridView3.DataKeys[index].Value);
            }
            catch
            {

            }

            if (e.CommandName == "Select")
            {

            }
            if (e.CommandName == "order")
            {
                //MessageBox(articulo.ToString());
            }
        }

        private void MessageBox(string msg)
        {
            Label lbl = new Label();
            lbl.Text = "<script language='javascript'>" + Environment.NewLine + "window.alert('" + msg + "')</script>";
            Page.Controls.Add(lbl);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            pedidos p = new pedidos();
            ImageButton btn = (ImageButton)sender;          
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            p.ID_ARTICULO = int.Parse(GridView3.DataKeys[row.RowIndex].Value.ToString());
            p.CANTIDAD = int.Parse(h1.Value.ToString());
            p.USUARIO = HttpContext.Current.User.Identity.Name;
            p.FECHA = System.DateTime.Today.ToShortDateString();
            p.Solicitar_Articulo();
            GridListaPedidos.DataBind();
            validar_boton_enviar();
            p = null;
           // MessageBox("ARTICULO = " + GridView3.DataKeys[row.RowIndex].Value.ToString() + " CANTIDAD = " + h1.Value.ToString());
        }

        protected void btnAdd_Click(object sender, ImageClickEventArgs e)
        {
           
        }
        protected void btnAdd_Click1(object sender, EventArgs e)
        {
           
        }

        protected void GridListaPedidos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
        }

        private void Borrar(int id_detalle_pedido)
        {
            pedidos p = new pedidos();
            try
            {
                p.ID_DETALLE_PEDIDO = id_detalle_pedido;
                p.Eliminar_Detalle_pedido();
                p = null;
                GridListaPedidos.DataBind();
                validar_boton_enviar();
            }
            catch (Exception err)
            {
                MessageBox(err.Message);
            }
        }

        protected void btnDelete_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Borrar(int.Parse(GridListaPedidos.DataKeys[row.RowIndex].Value.ToString()));
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            pedidos p = new pedidos();
            try
            {
                p.FECHA = System.DateTime.Today.ToShortDateString();
                p.USUARIO = HttpContext.Current.User.Identity.Name;
                p.Crear_Pedido();
                p = null;
                GridListaPedidos.DataBind();
                validar_boton_enviar();
            }
            catch (Exception err)
            {
                MessageBox(err.Message);
            }
        }
    }
}