Public Class Landing_Page
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If (Session.Count = 0) Then
                Response.Redirect("Login.aspx")
            End If
        Catch ex As Exception
            Response.Redirect("Login.aspx")
        End Try
    End Sub

    Protected Sub btnCreateAccount_Click(sender As Object, e As EventArgs) Handles btnCreateAccount.Click
        Response.Redirect("CreateAccount.aspx")
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Response.Redirect("Search.aspx")
    End Sub

    Protected Sub btnUpdateInv_Click(sender As Object, e As EventArgs) Handles btnUpdateInv.Click

        Response.Redirect("UpdateInventory.aspx")

    End Sub
End Class