<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="5" cellspacing="5" style="width: 100%; border: 1px solid #000000">
    <tr>
        <td style="text-align: center">
            <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: x-large" Text="Feedback page Control"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="feedbackno" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    <asp:BoundField DataField="feedbackno" HeaderText="feedbackno" InsertVisible="False" ReadOnly="True" SortExpression="feedbackno" />
                    <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                    <asp:BoundField DataField="workername" HeaderText="workername" SortExpression="workername" />
                    <asp:BoundField DataField="feedback" HeaderText="feedback" SortExpression="feedback" />
                    <asp:BoundField DataField="servicename" HeaderText="servicename" SortExpression="servicename" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_A49337_homeeserviceeConnectionString %>" DeleteCommand="DELETE FROM [feedback] WHERE [feedbackno] = @feedbackno" InsertCommand="INSERT INTO [feedback] ([username], [workername], [feedback], [servicename]) VALUES (@username, @workername, @feedback, @servicename)" SelectCommand="SELECT * FROM [feedback]" UpdateCommand="UPDATE [feedback] SET [username] = @username, [workername] = @workername, [feedback] = @feedback, [servicename] = @servicename WHERE [feedbackno] = @feedbackno">
                <DeleteParameters>
                    <asp:Parameter Name="feedbackno" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="workername" Type="String" />
                    <asp:Parameter Name="feedback" Type="String" />
                    <asp:Parameter Name="servicename" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="workername" Type="String" />
                    <asp:Parameter Name="feedback" Type="String" />
                    <asp:Parameter Name="servicename" Type="String" />
                    <asp:Parameter Name="feedbackno" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>

