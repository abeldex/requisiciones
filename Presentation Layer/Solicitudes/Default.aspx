<%@ Page Title="" Language="C#" MasterPageFile="~/Principal2.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation_Layer.Solicitudes.Default" %>
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
                          <li><a href="../"><i class="icon-shopping-cart"></i><span><h3>Solicitar</h3></span></a></li>
                          <li class="active"><a href="#"><i class="icon-list"></i><span><h3>Mis Requisiciones</h3></span></a></li>
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
    <div class="main">
	<div class="main-inner">
	    <div class="container">	
	      <div class="row">	
               	<div class="span12">
                       <asp:label runat="server" text="Label" ID="lblUsuario" Visible="False"></asp:label>
	      		<div id="target-2" class="widget">
	      			<div class="widget-header"> <i class="icon-listt"></i>
             <h3>Lista de Requisiciones</h3>
            </div>
	      			<div class="widget-content">

			      		<asp:GridView ID="GridRequisiciones" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceRequisiciones" DataKeyNames="PEDIDO" CssClass="table table-bordered" OnRowDataBound="GridRequisiciones_RowDataBound" AllowPaging="True">
                            <Columns>
                                <asp:BoundField DataField="PEDIDO" HeaderText="NUMERO DE REQUISICIÓN" SortExpression="PEDIDO" InsertVisible="False" ReadOnly="True" />
                                <asp:BoundField DataField="FECHA" HeaderText="FECHA DE LA REQUISICIÓN" SortExpression="FECHA" />
                                <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" SortExpression="ESTADO" Visible="False" />
                                <asp:TemplateField HeaderText="VER ARTICULOS">
                                    <ItemTemplate>
                                        <centeR><asp:Button ID="btnVerArticulos" runat="server" CssClass="btn btn-info" OnClick="btnVerArticulos_Click" Text="Articulos Solicitados" /></centeR>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ESTADO">
                                    <ItemTemplate>
                                        <center><asp:Image ID="imgestado" runat="server" Height="16px" Width="16px" />
                                            <asp:Label ID="lblEstado" runat="server"></asp:Label>
                                        <asp:LinkButton runat="server" ID="btnMotivo" ForeColor="#FF5050" Visible="False"> <br />[Ver Motivo]
                                        </asp:LinkButton></center>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceRequisiciones" runat="server" ConnectionString="<%$ ConnectionStrings:AlmacenConnectionString %>" SelectCommand="SELECT ID_PEDIDO AS PEDIDO, CONVERT (char(12), FECHA, 3) AS FECHA, ESTADO FROM PEDIDOS WHERE (USUARIO = @usuario)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblUsuario" Name="usuario" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
			      		<br />
                        </div>
                      </div>
                       </div>

                          	<div class="span12">
	      		<div id="Div1" class="widget">
	      			<div class="widget-header"> <i class="icon-listt"></i>
             <h3>Lista de Articulos de la Requisicion Número: <asp:label runat="server" text="0" ID="lblrequisicion"></asp:label>
	      		        </h3>
            </div>
	      			<div class="widget-content">
                          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataSourceID="SqlDataSourceArticulos">
                              <Columns>
                                  <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE DEL ARTICULO" SortExpression="NOMBRE" />
                                  <asp:BoundField DataField="CANTIDAD" HeaderText="CANTIDAD SOLICITADA" SortExpression="CANTIDAD" />
                              </Columns>
                          </asp:GridView>
                          <asp:SqlDataSource ID="SqlDataSourceArticulos" runat="server" ConnectionString="<%$ ConnectionStrings:AlmacenConnectionString %>" SelectCommand="SELECT ARTICULOS.NOMBRE, DETALLE_PEDIDO.CANTIDAD FROM ARTICULOS INNER JOIN DETALLE_PEDIDO ON ARTICULOS.ID_ARTICULO = DETALLE_PEDIDO.ID_ARTICULO WHERE ID_PEDIDO = @pedido ">
                              <SelectParameters>
                                  <asp:ControlParameter ControlID="lblrequisicion" Name="pedido" PropertyName="Text" />
                              </SelectParameters>
                          </asp:SqlDataSource>
                          </div>
                      </div>
                                  </div>


              </div>
            </div>
        </div>
        </div>
			      		
</asp:Content>
