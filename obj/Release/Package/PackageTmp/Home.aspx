<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Flight_Plan.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Flight Plan</title>
    <style type="text/css">
        .auto-style1 {
            width: 274px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Flight Plan</h1>
            <br />
            <table>
                <tr>
                    <td class="auto-style1">
                        <asp:HyperLink ID="link_InsertPayload" runat="server" NavigateUrl="~/InsertPayload.aspx" BorderStyle="None" Font-Bold="True" Font-Size="XX-Large" ForeColor="#000066">Insert Payload</asp:HyperLink>
                    </td>
                    <td>
                        <asp:HyperLink ID="link_wb" runat="server" NavigateUrl="~/WeightBalance.aspx" Font-Bold="True" Font-Size="XX-Large" ForeColor="#000066">Weight Balance</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
