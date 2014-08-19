<%@ Page Title="Página principal" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default2.aspx.cs" Inherits="instrumental_wbforrms._Default" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <!-- Nav -->
    <nav id="nav" class="skel-panels-fixed">
        <ul>
                        <li><a id="A11" runat="server" href="~/Solicitud/">SOLICITAR EQUIPO</a></li> 
                        <li><a id="A13" runat="server" href="~/Administrador/">ADMINISTRADOR</a></li>                  
        </ul>        
    </nav>
    <!-- /Nav -->
    <div id="banner-wrapper">
				<section id="banner">
                    <img src="Content/themes/theme_up/css/images/uas.png" style="width:100px; float:left;"/><img src="Content/themes/theme_up/css/images/LOGO%20GEODESIA.png" style="width:130px; float:right;"/>
					<h2>SISTEMA DE INSTRUMENTAL GEODÉSICO</h2>      
					<h3 style="color:white;">FACULTAD DE CIENCIAS DE LA TIERRA Y EL ESPACIO</h3>				
				</section>
</div>
</asp:Content>