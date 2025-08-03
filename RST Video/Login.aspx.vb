Imports System.Data.SqlClient
Imports System.Data
Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim chaAccount As Char() = txtUsername.Text.ToCharArray()
        Dim atSign As Integer = 0
        Dim atCount As Integer = 0
        Dim dot As Integer = 0
        Dim dt As DataTable = New DataTable()

        For i As Integer = 0 To chaAccount.Length - 1 Step 1
            If (chaAccount(i) = "@") Then
                atSign = i
                atCount += 1
                For j As Integer = atSign + 1 To chaAccount.Length - 1 Step 1

                    If (chaAccount(j) = ".") Then
                        dot = j
                        j = chaAccount.Length
                    End If
                Next

            End If
        Next

        If (atCount = 1) Then
            If (dot - atSign >= 2 And chaAccount(chaAccount.Length - 1) <> "." And chaAccount(0) <> ".") Then
                If txtUsername.Text.Contains(".com") Or txtUsername.Text.Contains(".edu") Or txtUsername.Text.Contains(".net") Then
                    lblError.Text = "Welcome aboard!"
                    lblError.ForeColor = System.Drawing.Color.White

                    Dim conn As SqlConnection = New SqlConnection("Data Source=FLAREOUS\SQLEXPRESS;Initial Catalog=MOVIES;Integrated Security=True")
                    conn.Open()
                    Dim cmd As SqlCommand = New SqlCommand("SELECT * FROM Accounts WHERE email = @email AND password = @password")
                    cmd.Parameters.AddWithValue("@email", txtUsername.Text)
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text)

                    cmd.Connection = conn

                    Dim dr As SqlDataReader = cmd.ExecuteReader()

                    If dr.Read Then
                        Session("Accounttype") = ("Account_Type").ToString()
                        Session("userID") = ("email").ToString()
                        Response.Redirect("LandingPage.aspx")
                    Else
                        lblError.Text = "Not a valid login"
                    End If
                    conn.Close()
                Else lblError.Text = "This is not from an allowed email address"
                End If
            Else
                lblError.Text = "Please recheck your email address for accuracy"
                lblError.ForeColor = System.Drawing.Color.Black
            End If
        Else
            lblError.Text = "Do you have only one @ in the address?"
        End If
    End Sub
End Class