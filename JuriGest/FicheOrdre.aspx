<%@ Page Title="استصدار إذن" Language="vb" AutoEventWireup="false" MasterPageFile="~/Standard.Master" CodeBehind="FicheOrdre.aspx.vb" Inherits="JuriGest.FicheOrdre" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblNom" runat="server" Text="الإسم واللقب"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 text-right">
                        <h1 class="h3 mb-0 text-gray-800">البيانات الخاصة بالإذن<asp:ScriptManager ID="ScriptManager1" runat="server">
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
                         <asp:Label Text="الإذن" ID="Label7" runat="server"></asp:Label>
                            <asp:DropDownList ID="dpType" class="form-control dropdown-toggle" type="button" runat="server" DataSourceID="sqlTribunal" DataTextField="Libelle" DataValueField="Code">

                         </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlTribunal" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [typordre]"></asp:SqlDataSource>
                        </div>
    <div class="row text-right">
                    
                     </div>
     <div class="form-group">    
                                  <asp:Label Text="العدد" ID="Label9" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtNumOrdre" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="العدد..." runat="server"></asp:TextBox>
                              
                             </div>
      <div class="form-group">    
                                  <asp:Label Text="التاريخ" ID="Label4" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtDate" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="التاريخ..." runat="server"></asp:TextBox>
                              
                             </div>
   
           <div class="form-group">    
                                  <asp:Label Text="الموضوع" ID="Label2" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtObjet" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder=" الموضوع..." runat="server"></asp:TextBox>
                              
                             </div>
    <div class="form-group">    
                                  <asp:Label Text="المبلغ" ID="Label8" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtMt" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="المبلغ..." runat="server"></asp:TextBox>
                              
                             </div>
  <div class="form-group">    
                             </div>

                   
    <div class="text-right">
        <asp:LinkButton ID="btnSave" Text="تثبيت" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
        <asp:LinkButton ID="btnUndo" Text="رجوع" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
         </div>
       
    
         

    
</asp:Content>
