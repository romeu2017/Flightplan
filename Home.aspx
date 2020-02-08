<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Flight_Plan.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Flight Plan</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="link_InsertPayload" runat="server" NavigateUrl="~/InsertPayload.aspx">Insert Payload</asp:HyperLink>
        <br />
            <asp:HyperLink ID="link_wb" runat="server" NavigateUrl="~/WeightBalance.aspx">Weight Balance</asp:HyperLink>
        </div>
    </form>
</body>
</html>
