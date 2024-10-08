<%@ Page Title="المصاريف" Language="vb" AutoEventWireup="false" MasterPageFile="~/Standard.Master" CodeBehind="Depense.aspx.vb" Inherits="JuriGest.Depense" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content5" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblNom" runat="server" Text="الإسم واللقب"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-sm-flex align-items-center justify-content-between mb-4 text-right">
                        <h1 class="h3 mb-0 text-gray-800">المصاريف<asp:ScriptManager ID="ScriptManager1" runat="server">
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
                                  <asp:Label Text="تعريف الملف" ID="Label2" runat="server"></asp:Label>
                                  <asp:TextBox ID="txtLibelle" class="form-control form-control-user" aria-describedby="emailHelp"
                                                                        placeholder="تعريف الملف..." runat="server" TextMode="MultiLine" ReadOnly></asp:TextBox>
                             </div> 




   

   <div class="text-right">
        <asp:LinkButton ID="btnSave" Text="تثبيت" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
        <asp:LinkButton ID="btnUndo" Text="رجوع" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
         </div>
    <br />
</asp:Content>