<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UpdateInventory.aspx.vb" Inherits="RST_Video.Update_Inventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Inventory</title>
    <style type="text/css">
        .auto-style2 {
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
            width: 177px;
        }
        .auto-style5 {
            width: 177px;
        }
        .auto-style6 {
            width: 118px;
        }
        .auto-style7 {
            width: 217px;
        }
        .auto-style8 {
            width: 146px;
        }
        body {background-color:teal}
    </style>
    <center>
    <img src="RST%20Video.png" alt="logo"/>
    </center>
</head>
<body>
    <form id="form1" runat="server">
    <center>
        <div>
            <asp:Label ID="lblAddGenre" runat="server" Text="Add/Remove Genre" Font-Bold="True" ForeColor="White" Font-Size="Large"></asp:Label>
        <table class="Center">
            <tr>
                <td class="auto-style2">

                    <asp:Label ID="lblGenreAddName" runat="server" Text="Add Genre Name" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>

                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtAddGenre" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>

                    <asp:Label ID="lblRemove" runat="server" Text="Remove Existing Genre" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>

                </td>
                <td>

                    <asp:DropDownList ID="ddlGenreRemove" runat="server" DataSourceID="GenreRemove" DataTextField="Genre_Name" DataValueField="Genre_ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="GenreRemove" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT * FROM [Genre]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
<asp:Button ID="btnAddGenre" runat="server" Text="Add"></asp:Button>
                    <asp:Button ID="btnRemove" runat="server" Text="Remove" />
                </td>
            </tr>
        </table>
    </div>
        <br />
        <br />
        <div>
            <asp:Label ID="lblARRelease" runat="server" Text="Add/Remove Release Type" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
            <table class="center">
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblAddRelease" runat="server" Text="Add Release" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtAddRelease" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
<asp:Label ID="lblRemoveRelease" runat="server" Text="Remove Release" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
                    </td>
                    <td class="auto-style6">

                        <asp:DropDownList ID="ddlRemoveRelease" runat="server" DataSourceID="ReleaseRemove" DataTextField="Release_Type" DataValueField="Release_ID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="ReleaseRemove" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT * FROM [Releases]"></asp:SqlDataSource>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">
                        <asp:Button ID="btnAddrelease" runat="server" Text="Add" />
                        <asp:Button ID="btnRemoverelease" runat="server" Text="Remove" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
<asp:Label ID="lblMoviesAUR" runat="server" Text="Add Movies" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
<table class="center">
    <tr>
        <td class="auto-style8">
            <asp:Label ID="lblAURMovieName" runat="server" Text="Movie Name" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
        </td>
        <td class="auto-style7">
            <asp:TextBox ID="txtMovies" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style8">
            <asp:Label ID="lblAURMovieRelease" runat="server" Text="Release Type" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
        </td>
        <td class="auto-style7">
            <asp:DropDownList ID="ddlReleasetypemovies" runat="server" DataSourceID="ReleaseRemove" DataTextField="Release_Type" DataValueField="Release_ID">
            </asp:DropDownList>
        </td>
    </tr>
    <tr><td class="auto-style8">
        <asp:Label ID="lblAURMovieGenre" runat="server" Text="Genre" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
        </td>
        <td class="auto-style7">
            <asp:DropDownList ID="ddlGenremovies" runat="server" DataSourceID="GenreRemove" DataTextField="Genre_Name" DataValueField="Genre_ID">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="auto-style8">

            <asp:Label ID="lblAURMoviePrice" runat="server" Text="Price" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
        </td>
        <td class="auto-style7">

            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>

        </td>
    </tr>
    <tr>
        <td class="auto-style8">

        </td>
        <td class="auto-style7">

            <asp:Button ID="btnAddMovie" runat="server" Text="Add" />

        </td>
    </tr>
</table>
            <br />
            <br />
            <asp:Label ID="lblUpdateMovie" runat="server" Text="Update/Delete Movies" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
<table class="center">
    <tr>
        <td>
<asp:Label ID="lblMovieSelect" runat="server" Text="Select a Movie" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlUDMovieSelect" runat="server" DataSourceID="UDMovies" DataTextField="Movie_Name" DataValueField="Movie_ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="UDMovies" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT * FROM [Movies]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
<asp:Label ID="lblMovieUDReleaseType" runat="server" Text="Release Type" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
        </td>
        <td>

            <asp:DropDownList ID="ddlUDRelease" runat="server" DataSourceID="UDReleaseType" DataTextField="Release_Type" DataValueField="Release_ID">
            </asp:DropDownList>

            <asp:SqlDataSource ID="UDReleaseType" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT [Release_ID], [Release_Type] FROM [Releases]"></asp:SqlDataSource>

        </td>
    </tr>
    <tr>
        <td>

            <asp:Label ID="lblUDgenre" runat="server" Text="Genre" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>

        </td>
        <td>
            <asp:DropDownList ID="ddlUDGenre" runat="server" DataSourceID="UDGenre" DataTextField="Genre_Name" DataValueField="Genre_ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="UDGenre" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT [Genre_ID], [Genre_Name] FROM [Genre]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
<asp:Label ID="lblUDprice" runat="server" Text="Price" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
        </td>
        <td>
<asp:TextBox ID="txtUDprice" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>

        </td>
        <td>
<asp:Button ID="btnUpdateMovie" runat="server" Text="Update"></asp:Button>
            <asp:Button ID="btnDeleteMovie" runat="server" Text="Delete"></asp:Button>
        </td>
    </tr>
</table>
            <br />
            <br />
<asp:Label ID="lblTaxUpdate" runat="server" Text="Update Taxes" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
<table class="center">
    <tr>
        <td>
<asp:Label ID="lblTaxAmount" runat="server" Text="Update Tax Amount" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
        </td>
        <td>
<asp:TextBox ID="txtUpdateTax" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>

        </td>
        <td>
<asp:Button ID="btnUpdateTax" runat="server" Text="Update"></asp:Button>
        </td>
    </tr>


        </table>
        </div>
    </center>
    </form>
</body>
</html>
