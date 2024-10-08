Imports System.Data.Odbc
Public Class FichePatrimoine
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then lblNom.Text = Session.Item("Nom")
            If Session.Item("NumDOs") IsNot System.DBNull.Value Then
                txtCode.Text = Session.Item("NumDOs")
                txtId.Text = Request.QueryString("Id")
                Alimenter()

            End If
        End If

    End Sub
    Public Sub Alimenter()
        Dim TypDos As Integer
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
        commandtext = "Select * from dtlPatrimoine where id = " & txtId.Text
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        lire = commande.ExecuteReader
        While lire.Read()
            dpType.SelectedValue = lire("Type")
            TypDos = lire("Type")
            If lire("Identifiant") IsNot System.DBNull.Value Then txtIdentifiant.Text = lire("Identifiant")
        End While

        lire.Dispose()


        If TypDos = 1 Then
            commandtext = "Select * from dtlPatriEnt where numdos = " & txtCode.Text
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext

            lire = commande.ExecuteReader

            While lire.Read()
                If lire("rs") IsNot System.DBNull.Value Then txt2.Text = lire("rs")
                If lire("mt") IsNot System.DBNull.Value Then txt1.Text = lire("mt")
                If lire("adr") IsNot System.DBNull.Value Then txt3.Text = lire("adr")
                If lire("email") IsNot System.DBNull.Value Then txt4.Text = lire("email")
                If lire("tel") IsNot System.DBNull.Value Then txt5.Text = lire("tel")
                If lire("code") IsNot System.DBNull.Value Then txt4.Text = lire("code")
                If lire("DateCode") IsNot System.DBNull.Value Then txtCode.Text = lire("DateCode")
                If lire("LieuCode") IsNot System.DBNull.Value Then txt4.Text = lire("lieuCode")

            End While
            lire.Dispose()
        End If


        If TypDos = 2 Then
            commandtext = "Select * from dtlPatriAct where numdos = " & txtCode.Text
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext

            lire = commande.ExecuteReader
            While lire.Read()
                If lire("NomSte") IsNot System.DBNull.Value Then TextBox2.Text = lire("NomSte")
                If lire("NbrAction") IsNot System.DBNull.Value Then TextBox3.Text = lire("NbrAction")
                If lire("ValeurAction") IsNot System.DBNull.Value Then TextBox4.Text = lire("ValeurAction")
                If lire("ValeurTotale") IsNot System.DBNull.Value Then TextBox5.Text = lire("ValeurTotale")
            End While
            lire.Dispose()
        End If

        If TypDos = 3 Then
            commandtext = "Select * from dtlPatriTer where numdos = " & txtCode.Text
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext

            lire = commande.ExecuteReader
            While lire.Read()
                If lire("Adr") IsNot System.DBNull.Value Then TextBox6.Text = lire("Adr")
                If lire("PeriTotale") IsNot System.DBNull.Value Then TextBox7.Text = lire("PeriTotale")
                If lire("PeriVerte") IsNot System.DBNull.Value Then TextBox8.Text = lire("PeriVerte")
                If lire("TypeVerte") IsNot System.DBNull.Value Then TextBox9.Text = lire("TypeVerte")
                If lire("Situation") IsNot System.DBNull.Value Then cb1.Text = lire("Situation")
                If lire("Situation") IsNot System.DBNull.Value Then cb2.Text = lire("Situation")
                If lire("NbrInscrit") IsNot System.DBNull.Value Then TextBox10.Text = lire("NbrInscrit")

            End While
            lire.Dispose()
        End If


        If TypDos = 4 Then
            commandtext = "Select * from dtlPatriApp where numdos = " & txtCode.Text
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext

            lire = commande.ExecuteReader
            While lire.Read()
                If lire("Adr") IsNot System.DBNull.Value Then TextBox11.Text = lire("Adr")
                If lire("Perimetre") IsNot System.DBNull.Value Then TextBox12.Text = lire("Perimetre")
                If lire("NbrChambre") IsNot System.DBNull.Value Then TextBox13.Text = lire("NbrChambre")
                If lire("CasGeneral") IsNot System.DBNull.Value Then TextBox14.Text = lire("CasGeneral")
                If lire("Situation") IsNot System.DBNull.Value Then cb3.Text = lire("Situation")
                If lire("Situation") IsNot System.DBNull.Value Then cb4.Text = lire("Situation")
                If lire("NbrInscrit") IsNot System.DBNull.Value Then TextBox16.Text = lire("NbrInscrit")
                If lire("SituationLoc") IsNot System.DBNull.Value Then cb5.Text = lire("SituationLoc")
                If lire("SituationLoc") IsNot System.DBNull.Value Then cb6.Text = lire("SituationLoc")
                If lire("Locataire") IsNot System.DBNull.Value Then dp.Text = lire("Locataire")
                If lire("DLoc") IsNot System.DBNull.Value Then TextBox18.Text = lire("DLoc")
                If lire("Type") IsNot System.DBNull.Value Then TextBox17.Text = lire("Type")
            End While
            lire.Dispose()
        End If

        If TypDos = 5 Then
            commandtext = "Select * from dtlPatriImm where NumDOs = " & txtCode.Text
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext

            lire = commande.ExecuteReader
            While lire.Read()
                If lire("Adr") IsNot System.DBNull.Value Then TextBox20.Text = lire("Adr")
                If lire("Situation") IsNot System.DBNull.Value Then cb7.Text = lire("Situation")
                If lire("Situation") IsNot System.DBNull.Value Then cb8.Text = lire("Situation")
                If lire("NumInscrit") IsNot System.DBNull.Value Then TextBox21.Text = lire("NumInscrit")
                If lire("Type") IsNot System.DBNull.Value Then TextBox22.Text = lire("Type")
                If lire("TypeLoc") IsNot System.DBNull.Value Then cb9.Text = lire("TypeLoc")
                If lire("TypeLoc") IsNot System.DBNull.Value Then cb10.Text = lire("TypeLoc")
                If lire("NbrEtage") IsNot System.DBNull.Value Then TextBox23.Text = lire("NbrEtage")

            End While
            lire.Dispose()
            commandtext = "Select * from ListeImm where NumDOs = " & txtCode.Text
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext

            lire = commande.ExecuteReader
            While lire.Read()
                If lire("NumApp") IsNot System.DBNull.Value Then TextBox24.Text = lire("NumApp")
                If lire("Etager") IsNot System.DBNull.Value Then TextBox25.Text = lire("Etager")
                If lire("Type") IsNot System.DBNull.Value Then TextBox26.Text = lire("Type")
                If lire("Situation") IsNot System.DBNull.Value Then TextBox27.Text = lire("Situation")
                If lire("NomLoc") IsNot System.DBNull.Value Then TextBox28.Text = lire("NomLoc")


            End While
            lire.Dispose()
        End If


        If TypDos = 6 Then
            commandtext = "Select * from dtlPatriLoc where NumDOs = " & txtCode.Text
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext

            lire = commande.ExecuteReader
            While lire.Read()
                If lire("Adr") IsNot System.DBNull.Value Then TextBox29.Text = lire("Adr")
                If lire("Act") IsNot System.DBNull.Value Then TextBox30.Text = lire("Act")
                If lire("Situation") IsNot System.DBNull.Value Then TextBox31.Text = lire("Situation")
                If lire("NomLoc") IsNot System.DBNull.Value Then TextBox32.Text = lire("NomLoc")
                If lire("SalaireLoc") IsNot System.DBNull.Value Then TextBox33.Text = lire("SalaireLoc")

            End While
            lire.Dispose()
            commandtext = "Select * from ListeImm where NumDOs = " & txtCode.Text
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext

            lire = commande.ExecuteReader
            While lire.Read()
                If lire("NumApp") IsNot System.DBNull.Value Then TextBox24.Text = lire("NumApp")
                If lire("Etager") IsNot System.DBNull.Value Then TextBox25.Text = lire("Etager")
                If lire("Type") IsNot System.DBNull.Value Then TextBox26.Text = lire("Type")
                If lire("Situation") IsNot System.DBNull.Value Then TextBox27.Text = lire("Situation")
                If lire("NomLoc") IsNot System.DBNull.Value Then TextBox28.Text = lire("NomLoc")


            End While
            lire.Dispose()
        End If
        Connexion.Close()
        If TypDos = 1 Then
            Label10.Visible = True
            txt1.Visible = True

            Label11.Visible = True
            txt2.Visible = True

            Label12.Visible = True
            txt3.Visible = True

            Label13.Visible = True
            txt4.Visible = True

            Label14.Visible = True
            txt5.Visible = True

            Label15.Visible = True
            txt6.Visible = True

            Label17.Visible = True
            txtDatDos.Visible = True

            Label16.Visible = True
            txt8.Visible = True

            Label3.Visible = True
            Fichier.Visible = True

        End If
        '****************************

        If TypDos = 2 Then
            Label9.Visible = True
            TextBox2.Visible = True

            Label18.Visible = True
            TextBox3.Visible = True

            Label19.Visible = True
            TextBox4.Visible = True

            Label20.Visible = True
            TextBox5.Visible = True



        End If
        '****************************

        If TypDos = 3 Then
            Label21.Visible = True
            TextBox6.Visible = True

            Label22.Visible = True
            TextBox7.Visible = True

            Label23.Visible = True
            TextBox8.Visible = True

            Label24.Visible = True
            TextBox9.Visible = True

            Label25.Visible = True
            cb1.Visible = True

            Label25.Visible = True
            cb2.Visible = True

            Label26.Visible = True
            TextBox10.Visible = True
        End If
        '****************************

        If TypDos = 4 Then
            Label27.Visible = True
            TextBox11.Visible = True

            Label28.Visible = True
            TextBox12.Visible = True

            Label29.Visible = True
            TextBox13.Visible = True


            Label30.Visible = True
            TextBox14.Visible = True

            Label32.Visible = True
            cb3.Visible = True

            Label32.Visible = True
            cb4.Visible = True

            Label33.Visible = True
            TextBox16.Visible = True

            Label34.Visible = True
            cb5.Visible = True

            Label34.Visible = True
            cb6.Visible = True

            Label35.Visible = True
            DP.Visible = True

            Label38.Visible = True
            FileUpload2.Visible = True

            Label36.Visible = True
            TextBox17.Visible = True
        End If
        '****************************
        If TypDos = 5 Then
            Label39.Visible = True
            TextBox20.Visible = True

            Label40.Visible = True
            cb7.Visible = True

            Label40.Visible = True
            cb8.Visible = True

            Label41.Visible = True
            TextBox21.Visible = True

            Label42.Visible = True
            TextBox22.Visible = True

            Label44.Visible = True
            cb9.Visible = True

            Label44.Visible = True
            cb10.Visible = True

            Label45.Visible = True
            TextBox23.Visible = True

            Label43.Visible = True

            Label46.Visible = True
            TextBox24.Visible = True

            Label47.Visible = True
            TextBox25.Visible = True

            Label48.Visible = True
            TextBox26.Visible = True

            Label49.Visible = True
            TextBox27.Visible = True

            Label50.Visible = True
            TextBox28.Visible = True
        End If
        If TypDos = 6 Then

            Label51.Visible = True
            TextBox29.Visible = True

            Label52.Visible = True
            TextBox30.Visible = True

            Label53.Visible = True
            TextBox31.Visible = True

            Label54.Visible = True
            TextBox32.Visible = True

            Label55.Visible = True
            TextBox33.Visible = True
        End If
    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        If Trim(txtId.Text) = "" Then
            Numeroter()
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "insert into dtlpatrimoine (id, NumDOs, nom, identifiant, type) values(" & txtId.Text & "," & txtCode.Text & ", N'" & Replace(txt1.Text, "'", "''") & "', N'" & Replace(txtIdentifiant.Text, "'", "''") & "', " & dpType.SelectedValue & ")"

            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            ' Response.Redirect("~\PatriDos.aspx")

        Else

            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String

            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commandtext = "update dtlpatrimoine set type = " & dpType.SelectedValue & ",  Identifiant = N'" & Replace(txtIdentifiant.Text, "'", "''") & "'  Where id = " & txtId.Text
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            ' Response.Redirect("~\PatriDos.aspx")
        End If

        ' Insertion des données si la valeur =1
        If Trim(dpType.SelectedValue) = "1" Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "delete from dtlpatrient where idpatri = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            commandtext = "insert into dtlPatriEnt(NumDOs, mt, rs, adr, email,tel, code, DateCode, LieuCode,CheminPV, idpatri) values(" & txtCode.Text & "
                ,'" & Replace(txt1.Text, "'", "''") & "'
                ,'" & Replace(txt2.Text, "'", "''") & "'
                ,'" & Replace(txt3.Text, "'", "''") & "'
                ,'" & Replace(txt4.Text, "'", "''") & "'
                ,'" & Replace(txt5.Text, "'", "''") & "'
                ,'" & Replace(txt6.Text, "'", "''") & "'
                ,'" & Replace(txtDatDos.Text, "'", "''") & "'
                ,'" & Replace(txt8.Text, "'", "''") & "'
                , N'" & Replace(txtChemin.Text, "'", "''") & "',
                
                " & txtId.Text & "
                )"
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext
            commande.ExecuteNonQuery()
            Connexion.Close()
            Response.Redirect("~\PatriDos.aspx")
        End If



        ' Insertion des données si la valeur =2
        If Trim(dpType.SelectedValue) = "2" Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "delete from dtlpatriact where idpatri = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            commandtext = "insert into dtlpatriact(NumDOs, NomSte, NbrAction, ValeurAction, ValeurTotale,idpatri) values(" & txtCode.Text & "
                ,'" & Replace(TextBox2.Text, "'", "''") & "'
                ,'" & Replace(TextBox3.Text, "'", "''") & "'
                ,'" & Replace(TextBox4.Text, "'", "''") & "'
                ,'" & Replace(TextBox5.Text, "'", "''") & "'
                ," & txtId.Text & "
                )"
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext
            commande.ExecuteNonQuery()
            Connexion.Close()
            Response.Redirect("~\PatriDos.aspx")
        End If


        ' Insertion des données si la valeur =3
        If Trim(dpType.SelectedValue) = "3" Then
            Dim VCB As Integer

            ' Code pour obtenir la valeur de la checkbox (1 pour cochée, 0 pour non cochée)
            If cb1.Checked Then
                VCB = 1
            Else
                VCB = 0
            End If

            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "delete from dtlpatriter where idpatri = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            commandtext = "insert into dtlpatriter(NumDOs, Adr, PeriTotale, PeriVerte, TypeVerte,Situation,NbrInscrit,idpatri) values(" & txtCode.Text & "
                ,'" & Replace(TextBox6.Text, "'", "''") & "'   
                ,'" & Replace(TextBox7.Text, "'", "''") & "'        
                ,'" & Replace(TextBox8.Text, "'", "''") & "'
                ,'" & Replace(TextBox9.Text, "'", "''") & "'
                , " & VCB & "
                ,'" & Replace(TextBox10.Text, "'", "''") & "'
                ," & txtId.Text & "
                )"
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext
            commande.ExecuteNonQuery()
            Connexion.Close()
            Response.Redirect("~\PatriDos.aspx")
        End If


        ' Insertion des données si la valeur =4
        If Trim(dpType.SelectedValue) = "4" Then
            Dim VCB As Integer

            ' Code pour obtenir la valeur de la checkbox (1 pour cochée, 0 pour non cochée)
            If cb3.Checked Then
                VCB = 1
            Else
                VCB = 0
            End If
            Dim VCB1 As Integer

            ' Code pour obtenir la valeur de la checkbox (1 pour cochée, 0 pour non cochée)
            If cb6.Checked Then
                VCB1 = 1
            Else
                VCB1 = 0
            End If
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "delete from dtlpatriapp where idpatri = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            commandtext = "insert into dtlpatriapp(NumDOs, Adr, Perimetre, NbrChambre, CasGeneral,Situation,NbrInscrit,SituationLoc, DLoc, Locataire, Type,idpatri) values(" & txtCode.Text & "
                ,'" & Replace(TextBox11.Text, "'", "''") & "'   
                ,'" & Replace(TextBox12.Text, "'", "''") & "'        
                ,'" & Replace(TextBox13.Text, "'", "''") & "'
                ,'" & Replace(TextBox14.Text, "'", "''") & "'
                , " & VCB & "
                , " & VCB1 & "
                ,'" & Replace(TextBox16.Text, "'", "''") & "'
                ,'" & Replace(TextBox18.Text, "'", "''") & "'
                ," & dp.SelectedValue & "
                ,'" & Replace(TextBox17.Text, "'", "''") & "'
                ," & txtId.Text & "
                )"
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext
            commande.ExecuteNonQuery()
            Connexion.Close()
            Response.Redirect("~\PatriDos.aspx")
        End If


        If Trim(dpType.SelectedValue) = "5" Then
            Dim VCB As Integer

            ' Code pour obtenir la valeur de la checkbox (1 pour cochée, 0 pour non cochée)
            If cb7.Checked Then
                VCB = 1
            Else
                VCB = 0
            End If
            Dim VCB1 As Integer

            ' Code pour obtenir la valeur de la checkbox (1 pour cochée, 0 pour non cochée)
            If cb10.Checked Then
                VCB1 = 1
            Else
                VCB1 = 0
            End If
            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "delete from dtlPatriImm where idpatri = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            commandtext = "delete from ListeImm where id = " & txtId.Text
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            commandtext = "insert into dtlPatriImm(NumDOs, Adr, Situation, NumInscrit, Type ,TypeLoc ,idpatri) values(" & txtCode.Text & "
                ,'" & Replace(TextBox20.Text, "'", "''") & "'   
                , " & VCB & "      
                ,'" & Replace(TextBox21.Text, "'", "''") & "'
                ,'" & Replace(TextBox22.Text, "'", "''") & "'
                , " & VCB1 & "
                ," & txtId.Text & "
                )"
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext
            commande.ExecuteNonQuery()
            Connexion.Close()
            commandtext = "insert into ListeImm(NumDOs, NumApp, Etager, Type, Situation ,NomLoc ,id) values(" & txtCode.Text & "
                ,'" & Replace(TextBox24.Text, "'", "''") & "'  
                ,'" & Replace(TextBox25.Text, "'", "''") & "'
                ,'" & Replace(TextBox26.Text, "'", "''") & "'
                ,'" & Replace(TextBox27.Text, "'", "''") & "'
                ,'" & Replace(TextBox28.Text, "'", "''") & "'
                ," & txtId.Text & "
                )"
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()

            commande.ExecuteNonQuery()
            Connexion.Close()
            Response.Redirect("~\PatriDos.aspx")
        End If




        If Trim(dpType.SelectedValue) = "6" Then


            Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "delete from dtlPatriLoc where idpatri = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            commandtext = "insert into dtlPatriLoc(NumDOs, Adr, Act, Situation, NomLoc ,SalaireLoc ,idpatri) values(" & txtCode.Text & "
                ,'" & Replace(TextBox29.Text, "'", "''") & "'     
                ,'" & Replace(TextBox30.Text, "'", "''") & "'
                ,'" & Replace(TextBox31.Text, "'", "''") & "'
                ,'" & Replace(TextBox32.Text, "'", "''") & "'
                ,'" & Replace(TextBox33.Text, "'", "''") & "'
                ," & txtId.Text & "
                )"
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext
            commande.ExecuteNonQuery()
            Connexion.Close()
            Response.Redirect("~\PatriDos.aspx")
        End If
        sqlDoc.DataBind()
        Response.Redirect("~\PatriDos.aspx")

    End Sub



    Protected Sub pSOurce_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpType.SelectedIndexChanged

        If dpType.SelectedValue = 1 Then
            Label10.Visible = True
            txt1.Visible = True

            Label11.Visible = True
            txt2.Visible = True

            Label12.Visible = True
            txt3.Visible = True

            Label13.Visible = True
            txt4.Visible = True

            Label14.Visible = True
            txt5.Visible = True

            Label15.Visible = True
            txt6.Visible = True

            Label17.Visible = True
            txtDatDos.Visible = True

            Label16.Visible = True
            txt8.Visible = True

            Label3.Visible = True
            Fichier.Visible = True


        Else
            Label10.Visible = False
            txt1.Visible = False

            Label11.Visible = False
            txt2.Visible = False

            Label12.Visible = False
            txt3.Visible = False

            Label13.Visible = False
            txt4.Visible = False

            Label14.Visible = False
            txt5.Visible = False

            Label15.Visible = False
            txt6.Visible = False

            Label17.Visible = False
            txtDatDos.Visible = False

            Label16.Visible = False
            txt8.Visible = False

            Label3.Visible = False
            Fichier.Visible = False


        End If
        If dpType.SelectedValue = 2 Then
            Label9.Visible = True
            TextBox2.Visible = True

            Label18.Visible = True
            TextBox3.Visible = True

            Label19.Visible = True
            TextBox4.Visible = True

            Label20.Visible = True
            TextBox5.Visible = True

        Else
            Label9.Visible = False
            TextBox2.Visible = False

            Label18.Visible = False
            TextBox3.Visible = False

            Label19.Visible = False
            TextBox4.Visible = False

            Label20.Visible = False
            TextBox5.Visible = False


        End If
        If dpType.SelectedValue = 3 Then
            Label21.Visible = True
            TextBox6.Visible = True

            Label22.Visible = True
            TextBox7.Visible = True

            Label23.Visible = True
            TextBox8.Visible = True

            Label24.Visible = True
            TextBox9.Visible = True

            Label25.Visible = True
            cb1.Visible = True
            cb2.Visible = True

            Label26.Visible = True
            TextBox10.Visible = True



        Else
            Label21.Visible = False
            TextBox6.Visible = False

            Label22.Visible = False
            TextBox7.Visible = False

            Label23.Visible = False
            TextBox8.Visible = False

            Label24.Visible = False
            TextBox9.Visible = False

            Label25.Visible = False
            cb1.Visible = False
            cb2.Visible = False

            Label26.Visible = False
            TextBox10.Visible = False
        End If
        If dpType.SelectedValue = 4 Then
            Label27.Visible = True
            TextBox11.Visible = True

            Label28.Visible = True
            TextBox12.Visible = True

            Label29.Visible = True
            TextBox13.Visible = True


            Label30.Visible = True
            TextBox14.Visible = True

            Label32.Visible = True
            cb3.Visible = True

            Label32.Visible = True
            cb4.Visible = True

            Label33.Visible = True
            TextBox16.Visible = True

            Label34.Visible = True
            cb5.Visible = True

            Label34.Visible = True
            cb6.Visible = True

            Label35.Visible = True
            DP.Visible = True

            Label38.Visible = True
            FileUpload2.Visible = True

            Label36.Visible = True
            TextBox17.Visible = True

        Else
            Label27.Visible = False
            TextBox11.Visible = False

            Label28.Visible = False
            TextBox12.Visible = False

            Label29.Visible = False
            TextBox13.Visible = False


            Label30.Visible = False
            TextBox14.Visible = False

            Label32.Visible = False
            cb3.Visible = False

            Label32.Visible = False
            cb4.Visible = False

            Label33.Visible = False
            TextBox16.Visible = False

            Label34.Visible = False
            cb5.Visible = False

            Label34.Visible = False
            cb6.Visible = False

            Label35.Visible = False
            DP.Visible = False

            Label38.Visible = False
            FileUpload2.Visible = False

            Label36.Visible = False
            TextBox17.Visible = False
        End If
        If dpType.SelectedValue = 5 Then
            Label39.Visible = True
            TextBox20.Visible = True

            Label40.Visible = True
            cb7.Visible = True

            Label40.Visible = True
            cb8.Visible = True

            Label41.Visible = True
            TextBox21.Visible = True

            Label42.Visible = True
            TextBox22.Visible = True

            Label44.Visible = True
            cb9.Visible = True

            Label44.Visible = True
            cb10.Visible = True

            Label45.Visible = True
            TextBox23.Visible = True

            Label43.Visible = True

            Label46.Visible = True
            TextBox24.Visible = True

            Label47.Visible = True
            TextBox25.Visible = True

            Label48.Visible = True
            TextBox26.Visible = True

            Label49.Visible = True
            TextBox27.Visible = True

            Label50.Visible = True
            TextBox28.Visible = True
        Else
            Label39.Visible = False
            TextBox20.Visible = False

            Label40.Visible = False
            cb7.Visible = False

            Label40.Visible = False
            cb8.Visible = False

            Label41.Visible = False
            TextBox21.Visible = False

            Label42.Visible = False
            TextBox22.Visible = False

            Label44.Visible = False
            cb9.Visible = False

            Label44.Visible = False
            cb10.Visible = False

            Label45.Visible = False
            TextBox23.Visible = False

            Label43.Visible = False

            Label46.Visible = False
            TextBox24.Visible = False

            Label47.Visible = False
            TextBox25.Visible = False

            Label48.Visible = False
            TextBox26.Visible = False

            Label49.Visible = False
            TextBox27.Visible = False

            Label50.Visible = False
            TextBox28.Visible = False

            Label46.Visible = False
            TextBox24.Visible = False

            Label47.Visible = False
            TextBox25.Visible = False

            Label48.Visible = False
            TextBox26.Visible = False

            Label49.Visible = False
            TextBox27.Visible = False


        End If
        If dpType.SelectedValue = 6 Then
            Label51.Visible = True
            TextBox29.Visible = True

            Label52.Visible = True
            TextBox30.Visible = True

            Label53.Visible = True
            TextBox31.Visible = True

            Label54.Visible = True
            TextBox32.Visible = True

            Label55.Visible = True
            TextBox33.Visible = True
        Else
            Label51.Visible = False
            TextBox29.Visible = False

            Label52.Visible = False
            TextBox30.Visible = False

            Label53.Visible = False
            TextBox31.Visible = False

            Label54.Visible = False
            TextBox32.Visible = False

            Label55.Visible = False
            TextBox33.Visible = False
        End If


    End Sub

    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\PatriDos.aspx")
    End Sub
    Public Sub Numeroter()
        Dim Num As Integer = 0
        Dim connectionString = ConfigurationManager.ConnectionStrings("JuriConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "select max(id) as Num from dtlpatrimoine"
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        Dim lire As IDataReader = commande.ExecuteReader
        While lire.Read
            If lire("Num") IsNot System.DBNull.Value Then Num = lire("Num")
        End While
        Connexion.Close()
        Num = Num + 1
        txtId.Text = Num
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
            commandtext = "update dtlPatriEnt set CheminPv = '' where numdos = " & txtCode.Text
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