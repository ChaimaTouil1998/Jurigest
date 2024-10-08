Imports System.Data.Odbc
Public Class FichePartie
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
        commandtext = "Select * from dtlpartie where id = " & txtId.Text
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        lire = commande.ExecuteReader
        While lire.Read()
            If lire("Nom") IsNot System.DBNull.Value Then txtnom.Text = lire("Nom")
            dpSOurce.SelectedValue = lire("Type")
            If lire("Identifiant") IsNot System.DBNull.Value Then txtIdentifiant.Text = lire("Identifiant")
        End While

        lire.Dispose()
        If dpSOurce.SelectedValue = "0" Then
            commandtext = "Select * from dtlparste where numdos = " & txtCode.Text
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext

            lire = commande.ExecuteReader
            While lire.Read()
                If lire("rs") IsNot System.DBNull.Value Then txtRS.Text = lire("rs")
                If lire("adr") IsNot System.DBNull.Value Then txtAdr.Text = lire("adr")
                If lire("rne") IsNot System.DBNull.Value Then txtRNE.Text = lire("rne")
                If lire("email") IsNot System.DBNull.Value Then txtEmail.Text = lire("email")
                If lire("tel") IsNot System.DBNull.Value Then txtTel.Text = lire("tel")
                If lire("NomAgent") IsNot System.DBNull.Value Then TextBox1.Text = lire("NomAgent")


            End While

            lire.Dispose()
        End If
        If dpSOurce.SelectedValue = "1" Then
            commandtext = "Select * from dtlherite where numdos = " & txtCode.Text
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext

            lire = commande.ExecuteReader
            While lire.Read()
                If lire("Nom") IsNot System.DBNull.Value Then txtNom.Text = lire("Nom")
                If lire("Adresse") IsNot System.DBNull.Value Then TextBox3.Text = lire("Adresse")
                If lire("cin") IsNot System.DBNull.Value Then TextBox2.Text = lire("cin")
                If lire("email") IsNot System.DBNull.Value Then TextBox4.Text = lire("email")
                If lire("tel") IsNot System.DBNull.Value Then TextBox5.Text = lire("tel")



            End While

            lire.Dispose()
        End If
        If dpSOurce.SelectedValue = "2" Then
            commandtext = "Select * from dtlParLoc where numdos = " & txtCode.Text
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext

            lire = commande.ExecuteReader
            While lire.Read()
                If lire("Nom") IsNot System.DBNull.Value Then txtNom.Text = lire("Nom")
                If lire("Adresse") IsNot System.DBNull.Value Then TextBox3.Text = lire("Adresse")
                If lire("cin") IsNot System.DBNull.Value Then TextBox2.Text = lire("cin")
                If lire("email") IsNot System.DBNull.Value Then TextBox4.Text = lire("email")
                If lire("tel") IsNot System.DBNull.Value Then TextBox5.Text = lire("tel")



            End While

            lire.Dispose()
        End If
        Connexion.Close()

        '****************************
    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim Chemin As String = ""
        If Fichier.HasFile Then
            Chemin = Server.MapPath("~/Documents/")
            Fichier.SaveAs(Chemin & Fichier.FileName)
            Chemin = Fichier.FileName
            txtChemin.Text = Chemin
        End If
        If Trim(txtId.Text) = "" Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String

            commandtext = "insert into dtlpartie (NumDOs, Type, nom, identifiant,DateBo,CIN,Email,Tel,Adresse, cheminPV) 
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


        ' Insertion des données si la valeur =0
        If Trim(dpSOurce.SelectedValue) = 0 Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "insert into dtlParSte(NumDOs, RS, Adr, Mt, RNE, Email, Tel,NomAgent) values(" & txtCode.Text & "
                ,'" & Replace(txtRS.Text, "'", "''") & "'
                ,'" & Replace(txtAdr.Text, "'", "''") & "'
                ,'" & Replace(txtMt.Text, "'", "''") & "'
                ,'" & Replace(txtRNE.Text, "'", "''") & "'
                ,'" & Replace(txtEmail.Text, "'", "''") & "'
                ,'" & Replace(txtTel.Text, "'", "''") & "'
                ,'" & Replace(TextBox1.Text, "'", "''") & "'
                )"
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            'Response.Redirect("~\PartieDos.aspx")
        End If

        If Trim(dpSOurce.SelectedValue) = 1 Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "insert into dtlherite(NumDOs, nom,Adresse,Tel,Email,cin) values(" & txtCode.Text & "
                ,'" & Replace(txtNom.Text, "'", "''") & "'
                ,'" & Replace(TextBox3.Text, "'", "''") & "'
                ,'" & Replace(TextBox5.Text, "'", "''") & "'
                ,'" & Replace(TextBox4.Text, "'", "''") & "'
                ,'" & Replace(TextBox2.Text, "'", "''") & "'
                
                )"
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            'Response.Redirect("~\PartieDos.aspx")
        End If
        If Trim(dpSOurce.SelectedValue) = 2 Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "insert into dtlParLoc(NumDOs, nom,Adresse,Tel,Email,cin) values(" & txtCode.Text & "
                ,'" & Replace(txtNom.Text, "'", "''") & "'
                ,'" & Replace(TextBox3.Text, "'", "''") & "'
                ,'" & Replace(TextBox5.Text, "'", "''") & "'
                ,'" & Replace(TextBox4.Text, "'", "''") & "'
                ,'" & Replace(TextBox2.Text, "'", "''") & "'
                
                )"
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            'Response.Redirect("~\PartieDos.aspx")
        End If
        sqlDoc.DataBind()
        grdDoc.DataBind()
        Response.Redirect("~\PartieDos.aspx")
    End Sub



    Protected Sub grdDoc_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grdDoc.SelectedIndexChanged

    End Sub


    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\PartieDos.aspx")
    End Sub

    Protected Sub pSOurce_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpSOurce.SelectedIndexChanged
        If dpSOurce.SelectedItem.Value = 0 Then
            Label3.Visible = True
            txtRS.Visible = True

            Label9.Visible = True
            txtAdr.Visible = True

            Label10.Visible = True
            txtMt.Visible = True

            Label11.Visible = True
            txtRNE.Visible = True

            Label12.Visible = True
            txtEmail.Visible = True

            Label13.Visible = True
            txtTel.Visible = True

            Label14.Visible = True
            txtChemin.Visible = True

            Label15.Visible = True
            TextBox1.Visible = True

            Label16.Visible = False
            TextBox2.Visible = False

            Label17.Visible = False
            TextBox3.Visible = False

            Label18.Visible = False
            TextBox4.Visible = False

            Label19.Visible = False
            TextBox5.Visible = False

            Label8.Visible = False
            txtNom.Visible = False
        Else
            Label3.Visible = False
            txtRS.Visible = False


            Label9.Visible = False
            txtAdr.Visible = False

            Label10.Visible = False
            txtMt.Visible = False

            Label11.Visible = False
            txtRNE.Visible = False

            Label12.Visible = False
            txtEmail.Visible = False

            Label13.Visible = False
            txtTel.Visible = False

            Label8.Visible = True
            txtNom.Visible = True


            Label15.Visible = False
            TextBox1.Visible = False


            Label16.Visible = True
            TextBox2.Visible = True

            Label17.Visible = True
            TextBox3.Visible = True

            Label18.Visible = True
            TextBox4.Visible = True
            Label13.Visible = False

            txtTel.Visible = False
            Label19.Visible = True
            TextBox5.Visible = True
        End If




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
            If dpSOurce.SelectedItem.Value = 0 Then


                Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
                Dim commandtext As String
                commandtext = "update dtlParSte set CheminPv = '' where numdos = " & txtCode.Text
                Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
                Dim commande As OdbcCommand = Connexion.CreateCommand
                commande.CommandText = commandtext
                Connexion.Open()
                commande.ExecuteNonQuery()
                Connexion.Close()
                grdDoc.DataBind()

            End If
            If dpSOurce.SelectedItem.Value = 1 Then


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
            If dpSOurce.SelectedItem.Value = 2 Then
                Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
                Dim commandtext As String
                commandtext = "update dtlParLoc set CheminPv = '' where numdos = " & txtCode.Text
                Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
                Dim commande As OdbcCommand = Connexion.CreateCommand
                commande.CommandText = commandtext
                Connexion.Open()
                commande.ExecuteNonQuery()
                Connexion.Close()
                grdDoc.DataBind()

            End If
        End If
    End Sub


End Class