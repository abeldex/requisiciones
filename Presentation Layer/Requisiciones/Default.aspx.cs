using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation_Layer.Requisiciones
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVerArticulos_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int id_articulo = int.Parse(GridRequisiciones.DataKeys[row.RowIndex].Value.ToString());
            lblrequisicion.Text = id_articulo.ToString();
            MessageBox("ARTICULO = " + id_articulo);
        }

        private void MessageBox(string msg)
        {
            Label lbl = new Label();
            lbl.Text = "<script language='javascript'>" + Environment.NewLine + "window.alert('" + msg + "')</script>";
            Page.Controls.Add(lbl);
        }

        protected void GridRequisiciones_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string _estado = DataBinder.Eval(e.Row.DataItem, "ESTADO").ToString();
                //string _articulos = DataBinder.Eval(e.Row.DataItem, "ID_PEDIDO").ToString();
                System.Web.UI.WebControls.Image imagen = (System.Web.UI.WebControls.Image)e.Row.FindControl("imgestado");
                Label label = (Label)e.Row.FindControl("lblEstado");
                //Label label2 = (Label)e.Row.FindControl("lblArticulos");
                // label2.Text = _articulos;


                if (_estado == "PENDIENTE")
                {
                    label.Text = "PENDIENTE";
                    label.ForeColor = Color.FromName("#000");
                    //e.Row.Cells[2].BackColor = Color.FromName("#ffeb9c");
                    imagen.ImageUrl = "../Images/pendiente.png";
                    imagen.ToolTip = "PENDIENTE";
                }
                if (_estado == "APROBADO")
                {
                    label.Text = "APROBADA";
                    label.ForeColor = Color.FromName("#74DF00");
                    //e.Row.Cells[2].BackColor = Color.FromName("#c6efce");
                    imagen.ImageUrl = "../Images/aprobado.png";
                    imagen.ToolTip = "APROBADA";
                }
                if (_estado == "RECHAZADO")
                {
                    label.Text = "RECHAZADA";
                    label.ForeColor = Color.FromName("#FF0000");
                    //e.Row.Cells[2].BackColor = Color.FromName("#ffc7ce");
                    imagen.ImageUrl = "../Images/denegado.png";
                    imagen.ToolTip = "RECHADAZA";
                }
            }
        }
    }
}