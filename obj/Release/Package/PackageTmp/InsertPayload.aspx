<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertPayload.aspx.cs" Inherits="Flight_Plan.InsertPaylouad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Flight Plan</title>
    <style type="text/css">
        .auto-style1 {
            width: 143px;
        }

        .auto-style2 {
            margin-left: 0px;
        }
        .auto-style3 {
            width: 401px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="link_home" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink>
            <br />
            <h1>Insert Payload</h1>
            <asp:Label ID="lbl_id_payload" runat="server" Visible="False"></asp:Label>
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="lbl_name" runat="server" Text="Flight Number"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="lbl_qtdpax" runat="server" Text="Passengers Quantity"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_qtdpax" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="lbl_paxw" runat="server" Text="Passenger Weight"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_paxw" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style3">
                        <asp:Button ID="btn_insert" runat="server" Text="Insert Payload" OnClick="btn_insert_Click" />
                        <asp:Button ID="btn_update" runat="server" OnClick="btn_update_Click" Text="Update Payload" Visible="False" />
                    </td>
                    <td>
                        <asp:Button ID="btn_delete" runat="server" Text="Delete Payload" Visible="False" OnClick="btn_delete_Click" CssClass="auto-style2" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <asp:GridView ID="gw_payload" runat="server" AutoGenerateColumns="False" DataKeyNames="id_payload" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnSelectedIndexChanged="gw_payload_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="id_payload" HeaderText="id_payload" InsertVisible="False" ReadOnly="True" SortExpression="id_payload" Visible="False" />
                    <asp:BoundField DataField="flight_number" HeaderText="Flight Number" SortExpression="flight_number" />
                    <asp:BoundField DataField="pax_qtd" HeaderText="Passengers Quantity" SortExpression="pax_qtd" />
                    <asp:BoundField DataField="pax_w" HeaderText="Passenger Weight" SortExpression="pax_w" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Selecionar"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
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
        </div>
    </form>
</body>
</html>
