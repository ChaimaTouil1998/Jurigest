<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Standard.Master" CodeBehind="Repartition.aspx.vb" Inherits="JuriGest.Repartition" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblNom" runat="server" Text="الإسم واللقب"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 text-right">
                        <h1 class="h3 mb-0 text-gray-800"> بيانات الفريضة الشرعية<asp:ScriptManager ID="ScriptManager1" runat="server">
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

                  <asp:Label runat="server" Text="الوريث" ID="label"  Visible ="true"></asp:Label>
                    <asp:DropDownList class="form-control dropdown-toggle" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nom" DataValueField="id">
                             <asp:ListItem Value="-1">--</asp:ListItem>
                             

                    </asp:DropDownList>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT id, [Nom] FROM  [dtlHerite] WHERE ([NumDos] = ?)">
                    <SelectParameters>
                        <asp:SessionParameter Name="NumDos" SessionField="NumDOs" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
              </div>
               

               

          
    <div class="row text-right">
        <div class="col">
            <div class="form-group">    
                <asp:Label  Text="المناب" ID="Label3" runat="server" Visible ="true"></asp:Label>
                                  <asp:TextBox ID="txtpart" class="form-control form-control-user" aria-describedby="emailHelp"
                                     placeholder="المناب..." runat="server" Visible ="true">
                                  </asp:TextBox>
            </div>
        </div>
   </div>
         
    <br />
                   
                       
    <div class="text-right">
        <asp:LinkButton ID="btnSave" Text="تثبيت" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
        <asp:LinkButton ID="btnRetour" Text="رجوع" class="d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm" runat="server" ></asp:LinkButton>
         </div>
       
            
   <br />  

    <asp:GridView ID="grdDoc" class="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CellPadding="4" DataKeyNames="id" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="nom" HeaderText="الوريث" SortExpression="nom" />
        <asp:BoundField DataField="part" HeaderText="المناب" SortExpression="part" />
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
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
                     

    
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="select repartition.id, repartition.part, dtlherite.nom from repartition, dtlherite WHERE repartition.herite = dtlherite.id and  (repartition.[NumDOs] = ?)">
         <SelectParameters>
             <asp:SessionParameter Name="NumDOs" SessionField="NumDos" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>
                     

    
</asp:Content>
