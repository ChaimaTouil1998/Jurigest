Imports System.Data.Odbc
Public Class FicheOrdre
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
        commandtext = "Select * from dtlOrdre where id = " & txtId.Text
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        lire = commande.ExecuteReader
        While lire.Read()
            dpType.SelectedValue = lire("type")
            txtDate.Text = lire("Date")
            If lire("Objet") IsNot System.DBNull.Value Then txtObjet.Text = lire("objet")
            If lire("numordre") IsNot System.DBNull.Value Then txtNumOrdre.Text = lire("numordre")
            txtDate.Text = lire("Date")
            txtMt.Text = FormatNumber(lire("Mt"), 3, -1, 0, 0)


        End While

        lire.Dispose()
        Connexion.Close()

        '****************************
    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        If Trim(txtId.Text) = "" Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "insert into dtlordre (numdos, numordre, date, objet, mt, type) values(" & txtCode.Text & ", " & txtNumOrdre.Text & ", cast('" & txtDate.Text & "' as datetime), N'" & Replace(txtObjet.Text, "'", "''") & "', " & Replace(txtMt.Text, ",", ".") & ", " & dpType.SelectedValue & ")"
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()

            Response.Redirect("~\PubliDos.aspx")
        Else
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update dtlordre set objet = N'" & Replace(txtObjet.Text, "'", "''") & "', date = cast('" & txtDate.Text & "' as datetime), numordre = " & Replace(txtNumOrdre.Text, ",", ".") & ", type = " & dpType.SelectedValue & "  Where id = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()

            'Response.Redirect("~\PubliDos.aspx")
        End If

    End Sub

    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\OrdreDos.aspx")
    End Sub



End Class