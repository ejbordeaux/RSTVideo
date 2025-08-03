<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CreateAccount.aspx.vb" Inherits="RST_Video.CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Account</title>
    <center>
        <img src="RST%20Video.png" id="imgLogo" alt="Logo"/>
    </center>
</head>
<style>
    body {background-color:teal}
</style>
    <br />
<body>
    <form id="form1" runat="server">
    <center>
        <div>
        <table class="center">
            <tr>
                <td>
                    <asp:Label ID="lblFirst" runat="server" Text="First Name:" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFirst" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblLast" runat="server" Text="Last Name:" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLast" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Text="eMail Address:" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPassword" runat="server" Text="Password" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPassCheck" runat="server" Text="Confirm Password" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassCheck" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    </center>
    <center>
    <div>
        <asp:DropDownList ID="ddlActtype" runat="server" DataSourceID="SqlDataSource1" DataTextField="Account_Type" DataValueField="Type_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT [Type_ID], [Account_Type] FROM [AccountType]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="AccountValue" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT [Type_ID] FROM [AccountType]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="AcctTypeSource" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT [Account_Type] FROM [AccountType]"></asp:SqlDataSource>
    </div>
    </Center>
    <br />
    <center>
    <div>
        <asp:Button ID="btnCreate" runat="server" Text="Create Account" />
        <asp:Button ID="btnUpdate" runat="server" Text="Update Password" />
    </div>
    </center>
    <br />
    <center>
    <div>
        <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White" Text=""></asp:Label>
    </div>
    </center>
    </form>
</body>
</html>

