<%@ Page Title="التركة" Language="vb" AutoEventWireup="false" MasterPageFile="~/Standard.Master" CodeBehind="PatriDos.aspx.vb" Inherits="JuriGest.PatriDos" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblNom" runat="server" Text="الإسم واللقب"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 text-right">
                        <h1 class="h3 mb-0 text-gray-800">التركة<asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </h1>
                    </div>
    

     <div class="row text-right">
                    <div class="col">
                            <div class="form-group">    
                                  <asp:Label Text="الملف" ID="Label1" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtCode" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="المعرف..." runat="server" ReadOnly></asp:TextBox>
                             </div>
                    </div>
                    <div class="col">
                          <div class="form-group">    
                                  <asp:Label Text="عدد التضمين" ID="Label6" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtNumBO" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="عدد التضمين..." runat="server" ReadOnly></asp:TextBox>
                             </div> 
                    </div>
                    <div class="col">
                     <div class="form-group">    
                                  <asp:Label Text="تاريخ التضمين" ID="Label5" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtDatBO" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="تاريخ التضمين..." runat="server" ReadOnly></asp:TextBox>
                                  <ajaxToolkit:CalendarExtender ID="TextBox3_CalendarExtender" Format="dd/MM/yyyy" runat="server" BehaviorID="TextBox3_CalendarExtender" TargetControlID="txtDatBO">
                                  </ajaxToolkit:CalendarExtender>
                             </div>

                    </div>
                     </div>
                
                        <div class="form-group">    
                                  <asp:Label Text="تعريف الملف" ID="Label7" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtLibelle" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="تعريف الملف..." runat="server" TextMode="MultiLine" ReadOnly></asp:TextBox>
                             </div> 
         <div class="text-right">
      <asp:LinkButton ID="btnRepart" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm collapsed text-right" runat="server" aria-expanded="true" >
                            <i class="fas fa-save fa-sm text-white-50"></i> الفريضة الشرعية</asp:LinkButton>
    </div>
    <br />
      <div class="text-right">
      <asp:LinkButton ID="btnAdd" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm collapsed text-right" runat="server" aria-expanded="true" >
                            <i class="fas fa-save fa-sm text-white-50"></i> إضافة</asp:LinkButton>
    </div>
                    
   
    <asp:GridView ID="grdDoc" class="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDoc" DataKeyNames="Id">
    <Columns>
        <asp:BoundField DataField="Identifiant" HeaderText="المعرف" SortExpression="Identifiant" />
          <asp:BoundField DataField="Nom" HeaderText="الإسم" SortExpression="Nom" />
        <asp:BoundField DataField="LibType" HeaderText="النوع" SortExpression="LibType" />
        <asp:TemplateField>
                 <ItemTemplate>
                            <asp:LinkButton class="btn btn-group btn-circle collapsed"  ID="Open" runat="server"  
                                CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" 
                                CommandName="OpenLg" ToolTip="Modifier la ligne" >
                                   <i class="fas fa-pen"></i></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
                 </asp:TemplateField>
    </Columns>
        </asp:GridView>
                     
          
     
    
                  
                   
                       
     <asp:SqlDataSource ID="sqlDoc" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT [Id], [Nom], [Identifiant], typpatri.libelle as LibType FROM [dtlpatrimoine], typpatri WHERE dtlpatrimoine.type = typpatri.code and ([NumDOs] = ?)">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtCode" Name="NumDOs" PropertyName="Text" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>
                     
          
     
    
                  
                   
                       
   
    
         

    
</asp:Content>
