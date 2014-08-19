using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace instrumental_wbforrms
{
    public partial class Solicitud : System.Web.UI.Page
    {
        int i; //variable para capturar la ultima solicitud
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BDPLite1.SelectedDate = DateTime.Today;
                //txtHoraSalida.Text = DateTime.Now.ToString("hh:mm");
                //DivEquipos.Visible = false;
                //DivGrupoBrigada.Visible = false;
                //DivIntegrantesBrigada.Visible = false;
                //btnElegirEquipos.Visible = false;
                divSolEquipos.Visible = false;
                divSelEquipos.Visible = false;
                cmbSolicitudNumero.DataBind();
                i = int.Parse(cmbSolicitudNumero.SelectedValue.ToString());
                i = i + 1;
                lblFolio.Text = i.ToString();
            }
        }

        protected void btnTurno_Click(object sender, EventArgs e)
        {
            try
            {
                lblFecha.Text = cmbDia.Text + "/" + cmbMes.Text + "/" + cmbAño.Text;
                cmbTurno.DataBind();
                int turno = int.Parse(cmbTurno.Text);
                lblTurno.Text = turno.ToString();
                lblObtTurno.Visible = false;
                btnTurno.Visible = false;
                DivGrupoBrigada.Visible = true;
                DivIntegrantesBrigada.Visible = true;
                btnElegirEquipos.Visible = true;
            }
            catch (Exception er)
            {
                MessageBox(er.Message);
            }
        }


        protected void ActualizarNombres(object sender, EventArgs e)
        {
            GridView2.DataBind();
        }

        protected void btnSeleccionarEquipos_Click(object sender, EventArgs e)
        {
            try
            {
                Agregar(sender, e);
                divSelEquipos.Visible = true;
                divSolEquipos.Visible = true;
                btnSeleccionarEquipos.Enabled = false;
                txtCantidad.Text = "1";
            }
            catch (Exception er)
            {
                MessageBox("No se ha seleccionado un TURNO. Haga Clic en el boton en forma de calendario.");
            }
        }

        protected void Agregar(object sender, EventArgs e)
        {
            AccesoLogica negocio = new AccesoLogica();
            string fecha = lblFecha.Text;
            int brigada = int.Parse(cmbBrigada.SelectedValue.ToString());
            int profesor = int.Parse(cmbMaestros.SelectedValue.ToString());
            int practica = int.Parse(cmbPractica.SelectedValue.ToString());
            int turno = int.Parse(cmbTurno.SelectedValue.ToString());
            int resultado = negocio.INSERTAR_Solicitud(brigada, fecha, DateTime.Now.ToString("hh:mm"), "00:00", practica, profesor, true, turno);
            negocio = null;
            cmbSolicitudNumero.DataBind();
            cmbBrigada.Enabled = false;
            cmbAño.Enabled = false;
            cmbDia.Enabled = false;
            cmbMes.Enabled = false;
            cmbMaestros.Enabled = false;
            cmbPractica.Enabled = false;
            btnSeleccionarEquipos.Enabled = false;
            cmbGrupoBrigada.Enabled = false;
            btnTurno.Enabled = false;
        }

        private void MessageBox(string msg)
        {
            Label lbl = new Label();
            lbl.Text = "<script language='javascript'>" + Environment.NewLine + "window.alert('" + msg + "')</script>";
            Page.Controls.Add(lbl);
        }

        protected void btnAgregar_Click1(object sender, EventArgs e)
        {
            try
            {
                AgregarEquipo(sender, e);
                GridView1.DataBind();
                cmbEquipos.DataBind();
                txtCantidad.Text = "1";
            }
            catch 
            {
                MessageBox("No se ha seleccionado una Cantidad");
            }
        }
        protected void AgregarEquipo(object sender, EventArgs e)
        {
            int sol_numero = int.Parse(cmbSolicitudNumero.SelectedValue.ToString());
            int equipo_cod = int.Parse(cmbEquipos.SelectedValue.ToString());
            int cantidad = int.Parse(txtCantidad.Text);
            AccesoLogica negocio = new AccesoLogica();
            int resultado = negocio.INSERTAR_Solicitud_detalle(sol_numero, equipo_cod, cantidad);
            negocio = null;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DivGrupoBrigada.Visible = false;
            DivBotonImprimir.Visible = false;
            DivSeleccionarEquipos.Visible = false;
            btnElegirEquipos.Visible = false;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //Response.Redirect("http://geodesia.uas.edu.mx");
        }
    }
}