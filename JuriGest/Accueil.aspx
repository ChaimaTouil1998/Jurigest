<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Vide.Master" CodeBehind="Accueil.aspx.vb" Inherits="JuriGest.Accueil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblNom" runat="server" Text="Nom et Prénom"></asp:Label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="d-sm-flex align-items-center justify-content-between mb-4 text-right">
                        <h1 class="h3 mb-0 text-gray-800">قائمة الملفات</h1>
                    </div>
       <asp:GridView ID="grdListe" runat="server" class="table table-bordered text-right" AutoGenerateColumns="False" DataSourceID="sqlLIste" DataKeyNames="NumDos">
            <Columns>
                <asp:BoundField DataField="NumDos" HeaderText="عدد" SortExpression="NumDos" />
                <asp:BoundField DataField="DatDos" HeaderText="تاريخ الإنشاء" SortExpression="DatDos" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Numero" HeaderText="ملف عدد" SortExpression="Numero" />
                <asp:BoundField DataField="Tribunal" HeaderText="المحكمة" SortExpression="Tribunal" />
                <asp:BoundField DataField="NumBO" HeaderText="عدد التضمين" SortExpression="NumBO" />
                <asp:BoundField DataField="DatBO" HeaderText="تاريخ التضمين" SortExpression="DatBO" />
                <asp:BoundField DataField="LibDos" HeaderText="تعريف الملف" SortExpression="LibDos" />
                <asp:BoundField DataField="Juge" HeaderText="القاضي المراقب" SortExpression="Juge" />
            
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

       <asp:SqlDataSource ID="sqlLIste" runat="server" ConnectionString="<%$ ConnectionStrings:JuriConnectionString %>" ProviderName="<%$ ConnectionStrings:JuriConnectionString.ProviderName %>" SelectCommand="SELECT [NumDos], [DatDos], [Numero], Tribunal.libelle as Tribunal, [NumBO], [DatBO], dossier.[Libelle] as LibDos, [Juge] FROM [Dossier], tribunal where dossier.tribunal = tribunal.code order by datdos desc"></asp:SqlDataSource>

</asp:Content>
