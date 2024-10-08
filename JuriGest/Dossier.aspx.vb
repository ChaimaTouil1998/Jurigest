Imports System.Data.Odbc
Public Class Dossier
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then lblNom.Text = Session.Item("Nom")
        End If
    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Numeroter()
        Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "Insert into dossier (NumDOs, datdos, Tribunal, NumBO, DatBO, Libelle) values(" & txtCode.Text & ", cast('" & txtDatDos.Text & "' as datetime), " & dpTribunal.SelectedValue & ", '" & Replace(txtNumBO.Text, "'", "''") & "', cast('" & txtDatBO.Text & "' as datetime), N'" & Replace(txtLibelle.Text, "'", "''") & "')"
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        commande.ExecuteNonQuery()
        Connexion.Close()
        Session.Item("NumDos") = txtCode.Text
    End Sub
    Public Sub Numeroter()
        Dim Numero As Integer = 0
        Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "Select max(Numdos) as num from dossier"
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        Dim lire As IDataReader = commande.ExecuteReader
        While lire.Read()
            If lire("Num") IsNot System.DBNull.Value Then Numero = lire("Num")
        End While
        lire.Dispose()
        Connexion.Close()
        Numero = Numero + 1
        txtCode.Text = Numero
    End Sub
End Class