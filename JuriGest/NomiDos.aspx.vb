Imports System.Data.Odbc
Public Class NomiDos
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
        Dim nb As Integer = 0
        Dim lire As IDataReader = commande.ExecuteReader
        While lire.Read()
            If lire("Libelle") IsNot System.DBNull.Value Then txtLibelle.Text = lire("Libelle")
            txtDatBO.Text = lire("DatBO")
            txtNumBO.Text = lire("NumBO")
            If lire("Juge") IsNot System.DBNull.Value Then txtJuge.Text = lire("Juge")
        End While

        lire.Dispose()
        Connexion.Close()
        '****************************
    End Sub

    Protected Sub dpSOurce_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpSOurce.SelectedIndexChanged
        If CInt(dpSOurce.SelectedValue) = 1 Then
            Label3.Visible = True
            txtAncienExp.Visible = True
        Else
            Label3.Visible = False
            txtAncienExp.Visible = False
        End If
    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        Dim Chemin As String = ""

        If Fichier.HasFile = False Then
            Exit Sub
        End If
        If Fichier.HasFile Then
            Chemin = Server.MapPath("~/Documents/")
            Fichier.SaveAs(Chemin & Fichier.FileName)
            Chemin = Fichier.FileName
            txtChemin.Text = Chemin
        End If
        Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "update dossier set cheminPV = '" & Replace(txtChemin.Text, "'", "''") & "', source = " & dpSOurce.SelectedValue & ", juge = N'" & Replace(txtJuge.Text, "'", "''") & "', ANcienExp = N'" & Replace(txtAncienExp.Text, "'", "''") & "' where numdos = " & txtCode.Text
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        commande.ExecuteNonQuery()
        Connexion.Close()
        sqlDoc.DataBind()
        grdDoc.DataBind()
    End Sub

    Protected Sub grdDoc_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grdDoc.SelectedIndexChanged

    End Sub

    Private Sub grdDoc_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdDoc.RowCommand
        If (e.CommandName = "OpenLg") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            ' Dim k As String
            'k = ""
            'k = grdListe.DataKeys(index).Value.ToString

            Response.Redirect(Trim("~/Documents/" & grdDoc.DataKeys(index).Values("CheminPV").ToString))

        End If
        If (e.CommandName = "SuppLg") Then

            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update dossier set cheminPv = '' where numdos = " & txtCode.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            grdDoc.DataBind()

        End If
    End Sub
End Class