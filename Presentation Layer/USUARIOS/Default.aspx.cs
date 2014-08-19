using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace Presentation_Layer.USUARIOS
{
    public partial class Default : System.Web.UI.Page
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
        }

        public void habilitarValidadores()
        {

        }

        public void limpiarFormulario()
        {
            txtNumEmpleado.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtContraseña.Text = string.Empty;
            txtContraseña0.Text = string.Empty;
            txtUsuario.Text = string.Empty;
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
           usuario user = new usuario();
           user.NUMERO_EMPLEADO = int.Parse(txtNumEmpleado.Text);
           user.NOMBRE = txtNombre.Text.ToUpper();
           user.USUARIO = txtUsuario.Text.ToUpper();
           user.CONTRASEÑA = txtContraseña.Text.ToUpper();
           user.ROL = DropDownROL.Text.ToUpper();
           user.Agregar_Usuario();
           GridUsuarios.DataBind();
           user = null;
        }

        protected void Actualizar(object sender, EventArgs e)
        {
            usuario user = new usuario();
            user.NUMERO_EMPLEADO = int.Parse(txtNumEmpleado.Text);
            user.NOMBRE = txtNombre.Text.ToUpper();
            user.USUARIO = txtUsuario.Text.ToUpper();
            user.CONTRASEÑA = txtContraseña.Text.ToUpper();
            user.ROL = DropDownROL.Text.ToUpper();
            user.Actualizar_Usuario();
            GridUsuarios.DataBind();
            user = null;
        }

        private void Borrar(int Equipo)
        {
            usuario user = new usuario();
            try
            { 
                user.NUMERO_EMPLEADO = Equipo;
                user.Eliminar_Usuario();
                user = null;
                GridUsuarios.DataBind();
            }
            catch (Exception err)
            {
                MessageBox(err.Message);
            }
        }


        #endregion

        #region BOTONES


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Agregar(sender, e);
                GridUsuarios.DataBind();
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

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                Actualizar(sender, e);
                GridUsuarios.DataBind();
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

        #endregion

        #region GRIDVIEW
        protected void GridUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            AccesoLogica DAL = new AccesoLogica();
            int index = 0;
            int idUsuario = 0;
            try
            {
                index = Convert.ToInt32(e.CommandArgument);
                idUsuario = Convert.ToInt32(GridUsuarios.DataKeys[index].Value);
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
                txtNumEmpleado.Text = (GridUsuarios.Rows[index].Cells[0]).Text;
                txtNombre.Text = (GridUsuarios.Rows[index].Cells[1]).Text;
                txtUsuario.Text = (GridUsuarios.Rows[index].Cells[2]).Text;
                txtContraseña.Text = (GridUsuarios.Rows[index].Cells[3]).Text;
                DropDownROL.Text = (GridUsuarios.Rows[index].Cells[4]).Text;
                txtNumEmpleado.Enabled = false;
            }

            if (e.CommandName == "Select2")
            {
                Borrar(idUsuario);
            }
        }
        #endregion

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void lblAgregarUsuarios_Click(object sender, EventArgs e)
        {
            DivAgregarArticulos.Visible = true;
            DivListaEquipos.Visible = false;
            //se habilitan los validadores
            habilitarValidadores();
            limpiarFormulario();
            btnGuardar.Visible = true;
            txtNumEmpleado.Enabled = true;
            btnActualizar.Visible = false;
        }

    }
}