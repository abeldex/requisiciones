<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Presentation_Layer.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="menu" runat="server">
     <div class="subnavbar">
                  <div class="subnavbar-inner">
                    <div class="container">
                      <ul class="mainnav">
                        
                      </ul>
                        <div class="nav pull-right">
                             <asp:LoginView ID="LoginView2" runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                           
                                <a id="registerLink" runat="server" href="~/Register.aspx">Registrarse</a>
                                <a id="loginLink" runat="server" href="~/Login.aspx">Iniciar sesión</a>
                           
                        </AnonymousTemplate>
                        <LoggedInTemplate>
                            <p><br />
                                usuario: <i class="icon-user"></i><a id="A4" runat="server" class="" href="~/Manage.aspx" title="Cambiar Contraseña">
                                    <asp:LoginName ID="LoginName1" runat="server" CssClass="dropdown" /></a> | 
                                <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutText="Salir" LogoutPageUrl="~/Login.aspx" /><i class="icon-signout"></i>
                            </p>
                        </LoggedInTemplate>
                    </asp:LoginView>
                            </div>         
                    </div>
                    <!-- /container --> 
                  </div>
                  <!-- /subnavbar-inner --> 
           
                </div>
                <!-- /subnavbar -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div style="text-align:center;">
       &nbsp;<!--ENCABEZADO DE LA SOLICITUD--><h1 style="color:#8503b9">ACCESO RESTRINGIDO<br />
              <br />
          </h1>
    </div>
    <div class="row" id="imp">	      	
	      	
	      	<div class="span12">	      		
	      		<div id="target-1" class="widget">
                      <div class="widget-content">
                           <div id="datos" runat="server">   
                            <center><h3>&quot;Esta intentando acceder a una página a la cual debe estar registrado o no tiene los permisos suficientes para acceder a ella&quot;.<br />
                                <br /><asp:Button runat="server" Text="Inicie Sesión" CssClass="button btn btn-invert" Height="40px" Width="150px" ID="btnIniciarSesion" OnClick="btnIngresar_Click"/>
                                &nbsp;&nbsp;&nbsp; <asp:Button runat="server" Text="Volver" CssClass="button btn btn-invert" Height="40px" Width="150px" ID="btnBack" OnClientClick="javascript:history.back(); return false;"/>
                                <br />
                                </h3>
                                
                                </center>
                      </div>
                </div>
            </div>
         </div>
        </div>
</asp:Content>
