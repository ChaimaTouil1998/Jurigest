Imports System.Data.Odbc
Public Class FicheBanque
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
        commandtext = "Select * from dtlbanque where id = " & txtId.Text
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        lire = commande.ExecuteReader
        While lire.Read()
            dpType.SelectedValue = lire("banque")
            txtDate.Text = lire("Datcpte")
            If lire("compte") IsNot System.DBNull.Value Then txtCompte.Text = lire("compte")
            If lire("Agence") IsNot System.DBNull.Value Then txtAgence.Text = lire("agence")
            If lire("Adresse") IsNot System.DBNull.Value Then txtAdresse.Text = lire("adresse")

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
            commandtext = "insert into dtlbanque (numdos, banque, compte, datcpte, agence, adresse, SoldeActuel, DatePassation, Email, SoldePassation, CheminPV) values (
            " & txtCode.Text & ",
            " & dpType.SelectedValue & ", 
            N'" & Replace(txtCompte.Text, "'", "''") & "',
            cast('" & txtDate.Text & "' as datetime), 
            N'" & Replace(txtAgence.Text, "'", "''") & "', 
            N'" & Replace(txtAdresse.Text, "'", "''") & "',
            N'" & Replace(TextBox2.Text, "'", "''") & "',
            cast('" & TextBox4.Text & "' as datetime), 
            N'" & Replace(TextBox1.Text, "'", "''") & "',
            N'" & Replace(TextBox3.Text, "'", "''") & "',
            N'" & Replace(Chemin, "'", "''") & "'
            )"
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()

            Response.Redirect("~\BanqueDos.aspx")
        Else
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update dtlbanque set 
            adresse = N'" & Replace(txtAdresse.Text, "'", "''") & "',
            compte = '" & Replace(txtCompte.Text, "'", "''") & "', 
            agence = N'" & Replace(txtAgence.Text, "'", "''") & "', 
            banque = " & dpType.SelectedValue & ",
            SoldeActuel = N'" & Replace(TextBox2.Text, "'", "''") & "', 
            DatePassation = cast('" & TextBox4.Text & "' as datetime), 
            Email =  N'" & Replace(TextBox1.Text, "'", "''") & "',
            SoldePassation = N'" & Replace(TextBox3.Text, "'", "''") & "',
            CheminPV = N'" & Replace(txtChemin.Text, "'", "''") & "' 
            Where id = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()

            Response.Redirect("~\BanqueDos.aspx")
        End If

    End Sub

    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\BanqueDos.aspx")
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
            commandtext = "update dtlbanque set CheminPv = '' where numdos = " & txtCode.Text
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