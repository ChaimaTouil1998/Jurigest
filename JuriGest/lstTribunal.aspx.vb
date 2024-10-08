Imports System.Data.Odbc
Public Class lstTribunal
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then lblNom.Text = Session.Item("Nom")

        End If
    End Sub

    Private Sub grdListe_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdListe.RowCommand
        If (e.CommandName = "SuppLg") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim Nb As Integer = 0
            Dim k As Integer = 0
            k = grdListe.DataKeys(index).Value.ToString
            Dim connectionstring As String = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = " select * from dossier where tribunal = " & k
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionstring)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            Connexion.Open()
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext
            Dim Lire As IDataReader = commande.ExecuteReader
            While Lire.Read
                If Lire("numdos") IsNot System.DBNull.Value Then
                    Nb = Nb + 1
                End If
            End While
            Lire.Dispose()
            If Nb > 0 Then
                Connexion.Close()
                Exit Sub
            End If
            commandtext = "Delete from tribunal  where code = " & k
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext
            commande.ExecuteNonQuery()

            Connexion.Close()
            grdListe.DataBind()
            '*************************

        End If
        If (e.CommandName = "OpenLg") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim k As Integer
            k = 0
            k = CInt(grdListe.DataKeys(index).Value.ToString)
            Dim connectionstring As String = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "select * from tribunal where code = " & k
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionstring)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            Dim Lire As IDataReader = commande.ExecuteReader
            While Lire.Read
                txtCode1.Text = Lire("Code")
                If Lire("Libelle") IsNot System.DBNull.Value Then txtLibelle1.Text = Lire("Libelle")

            End While
            Connexion.Close()
            Panel1.Visible = True
            '*************************

        End If
    End Sub

    Private Sub btnSaveModif_Click(sender As Object, e As EventArgs) Handles btnSaveModif.Click
        Dim connectionstring As String = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "update tribunal set libelle = N'" & Replace(txtLibelle1.Text, "'", "''") & "' where code =" & txtCode1.Text
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionstring)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        commande.ExecuteNonQuery()

        Connexion.Close()
        Panel1.Visible = False
        grdListe.DataBind()
    End Sub

    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Panel1.Visible = False
        txtCode1.Text = ""
        txtLibelle1.Text = ""
    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim connectionstring As String = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "insert into tribunal (libelle) values (N'" & Replace(txtLibelle.Text, "'", "''") & "')"
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionstring)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        commande.ExecuteNonQuery()
        Connexion.Close()
        grdListe.DataBind()
    End Sub
End Class