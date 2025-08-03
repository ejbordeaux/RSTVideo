Imports System.Data.SqlClient
Imports System.Data
Public Class Search
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

    Protected Sub btnTotal_Click(sender As Object, e As EventArgs) Handles btnTotal.Click
        Dim taxconn As SqlConnection = New SqlConnection("Data Source=FLAREOUS\SQLEXPRESS;Initial Catalog=MOVIES;Integrated Security=True")
        taxconn.Open()
        Dim taxcmd As SqlCommand = New SqlCommand("Select [Tax_Amount] FROM Taxes", taxconn)
        Dim dr As SqlDataReader = taxcmd.ExecuteReader
        While dr.Read
            Dim tax As String = dr.Item("Tax_Amount")
            txtTax.Text = FormatCurrency(tax)
        End While
        Dim sum As Decimal = 0
        Dim i As Integer = 0
        txtMovies.Text = ""
        txtTax.Text = ""
        For i = 0 To clMovies.Items.Count - 1 Step 1
            If clMovies.Items(i).Selected Then
                sum += clMovies.Items(i).Value
            End If
        Next
        For i = 0 To clMovies.Items.Count - 1 Step 1
            If clMovies.Items(i).Selected Then
                txtMovies.Text &= (clMovies.Items(i)).ToString
            End If
        Next
        txtTotal.Text = FormatCurrency(txtTax.Text + txtTotal.Text)
    End Sub

    Protected Sub btnFind_Click(sender As Object, e As EventArgs) Handles btnFind.Click

        Dim conn As SqlConnection = New SqlConnection("Data Source=FLAREOUS\SQLEXPRESS;Initial Catalog=MOVIES;Integrated Security=True")
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand("SELECT [Movie_Name], $ , [Movie_Price] FROM Movies WHERE Genre_ID = '" & ddlgenre.SelectedValue & "' AND Release_ID = '" & rblRelease.SelectedValue & "')", conn)

        conn.Close()
    End Sub
End Class