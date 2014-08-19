<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Logon.aspx.cs" Inherits="Presentation_Layer.Logon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="menu" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <link href="Content/themes/AdminTemplate/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="Content/themes/AdminTemplate/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />

<link href="Content/themes/AdminTemplate/css/font-awesome.css" rel="stylesheet"/>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet"/>
    
<link href="Content/themes/AdminTemplate/css/style.css" rel="stylesheet" type="text/css"/>
<link href="Content/themes/AdminTemplate/css/pages/signin.css" rel="stylesheet" type="text/css"/> 
        <div class="account-container">
	        <div class="content clearfix">
                    <h1>Acceso al Sistema</h1>
                    <div class="login-fields">
				
				            <p>Por favor ingresa tus datos</p>
                        	        <div class="field">
					                    <label for="UserName">Usuario</label>
                                        <input id="txtUserName" type="text" runat="server">
                                        <ASP:RequiredFieldValidator ControlToValidate="txtUserName"
                                           Display="Static" ErrorMessage="*" runat="server" 
                                           ID="vUserName" />	                   
				        </div> <!-- /field -->
                        <div class="field">
					        <label for="Password">Password:</label>
                            <input id="txtUserPass" type="password" runat="server">
                              <ASP:RequiredFieldValidator ControlToValidate="txtUserPass"
                                  Display="Static" ErrorMessage="*" runat="server" 
                                  ID="vUserPass" />
					    </div> <!-- /password -->
                    </div><!-- /login-fields -->
                            <div class="login-actions">
				
                    Recordar Contraseña
                    <ASP:CheckBox id="chkPersistCookie" runat="server" autopostback="false" />
                                
                                <input type="submit" Value="Entrar" runat="server" ID="cmdLogin" class="button btn btn-invert" Height="56px" Width="175px">
			</div>  	
                            
          <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" NavigateUrl="~/Register.aspx">Registrarse</asp:HyperLink>
            si no tiene una cuenta.
</div>  
            <asp:Label id="lblMsg" ForeColor="red" Font-Name="Verdana" Font-Size="10" runat="server" />	
             <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h3 id="myModalLabel">¿Esta seguro de cancelar el registro del articulo?</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p></p>
                                                      </div>
                                                      <div class="modal-footer">
                                                          <asp:Button runat="server" Text="SI" ID="btnCancelar" CssClass="btn btn-danger" OnClientClick="#MyModal"></asp:Button>
                                                      </div>
                                                    </div>
</div>

</asp:Content>
