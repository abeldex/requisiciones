using BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation_Layer.CATALOGOS
{
    public partial class mantenimiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string userName = "";
                userName = HttpContext.Current.User.Identity.Name;
                string rol = "";
                usuario user = new usuario();
                user.USUARIO = userName;
                rol = user.Obtener_ROL().Rows[0][0].ToString();
                if (rol != "ADMINISTRADOR")
                {
                    Response.Redirect("../Error.aspx");
                }
                DivAgregarArticulos.Visible = false;
            }
        }

        #region navegavilidad
            private void deshabilitarValidadores()
            {
                RequiredCodigo.Enabled = false;
                RequiredNombre.Enabled = false;
                RequiredDescripcion.Enabled = false;
            }

            public void habilitarValidadores()
            {
                RequiredCodigo.Enabled = true;
                RequiredNombre.Enabled = true;
                RequiredDescripcion.Enabled = true;
            }

            public void limpiarFormulario()
            {
                txtCodigoArticulo.Text = string.Empty;
                txtNombreArticulo.Text = string.Empty;
                txtDescripcion.Text = string.Empty;
            }

            private void MessageBox(string msg)
            {
                Label lbl = new Label();
                lbl.Text = "<script language='javascript'>" + Environment.NewLine + "window.alert('" + msg + "')</script>";
                Page.Controls.Add(lbl);
            }
        #endregion

        #region ABC
            protected void Agregar(object sender, EventArgs e)
            {
                AccesoLogica negocio = new AccesoLogica();
                int codigo = int.Parse(txtCodigoArticulo.Text);
                int resultado = negocio.Agregar_Articulo(codigo, txtNombreArticulo.Text.ToUpper(), "", "", "MANTENIMIENTO", txtDescripcion.Text.ToUpper(), 0);
                negocio = null;
            }

            protected void Actualizar(object sender, EventArgs e)
            {
                AccesoLogica negocio = new AccesoLogica();
                int codigo = int.Parse(txtCodigoArticulo.Text);
                int resultado = negocio.Actualizar_Articulo(codigo, txtNombreArticulo.Text.ToUpper(), "", "", "MANTENIMIENTO", txtDescripcion.Text.ToUpper(), 0); 
                negocio = null;
            }

            private void Borrar(int Equipo)
            {
                AccesoLogica negocio = new AccesoLogica();
                try
                {
                    negocio.Eliminar_Articulo(Equipo);
                    negocio = null;
                    GridServicios.DataBind();
                }
                catch
                {

                }
            }
        #endregion

        #region BOTONES
            protected void btnActualizar_Click(object sender, EventArgs e)
            {
                try
                {
                    Actualizar(sender, e);
                    GridServicios.DataBind();
                    deshabilitarValidadores();
                    limpiarFormulario();
                    DivAgregarArticulos.Visible = false;
                    DivListaEquipos.Visible = true;
                }
                catch (Exception er)
                {
                    MessageBox(er.Message);
                }
            }

            protected void btnGuardar_Click(object sender, EventArgs e)
            {
                try
                {
                    Agregar(sender, e);

                    GridServicios.DataBind();
                    deshabilitarValidadores();
                    limpiarFormulario();
                    DivAgregarArticulos.Visible = false;
                    DivListaEquipos.Visible = true;
                }
                catch (Exception er)
                {
                    MessageBox(er.Message);
                }
            }

            protected void btnCancelar_Click(object sender, EventArgs e)
            {
                DivAgregarArticulos.Visible = false;
                DivListaEquipos.Visible = true;
                //se inhabilitan los validadores
                deshabilitarValidadores();
                limpiarFormulario();
                btnGuardar.Visible = true;
                btnActualizar.Visible = false;
            }

            protected void btnAgregarServicios_Click(object sender, EventArgs e)
            {
                DivAgregarArticulos.Visible = true;
                DivListaEquipos.Visible = false;
                //se habilitan los validadores
                habilitarValidadores();
                limpiarFormulario();
                btnGuardar.Visible = true;
                txtCodigoArticulo.Enabled = true;
                btnActualizar.Visible = false;
                txtCodigoArticulo.Enabled = true;
            }
            #endregion
            
        protected void GridServicios_RowCommand(object sender, GridViewCommandEventArgs e)
            {
                AccesoLogica negocio = new AccesoLogica();
                int index = 0;
                int idArticulo = 0;
                try
                {
                    index = Convert.ToInt32(e.CommandArgument);
                    idArticulo = Convert.ToInt32(GridServicios.DataKeys[index].Value);
                }
                catch
                {

                }

                if (e.CommandName == "Select")
                {
                    DivAgregarArticulos.Visible = true;
                    DivListaEquipos.Visible = false;
                    //se habilitan los validadores
                    habilitarValidadores();
                    limpiarFormulario();
                    btnGuardar.Visible = false;
                    btnActualizar.Visible = true;
                    //SE CARGAN LOS DATOS DEL ARTICULO SELECCIONADO
                    txtCodigoArticulo.Text = (GridServicios.Rows[index].Cells[0]).Text;
                    txtNombreArticulo.Text = (GridServicios.Rows[index].Cells[1]).Text;
                    txtDescripcion.Text = (GridServicios.Rows[index].Cells[5]).Text;
                    txtCodigoArticulo.Enabled = false;
                }

                if (e.CommandName == "Select2")
                {
                    Borrar(idArticulo);
                }       
            }

    }
}