<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation_Layer.Principal" %>
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
                          <li class="active"><a href="#"><i class="icon-user"></i><span><h3><asp:label runat="server" text="Label" ID="lblName"></asp:label></h3>
                          </span> </a> </li>
                          <li class="active"><a href="#"><i class="icon-shopping-cart"></i><span><h3>Solicitar</h3></span></a></li>
                          <li><a href="Solicitudes/"><i class="icon-list"></i><span><h3>Mis Requisiciones</h3></span></a></li>
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
     <div class="row" id="imp">	      	
	      	
                           <div id="datos" runat="server">   
                            <center><h3>
                                <asp:Label ID="lblNombre" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lblFecha" runat="server" Visible="False"></asp:Label>
                                </h3>
                                </center>
                      </div>
     <div class="widget">
            <div class="widget-header"> <i class="icon-edit"></i>
             <h3>SOLICITAR</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
                 <div class="shortcuts"> 
                     <asp:linkbutton runat="server" class="shortcut" ID="btnPapeleria" OnClick="Unnamed1_Click"><i class="shortcut-icon icon-paper-clip"></i> <span class="shortcut-label">Papeleria</span></asp:linkbutton>
                 <asp:linkbutton runat="server" class="shortcut" ID="btnCartuchos" OnClick="btnCartuchos_Click"> <i class="shortcut-icon icon-tint"></i><span class="shortcut-label">Cartuchos</span> </asp:linkbutton> 
                  <asp:linkbutton runat="server" class="shortcut" ID="btnMantenimiento" OnClick="btnMantenimiento_Click"> <i class="shortcut-icon icon-cogs"></i><span class="shortcut-label">Mantenimiento</span> </asp:linkbutton> 
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
	        <div id="Div2" class="widget">	<div class="widget-header"> <i class="icon-list-alt"></i>
              <h3>CATALOGO DE
                 <asp:Label ID="lblCategoria" runat="server"></asp:Label>
&nbsp;</h3>
            </div>	
                <div class="widget-content">            
            <!-- /widget-header -->

                 <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_ARTICULO" DataSourceID="SqlDataSourceArticulos" CssClass="table table-striped table-bordered" AllowPaging="True" OnRowCommand="GridView3_RowCommand">
                     <Columns>
                         <asp:BoundField DataField="ID_ARTICULO" HeaderText="COD" ReadOnly="True" SortExpression="ID_ARTICULO" />
                         <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                         <asp:BoundField DataField="FAMILIA" HeaderText="FAMILIA" SortExpression="FAMILIA" Visible="False" />
                         <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCRIPCION" SortExpression="DESCRIPCION" />
                         <asp:TemplateField>
                             <ItemTemplate> 
                                                  
                                 <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/1385175155_meanicons_59.png"  OnClick="ImageButton1_Click" CommandName="Select" OnClientClick="return llamarCantidad();"/>            
                                
                                     
                             </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSourceArticulos" runat="server" ConnectionString="<%$ ConnectionStrings:AlmacenConnectionString %>" SelectCommand="SELECT ID_ARTICULO, NOMBRE, FAMILIA, DESCRIPCION FROM ARTICULOS WHERE (FAMILIA = @FAMILIA) ORDER BY NOMBRE">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="lblCategoria" DefaultValue="PAPELERIA" Name="FAMILIA" PropertyName="Text" />
                     </SelectParameters>
                 </asp:SqlDataSource>
			      		
		      		
			      		 <asp:HiddenField ID="h1" runat="server" />
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
	      				 
			      		
			      		<asp:GridView ID="GridListaPedidos" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDetallePedido" DataKeyNames="ID_DETALLE_PEDIDO" CssClass="table table-striped table-bordered" OnRowCommand="GridListaPedidos_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="ID_DETALLE_PEDIDO" HeaderText="ID" SortExpression="ID_DETALLE_PEDIDO" InsertVisible="False" ReadOnly="True" Visible="False" />
                                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                                <asp:BoundField DataField="CANTIDAD" HeaderText="CANTIDAD" SortExpression="CANTIDAD" />
                                <asp:BoundField DataField="FAMILIA" HeaderText="CATEGORIA" SortExpression="FAMILIA" />
                                <asp:BoundField DataField="ID_PEDIDO" HeaderText="ID_PEDIDO" SortExpression="ID_PEDIDO" Visible="False" />
                                <asp:BoundField DataField="USUARIO" HeaderText="USUARIO" SortExpression="USUARIO" Visible="False" />
                                <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" Visible="False" />
                                <asp:TemplateField>
                                    <ItemTemplate> 
                                        <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/Images/delete.png" OnClick="btnDelete_Click"  />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                         <center><asp:button runat="server" text="Enviar Requisición" ID="btnEnviar" CssClass="btn" Width="30%" Height="50px" data-toggle="modal" data-target="#myModal"/></center> 
                        <asp:SqlDataSource ID="SqlDataSourceDetallePedido" runat="server" ConnectionString="<%$ ConnectionStrings:AlmacenConnectionString %>" SelectCommand="SELECT DETALLE_PEDIDO.ID_PEDIDO, DETALLE_PEDIDO.CANTIDAD, DETALLE_PEDIDO.USUARIO, DETALLE_PEDIDO.FECHA, DETALLE_PEDIDO.ID_DETALLE_PEDIDO, ARTICULOS.NOMBRE, ARTICULOS.FAMILIA FROM DETALLE_PEDIDO INNER JOIN ARTICULOS ON DETALLE_PEDIDO.ID_ARTICULO = ARTICULOS.ID_ARTICULO WHERE (DETALLE_PEDIDO.USUARIO = @usuario) AND (DETALLE_PEDIDO.FECHA = @fecha) AND (DETALLE_PEDIDO.ESTADO = 'PENDIENTE')">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblNombre" Name="usuario" PropertyName="Text" />
                                <asp:ControlParameter ControlID="lblFecha" DefaultValue="" Name="fecha" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
			      		<br />
                        
			      		<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h3 id="myModalLabel">CONFIRMACIÓN DE ENVIO<asp:Label ID="lblArticulos" runat="server" Text=""></asp:Label>
                                                        </h3>
                                                      </div>
                                                      <div class="modal-body">
                                                          <center>
                                                        <p><h4>Los articulos agregados a la lista se enviarán al administrador para que revise la requisición.</h4><br /><br />
                                                            <asp:Button ID="btnCanelar" runat="server" CssClass="btn-danger"  text="Cancelar"  Width="30%" Height="30px" data-dismiss="modal"/> 
                                                            <asp:Button ID="btnAdd" runat="server" CssClass="btn-success" OnClick="btnEnviar_Click" text="Enviar"  Width="30%" Height="30px"/> 
                                                         
                                                        </p></center>
                                                      </div>
                                                      <div class="modal-footer">
                                                          
                                                      </div>
                                                    </div>
		      		    
		      		</div> <!-- /widget-content -->
		      		
	      		</div> <!-- /widget -->
	      		
      		</div> <!-- /span6 -->
      		 	
	      	
	      </div> <!-- /row -->
	
	    </div> <!-- /container -->
    
	</div> <!-- /main-inner -->
	     
</div>
    </div>

    <script type = "text/javascript">
        function llamarCantidad()
        {
            var x=0;
            var cant = prompt("CANTIDAD A PEDIR:", "1");
            if (cant != null) {
                x = cant;
                document.getElementById("<%=h1.ClientID%>").value = x;
            }
            else { document.getElementById("<%=h1.ClientID%>").value = 0; }
            
        }
    </script>

</asp:Content>
