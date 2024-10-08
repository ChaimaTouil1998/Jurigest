<%@ Page Title="التسمية" Language="vb" AutoEventWireup="false" MasterPageFile="~/Standard.Master" CodeBehind="NomiDos.aspx.vb" Inherits="JuriGest.NomiDos" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblNom" runat="server" Text="الإسم واللقب"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 text-right">
                        <h1 class="h3 mb-0 text-gray-800">التسمية<asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </h1>
                    </div>
    

     <div class="row text-right">
                    <div class="col">
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
                                  <asp:Label Text="تعريف الملف" ID="Label7" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtLibelle" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="تعريف الملف..." runat="server" TextMode="MultiLine"></asp:TextBox>
                             </div> 
       <div class="form-group">
                         <asp:Label Text="المحكمة" ID="Label2" runat="server"></asp:Label>
                            <asp:DropDownList ID="dpTribunal" class="form-control dropdown-toggle" type="button" runat="server" DataSourceID="sqlTribunal" DataTextField="Libelle" DataValueField="Code">

                         </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlTribunal" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [Tribunal]"></asp:SqlDataSource>
                        </div>
    <div class="row text-right">
                    
                     </div>
   
      <div class="row text-right">
                    <div class="col">
                          <div class="form-group">    
                                  <asp:Label Text="التسمية" ID="Label8" runat="server"></asp:Label>
                                    <asp:DropDownList ID="dpSOurce" class="form-control dropdown-toggle" type="button" runat="server" AutoPostBack="True">
                                        <asp:ListItem Value="0">حكم استعجالي</asp:ListItem>
                                        <asp:ListItem Value="1">قرار تعويض</asp:ListItem>

                         </asp:DropDownList>
                             </div> 
                    </div>
                    <div class="col">
                     <div class="form-group">    
                                  <asp:Label Text="القاضي المراقب" ID="Label9" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtJuge" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="تاريخ التضمين..." runat="server"></asp:TextBox>
                              
                             </div>

                    </div>
                     </div>
      
                    <div class="form-group">    
                                  <asp:Label  Text="إسم الزميل السابق" ID="Label3" runat="server" Visible ="false"></asp:Label>
                                  <asp:TextBox ID="txtAncienExp" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="إسم الزميل السابق..." runat="server" Visible ="false"></asp:TextBox>
                              
                             </div>
    <div class="form-group">    
         <asp:Label  Text="محظر تسليم وتسلم مع الزميل السابق" ID="Label4" runat="server" Visible ="True"></asp:Label>
         <asp:FileUpload CssClass="form-control" ID="Fichier" runat="server" />
         <asp:TextBox ID="txtChemin" class="form-control form-control-user"  runat="server" Visible ="false" ></asp:TextBox>
    </div>
    <asp:GridView ID="grdDoc" class="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDoc" DataKeyNames="CheminPV">
    <Columns>
        <asp:BoundField DataField="CheminPV" HeaderText="الوثيقة" SortExpression="CheminPV" />
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
                     
          
     
    
                  
                   
                       
     <asp:SqlDataSource ID="sqlDoc" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT [CheminPV] FROM [Dossier] WHERE ([NumDos] = ?) And CheminPV <> ''">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtCode" Name="NumDos" PropertyName="Text" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>
                     
          
     
    
                  
                   
                       
    <div class="text-right">
        <asp:LinkButton ID="btnSave" Text="تثبيت" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
        <asp:LinkButton ID="btnUndo" Text="إلغاء" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
         </div>
       
    
         

    
</asp:Content>
