Imports System.Data.Odbc
Public Class FicheHerite
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
        commandtext = "Select * from dtlHerite where id = " & txtId.Text
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        lire = commande.ExecuteReader
        While lire.Read()
            If lire("Nom") IsNot System.DBNull.Value Then txtNom.Text = lire("Nom")
            If lire("Identifiant") IsNot System.DBNull.Value Then txtIdentifiant.Text = lire("Identifiant")
            If lire("Adresse") IsNot System.DBNull.Value Then txtAdresse.Text = lire("Adresse")
            If lire("Tel") IsNot System.DBNull.Value Then txtTel.Text = lire("Tel")
            If lire("Email") IsNot System.DBNull.Value Then txtEmail.Text = lire("Email")
            If lire("CIN") IsNot System.DBNull.Value Then txtCIN.Text = lire("CIN")
            If lire("Nom2") IsNot System.DBNull.Value Then txtNom2.Text = lire("Nom2")

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
            commandtext = "insert into dtlHerite (NumDOs, nom, identifiant, Adresse, Tel, Email,CIN,Nom2, CheminPV) values(" & txtCode.Text & ", N'" & Replace(txtNom.Text, "'", "''") & "', N'" & Replace(txtIdentifiant.Text, "'", "''") & "', N'" & Replace(txtAdresse.Text, "'", "''") & "','" & Replace(txtTel.Text, "'", "''") & "','" & Replace(txtEmail.Text, "'", "''") & "','" & Replace(txtCIN.Text, "'", "''") & "','" & Replace(txtNom2.Text, "'", "''") & "',N'" & Replace(Chemin, "'", "''") & "')"
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            Response.Redirect("~\HeriteDos.aspx")
        Else
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update dtlherite set Tel = '" & Replace(txtTel.Text, "'", "''") & "', email = N'" & Replace(txtEmail.Text, "'", "''") & "', Adresse = N'" & Replace(txtAdresse.Text, "'", "''") & "', nom = N'" & Replace(txtNom.Text, "'", "''") & "', Identifiant = N'" & Replace(txtIdentifiant.Text, "'", "''") & "',CheminPV = N'" & Replace(txtChemin.Text, "'", "''") & "'  Where id = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            Response.Redirect("~\HeriteDos.aspx")
        End If
        sqlDoc.DataBind()
        grdDoc.DataBind()
    End Sub

    Protected Sub grdDoc_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grdDoc.SelectedIndexChanged

    End Sub


    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\HeriteDos.aspx")
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
            commandtext = "update dtlHerite set CheminPv = '' where numdos = " & txtCode.Text
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