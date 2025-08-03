<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="LandingPage.aspx.vb" Inherits="RST_Video.Landing_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <title>Welcome to RST Video</title>
    <center>
        <img src="RST%20Video.png" id="imgLogo" alt="logo" />
    </center>
</head>
<style>
    body {
        background-color:teal
    }
</style>
    <br />

<body>
    <form id="form1" runat="server">
    <center>
        <div>
        <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" />
            <br />
<asp:Button ID="btnSearch" runat="server" Text="Search"></asp:Button>
            <br />
<asp:Button ID="btnUpdateInv" runat="server" Text="Update Inventory"></asp:Button>
    </div>
        </center>
    </form>
</body>
</html>
