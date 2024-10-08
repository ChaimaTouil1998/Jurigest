Imports System.Data.Odbc

Public Class Repartition
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
        commandtext = "Select * from repartition where id = " & txtId.Text
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()

        lire = commande.ExecuteReader
        While lire.Read()
            If lire("part") IsNot System.DBNull.Value Then txtpart.Text = lire("part")


        End While

        lire.Dispose()
        Connexion.Close()

        lire.Dispose()
        Connexion.Close()

        '****************************
    End Sub

    Private Sub btnRetour_Click(sender As Object, e As EventArgs) Handles btnRetour.Click
        Response.Redirect("~\PatriDos.aspx")
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "Select Nom from dtlHerite where numdos = " & txtCode.Text
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        If Trim(txtId.Text) = "" Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "insert into repartition (numdos, herite, part) values (" & txtCode.Text & "," & DropDownList1.SelectedValue & "," & Replace(txtpart.Text, ",", ".") & ")"
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()

            Response.Redirect("~\Repartition.aspx")
        Else
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update repartition set  part = " & Replace(txtpart.Text, ",", ".") & ", herite = " & DropDownList1.SelectedValue & " Where id = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()

            Response.Redirect("~\Repartition.aspx")
        End If
    End Sub




    Private Sub grdDoc_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdDoc.RowCommand

        If (e.CommandName = "SuppLg") Then

            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update repartition set part =Null and herite =Null  where numdos = " & txtCode.Text
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