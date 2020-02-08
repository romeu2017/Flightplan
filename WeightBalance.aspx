<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WeightBalance.aspx.cs" Inherits="Flight_Plan.WeightBalance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Weight Balance</title>
    <style type="text/css">
        .auto-style1 {
            width: 289px;
        }
        .auto-style2 {
            width: 189px;
        }
        .auto-style3 {
            width: 153px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="link_home" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink>
            <br />
            <h1>Payload</h1>
            <asp:GridView ID="gw_payload" runat="server" AutoGenerateColumns="False" DataKeyNames="flight_number,pax_qtd,pax_w" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnSelectedIndexChanged="gw_payload_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="id_payload" HeaderText="id_payload" InsertVisible="False" ReadOnly="True" SortExpression="id_payload" Visible="False" />
                    <asp:BoundField DataField="flight_number" HeaderText="Flight Number" SortExpression="flight_number" />
                    <asp:BoundField DataField="pax_qtd" HeaderText="Passengers Quantity" SortExpression="pax_qtd" />
                    <asp:BoundField DataField="pax_w" HeaderText="Passenger Weight" SortExpression="pax_w" />
                    <asp:CommandField SelectText="Select" ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <br />
            <br />
            <h1>Aircraft</h1>
            <asp:GridView ID="gw_acft" runat="server" DataKeyNames="name_acft,pb" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnSelectedIndexChanged="gw_acft_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="id_acft" HeaderText="id_acft" Visible="False" />
                    <asp:BoundField DataField="name_acft" HeaderText="Identification" />
                    <asp:BoundField DataField="model_acft" HeaderText="Model" />
                    <asp:BoundField DataField="min_performance" HeaderText="Min Performance" />
                    <asp:BoundField DataField="max_performance" HeaderText="Max Performance" />
                    <asp:BoundField DataField="pb" HeaderText="PB" />
                    <asp:CommandField SelectText="Select" ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <br />
            <br />
            <h1>Basic Operating Weight</h1>
        </div>
    <table style="width:100%;">
        <tr>
            <td>Payload</td>
            <td>Aircraft</td>
            <td>Total</td>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:TextBox ID="txt_flightNumber" runat="server" Enabled="False"></asp:TextBox>
                <asp:Label ID="lbl_pax_qtd" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lbl_pax_w" runat="server" Visible="False"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txt_name_acft" runat="server" Enabled="False"></asp:TextBox>
                <asp:Label ID="lbl_pb" runat="server" Visible="False"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txt_bow" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btn_calculate" runat="server" Text="Calculate" OnClick="btn_calculate_Click" /></td>
        </tr>
    </table>
    </form>
    </body>
</html>
