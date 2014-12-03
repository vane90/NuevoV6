<%@ Page Language="VB" AutoEventWireup="false" CodeFile="wfAdminCursosDep_GridTodos.aspx.vb" Inherits="App_AdminCursos_wfAdminCursosDep_GridTodos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../Mensajes/wvc_ScriptManager.ascx" TagName="wvc_ScriptManager" TagPrefix="uc1" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Cursos</title>
    <%--<link href="../../App/HojasDEstilo/nexusestilos.css" rel="stylesheet" type="text/css" />--%>
    <%--<link href="../../App/HojasDEstilo/YahooGridView.css" rel="stylesheet" type="text/css" />--%>
    <script language="javascript" src="../../App/Scripts/jsAdmCur.js" type="text/javascript"></script> 
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/AdminLTE.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
          body {
              background-color: white;
          }
         .table > tbody > tr > td
         {
             vertical-align: middle;
             border-top: none;
         }
         .table > tbody > tr > th
         {
             text-align: center;
         }

         .thead 
         {
             background-color: #3c8dbc;
             color: white;
         }

         .thead a
         {
             color: white;   
         }
  
     </style>

    <%--<META HTTP-EQUIV="Cache-Control" CONTENT ="no-cache"/>--%>
</head>
<body>
    <form id="form1" runat="server">
    <uc1:wvc_ScriptManager ID="Wvc_ScriptManager1" runat="server" />   
    <asp:UpdatePanel id="Up1" runat="server">
        <ContentTemplate>
        
        <div class="col-lg-10">

<%--
                    <tr>
                        <td width="100%" align="center">
                            <table class="info" style="margin-top:-5px">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblBusCurso" runat="server" Text="Buscar Curso"></asp:Label>
                                    </td>
                                    <td>
                                         <asp:TextBox ID="txtBusquedaCurso" runat="server" Width="300px"></asp:TextBox>
                                         <cc1:AutoCompleteExtender ID="ACCurso" runat="server" ContextKey="" MinimumPrefixLength="1" ServiceMethod="Curso" ServicePath="../../WebServices/AutoComplete.asmx" TargetControlID="txtBusquedaCurso" UseContextKey="True" CompletionInterval="500"></cc1:AutoCompleteExtender>
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="btnBuscar" runat="server" Width="16px" ImageUrl="~/App/Utilerias/DisenioGrafico/Imagenes/Buscar.png" OnClick="btnBuscar_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
--%>
            <asp:GridView ID="GvCursos" runat="server" CssClass="table" AutoGenerateColumns="False"
                AllowPaging="True" AllowSorting="True" PageSize="27" Visible="False" EnableTheming="True"
                GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="CURSO" SortExpression="Nombre asc">
                        <ItemTemplate>
                            
                            <asp:LinkButton ID="lbNombre" CommandName="Curso" Text='<%# DataBinder.Eval(Container, "DataItem.Nombre") %>'
                                CommandArgument='<%# DataBinder.Eval(Container, "DataItem.IdCurso") %>' runat="server"></asp:LinkButton><br/>

                                <i class="glyphicon glyphicon-user"></i>
                                <asp:LinkButton ID="lbUsuario" CommandName="Curso" Text="Nombre del Usuario" runat="server"></asp:LinkButton><br/>

                                <i class="fa fa-folder"></i>
                            <asp:Label ID="lbNombreCarpeta" Text='<%# DataBinder.Eval(Container, "DataItem.NombreCarpeta") %>'
                                runat="server"></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>


                   <%-- <asp:TemplateField HeaderText="Usuarios">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImgUserGrid" runat="server" ImageUrl="~/App/Utilerias/DisenioGrafico/Imagenes/usuarios_Curso.png"
                                CommandName="Usuarios" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.IdCurso") %>' /><br />
                            <asp:Label ID="lblLegendaUsuarios" runat="server" Text="(*)" Visible="false"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>

                    <asp:TemplateField HeaderText="Vigencia / Estatus" SortExpression="Descripcion asc">
                        <ItemTemplate>
                            <i class="fa fa-check text-green"></i>
                            <asp:Label runat="server" ID="lblStatus" Text='<%# DataBinder.Eval(Container, "DataItem.Descripcion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Modalidad" SortExpression="Modalidad asc">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblModalidad" Text='<%# DataBinder.Eval(Container, "DataItem.Modalidad") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="Tipo" SortExpression="Modalidad asc">
                        <ItemTemplate>
                            Competencias
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <div class="dropdown pull-right">
                                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                        Acciones
                                        <span class="caret"></span>
                                    </button>

                                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu3">
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-users"></i>Gestionar Usuarios</a></li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-edit"></i>Editar</a></li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="glyphicon glyphicon-certificate"></i>Respaldar</a></li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-share"></i>Compartir</a></li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-copy"></i>Replicar</a></li>
                                        <li role="presentation" class="divider"></li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="glyphicon glyphicon-trash"></i>Eliminar</a></li>
                                    </ul>
                                </div>
                                
                            <asp:ImageButton ID="ImgEditGrid" runat="server" ImageUrl="~/App/Utilerias/DisenioGrafico/Imagenes/bookedit.png"
                                CommandName="Editar" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.IdCurso") %>'
                                ToolTip="Editar Curso" Visible="False" />
                            <asp:ImageButton ID="ImgDeleteGrid" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.IdCurso") %>'
                                runat="server" ImageUrl="~/App/Utilerias/DisenioGrafico/Imagenes/borrar.gif"
                                CommandName="Borrar" ToolTip="Borrar Curso" Visible="False" />
                            <asp:ImageButton ID="ImgSaveGrid" CommandName="Respaldo" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.IdCurso") %>'
                                runat="server" ImageUrl="~/App/Utilerias/DisenioGrafico/Imagenes/disks.png" ToolTip="Respaldar Curso" Visible="False" />
                            <asp:ImageButton ID="ImgCompartirGrid" runat="server" ImageUrl="~/App/Utilerias/DisenioGrafico/Imagenes/compartir.png"
                                CommandName="Compartir" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.IdCurso") %>'
                                ToolTip="Compartir Curso" Visible="False" /><br />
                            <asp:Label ID="lblLegenda" runat="server" Text="En proceso de cierre (*)" Visible="false"></asp:Label>
                            <asp:HiddenField ID="HFCursoId" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.IdCurso") %>' />

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="thead" />
                <RowStyle CssClass="tr" />
            </asp:GridView>
            <asp:HiddenField ID="HfEsta" runat="server" />
                            <asp:HiddenField ID="HfModa" runat="server" />
                            <asp:HiddenField ID="HfMaes" runat="server" />
                    
        </div>

        </ContentTemplate>
    </asp:UpdatePanel> 
    


    </form>
    
     <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <script src="../js/AdminLTE/app.js" type="text/javascript"></script>
    <script language="javascript" src="../../App/Scripts/AdminCursos.js" type="text/javascript"></script>
    
</body>
</html>
