<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Administracion.aspx.cs" Inherits="Presentation_Layer.Administracion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="menu" runat="server">
        <div class="subnavbar">
                  <div class="subnavbar-inner">
                    <div class="container">
                      <ul class="mainnav">
                          <li class="active"><a href="#"><i class="icon-home"></i><span>INICIO</span> </a> </li>                                                             
                          <li ><a href="USUARIOS/"><i class="icon-group"></i><span>USUARIOS</span> </a> </li> 
                          <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-book"></i><span>CATALOGOS</span><b class="caret"></b> </a> 
                           <ul class="dropdown-menu">
                            <li><a href="CATALOGOS/papeleria.aspx">PAPELERIA</a></li>
                            <li><a href="CATALOGOS/cartuchos.aspx">CARTUCHOS</a></li>
                            <li><a href="CATALOGOS/mantenimiento.aspx">MANTENIMIENTO</a></li>
                          </ul>
                          </li>
                        <li><a href="Requisiciones/"><i class="icon-list"></i><span>REQUISICIONES</span> </a></li>
                        
                          
                      </ul>
                        <div class="nav pull-right">
                             
                             <asp:LoginView ID="LoginView2" runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                           
                                <a id="registerLink" runat="server" href="~/Register.aspx">Registrarse</a>
                                <a id="loginLink" runat="server" href="~/Login.aspx">Iniciar sesión</a>
                           
                        </AnonymousTemplate>
                        <LoggedInTemplate>
                            <p><br />
                                Identificado como: <i class="icon-user"></i>
                                    <b><asp:LoginName ID="LoginName1" runat="server" CssClass="dropdown" /></b> |
                                <i class="icon-signout"></i> <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutText="Salir" LogoutPageUrl="~/Logon.aspx" />
                            </p>
                        </LoggedInTemplate>
                    </asp:LoginView>
                            </div>         
                    </div>
                    <!-- /container --> 
                  </div>
                  <!-- /subnavbar-inner --> 
           
                </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="widget-header"> <i class="icon-book"></i>
             ADMINISTRACIÓN DE CATALOGOS
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
                 <div class="shortcuts"> 
                     <asp:linkbutton runat="server" class="shortcut" ID="btnPapeleria" OnClick="btnPapeleria_Click"><i class="shortcut-icon icon-paper-clip"></i>
                      <span class="shortcut-label">Papeleria</span></asp:linkbutton>
                 <asp:linkbutton runat="server" class="shortcut" ID="btnCartuchos" OnClick="btnCartuchos_Click">
                      <i class="shortcut-icon icon-tint"></i>
                        <span class="shortcut-label">Cartuchos</span> </asp:linkbutton> 
                  <asp:linkbutton runat="server" class="shortcut" ID="btnMantenimiento" OnClick="btnMantenimiento_Click">
                      <i class="shortcut-icon icon-cogs"></i>
                      <span class="shortcut-label">Mantenimiento</span> </asp:linkbutton> 
            </div>
                </div>
    <br />
       <div class="widget-header"> <i class="icon-list"></i>
             REQUISICIONES PENDIENTES
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
                 <div class="widget-content">
              <div class="widget big-stats-container">
                <div class="widget-content">
                  <center><h3 class="bigstats">Cantidad de Requisiciones que requieren de su atención.</h3></center>
                  <div id="big_stats" class="cf">
                    <div class="stat">  <span class="value">
                        <asp:label runat="server" ID="lblPendientes"></asp:label>
                        </span> <br /><br /><asp:button runat="server" text="Atenderlas" CssClass="btn btn-info" />
                    </div>
                  </div>
                </div>
                <!-- /widget-content --> 
                
              </div>
            </div>
                </div>
    

</asp:Content>
