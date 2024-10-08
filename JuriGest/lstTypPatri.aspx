<%@ Page Title="أنواع التركة" Language="vb" AutoEventWireup="false" MasterPageFile="~/Vide.Master" CodeBehind="lstTypPatri.aspx.vb" Inherits="JuriGest.lstTypPatri" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblNom" runat="server" Text="الإسم واللقب"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 text-right">
                        <h1 class="h3 mb-0 text-gray-800">قائمة أنواع التركة</h1>
                    </div>
    <div class="text-right">
      <asp:LinkButton ID="btnAdd" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm collapsed text-right" runat="server" data-toggle="collapse" data-target="#collapseAdd" aria-expanded="true" aria-controls="collapseTwo">
                            <i class="fas fa-save fa-sm text-white-50"></i> إضافة</asp:LinkButton>
    </div>
        <li >
              <div id="collapseAdd" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded" >
                         <div class="form-group text-right">
                                    <asp:TextBox ID="txtLibelle" class="form-control form-control-user" aria-describedby="emailHelp"
                                                placeholder="النوع..." runat="server"></asp:TextBox>
                         </div>
                       
                        <div class="text-right">
                     <asp:LinkButton ID="btnSave" Text="تثبيت" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
                    </div>
                        </div>
                </div>
            </li>

    <asp:Panel ID="Panel1" runat="server" BackColor="Window" Visible="false">
                <div class="row text-right">
                    <div class="col">
                            <div class="form-group">    
                                    <asp:Label Text="المعرف" ID="lblCode" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtCode1" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                            placeholder="المعرف..." runat="server"></asp:TextBox>
                             </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <asp:Label Text="نوع التركة" ID="Label1" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtLibelle1" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="الوظيفة..." runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
          
     <div class="text-right">
        <asp:LinkButton ID="btnSaveModif" Text="تثبيت" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
        <asp:LinkButton ID="btnUndo" Text="إلغاء" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
</div>
    </asp:Panel>
    
   <asp:GridView ID="grdListe" runat="server" class="table table-bordered text-right" AutoGenerateColumns="False" DataKeyNames="Code" DataSourceID="sqlListe">
            <Columns>
                <asp:BoundField DataField="Code" HeaderText="المعرف" ReadOnly="True" SortExpression="Code" />
                <asp:BoundField DataField="Libelle" HeaderText="نوع التركة" SortExpression="Libelle" />
                <asp:TemplateField>
                <ItemTemplate>
                            <asp:LinkButton class="btn btn-danger btn-circle"  ID="AddButton" runat="server" 
                                CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" 
                                CommandName="SuppLg" ToolTip="مسح" OnClientClick="return confirm('هل أنت متأكد؟',);" >
                                   <i class="fas fa-trash"></i></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
                 </asp:TemplateField>
                <asp:TemplateField>
                 <ItemTemplate>
                            <asp:LinkButton class="btn btn-group btn-circle collapsed"  ID="Open" runat="server"  
                                CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" 
                                CommandName="OpenLg" ToolTip="تغيير" >
                                   <i class="fas fa-pen"></i></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
                 </asp:TemplateField>
            </Columns>
        </asp:GridView>
    <div class="row">
        
                     
             

           

                        
                    <asp:SqlDataSource ID="sqlListe" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [typpatri]"></asp:SqlDataSource>
                     
             

           

                        
                    </div>
</asp:Content>
