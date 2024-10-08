Imports System.Data.Odbc
Public Class PubliDos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then lblNom.Text = Session.Item("Nom")
            If Session.Item("NumDos") IsNot System.DBNull.Value Then
                txtCode.Text = Session.Item("NumDos")
                Alimenter()
            End If
        End If

    End Sub
    Public Sub Alimenter()
        Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "Select * from dossier where numdos = " & txtCode.Text
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        Dim lire As IDataReader = commande.ExecuteReader
        While lire.Read()
            If lire("Libelle") IsNot System.DBNull.Value Then txtLibelle.Text = lire("Libelle")
            txtDatBO.Text = lire("DatBO")
            txtNumBO.Text = lire("NumBO")
        End While

        lire.Dispose()
        Connexion.Close()
        '****************************
    End Sub

    Private Sub grdDoc_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdDoc.RowCommand
        If (e.CommandName = "OpenLg") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim k As Integer
            k = grdDoc.DataKeys(index).Value.ToString
            Response.Redirect("~\FichePubli.aspx?Id=" & k)
        End If

    End Sub

    Private Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        Response.Redirect("~\FichePubli.aspx")
    End Sub
End Class