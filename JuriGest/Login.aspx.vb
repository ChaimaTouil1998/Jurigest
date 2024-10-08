Imports System.Data.Odbc
Public Class Login
    Inherits System.Web.UI.Page
    Public Const cle As Integer = 1234
    Public Function Crypter(passe As String) As String
        Dim str As String
        str = ""
        For i = Len(passe) To 1 Step -1
            str = str & Hex(Asc(Mid(passe, i, 1)) + Int((cle / 40)))
        Next i
        Crypter = str
    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnOK_Click(sender As Object, e As EventArgs) Handles btnOK.Click

        Session.Item("Nom") = ""


        'Vérification des paramètres de connexion
        Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "Select * from gest where login = '" & txtLogin.Text.ToString & "'"
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        Dim nb As Integer = 0
        Dim lire As IDataReader = commande.ExecuteReader
        While lire.Read()
            nb = nb + 1
            Session.Item("Nom") = lire("Nom") & " " & lire("Prenom")

            If Trim(txtPass.Text) <> Trim(lire("Pass")) And Trim(Crypter(txtPass.Text)) <> Trim(lire("Pass")) Then
                Connexion.Close()
                Exit Sub
            End If

        End While
        If nb = 0 Then
            Exit Sub
        End If
        lire.Dispose()
        '****************************
        'Sauvegarder le nom d'utilisateur
        Session.Item("LogUser") = txtLogin.Text.ToString

        Connexion.Close()
        Response.Redirect("~/Accueil.aspx")
    End Sub
End Class