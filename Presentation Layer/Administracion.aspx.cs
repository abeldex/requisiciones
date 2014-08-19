using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace Presentation_Layer
{
    public partial class Administracion : System.Web.UI.Page
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
                string cantidad =  AccesoLogica.Obtener_REquisiciones_pendientes().Rows[0][0].ToString();
                lblPendientes.Text = cantidad;
                if (rol != "ADMINISTRADOR")
                {
                    Response.Redirect("Error.aspx");
                }
            }
        }

        protected void btnPapeleria_Click(object sender, EventArgs e)
        {
            Response.Redirect("CATALOGOS/papeleria.aspx");
        }

        protected void btnCartuchos_Click(object sender, EventArgs e)
        {
            Response.Redirect("CATALOGOS/cartuchos.aspx");
        }

        protected void btnMantenimiento_Click(object sender, EventArgs e)
        {
            Response.Redirect("CATALOGOS/mantenimiento.aspx");
        }
    }
}