using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation_Layer
{
    public partial class Principal1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        private void MessageBox(string msg)
        {
            Label lbl = new Label();
            lbl.Text = "<script language='javascript'>" + Environment.NewLine + "window.alert('" + msg + "')</script>";
            Page.Controls.Add(lbl);
        }

        public void lblPapeleria()
        {
            lblCategoria.Text = "Papeleria";
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            lblCategoria.Text = "PAPELERIA";
        }
    }
}