Imports System.Data.Odbc
Public Class FicheInfo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then lblNom.Text = Session.Item("Nom")
            If Session.Item("NumDos") IsNot System.DBNull.Value Then
                txtCode.Text = Session.Item("NumDos")
                txtId.Text = Request.QueryString("Id")
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
            txtDatBO.Text = lire("DatBO")
            txtNumBO.Text = lire("NumBO")
        End While
        lire.Dispose()
        Connexion.Close()
        If Trim(txtId.Text) = "" Then Exit Sub
        commandtext = "Select * from dtlInfo where id = " & txtId.Text
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        lire = commande.ExecuteReader
        While lire.Read()
            dpType.SelectedValue = lire("IdPartie")
            txtDate.Text = lire("Date")
            If lire("texte") IsNot System.DBNull.Value Then txtTexte.Text = lire("texte")
            dpType.SelectedValue = lire("IdPartie")
            If lire("huissier") IsNot System.DBNull.Value Then txtHuissier.Text = lire("huissier")

        End While

        lire.Dispose()
        Connexion.Close()

        '****************************
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
        If Trim(txtId.Text) = "" Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "insert into dtlinfo (NumDOs, idpartie, date, texte, chemin, huissier) values (" & txtCode.Text & "," & dpType.SelectedValue & ", cast('" & txtDate.Text & "' as datetime),  N'" & Replace(txtTexte.Text, "'", "''") & "', N'" & Replace(txtChemin.Text, "'", "''") & "', N'" & Replace(txtHuissier.Text, "'", "''") & "')"
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            sqlDoc.DataBind()
            grdDoc.DataBind()
            Response.Redirect("~\InfoDos.aspx")
        Else
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update dtlInfo set chemin = N'" & Replace(txtChemin.Text, "'", "''") & "', texte = '" & Replace(txtTexte.Text, "'", "''") & "', huissier = N'" & Replace(txtHuissier.Text, "'", "''") & "', idpartie = " & dpType.SelectedValue & "  Where id = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            sqlDoc.DataBind()
            grdDoc.DataBind()
            'Response.Redirect("~\PubliDos.aspx")
        End If

    End Sub

    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\InfoDos.aspx")
    End Sub

    Protected Sub grdDoc_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grdDoc.SelectedIndexChanged

    End Sub

    Private Sub grdDoc_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdDoc.RowCommand
        If (e.CommandName = "OpenLg") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            ' Dim k As String
            'k = ""
            'k = grdListe.DataKeys(index).Value.ToString

            Response.Redirect(Trim("~/Documents/" & grdDoc.DataKeys(index).Values("Chemin").ToString))

        End If
        If (e.CommandName = "SuppLg") Then

            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update dtlinfo set chemin = '' where id = " & txtId.Text
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