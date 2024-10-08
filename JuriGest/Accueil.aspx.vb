Imports System.Data.Odbc
Public Class Accueil
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then lblNom.Text = Session.Item("Nom")
        End If
    End Sub

    Private Sub grdListe_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdListe.RowCommand
        If (e.CommandName = "OpenLg") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim k As Integer
            k = 0
            k = CInt(grdListe.DataKeys(index).Value.ToString)
            Response.Redirect("~\FicheDossier.aspx?NumDos=" & k)
            '*************************

        End If
    End Sub

    Protected Sub grdListe_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grdListe.SelectedIndexChanged

    End Sub
End Class