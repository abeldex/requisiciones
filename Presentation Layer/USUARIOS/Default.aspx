<%@ Page Title="" Language="C#" MasterPageFile="~/Principal2.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation_Layer.USUARIOS.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="menu" runat="server">
     <div class="subnavbar">
                  <div class="subnavbar-inner">
                    <div class="container">
                      <ul class="mainnav">
                          <li ><a href="../Administracion.aspx"><i class="icon-home"></i><span>INICIO</span> </a> </li>                                                             
                          <li class="active"><a href="#"><i class="icon-group"></i><span>USUARIOS</span> </a> </li> 
                          <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-book"></i><span>CATALOGOS</span><b class="caret"></b> </a> 
                           <ul class="dropdown-menu">
                            <li><a href="../CATALOGOS/papeleria.aspx">PAPELERIA</a></li>
                            <li><a href="../CATALOGOS/cartuchos.aspx">CARTUCHOS</a></li>
                            <li><a href="../CATALOGOS/mantenimiento.aspx">MANTENIMIENTO</a></li>
                          </ul>
                          </li>
                        <li><a href="#"><i class="icon-list"></i><span>REQUISICIONES</span> </a></li>                                                             
                          <li class="active">
                              
                              </li>      
                      </ul>
                        <div class="nav pull-right">
                             
                             <asp:LoginView ID="LoginView2" runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                           
                                <a id="registerLink" runat="server" href="~../Register.aspx">Registrarse</a>
                                <a id="loginLink" runat="server" href="~../Logon.aspx">Iniciar sesión</a>
                           
                        </AnonymousTemplate>
                        <LoggedInTemplate>
                            <p><br />
                                Identificado como: <i class="icon-user"></i>
                                    <b><asp:LoginName ID="LoginName1" runat="server" CssClass="dropdown" /></b> |
                                <i class="icon-signout"></i> <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutText="Salir" LogoutPageUrl="../Logon.aspx" />
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
    <center><h1>ADMINISTRACIÓN DE USUARIOS</h1></center>
    <div class="row" id="imp">	
         <div class="main">
	
	        <div class="main-inner">

	            <div class="container">
	
	              <div class="row">	
                         <div class="span12" id="DivListaEquipos" runat="server">
	        <div id="Div2" class="widget">	<div class="widget-header"> <i class="icon-user"></i>
              USUARIOS
            </div>	
                <div class="widget-content">            
            <!-- /widget-header -->
                      <i class="icon-search"></i>     <asp:textbox runat="server" ID="txtBuscar" Width="402px"></asp:textbox>
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" /> &nbsp;&nbsp;&nbsp; <asp:button runat="server" text="AGREGAR USUARIO" ID="lblAgregarUsuarios" OnClick="lblAgregarUsuarios_Click" />
                 <asp:GridView ID="GridUsuarios" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_USUARIO,USERNAME" DataSourceID="SqlDataSourceUsuarios" CssClass="table  table-bordered" AllowPaging="True" OnRowCommand="GridUsuarios_RowCommand">
                     <Columns>
                         <asp:BoundField DataField="ID_USUARIO" HeaderText="NUM. EMPLEADO" ReadOnly="True" SortExpression="ID_USUARIO" />
                         <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                         <asp:BoundField DataField="USERNAME" HeaderText="USUARIO" SortExpression="USERNAME" />
                         <asp:BoundField DataField="CONTRASEÑA" HeaderText="CONTRASEÑA" SortExpression="CONTRASEÑA" Visible="False" />
                         <asp:BoundField DataField="ROL" HeaderText="ROL" SortExpression="ROL" />
                         <asp:ButtonField ButtonType="Image" CommandName="Select" Text="Editar" ImageUrl="~/Images/editar.png" HeaderText="EDITAR" />
                         <asp:ButtonField ButtonType="Image" CommandName="Select2" Text="Eliminar" ImageUrl="~/Images/delete.png" HeaderText="ELIMINAR" /> 
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:AlmacenConnectionString %>" SelectCommand="SELECT ID_USUARIO, NOMBRE, USERNAME, CONTRASEÑA, ROL FROM USUARIOS ORDER BY NOMBRE" FilterExpression="NOMBRE LIKE '%{0}%'">
                     <FilterParameters>
                         <asp:ControlParameter ControlID="txtBuscar" Name="NOMBRE" PropertyName="Text" />
                     </FilterParameters>
                 </asp:SqlDataSource>
			      		
		      		</div> <!-- /widget-content -->
	      		</div> 
	      		
      		</div><!--/TABLA DE ARTICULOS--> 
                      
                      <!-- AGREGAR ARTICULOS-->
         <div class="span12" id="DivAgregarArticulos" runat="server">
	        <div id="Div3" class="widget">	<div class="widget-header"> <i class="icon-plus-sign"></i><i class="icon-user"></i>
             EDICIÓN DE USUARIOS
            </div>	
                <div class="widget-content">
                    <center><h3>EDICIÓN DE USUARIOS</h3> <br />         
                     <table class="table table" style="width:50%;">
                         <tr>
                             <td>NUM. EMPLEADO:  </td>
                             <td>
                                 <asp:textbox runat="server" ID="txtNumEmpleado"></asp:textbox>
                                 <asp:RequiredFieldValidator ID="RequiredCodigo" runat="server" ControlToValidate="txtNumEmpleado" ErrorMessage="Campo requerido" ForeColor="Red">Campo requerido</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr>
                             <td>NOMBRE:  </td>
                             <td>
                                 <asp:textbox runat="server" ID="txtNombre"></asp:textbox>
                                 <asp:RequiredFieldValidator ID="RequiredCodigo0" runat="server" ControlToValidate="txtNombre" ErrorMessage="Campo requerido" ForeColor="Red">Campo requerido</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                          <tr>
                             <td>USUARIO:  </td>
                             <td>
                                 <asp:textbox runat="server" ID="txtUsuario"></asp:textbox>
                                 <asp:RequiredFieldValidator ID="RequiredCodigo1" runat="server" ControlToValidate="txtUsuario" ErrorMessage="Campo requerido" ForeColor="Red">Campo requerido</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                          <tr>
                             <td>CONTRASEÑA:</td>
                             <td>
                                 <asp:textbox runat="server" ID="txtContraseña0" TextMode="Password"></asp:textbox>
                                 <asp:RequiredFieldValidator ID="RequiredCodigo2" runat="server" ControlToValidate="txtContraseña0" ErrorMessage="Campo requerido" ForeColor="Red">Campo requerido</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                          <tr>
                             <td>CONTRASEÑA:  </td>
                             <td>
                                 <asp:textbox runat="server" ID="txtContraseña" TextMode="Password"></asp:textbox>
                                 <asp:RequiredFieldValidator ID="RequiredCodigo3" runat="server" ControlToValidate="txtContraseña" ErrorMessage="Campo requerido" ForeColor="Red">Campo requerido</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr>
                             <td>ROL:  </td>
                             <td>
                                 <asp:DropDownList ID="DropDownROL" runat="server">
                                     <asp:ListItem>ADMINISTRADOR</asp:ListItem>
                                     <asp:ListItem>EMPLEADO</asp:ListItem>
                                 </asp:DropDownList>
                             </td>
                         </tr>
                         <tr>
                             <td colspan="2" class="form-actions"><center><asp:Button runat="server" Text="Guardar" ID="btnGuardar" CssClass="btn btn-success" OnClick="btnGuardar_Click"></asp:Button><asp:Button runat="server" Text="Actualizar" ID="btnActualizar" CssClass="btn btn-success" Visible="False" OnClick="btnActualizar_Click"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;  <a href="#myModal" role="button" class="btn btn-danger" data-toggle="modal">Cancelar</a></center></td>
                         </tr>
                          <tr>
                             <td colspan="2">
                                 &nbsp;</td>
                          </tr>
                     </table></center>
                            <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h3 id="myModalLabel">¡CANCELAR EDICION!</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p>¿Esta seguro de cancelar la edición del articulo?<br />
                                                            
                                                            
                                                        </p>
                                                      </div>
                                                      <div class="modal-footer">
                                                          <asp:Button runat="server" Text="SI" ID="Button1" CssClass="btn btn-success" OnClientClick="#MyModal" OnClick="btnCancelar_Click"></asp:Button>
                                                         <asp:Button runat="server" Text="NO" ID="Button2" CssClass="btn btn-danger" OnClientClick="#MyModal" /></asp:Button>
                                                         <!--  <asp:Button runat="server" Text="NO" ID="btnCancelar" CssClass="btn btn-danger" OnClientClick="#MyModal" OnClick="btnCancelar_Click"></asp:Button>-->
                                                      </div>
                                                    </div>
		      		</div> <!-- /widget-content -->
	      		</div> 
	      		
      		</div><!--/AGREGAR ARTICULOS-->   
              
                       </div>
             </div>
             </div>
             </div>
     </div>
    </div>
</asp:Content>
