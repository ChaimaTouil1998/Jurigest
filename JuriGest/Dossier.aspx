<%@ Page Title="إضافة ملف" Language="vb" AutoEventWireup="false" MasterPageFile="~/Standard.Master" CodeBehind="Dossier.aspx.vb" Inherits="JuriGest.Dossier" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblNom" runat="server" Text="الإسم واللقب"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 text-right">
                        <h1 class="h3 mb-0 text-gray-800">إضافة ملف<asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </h1>
                    </div>
    

     <div class="row text-right">
                    <div class="col">
                            <div class="form-group">    
                                  <asp:Label Text="المعرف" ID="Label1" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtCode" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="المعرف..." runat="server"></asp:TextBox>
                             </div>
                    </div>
                    <div class="col">
                         <div class="form-group">    
                                  <asp:Label Text="تاريخ الإنشاء" ID="Label3" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtDatDos" format="dd/MM/yyyy" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="تاريخ الإنشاء..." runat="server"></asp:TextBox>
                                  <ajaxToolkit:CalendarExtender ID="txtDatDos_CalendarExtender" runat="server" BehaviorID="txtDatDos_CalendarExtender" DefaultView="Days" PopupPosition="BottomLeft" TargetControlID="txtDatDos" />
                             </div>
                    </div>
                     </div>
        
            <div class="form-group">
                         <asp:Label Text="المحكمة" ID="Label2" runat="server"></asp:Label>
                            <asp:DropDownList ID="dpTribunal" class="form-control dropdown-toggle" type="button" runat="server" DataSourceID="sqlTribunal" DataTextField="Libelle" DataValueField="Code">

                         </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlTribunal" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [Tribunal]"></asp:SqlDataSource>
                        </div>
    <div class="row text-right">
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
                                  <ajaxToolkit:CalendarExtender ID="TextBox3_CalendarExtender" Format="dd/MM/yyyy" runat="server" BehaviorID="txtDatBO_CalendarExtender" TargetControlID="txtDatBO">
                                  </ajaxToolkit:CalendarExtender>
                             </div>

                    </div>
                     </div>
    <div class="form-group">    
                                  <asp:Label Text="تعريف الملف" ID="Label7" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtLibelle" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="تعريف الملف..." runat="server" TextMode="MultiLine"></asp:TextBox>
                             </div> 
          
    
                     
          
     
    
                  
                   
                       
    <div class="text-right">
        <asp:LinkButton ID="btnSave" Text="تثبيت" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
        <asp:LinkButton ID="btnUndo" Text="إلغاء" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
         </div>
       
    
         

    
</asp:Content>
