<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Standard.Master" CodeBehind="FichePatrimoine.aspx.vb" Inherits="JuriGest.FichePatrimoine" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblNom" runat="server" Text="الإسم واللقب"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 text-right">
                        <h1 class="h3 mb-0 text-gray-800">البيانات الخاصة بالتركة<asp:ScriptManager ID="ScriptManager1" runat="server">
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
                         <asp:Label Text="النوع" ID="Label8" runat="server"></asp:Label>
                            <asp:DropDownList ID="dpType" class="form-control dropdown-toggle" type="button" runat="server" DataSourceID="sqlTribunal" DataTextField="Libelle" DataValueField="Code" AutoPostBack="True" AppendDataBoundItems="true">
                                <asp:ListItem Value="-1">--</asp:ListItem>

                         </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlTribunal" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [typpatri]"></asp:SqlDataSource>
                        </div>
     
      
   
           
    









    <div class="form-group">    
                    <asp:Label Text="المعرف الجبائي" ID="Label10" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txt1" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="المعرف الجبائي..." runat="server"  Visible="false"></asp:TextBox>
   </div> 
    <div class="form-group">    
                    <asp:Label Text="الصفة الإجتماعية" ID="Label11" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txt2" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="الصفة الإجتماعية..." runat="server" Visible="false"></asp:TextBox>
   </div> 
    <div class="form-group">    
                    <asp:Label Text="العنوان" ID="Label12" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txt3" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="العنوان..." runat="server" Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="البريد الإلكتروني" ID="Label13" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txt4" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="البريد الإلكتروني..." runat="server" Visible="false"></asp:TextBox>
   </div>
     <div class="form-group">    
                    <asp:Label Text="الهاتف" ID="Label14" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txt5" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="الهاتف..." runat="server" Visible="false"></asp:TextBox>
    </div>
    <div class="form-group">    
                    <asp:Label Text="عدد السّجل التجاري" ID="Label15" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txt6" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="عدد السّجل التجاري..." runat="server" Visible="false"></asp:TextBox>
   </div>
     <div class="form-group">    
          <asp:Label Text="تاريخ التسجيل" ID="Label17"  runat="server" Visible="false"></asp:Label>
           <div class="form-group">    
              <asp:TextBox ID="txtDatDos" format="dd/MM/yyyy" class="form-control form-control-user" aria-describedby="emailHelp"
                         placeholder="تاريخ التسجيل..." runat="server" Visible="false"></asp:TextBox>
              <ajaxToolkit:CalendarExtender ID="txtDatDos_CalendarExtender" runat="server" BehaviorID="txtDatDos_CalendarExtender" DefaultView="Days" PopupPosition="BottomLeft" TargetControlID="txtDatDos" />
           </div>
    </div>

    <div class="form-group">    
                    <asp:Label Text="مكان التسجيل" ID="Label16" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="txt8" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="مكان التسجيل..." runat="server" Visible="false"></asp:TextBox>
   </div>






    
    <br />
                   
               
   <div class="form-group">    
         <asp:Label  Text="إضافة وثيقة آلسجل الوطني للمؤسسات" ID="Label3" runat="server" Visible ="False"></asp:Label>
         <asp:FileUpload CssClass="form-control" ID="Fichier" runat="server" />
         <asp:TextBox ID="txtChemin" class="form-control form-control-user" runat="server" Visible ="false" ></asp:TextBox>
   </div>

    
<asp:GridView ID="grdDoc" class="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDoc" DataKeyNames="idPatri,CheminPV">
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



<asp:SqlDataSource ID="sqlDoc" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT IdPatri, [CheminPV] FROM [dtlPatriEnt] WHERE ([IdPatri] = ?) and cheminpv<>'' ">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtId" Name="Id" PropertyName="Text" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>


    














    <div class="form-group">    
                    <asp:Label Text="إسم الشركة" ID="Label9" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox2" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="إسم الشركة..." runat="server"  Visible="false"></asp:TextBox>
   </div> 
    <div class="form-group">    
                    <asp:Label Text="عدد الأسهم" ID="Label18" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox3" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="عدد الأسهم..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="قيمةالأسهم" ID="Label19" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox4" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="قيمةالأسهم..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="القيمة الجملية" ID="Label20" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox5" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="القيمة الجملية..." runat="server"  Visible="false"></asp:TextBox>
   </div>





    <div class="form-group">    
                    <asp:Label Text="العنوان" ID="Label21" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox6" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="العنوان..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="المساحة الجملية" ID="Label22" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox7" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="المساحة الجملية..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="المساحة المغروسة" ID="Label23" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox8" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="المساحة المغروسة..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="نوعية الغراسات" ID="Label24" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox9" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="نوعية الغراسات..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="الوضعية العقارية" ID="Label25" runat="server" Visible="false"></asp:Label>
                     
                   <asp:CheckBox Text="مسجلة" ID="cb1" runat="server" Visible="false" />
                  <asp:CheckBox Text="غير مسجلة " ID="cb2" runat="server" Visible="false" />

   </div>
    <div class="form-group">    
                    <asp:Label Text="عدد التسجيل" ID="Label26" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox10" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="عدد التسجيل..." runat="server"  Visible="false"></asp:TextBox>
   </div>









    <div class="form-group">    
                    <asp:Label Text="العنوان" ID="Label27" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox11" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="العنوان..." runat="server"  Visible="false"></asp:TextBox>
   </div>

    <div class="form-group">    
                    <asp:Label Text="المساحة" ID="Label28" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox12" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="المساحة..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="عدد الغرف" ID="Label29" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox13" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="عدد الغرف..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="الحالة العامة" ID="Label30" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox14" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="الحالة العامة..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="الحالة العامة" ID="Label31" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox15" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="الحالة العامة..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="الوضعية العقارية" ID="Label32" runat="server" Visible="false"></asp:Label>
                     
                   <asp:CheckBox Text="مسجلة" ID="cb3" runat="server" Visible="false" />
                  <asp:CheckBox Text="غير مسجلة " ID="cb4" runat="server" Visible="false" />

   </div>
    <div class="form-group">    
                    <asp:Label Text="عدد التسجيل" ID="Label33" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox16" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="عدد التسجيل..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="الوضعية الكرائية" ID="Label34" runat="server" Visible="false"></asp:Label>
                     
                   <asp:CheckBox Text="شاغرة" ID="cb5" runat="server" Visible="false" />
                  <asp:CheckBox Text="مشغولة" ID="cb6" runat="server" Visible="false" />

   </div>
     <div class="form-group">    
                    <asp:Label Text="آخر معين كراء" ID="Label37" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox18" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="آخر معين كراء..." runat="server"  Visible="false"></asp:TextBox>
   </div>
   
     <div class="form-group">
                         <asp:Label Text="إسم المتسوغ" ID="Label35" runat="server" Visible="false"></asp:Label>
                            <asp:DropDownList Visible="false" ID="dp" class="form-control dropdown-toggle" type="button" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nom" DataValueField="Id" AutoPostBack="True" AppendDataBoundItems="true">
                                <asp:ListItem Value="-1">--</asp:ListItem>

                         </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT [Nom], [Id] FROM [dtlParLoc] WHERE ([NumDos] = ?)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="NumDos" SessionField="NumDos" Type="Int32" />
                                </SelectParameters>
                         </asp:SqlDataSource>
                        </div>
                    
     <div class="form-group">    
                    <asp:Label Text="نوعية الإستغلال" ID="Label36" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox17" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="نوعية الإستغلال..." runat="server"  Visible="false"></asp:TextBox>
   </div>

     <div class="form-group">    
         <asp:Label  Text="نسخة من عقد الكراء" ID="Label38" runat="server" Visible ="False"></asp:Label>
         <asp:FileUpload CssClass="form-control" Visible="false" ID="FileUpload2" runat="server" />
         <asp:TextBox ID="TextBox19" Visible="False" runat="server" Width="227px"></asp:TextBox>
     </div>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT [IdPatri], [CheminPV] FROM [dtlPatriEnt] WHERE WHERE ([IdPatri] = ?) and cheminpv<>'' ">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtId" Name="Id" PropertyName="Text" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>












     <div class="form-group">    
                    <asp:Label Text="العنوان " ID="Label39" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox20" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="العنوان ..." runat="server"  Visible="false"></asp:TextBox>
     </div>
    <div class="form-group">    
                    <asp:Label Text="الوضعية العقارية" ID="Label40" runat="server" Visible="false"></asp:Label>
                     
                   <asp:CheckBox Text="مسجلة" ID="cb7" runat="server" Visible="false" />
                  <asp:CheckBox Text="غير مسجلة " ID="cb8" runat="server" Visible="false" />
   </div>
     <div class="form-group">    
                    <asp:Label Text="عدد التسجيل" ID="Label41" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox21" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="عدد التسجيل..." runat="server"  Visible="false"></asp:TextBox>
   </div>
     <div class="form-group">    
                    <asp:Label Text="الوضعية الكرائية" ID="Label44" runat="server" Visible="false"></asp:Label>
                     
                   <asp:CheckBox Text="شاغرة" ID="cb9" runat="server" Visible="false" />
                  <asp:CheckBox Text="مشغولة" ID="cb10" runat="server" Visible="false" />

   </div>
<div class="form-group">    
                    <asp:Label Text="نوعية الإستغلال" ID="Label42" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox22" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="نوعية الإستغلال..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="عدد الطوابق" ID="Label45" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox23" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="عدد الطوابق..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">
                         <asp:Label Text="قائمة الشقق" ID="Label43" runat="server" Visible="false"></asp:Label>
                            
                        </div>



    <div class="form-group">    
                    <asp:Label Text="شقة عدد" ID="Label46" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox24" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="شقة عدد..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="الطابق" ID="Label47" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox25" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="الطابق..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="نوعية الإستغلال" ID="Label48" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox26" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="نوعية الإستغلال..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="الوضعية الكرائية" ID="Label49" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox27" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="الوضعية الكرائية..." runat="server"  Visible="false"></asp:TextBox>
   </div>
     <div class="form-group">    
                    <asp:Label Text="إسم المتسوغ" ID="Label50" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox28" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="إسم المتسوغ..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    









     <div class="form-group">    
                    <asp:Label Text="العنوان" ID="Label51" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox29" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="العنوان..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="النشاط" ID="Label52" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox30" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="النشاط..." runat="server"  Visible="false"></asp:TextBox>
   </div>

    <div class="form-group">    
                    <asp:Label Text="الوضعية الكرائية" ID="Label53" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox31" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="الوضعية الكرائية..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="إسم المتسوغ" ID="Label54" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox32" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="إسم المتسوغ..." runat="server"  Visible="false"></asp:TextBox>
   </div>
    <div class="form-group">    
                    <asp:Label Text="القيمة الشهرية لمعين الكراء" ID="Label55" runat="server" Visible="false"></asp:Label>
                    <asp:TextBox ID="TextBox33" class="form-control form-control-user" aria-describedby="emailHelp"
                       placeholder="القيمة الشهرية لمعين الكراء..." runat="server"  Visible="false"></asp:TextBox>
   </div>





    <div class="form-group">    
                                  <asp:Label Text="الملاحظات" ID="Label2" runat="server" Visible="false"></asp:Label>
                                  <asp:TextBox ID="txtObs" class="form-control form-control-user" aria-describedby="emailHelp" Visible="false"
                                                                        placeholder="الملاحظات..." runat="server"></asp:TextBox>
                              
                             </div>   





    <div class="text-right">
        <asp:LinkButton ID="btnSave" Text="تثبيت" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
        <asp:LinkButton ID="btnUndo" Text="رجوع" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" runat="server" ></asp:LinkButton>
         </div>
       
    
         

    
</asp:Content>
