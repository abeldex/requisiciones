<%@ Page Title="" Language="C#" MasterPageFile="~/Principal2.Master" AutoEventWireup="true" CodeBehind="cartuchos.aspx.cs" Inherits="Presentation_Layer.CATALOGOS.cartuchos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="menu" runat="server">
       <div class="subnavbar">
                  <div class="subnavbar-inner">
                    <div class="container">
                      <ul class="mainnav">
                          <li class="active"><a href="../Administracion.aspx"><i class="icon-home"></i><span>INICIO</span> </a> </li>                                                             
                          <li class="active">
                              <asp:linkbutton runat="server" ID="btnAgregarArticulos" OnClick="btnAgregarArticulos_Click"><i class="icon-plus-sign"></i><span>AGREGAR CARTUCHOS</span></asp:linkbutton>
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
     <div style="text-align:center;">
       &nbsp;<!--ENCABEZADO DE LA SOLICITUD--><h1 style="color:#238ab1">CATÁLOGO DE CARTUCHOS</h1>
    </div>
     <div style="text-align:center;">
         <p style="color:#238ab1">&nbsp;</p>
    </div>
    <div class="row" id="imp">	
 <div class="main">
	
	<div class="main-inner">

	    <div class="container">
	
	      <div class="row">	    
              
              
                <!-- TABLA DE ARTICULOS-->
         <div class="span12" id="DivListaEquipos" runat="server">
	        <div id="Div2" class="widget">	<div class="widget-header"> <i class="icon-list-alt"></i>
              <h3>LISTADO DE CARTUCHOS</h3>
            </div>	
                <div class="widget-content">            
            <!-- /widget-header -->
                      <i class="icon-search"></i>     <asp:textbox runat="server" ID="txtBuscar" Width="402px"></asp:textbox>
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
                 <asp:GridView ID="GridCartuchos" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_ARTICULO" DataSourceID="SqlDataSourceArticulos" CssClass="table  table-bordered" AllowPaging="True" OnRowCommand="GridPapeleria_RowCommand">
                     <Columns>
                         <asp:BoundField DataField="ID_ARTICULO" HeaderText="CODIGO" ReadOnly="True" SortExpression="ID_ARTICULO" />
                         <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                         <asp:BoundField DataField="MARCA" HeaderText="MARCA" SortExpression="MARCA" />
                         <asp:BoundField DataField="MODELO" HeaderText="MODELO" SortExpression="MODELO" />
                         <asp:BoundField DataField="FAMILIA" HeaderText="FAMILIA" SortExpression="FAMILIA" />
                         <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCRIPCIÓN" SortExpression="DESCRIPCION" />
                         <asp:BoundField DataField="CANTIDAD" HeaderText="CANTIDAD" SortExpression="CANTIDAD" />
                         <asp:ButtonField ButtonType="Image" CommandName="Select" Text="Editar" ImageUrl="~/Images/editar.png" HeaderText="EDITAR" />
                         <asp:ButtonField ButtonType="Image" CommandName="Select2" Text="Eliminar" ImageUrl="~/Images/delete.png" HeaderText="ELIMINAR" />                                        
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSourceArticulos" runat="server" ConnectionString="<%$ ConnectionStrings:AlmacenConnectionString %>" SelectCommand="SELECT ID_ARTICULO, NOMBRE, MARCA, MODELO, FAMILIA, DESCRIPCION, CANTIDAD FROM ARTICULOS WHERE (FAMILIA = 'CARTUCHOS') ORDER BY NOMBRE" FilterExpression="NOMBRE LIKE '%{0}%'">
                     <FilterParameters>
                         <asp:ControlParameter ControlID="txtBuscar" Name="NOMBRE" PropertyName="Text" />
                     </FilterParameters>
                 </asp:SqlDataSource>
			      		
		      		</div> <!-- /widget-content -->
	      		</div> 
	      		
      		</div><!--/TABLA DE ARTICULOS-->

                 <!-- AGREGAR ARTICULOS-->
         <div class="span12" id="DivAgregarArticulos" runat="server">
	        <div id="Div3" class="widget">	<div class="widget-header"> <i class="icon-plus-sign"></i>
              <h3>AGREGAR CARTUCHOS</h3>
            </div>	
                <div class="widget-content">
                    <center><h3><i class="shortcut-icon icon-edit" style="font-size:25px"></i> FORMULARIO PARA EL REGISTRO DE CARTUCHOS</h3> <br />         
                     <table class="table table" style="width:50%;">
                         <tr>
                             <td>CODIGO:  </td>
                             <td>
                                 <asp:textbox runat="server" ID="txtCodigoArticulo"></asp:textbox>
                                 <asp:RequiredFieldValidator ID="RequiredCodigo" runat="server" ControlToValidate="txtCodigoArticulo" Enabled="False" ErrorMessage="Campo requerido" ForeColor="Red">Campo requerido</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr>
                             <td>NOMBRE:  </td>
                             <td>
                                 <asp:textbox runat="server" ID="txtNombreArticulo"></asp:textbox>
                                 <asp:RequiredFieldValidator ID="RequiredNombre" runat="server" ControlToValidate="txtNombreArticulo" Enabled="False" ErrorMessage="Campo requerido" ForeColor="Red">Campo requerido</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                          <tr>
                             <td>MARCA:  </td>
                             <td>
                                 <asp:textbox runat="server" ID="txtMarca"></asp:textbox>
                             </td>
                         </tr>
                          <tr>
                             <td>MODELO:  </td>
                             <td>
                                 <asp:textbox runat="server" ID="txtModelo"></asp:textbox>
                             </td>
                         </tr>
                         <tr>
                             <td>DESCRIPCIÓN:  </td>
                             <td>
                                 <asp:textbox runat="server" ID="txtDescripcion" Height="95px" TextMode="MultiLine" Width="356px"></asp:textbox><br />
                                 <asp:RequiredFieldValidator ID="RequiredDescripcion" runat="server" ControlToValidate="txtDescripcion" Enabled="False" ErrorMessage="Campo requerido" ForeColor="Red">Campo requerido</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr>
                             <td>CANTIDAD:  </td>
                             <td>
                                 <asp:textbox runat="server" ID="txtCantidad"></asp:textbox>
                                 <asp:RequiredFieldValidator ID="RequiredCantidad" runat="server" ControlToValidate="txtCantidad" Enabled="False" ErrorMessage="Campo requerido" ForeColor="Red">Campo requerido</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr>
                             <td colspan="2" class="form-actions"><center><asp:Button runat="server" Text="Guardar" ID="btnGuardar" CssClass="btn btn-success" OnClick="btnGuardar_Click"></asp:Button><asp:Button runat="server" Text="Actualizar" ID="btnActualizar" CssClass="btn btn-success" OnClick="btnActualizar_Click" Visible="False"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;  <a href="#myModal" role="button" class="btn btn-danger" data-toggle="modal">Cancelar</a></center></td>
                         </tr>
                          <tr>
                             <td colspan="2">
                                 &nbsp;</td>
                          </tr>
                     </table></center>
                            <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h3 id="myModalLabel">¿Esta seguro de cancelar el registro del articulo?</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p></p>
                                                      </div>
                                                      <div class="modal-footer">
                                                          <asp:Button runat="server" Text="SI" ID="btnCancelar" CssClass="btn btn-danger" OnClick="btnCancelar_Click" OnClientClick="#MyModal"></asp:Button>
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

    <script type="text/javascript">
        function DesactivarValidador(nombre) {
            var control = document.getElementById(nombre + '.ClientID');
            ValidatorEnable(control, false);
        }
    </script>
</asp:Content>
