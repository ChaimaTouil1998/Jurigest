Imports System.Data.Odbc
Public Class FicheDossier
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then lblNom.Text = Session.Item("Nom")
            txtCode.Text = Request.QueryString("NumDos")

            alimenter
        End If

    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
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
    Public Sub Alimenter()
        Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "Select * from dossier where numdos = " & txtCode.Text
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        Dim nb As Integer = 0
        Dim lire As IDataReader = commande.ExecuteReader
        While lire.Read()
            If lire("Libelle") IsNot System.DBNull.Value Then txtLibelle.Text = lire("Libelle")
            txtDatBO.Text = lire("DatBO")
            txtNumBO.Text = lire("NumBO")
            If lire("Juge") IsNot System.DBNull.Value Then txtJuge.Text = lire("Juge")
            dpSOurce.SelectedValue = lire("Source")
            txtLibelle.Text = lire("Libelle")

        End While

        lire.Dispose()
        Connexion.Close()
        '****************************
        Session.Item("NumDos") = txtCode.Text
    End Sub
End Class