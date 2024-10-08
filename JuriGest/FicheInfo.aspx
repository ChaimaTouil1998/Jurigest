<%@ Page Title="إعلام المتداخلين" Language="vb" AutoEventWireup="false" MasterPageFile="~/Standard.Master" CodeBehind="FicheInfo.aspx.vb" Inherits="JuriGest.FicheInfo" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblNom" runat="server" Text="الإسم واللقب"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 text-right">
                        <h1 class="h3 mb-0 text-gray-800">البيانات الخاصة بالإشهار<asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </h1>
                    </div>
    

     <div class="row text-right">
                    <div class="col">
                        <asp:TextBox ID="txtId" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                       runat="server" Visible ="false"></asp:TextBox>
                            <div class="form-group">    
                                  <asp:Label Text="الملف" ID="Label1" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtCode" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="المعرف..." runat="server"></asp:TextBox>
                             </div>
                    </div>
                    <div class="col">
                          <div class="form-group">    
                                  <asp:Label Text="عدد التضمين" ID="Label6" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtNumBO" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="عدد التضمين..." runat="server"></asp:TextBox>
                             </div> 
                    </div>
                    <div class="col">
                     <div class="form-group">    
                                  <asp:Label Text="تاريخ التضمين" ID="Label5" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtDatBO" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="تاريخ التضمين..." runat="server"></asp:TextBox>
                                  <ajaxToolkit:CalendarExtender ID="TextBox3_CalendarExtender" Format="dd/MM/yyyy" runat="server" BehaviorID="TextBox3_CalendarExtender" TargetControlID="txtDatBO">
                                  </ajaxToolkit:CalendarExtender>
                             </div>

                    </div>
                     </div>
                
                        <div class="form-group">
                         <asp:Label Text="الطرف" ID="Label7" runat="server"></asp:Label>
                            <asp:DropDownList ID="dpType" class="form-control dropdown-toggle" type="button" runat="server" DataSourceID="sqlTribunal" DataTextField="Nom" DataValueField="Id">

                         </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlTribunal" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT [Id], [Nom] FROM [dtlPartie] WHERE ([NumDOs] = ?)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtCode" Name="NumDOs" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
    <div class="row text-right">
                    
                     </div>
    
      <div class="form-group">    
                                  <asp:Label Text="التاريخ" ID="Label4" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtDate" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="التاريخ..." runat="server"></asp:TextBox>
                              
                                  <ajaxToolkit:CalendarExtender ID="txtDate_CalendarExtender" Format="dd/MM/yyyy" runat="server" BehaviorID="txtDate_CalendarExtender" DefaultView="Days" PopupPosition="BottomLeft" TargetControlID="txtDate" />
                              
                             </div>
   
           <div class="form-group">    
                                  <asp:Label Text="نص الإستدعاء" ID="Label2" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtTexte" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="نص الإشهار..." runat="server"></asp:TextBox>
                              
                             </div>   
    
           <div class="form-group">    
                                  <asp:Label Text="إسم العدل المنفذ" ID="Label8" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtHuissier" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="نص الإشهار..." runat="server"></asp:TextBox>
                              
                             </div>   
  <div class="form-group">    
                                  <asp:Label  Text="نسخة من نص الإستدعاء" ID="Label3" runat="server" Visible ="false"></asp:Label>
                                   <asp:FileUpload CssClass="form-control" ID="Fichier" runat="server" />
         <asp:TextBox ID="txtChemin" class="form-control form-control-user" 
                                                                       runat="server" Visible ="false" ></asp:TextBox>
                             </div>

                   
    <asp:GridView ID="grdDoc" class="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDoc" DataKeyNames="Chemin">
    <Columns>
        <asp:BoundField DataField="Chemin" HeaderText="الوثيقة" SortExpression="Chemin" />
        <asp:TemplateField>
                 <ItemTemplate>
                            <asp:LinkButton class="btn btn-group btn-circle collapsed"  ID="Open" runat="server"  
                                CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" 
                                CommandName="OpenLg" ToolTip="Modifier la ligne" >
                                   <i class="fas fa-pen"></i></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
                 </asp:TemplateField>
          <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton class="btn btn-danger btn-circle"  ID="AddButton" runat="server" 
                        CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" 
                        CommandName="SuppLg" >
                           <i class="fas fa-trash"></i></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
            </asp:TemplateField>
    </Columns>
        </asp:GridView>
                   
                       
     <asp:SqlDataSource ID="sqlDoc" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT [Chemin] FROM [dtlInfo] WHERE ([Id] = ?) and chemin <> ''">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtId" Name="Id" PropertyName="Text" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>
                   
                       
    <div class="text-right">
        <asp:LinkButton ID="btnSave" Text="تثبيت" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
        <asp:LinkButton ID="btnUndo" Text="رجوع" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
         </div>
       
    
         

    
</asp:Content>
