Imports System.Data.SqlClient
Imports System.Data
Public Class CreateAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnCreate_Click(sender As Object, e As EventArgs) Handles btnCreate.Click
        Dim chaAccount As Char() = txtEmail.Text.ToCharArray()
        Dim atSign As Integer = 0
        Dim atCount As Integer = 0
        Dim dot As Integer = 0

        If txtEmail.Text.Length = 0 Or txtFirst.Text.Length = 0 Or txtLast.Text.Length = 0 Or txtPassCheck.Text.Length = 0 Or txtPassword.Text.Length = 0 Then
            lblError.Text = "Please fill out all fields to create an account!"
        Else
            If txtPassword.Text = txtPassCheck.Text Then
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
                    If txtEmail.Text.Contains(".com") Or txtEmail.Text.Contains(".edu") Or txtEmail.Text.Contains(".net") Then
                        If (dot - atSign >= 2 And chaAccount(chaAccount.Length - 1) <> "." And chaAccount(0) <> ".") Then
                            Dim conn As SqlConnection = New SqlConnection("Data Source=FLAREOUS\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True")
                            conn.Open()
                            Dim cmd As SqlCommand = New SqlCommand("INSERT INTO Accounts([F_Name],[L_Name],[email],[Password],[Account_Type]) values (@firstname, @lastname, @email, @password, @type)", conn)
                            cmd.Parameters.AddWithValue("@firstname", txtFirst.Text)
                            cmd.Parameters.AddWithValue("@lastname", txtLast.Text)
                            cmd.Parameters.AddWithValue("@email", txtEmail.Text)
                            cmd.Parameters.AddWithValue("@password", txtEmail.Text)
                            cmd.Parameters.AddWithValue("@type", ddlActtype.SelectedValue)

                            cmd.ExecuteNonQuery()
                            cmd.Connection = conn

                            conn.Close()
                            MsgBox("Account creation successful, redirecting to the login page")
                            Response.Redirect("Login.aspx")
                        Else
                            lblError.Text = "Please recheck your email"
                            lblError.ForeColor = System.Drawing.Color.White
                        End If
                    Else
                        lblError.Text = "This email address is not allowed; email may only be .com, .edu, or .net"
                    End If
                Else
                    lblError.Text = "Email addresses require an @ symbol"
                End If
            Else
                lblError.Text = "The passwords do not match"
            End If
        End If
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        Dim chaAccount As Char() = txtEmail.Text.ToCharArray()
        Dim atSign As Integer = 0
        Dim atCount As Integer = 0
        Dim dot As Integer = 0

        If txtEmail.Text.Length = 0 Or txtPassword.Text.Length = 0 Then
            lblError.Text = "Please fill In the email And password fields"
        Else
            If txtPassword.Text <> txtPassCheck.Text Then
                lblError.Text = "The passwords Do Not match"
            Else
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
                    Dim updateint As Integer
                    Dim connupdate As SqlConnection = New SqlConnection("Data Source=FLAREOUS\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True")
                    connupdate.Open()
                    Dim cmdcheck As SqlCommand = New SqlCommand("Select * FROM Accounts WHERE email = '" & txtEmail.Text & "'", connupdate)
                    cmdcheck.Connection = connupdate

                    Dim dr As SqlDataReader = cmdcheck.ExecuteReader()

                    If dr.Read Then
                        Dim cmdupdate As SqlCommand = New SqlCommand("UPDATE Accounts SET Password = '" & txtPassword.Text & "' WHERE email = '" & txtEmail.Text & "'", connupdate)
                        updateint = cmdupdate.ExecuteNonQuery
                        connupdate.Close()
                        MsgBox("Your password was successfully updated, returning to login page")
                        Response.Redirect("Login.aspx")
                    Else
                        lblError.Text = "Not a valid login!"
                    End If
                Else
                    lblError.Text = "Please recheck your email format"
                    lblError.ForeColor = System.Drawing.Color.White
                End If
            End If
        End If

    End Sub
End Class