﻿using BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation_Layer.CATALOGOS
{
    public partial class cartuchos : System.Web.UI.Page
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

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void GridPapeleria_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            AccesoLogica negocio = new AccesoLogica();
            int index = 0;
            int idArticulo = 0;
            try
            {
                index = Convert.ToInt32(e.CommandArgument);
                idArticulo = Convert.ToInt32(GridCartuchos.DataKeys[index].Value);
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
                txtCodigoArticulo.Text = (GridCartuchos.Rows[index].Cells[0]).Text;
                txtNombreArticulo.Text = (GridCartuchos.Rows[index].Cells[1]).Text;
                txtMarca.Text = (GridCartuchos.Rows[index].Cells[2]).Text;
                txtModelo.Text = (GridCartuchos.Rows[index].Cells[3]).Text;
                txtDescripcion.Text = (GridCartuchos.Rows[index].Cells[5]).Text;
                txtCantidad.Text = (GridCartuchos.Rows[index].Cells[6]).Text;
                txtCodigoArticulo.Enabled = false;
            }

            if (e.CommandName == "Select2")
            {
                BorrarArticulo(idArticulo);
            }       
        }

        private void deshabilitarValidadores()
        {
            RequiredCodigo.Enabled = false;
            RequiredNombre.Enabled = false;
            RequiredDescripcion.Enabled = false;
            RequiredCantidad.Enabled = false;
        }

        public void habilitarValidadores()
        {
            RequiredCodigo.Enabled = true;
            RequiredNombre.Enabled = true;
            RequiredDescripcion.Enabled = true;
            RequiredCantidad.Enabled = true;
        }

        public void limpiarFormulario()
        {
            txtCodigoArticulo.Text = string.Empty;
            txtNombreArticulo.Text = string.Empty;
            txtMarca.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtCantidad.Text = string.Empty;
        }

        private void BorrarArticulo(int Equipo)
        {
            AccesoLogica negocio = new AccesoLogica();
            try
            {
                negocio.Eliminar_Articulo(Equipo);
                negocio = null;
                GridCartuchos.DataBind();
            }
            catch
            {

            }
        }

        private void MessageBox(string msg)
        {
            Label lbl = new Label();
            lbl.Text = "<script language='javascript'>" + Environment.NewLine + "window.alert('" + msg + "')</script>";
            Page.Controls.Add(lbl);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Agregar(sender, e);
                GridCartuchos.DataBind();
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

        protected void Agregar(object sender, EventArgs e)
        {
            AccesoLogica negocio = new AccesoLogica();
            int codigo = int.Parse(txtCodigoArticulo.Text);
            int cantidad = int.Parse(txtCantidad.Text);
            int resultado = negocio.Agregar_Articulo(codigo, txtNombreArticulo.Text.ToUpper(), txtMarca.Text.ToUpper(), txtModelo.Text.ToUpper(), "CARTUCHOS", txtDescripcion.Text.ToUpper(), cantidad);
            negocio = null;
        }

        protected void Actualizar(object sender, EventArgs e)
        {
            AccesoLogica negocio = new AccesoLogica();
            int codigo = int.Parse(txtCodigoArticulo.Text);
            int cantidad = int.Parse(txtCantidad.Text);
            int resultado = negocio.Actualizar_Articulo(codigo, txtNombreArticulo.Text.ToUpper(), txtMarca.Text.ToUpper(), txtModelo.Text.ToUpper(), "CARTUCHOS", txtDescripcion.Text.ToUpper(), cantidad);
            negocio = null;
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

        protected void btnAgregarArticulos_Click(object sender, EventArgs e)
        {
            DivAgregarArticulos.Visible = true;
            DivListaEquipos.Visible = false;
            //se habilitan los validadores
            habilitarValidadores();
            limpiarFormulario();
            btnGuardar.Visible = true;
            btnActualizar.Visible = false;
            txtCodigoArticulo.Enabled = true;
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                Actualizar(sender, e);
                GridCartuchos.DataBind();
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


    }
}