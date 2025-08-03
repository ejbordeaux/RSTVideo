<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Search.aspx.vb" Inherits="RST_Video.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search</title>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <style>
        .auto-style1 {
            height: 40px;
        }

        body{ background-color:teal;}
    </style>
    <center>
    <img src="RST%20Video.png" alt="logo"/>
    </center>
</head>
    <br />
<body>
    <form id="form1" runat="server">
    <center>
        <div>
<asp:Label ID="lblGenre" runat="server" Text="Choose a genre" Font-Bold="True" ForeColor="White" Font-Size="Large" Font-Underline="True"></asp:Label>
            <br />
            <br />
            <asp:DropDownList ID="ddlgenre" runat="server" DataSourceID="Genre" DataTextField="Genre_Name" DataValueField="Genre_ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="Genre" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT [Genre_ID], [Genre_Name] FROM [Genre]"></asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="GenreDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT [Genre_Name], [Genre_ID] FROM [Genre]"></asp:SqlDataSource>
    </div>
        <br />
    <div>
<asp:Label ID="lblSelect" runat="server" Text="Select release type" Font-Bold="True" Font-Size="Large" Font-Underline="True" ForeColor="White"></asp:Label>
        <asp:RadioButtonList ID="rblRelease" runat="server" DataSourceID="ReleasesTypes" DataTextField="Release_Type" DataValueField="Release_ID" Font-Bold="True" ForeColor="White">
        </asp:RadioButtonList>
        <asp:SqlDataSource ID="ReleasesTypes" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT [Release_ID], [Release_Type] FROM [Releases]"></asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="Releases" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT [Release_Type] FROM [Releases]"></asp:SqlDataSource>
    </div>
        <asp:Label ID="lblChoose" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True" ForeColor="White" Text="Choose your movies"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnFind" runat="server" Text="Find Movies" />
    <br />
        <asp:CheckBoxList ID="clMovies" runat="server" DataSourceID="Movies" DataTextField="Movie_Name" DataValueField="Movie_Price" ForeColor="White">
        </asp:CheckBoxList>
        <br />
    <div>
        <asp:SqlDataSource ID="Movies" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT [Movie_ID], [Movie_Name], [Movie_Price], [Genre_ID], [Release_ID] FROM [Movies] WHERE (([Genre_ID] = @Genre_ID) AND ([Release_ID] = @Release_ID))">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlgenre" Name="Genre_ID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="rblRelease" Name="Release_ID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <div>
<table class="center">
    <tr>
        <td class="auto-style1">
            <asp:Label ID="lblMovies" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="White" Text="Movies:"></asp:Label>
        </td>
        <td class="auto-style1">
            
            <asp:TextBox ID="txtMovies" runat="server" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblTax" runat="server" Text="Tax" Font-Size="Large" ForeColor="White"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTax" runat="server" ReadOnly="True" Width="168px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
<asp:Label ID="lblTotal" runat="server" Text="Total:" Font-Size="Large" ForeColor="White"></asp:Label>
        </td>
        <td>
<asp:TextBox ID="txtTotal" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>
    </div>
    <div>
<asp:Button ID="btnTotal" runat="server" Text="Total"></asp:Button>
    </div>
    <br />
    <div>
<asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
    </div>
    </form>
</body>
</html>
