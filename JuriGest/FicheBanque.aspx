<%@ Page Title="حساب الإئتمان" Language="vb" AutoEventWireup="false" MasterPageFile="~/Standard.Master" CodeBehind="FicheBanque.aspx.vb" Inherits="JuriGest.FicheBanque" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblNom" runat="server" Text="الإسم واللقب"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 text-right">
                        <h1 class="h3 mb-0 text-gray-800">البيانات الخاصة بحساب الإئتمان<asp:ScriptManager ID="ScriptManager1" runat="server">
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
                         <asp:Label Text="البنك" ID="Label7" runat="server"></asp:Label>
                            <asp:DropDownList ID="dpType" class="form-control dropdown-toggle" type="button" runat="server" DataSourceID="sqlTribunal" DataTextField="Libelle" DataValueField="Code">

                         </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlTribunal" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [banque]"></asp:SqlDataSource>
                        </div>
    <div class="row text-right">
                    
                     </div>
     <div class="form-group">    
                                  <asp:Label Text="الحساب" ID="Label9" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtCompte" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="الحساب..." runat="server"></asp:TextBox>
                              
                             </div>
      <div class="form-group">    
                                  <asp:Label Text="التاريخ" ID="Label4" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtDate" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="التاريخ..." runat="server"></asp:TextBox>
                              
                                  <ajaxToolkit:CalendarExtender ID="txtDate_CalendarExtender" Format="dd/MM/yyyy" runat="server" BehaviorID="txtDate_CalendarExtender" DefaultView="Days" PopupPosition="BottomLeft" TargetControlID="txtDate" />
                              
                             </div>
   
           <div class="form-group">    
                                  <asp:Label Text="الفرع" ID="Label2" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtAgence" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="الفرع..." runat="server"></asp:TextBox>
                              
                             </div>   
           <div class="form-group">    
                                  <asp:Label Text="العنوان" ID="Label3" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtAdresse" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="العنوان..." runat="server"></asp:TextBox>
                              
                             </div>   
    



    
    <div class="form-group">    
           <asp:Label Text="البريد الإلكتروني" ID="Label12" runat="server"></asp:Label>
            <asp:TextBox ID="TextBox1" class="form-control form-control-user" aria-describedby="emailHelp" placeholder="البريد الإلكتروني..." runat="server"></asp:TextBox>
    </div> 
    <div class="form-group">    
           <asp:Label Text="الرصيد الحالي" ID="Label8" runat="server"></asp:Label>
            <asp:TextBox ID="TextBox2" class="form-control form-control-user" aria-describedby="emailHelp" placeholder="الرصيد الحالي..." runat="server"></asp:TextBox>
    </div> 
    <div class="form-group">    
           <asp:Label Text="الرصيد عند التسليم" ID="Label13" runat="server"></asp:Label>
            <asp:TextBox ID="TextBox3" class="form-control form-control-user" aria-describedby="emailHelp" placeholder="الرصيد عند التسليم..." runat="server"></asp:TextBox>
    </div>
    
     <div class="col">
                     <div class="form-group">    
                                  <asp:Label Text="تاريخ التضمين" ID="Label10" runat="server"></asp:Label>
                                  <asp:TextBox ID="TextBox4" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="تاريخ التضمين..." runat="server"></asp:TextBox>
                                  <ajaxToolkit:CalendarExtender ID="CalendarExtender1" Format="dd/MM/yyyy" runat="server" BehaviorID="TextBox3_CalendarExtender" TargetControlID="TextBox4">
                                  </ajaxToolkit:CalendarExtender>
                             </div>

                    </div>
    




    <div class="form-group">    
         <asp:Label  Text="الهوية البنكية" ID="Label14" runat="server" Visible ="True"></asp:Label>
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


     <asp:SqlDataSource ID="sqlDoc" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT id, [CheminPV] FROM [dtlBanque] WHERE ([Id] = ?) and cheminpv<>'' ">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtId" Name="Id" PropertyName="Text" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>



                       
    <div class="text-right">
        <asp:LinkButton ID="btnSave" Text="تثبيت" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
        <asp:LinkButton ID="btnUndo" Text="رجوع" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
         </div>
       
    
         

    
</asp:Content>
