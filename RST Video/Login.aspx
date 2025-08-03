<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="RST_Video.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RST Login</title>
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
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblUsername" runat="server" Text="Username:" Font-Bold="True" ForeColor="White" Font-Size="Large" ></asp:Label>
                </td>
         
                <td>
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPassword" runat="server" Text="Password:" Font-Bold="True" ForeColor="White" Font-Size="Large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
        <br />
    <div>
        <asp:Button ID="btnLogin" runat="server" Text="Login" /> 
        <asp:Button ID="btnNew" runat="server" Text="New Account" />
    </div>
    <br />
    <div>
<asp:Label ID="lblError" runat="server" Text="" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
        <br />
    </div>
    </center>
    </form>
</body>
</html>
