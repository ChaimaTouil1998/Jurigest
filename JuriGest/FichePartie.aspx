<%@ Page Title="البيانات الخاصة بالطرف" Language="vb" AutoEventWireup="false" MasterPageFile="~/Standard.Master" CodeBehind="FichePartie.aspx.vb" Inherits="JuriGest.FichePartie" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblNom" runat="server" Text="الإسم واللقب"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 text-right">
                        <h1 class="h3 mb-0 text-gray-800">البيانات الخاصة بالطرف<asp:ScriptManager ID="ScriptManager1" runat="server">
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
       <div class="form-group">
                         <asp:Label Text="صفة الطرف " ID="Label2" runat="server"></asp:Label>
                            <asp:DropDownList ID="dpSOurce" class="form-control dropdown-toggle" type="button" runat="server" AutoPostBack="True">
                                        <asp:ListItem Value="-1">--</asp:ListItem>
                                        <asp:ListItem Value="0">شركة</asp:ListItem>
                                        <asp:ListItem Value="1">وريث</asp:ListItem>
                                        <asp:ListItem Value="2">متسوغ</asp:ListItem>

                            </asp:DropDownList>
                         
                            <asp:SqlDataSource ID="sqlTribunal" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [typpar]"></asp:SqlDataSource>
                        </div>






   
    <div class="row text-right">
                            <div class="col">
                                 <div class="form-group">    
                                  <asp:Label  Text="الصفة الإجتماعية" ID="Label3" runat="server" Visible ="false"></asp:Label>
                                  <asp:TextBox ID="txtRS" class="form-control form-control-user" aria-describedby="emailHelp"
                                     placeholder="الصفة الإجتماعية..." runat="server" Visible ="false">
                                  </asp:TextBox>
                               <asp:Label  Text="عنوان الشركة" ID="Label9" runat="server" Visible ="false"></asp:Label>
                                  <asp:TextBox ID="txtAdr" class="form-control form-control-user" aria-describedby="emailHelp"
                                     placeholder="عنوان الشركة..." runat="server" Visible ="false">
                                  </asp:TextBox>
                                     <asp:Label  Text="إسم الوكيل" ID="Label15" runat="server" Visible ="false"></asp:Label>
                                  <asp:TextBox ID="TextBox1" class="form-control form-control-user" aria-describedby="emailHelp"
                                     placeholder="إسم الوكيل..." runat="server" Visible ="false">
                                  </asp:TextBox>
                                <asp:Label  Text="المعرف الجبائي" ID="Label10" runat="server" Visible ="false"></asp:Label>
                                  <asp:TextBox ID="txtMt" class="form-control form-control-user" aria-describedby="emailHelp"
                                     placeholder="المعرف الجبائي..." runat="server" Visible ="false">
                                  </asp:TextBox>
                                <asp:Label  Text="آلسجل الوطني للمؤسسات" ID="Label11" runat="server" Visible ="false"></asp:Label>
                                  <asp:TextBox ID="txtRNE" class="form-control form-control-user" aria-describedby="emailHelp"
                                     placeholder="آلسجل الوطني للمؤسسات..." runat="server" Visible ="false">
                                  </asp:TextBox>
                                <asp:Label  Text="البريد الإلكتروني" ID="Label12" runat="server" Visible ="false"></asp:Label>
                                  <asp:TextBox ID="txtEmail" class="form-control form-control-user" aria-describedby="emailHelp"
                                     placeholder="البريد الإلكتروني..." runat="server" Visible ="false">
                                  </asp:TextBox>

                         <asp:Label  Text="رقم الهاتف" ID="Label13" runat="server" Visible ="false"></asp:Label>
                                  <asp:TextBox ID="txtTel" class="form-control form-control-user" aria-describedby="emailHelp"
                                     placeholder="رقم الهاتف..." runat="server" Visible ="false">
                                  </asp:TextBox>
                             </div>
                            </div>
                   
                     </div>



    
     <div class="form-group"> 
        <asp:Label  Text="اسم الطرف" ID="Label8" runat="server" Visible ="false"></asp:Label>
         <asp:TextBox ID="txtNom" class="form-control form-control-user" aria-describedby="emailHelp"
             placeholder="اسم الطرف..." runat="server" Visible ="false">
         </asp:TextBox>
      </div>
    <div class="form-group"> 
        <asp:Label  Text="ع.ب.و" ID="Label16" runat="server" Visible ="false"></asp:Label>
         <asp:TextBox ID="TextBox2" class="form-control form-control-user" aria-describedby="emailHelp"
             placeholder="ع.ب.و..." runat="server" Visible ="false">
         </asp:TextBox>
     </div>
    <div class="form-group"> 
        <asp:Label  Text="العنوان" ID="Label17" runat="server" Visible ="false"></asp:Label>
         <asp:TextBox ID="TextBox3" class="form-control form-control-user" aria-describedby="emailHelp"
             placeholder="العنوان..." runat="server" Visible ="false">
         </asp:TextBox>
     </div>
    <div class="form-group"> 
        <asp:Label  Text="البريد الالكتروني" ID="Label18" runat="server" Visible ="false"></asp:Label>
         <asp:TextBox ID="TextBox4" class="form-control form-control-user" aria-describedby="emailHelp"
             placeholder="البريد الالكتروني..." runat="server" Visible ="false">
         </asp:TextBox>
     </div>
    <div class="form-group"> 
        <asp:Label  Text="الهاتف" ID="Label19" runat="server" Visible ="false"></asp:Label>
         <asp:TextBox ID="TextBox5" class="form-control form-control-user" aria-describedby="emailHelp"
             placeholder="الهاتف..." runat="server" Visible ="false">
         </asp:TextBox>
     </div>








   <div class="form-group">    
                                  <asp:Label Text="تاريخ التضمين" ID="Label4"  runat="server"></asp:Label>
                                  <div class="form-group">    
                                  <asp:TextBox ID="txtDatDos" format="dd/MM/yyyy" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="تاريخ التضمين..." runat="server"></asp:TextBox>
                                  <ajaxToolkit:CalendarExtender ID="txtDatDos_CalendarExtender" runat="server" BehaviorID="txtDatDos_CalendarExtender" DefaultView="Days" PopupPosition="BottomLeft" TargetControlID="txtDatDos" />
                             </div>
                             </div>
            
                    
     <div class="form-group">    
         <asp:Label  Text="إضافة وثيقة آلسجل الوطني للمؤسسات" ID="Label14" runat="server" Visible ="True"></asp:Label>
         <asp:FileUpload CssClass="form-control" ID="Fichier" runat="server" />
         <asp:TextBox ID="txtChemin" Visible="False" runat="server"></asp:TextBox>
     </div>
    


     <asp:SqlDataSource ID="sqlDoc" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT id, [CheminPV] FROM [dtlPartie] WHERE ([Id] = ?) and cheminpv<>'' ">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtId" Name="Id" PropertyName="Text" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>






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


                       
    <div class="text-right">
        <asp:LinkButton ID="btnSave" Text="تثبيت" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
        <asp:LinkButton ID="btnUndo" Text="رجوع" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
         </div>
       
         

    
</asp:Content>
