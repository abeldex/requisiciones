<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="Presentation_Layer.Principal1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="menu" runat="server">
    <div class="subnavbar">
                  <div class="subnavbar-inner">
                    <div class="container">
                      <ul class="mainnav">
                          <!--<li><a href="#"><i class="icon-home"></i><span>INICIO</span> </a> </li>
                          <li ><a href="ListaSolicitudes.aspx"><i class="icon-list"></i><span>Lista de Solicitudes</span> </a> </li> 
                          <li ><a href="Recibir.aspx"><i class="icon-retweet"></i><span>Recepción de Equipos</span> </a> </li> 
                          <li ><a href="AsignarEquipos.aspx"><i class="icon-briefcase"></i><span>Asignar Equipos a Prácticas</span> </a> </li>  
                          <li ><a href="#"><i class="icon-briefcase "></i><span>Equipos</span> </a> </li>                                                               
                          <li ><a href="#"><i class="icon-group"></i><span>Brigadas</span> </a> </li> 
                          <li ><a href="#"><i class="icon-book"></i><span>Prácticas</span> </a> </li>
                        <li><a href="guidely.html"><i class="icon-facetime-video"></i><span>App Tour</span> </a></li>
                        <li><a href="charts.html"><i class="icon-bar-chart"></i><span>Charts</span> </a> </li>
                        <li><a href="shortcodes.html"><i class="icon-code"></i><span>Shortcodes</span> </a> </li>
                        <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-long-arrow-down"></i><span>Drops</span> <b class="caret"></b></a>
                          <ul class="dropdown-menu">
                            <li><a href="icons.html">Icons</a></li>
                            <li><a href="faq.html">FAQ</a></li>
                            <li><a href="pricing.html">Pricing Plans</a></li>
                            <li><a href="login.html">Login</a></li>
                            <li><a href="signup.html">Signup</a></li>
                            <li><a href="error.html">404</a></li>
                          </ul>
                        </li>-->
                          
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
     <div class="widget">
            <div class="widget-header"> <i class="icon-edit"></i>
             <h3>SOLICITAR</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
                 <div class="shortcuts"> 
                     <asp:linkbutton runat="server" class="shortcut" ID="btnPapeleria" OnClick="Unnamed1_Click"><i class="shortcut-icon icon-paper-clip"></i>
                      <span class="shortcut-label">Papeleria</span></asp:linkbutton>
                       
                  </a>
                  <a href="#" class="shortcut">
                      <i class="shortcut-icon icon-tint"></i>
                        <span class="shortcut-label">Cartuchos</span> </a>  
                  <a href="#" class="shortcut">
                      <i class="shortcut-icon icon-cogs"></i>
                      <span class="shortcut-label">Mantenimiento</span> </a>
                  <!--<a href="javascript:;" class="shortcut">
                      <i class="shortcut-icon icon-signal"></i> 
                      <span class="shortcut-label">Ver Reportes</span> </a>
                  <a href="javascript:;" class="shortcut"> 
                      <i class="shortcut-icon icon-comment"></i>
                      <span class="shortcut-label">Commentarios</span> </a>
                  <a href="javascript:;" class="shortcut">
                      <i class="shortcut-icon icon-group"></i>
                      <span class="shortcut-label">Brigadas</span> </a>
                
                  <a href="javascript:;" class="shortcut">
                      <i class="shortcut-icon icon-book"></i> 
                      <span class="shortcut-label">Prácticas</span> 
                  </a><a href="javascript:;" class="shortcut"> 
                      <i class="shortcut-icon icon-cogs"></i>
                      <span class="shortcut-label">Opciones</span> </a> </div>-->
              <!-- /shortcuts --> 
            </div>
                </div>
     </div>
    <div class="main">
	
	<div class="main-inner">

	    <div class="container">
	
	      <div class="row">	    
              
              
                <!-- TABLA DE ARTICULOS-->
         <div class="span6" id="DivEquiposSol" runat="server">
	        <div id="Div2" class="widget">		
                <div class="widget-content">
			 <div class="widget widget-table action-table">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3>Articulos de
                 <asp:Label ID="lblCategoria" runat="server" Text="Label"></asp:Label>
&nbsp;</h3>
            </div>
            <!-- /widget-header -->
            <i class="icon-list-alt">  Buscar: <asp:textbox runat="server" ID="txtBuscar"></asp:textbox>
               
                <asp:gridview runat="server"></asp:gridview>
            <!-- /widget-content --> 
          </div>
			      		
		      		</div> <!-- /widget-content -->
	      		</div> 
	      		
      		</div>
            <!-- /span6 -->      	
              
               
      		 	
	      	
	      	<div class="span6">
	      		
	      		<div id="target-2" class="widget">
	      			<div class="widget-header"> <i class="icon-shopping-cart"></i>
             <h3>Articulos Solicitados</h3>
            </div>
	      			<div class="widget-content">
	      				 
			      		
			      		<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDetallePedido">
                            <Columns>
                                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                                <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCRIPCION" SortExpression="DESCRIPCION" />
                                <asp:BoundField DataField="CANTIDAD" HeaderText="CANTIDAD" SortExpression="CANTIDAD" />
                                <asp:CommandField ShowSelectButton="True" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceDetallePedido" runat="server" ConnectionString="<%$ ConnectionStrings:AlmacenConnectionString %>" SelectCommand="SELECT DETALLE_PEDIDO.CANTIDAD, ARTICULOS.NOMBRE, ARTICULOS.DESCRIPCION FROM DETALLE_PEDIDO INNER JOIN ARTICULOS ON DETALLE_PEDIDO.ID_ARTICULO = ARTICULOS.ID_ARTICULO"></asp:SqlDataSource>
			      		
		      		</div> <!-- /widget-content -->
		      		
	      		</div> <!-- /widget -->
	      		
      		</div> <!-- /span6 -->
      		 	
	      	
	      </div> <!-- /row -->
	
	    </div> <!-- /container -->
    
	</div> <!-- /main-inner -->
	    
</div>
    	

     </i>
    	

</asp:Content>
