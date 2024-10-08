<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Standard.Master" CodeBehind="FicheHerite.aspx.vb" Inherits="JuriGest.FicheHerite" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblNom" runat="server" Text="الإسم واللقب"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 text-right">
                        <h1 class="h3 mb-0 text-gray-800">البيانات الخاصة بالوريث<asp:ScriptManager ID="ScriptManager1" runat="server">
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
                                  <asp:Label Text="المعرف" ID="Label7" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtIdentifiant" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="المعرف..." runat="server"></asp:TextBox>
                             </div> 
     
    <div class="row text-right">
                    
                     </div>
     <div class="form-group">    
                                  <asp:Label Text="الإسم" ID="Label9" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtNom" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="الإسم..." runat="server"></asp:TextBox>
                              
                             </div>
      <div class="form-group">    
                                  <asp:Label Text="العنوان" ID="Label4" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtAdresse" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="العنوان..." runat="server"></asp:TextBox>
                              
                             </div>
   
           <div class="form-group">    
                                  <asp:Label Text="الهاتف" ID="Label2" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtTel" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="الهاتف..." runat="server"></asp:TextBox>
                              
                             </div>   
                      <div class="form-group">    
                                  <asp:Label Text="البريد الإلكتروني" ID="Label3" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtEmail" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="البريد الإلكتروني..." runat="server"></asp:TextBox>
                              
                             </div>
    
               <div class="form-group">    
                                  <asp:Label Text="عدد ب.ت.و" ID="Label8" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtCIN" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="عدد ب.ت.و..." runat="server"></asp:TextBox>
                              
                             </div>




                <div class="form-group">    
                    <asp:Label Text="إسم المخلف" ID="Label10" runat="server"></asp:Label>   
                    <asp:TextBox ID="txtNom2" class="form-control form-control-user" aria-describedby="emailHelp"
                        placeholder="إسم المخلف..." runat="server"></asp:TextBox>
                              
                             </div>




    <div class="form-group">    
         <asp:Label  Text="شهادة الوفاة" ID="Label14" runat="server" Visible ="False"></asp:Label>
         <asp:FileUpload CssClass="form-control" ID="Fichier" runat="server" />
         <asp:TextBox ID="txtChemin" Visible="false" runat="server"></asp:TextBox>
     </div>


     <asp:GridView ID="grdDoc" class="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDoc" DataKeyNames="id,CheminPV">
    <Columns>
        <asp:BoundField DataField="CheminPV" HeaderText="Chemin" SortExpression="CheminPV" />
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



    <asp:SqlDataSource ID="sqlDoc" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT id, [CheminPV] FROM [dtlHerite] WHERE ([Id] = ?) and cheminpv<>'' ">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtId" Name="Id" PropertyName="Text" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>

                       
    <div class="text-right">
        <asp:LinkButton ID="btnSave" Text="تثبيت" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
        <asp:LinkButton ID="btnUndo" Text="رجوع" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
         </div>
       
    
         

    
</asp:Content>
