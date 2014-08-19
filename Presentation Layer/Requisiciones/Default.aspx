<%@ Page Title="" Language="C#" MasterPageFile="~/Principal2.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation_Layer.Requisiciones.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="menu" runat="server">
     <div class="subnavbar">
                  <div class="subnavbar-inner">
                    <div class="container">
                      <ul class="mainnav">
                          <li ><a href="#"><i class="icon-home"></i><span>INICIO</span> </a> </li>                                                             
                          <li ><a href="../USUARIOS/"><i class="icon-group"></i><span>USUARIOS</span> </a> </li> 
                          <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-book"></i><span>CATALOGOS</span><b class="caret"></b> </a> 
                           <ul class="dropdown-menu">
                            <li><a href="../CATALOGOS/papeleria.aspx">PAPELERIA</a></li>
                            <li><a href="../CATALOGOS/cartuchos.aspx">CARTUCHOS</a></li>
                            <li><a href="../CATALOGOS/mantenimiento.aspx">MANTENIMIENTO</a></li>
                          </ul>
                          </li>
                        <li class="active"><a href="#"><i class="icon-list"></i><span>REQUISICIONES</span> </a></li>
                        
                          
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
              <center><h1>ADMINISTRACION DE REQUISICIONES</h1></center>
               	<div class="span12">
                       
	      		<div id="target-2" class="widget">
	      			<div class="widget-header"> <i class="icon-list"></i>
             Lista de Requisiciones pendientes
            </div>
	      			<div class="widget-content">

			      		<asp:GridView ID="GridRequisiciones" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceRequisiciones" DataKeyNames="PEDIDO" CssClass="table table-bordered" OnRowDataBound="GridRequisiciones_RowDataBound" AllowPaging="True">
                            <Columns>
                                <asp:BoundField DataField="PEDIDO" HeaderText="NO. REQUISICIÓN" SortExpression="PEDIDO" InsertVisible="False" ReadOnly="True" />
                                <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" ReadOnly="True" />
                                <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" SortExpression="ESTADO" Visible="False" />
                               
                               
                                <asp:BoundField DataField="NOMBRE" HeaderText="SOLICITANTE" SortExpression="NOMBRE" />
                                <asp:TemplateField HeaderText="ESTADO">
                                    <ItemTemplate>
                                        <center><asp:Image ID="imgestado" runat="server" Height="16px" Width="16px" />
                                            <asp:Label ID="lblEstado" runat="server"></asp:Label>
                                       </center>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                                <asp:TemplateField HeaderText="VER">
                                    <ItemTemplate>
                                        <centeR><asp:Button ID="btnVerArticulos" runat="server" CssClass="btn btn-info" OnClick="btnVerArticulos_Click" Text="Articulos Solicitados" /></centeR>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ACCIONES">
                                    <ItemTemplate>
                                        <centeR>
                                            <a href="#myModal" role="button" class="btn btn-success" data-toggle="modal">Aprobar</a>
                                            <a href="#myModal" role="button" class="btn btn-danger" data-toggle="modal">Rechazar</a>
                                            </centeR>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceRequisiciones" runat="server" ConnectionString="<%$ ConnectionStrings:AlmacenConnectionString %>" SelectCommand="SELECT PEDIDOS.ID_PEDIDO AS PEDIDO, CONVERT (char(12), PEDIDOS.FECHA, 3) AS FECHA, PEDIDOS.ESTADO, USUARIOS.NOMBRE FROM PEDIDOS INNER JOIN USUARIOS ON PEDIDOS.USUARIO = USUARIOS.USERNAME
WHERE ESTADO = 'PENDIENTE'">
                        </asp:SqlDataSource>
			      		<br />
                        </div>
                      </div>
                       </div>

                          	<div class="span12">
	      		<div id="Div1" class="widget">
	      			<div class="widget-header"> <i class="icon-list"></i>
             Lista de Articulos de la Requisicion Número: <asp:label runat="server" text="0" ID="lblrequisicion"></asp:label>
	      		        
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
             <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h3 id="myModalLabel">¡RECHAZAR REQUISICIÓN!</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p>ESCRIBA UN MOTIVO POR EL CUAL ESTA RECHAZANDO LA REQUISICIÓN<br />
                                                            <asp:textbox runat="server" ID="txtMotivo" TextMode="MultiLine" Width="100%" Heigth="200px"></asp:textbox>
                                                            
                                                        </p>
                                                      </div>
                                                      <div class="modal-footer">
                                                          <a href="#" role="button" class="btn btn-success" data-toggle="modal">Enviar</a>
                                                         <a href="#" role="button" class="btn btn-danger" data-toggle="modal">Cancelar</a>
                                                         
                                                      </div>
                                                    </div>
            </div>
        </div>
        </div>
</asp:Content>
