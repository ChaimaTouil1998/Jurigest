Imports System.Data.Odbc

Public Class Depense
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
        If Trim(txtId.Text) = "" Then Exit Sub
        commandtext = "Select * from Depense where id = " & txtId.Text
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        lire = commande.ExecuteReader
        While lire.Read()


            If lire("Identifiant") IsNot System.DBNull.Value Then txtIdentifiant.Text = lire("Identifiant")
        End While
        '****************************
    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        If Trim(txtId.Text) = "" Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String

            commandtext = "insert into depense (NumDOs, NumOrdre, DatDep,MtDep,Nature, Fournisseur, Facture) 
            values( " & txtCode.Text & ",
            " & dpSOurce.SelectedValue & ",
            N'" & Replace(txtNom.Text, "'", "''") & "',
            N'" & Replace(txtIdentifiant.Text, "'", "''") & "',
            '" & Replace(txtDatDos.Text, "'", "''") & "',
            '" & Replace(TextBox2.Text, "'", "''") & "',
            '" & Replace(TextBox3.Text, "'", "''") & "',
            '" & Replace(TextBox4.Text, "'", "''") & "',
            '" & Replace(TextBox5.Text, "'", "''") & "', 
            N'" & Replace(Chemin, "'", "''") & "')"


            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()

        Else
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update dtlpartie set CheminPV = '" & Replace(txtChemin.Text, "'", "''") & "', nom = N'" & Replace(txtNom.Text, "'", "''") & "', Identifiant = N'" & Replace(txtIdentifiant.Text, "'", "''") & "', type = " & dpSOurce.SelectedValue & " Where id = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            Response.Redirect("~\PartieDos.aspx")
        End If



        Response.Redirect("~\PartieDos.aspx")
    End Sub

End Class