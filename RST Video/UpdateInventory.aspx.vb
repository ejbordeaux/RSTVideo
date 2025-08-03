Imports System.Data.SqlClient
Imports System.Data
Public Class Update_Inventory
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

    Protected Sub btnAddGenre_Click(sender As Object, e As EventArgs) Handles btnAddGenre.Click
        Dim conn As SqlConnection = New SqlConnection("Data Source=FLAREOUS\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True")
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand("INSERT INTO Genre([Genre_Name]) values (@genrename)", conn)
        cmd.Parameters.AddWithValue("@genrename", txtAddGenre.Text)

        cmd.ExecuteNonQuery()
        cmd.Connection = conn

        conn.Close()
        MsgBox("Genre Added Successfully")
        Response.Redirect("Update Inventory.aspx")

    End Sub

    Protected Sub btnRemove_Click(sender As Object, e As EventArgs) Handles btnRemove.Click
        Dim result = MsgBox("Are you sure you want to remove this genre?", MsgBoxStyle.YesNo)

        If result = MsgBoxResult.Yes Then
            Dim conn As SqlConnection = New SqlConnection("Data Source=FLAREOUS\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True")
            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand("DELETE FROM Genre WHERE [Genre_Name] = @genrename", conn)

            cmd.Parameters.AddWithValue("@genrename", ddlGenreRemove.SelectedItem.Text)
            cmd.ExecuteNonQuery()
            cmd.Connection = conn
            conn.Close()
            MsgBox("Genre sucessfully deleted")
            Response.Redirect("Update Inventory.aspx")
        End If

    End Sub

    Protected Sub btnAddrelease_Click(sender As Object, e As EventArgs) Handles btnAddrelease.Click
        Dim conn As SqlConnection = New SqlConnection("Data Source=FLAREOUS\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True")
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand("INSERT INTO Releases([Release_Type]) values (@releasename)", conn)
        cmd.Parameters.AddWithValue("@releasename", txtAddRelease.Text)

        cmd.ExecuteNonQuery()
        cmd.Connection = conn

        conn.Close()
        MsgBox("Release Type Added Successfully")
        Response.Redirect("Update Inventory.aspx")
    End Sub

    Protected Sub btnRemoverelease_Click(sender As Object, e As EventArgs) Handles btnRemoverelease.Click
        Dim result = MsgBox("Are you sure you want to remove this release type?", MsgBoxStyle.YesNo)

        If result = MsgBoxResult.Yes Then
            Dim conn As SqlConnection = New SqlConnection("Data Source=FLAREOUS\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True")
            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand("DELETE FROM Releases WHERE [Release_Type] = @releasename", conn)

            cmd.Parameters.AddWithValue("@releasename", ddlRemoveRelease.SelectedItem.Text)
            cmd.ExecuteNonQuery()
            cmd.Connection = conn
            conn.Close()
            MsgBox("Release sucessfully deleted")
            Response.Redirect("Update Inventory.aspx")
        End If
    End Sub

    Protected Sub btnAddMovie_Click(sender As Object, e As EventArgs) Handles btnAddMovie.Click
        Dim conn As SqlConnection = New SqlConnection("Data Source=FLAREOUS\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True")
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand("INSERT INTO Movies([Movie_Name], [Movie_Price], [Genre_ID], [Release_ID]) values (@moviename, @movieprice, @genreid, @releaseid)", conn)
        cmd.Parameters.AddWithValue("@moviename", txtMovies.Text)
        cmd.Parameters.AddWithValue("@movieprice", txtPrice.Text)
        cmd.Parameters.AddWithValue("@genreid", ddlGenremovies.SelectedValue)
        cmd.Parameters.AddWithValue("@releaseid", ddlReleasetypemovies.SelectedValue)

        cmd.ExecuteNonQuery()
        cmd.Connection = conn

        conn.Close()
        MsgBox("Movie Added Successfully")
        Response.Redirect("Update Inventory.aspx")
    End Sub

    Protected Sub btnDeleteMovie_Click(sender As Object, e As EventArgs) Handles btnDeleteMovie.Click
        Dim result = MsgBox("Are you sure you want to remove this movie?", MsgBoxStyle.YesNo)

        If result = MsgBoxResult.Yes Then
            Dim conn As SqlConnection = New SqlConnection("Data Source=FLAREOUS\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True")
            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand("DELETE FROM Movies WHERE [Movie_Name] = @moviename", conn)

            cmd.Parameters.AddWithValue("@moviename", ddlUDMovieSelect.SelectedItem.Text)
            cmd.ExecuteNonQuery()
            cmd.Connection = conn
            conn.Close()
            MsgBox("Movie sucessfully deleted")
            Response.Redirect("Update Inventory.aspx")
        End If
    End Sub

    Protected Sub btnUpdateTax_Click(sender As Object, e As EventArgs) Handles btnUpdateTax.Click
        Dim result = MsgBox("Are you sure you wish to update the tax amount?", MsgBoxStyle.YesNo)

        If result = MsgBoxResult.Yes Then
            Dim conn As SqlConnection = New SqlConnection("Data Source=FLAREOUS\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True")
            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand("UPDATE [Tax_Amount] values (@taxamount FROM Taxes", conn)

            cmd.Parameters.AddWithValue("@taxamount", txtUpdateTax.Text)

            cmd.ExecuteNonQuery()
            cmd.Connection = conn
            conn.Close()
            MsgBox("Tax amount sucessfully updated")
            Response.Redirect("Update Inventory.aspx")

        End If
    End Sub

    Protected Sub btnUpdateMovie_Click(sender As Object, e As EventArgs) Handles btnUpdateMovie.Click
        Dim result = MsgBox("Are you sure you want to update this movie?", MsgBoxStyle.YesNo)

        If result = MsgBoxResult.Yes Then
            Dim conn As SqlConnection = New SqlConnection("Data Source=FLAREOUS\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True")
            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand("UPDATE [Movie_Price], [Genre_ID], [Release_ID]) values (@movieprice, @genreid, @releaseid) FROM Movies WHERE [Movie_Name] = @moviename", conn)

            cmd.Parameters.AddWithValue("@moviename", ddlUDMovieSelect.SelectedItem.Text)
            cmd.Parameters.AddWithValue("@movieprice", txtUDprice.Text)
            cmd.Parameters.AddWithValue("@genreid", ddlUDGenre.SelectedItem.Value)
            cmd.Parameters.AddWithValue("@releaseid", ddlUDRelease.SelectedItem.Value)

            cmd.ExecuteNonQuery()
            cmd.Connection = conn
            conn.Close()
            MsgBox("Movie sucessfully updated")
            Response.Redirect("Update Inventory.aspx")
        End If
    End Sub
End Class