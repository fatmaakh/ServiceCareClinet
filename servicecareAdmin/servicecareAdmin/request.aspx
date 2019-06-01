<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="request.aspx.cs" Inherits="request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="5" cellspacing="5" style="width: 100%; border: 1px solid #000000">
    <tr>
        <td style="text-align: center">
            <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: x-large" Text="Request Page Control"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="req no" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="req no" HeaderText="req no" InsertVisible="False" ReadOnly="True" SortExpression="req no" />
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    <asp:BoundField DataField="notes" HeaderText="notes" SortExpression="notes" />
                    <asp:BoundField DataField="latitude" HeaderText="latitude" SortExpression="latitude" />
                    <asp:BoundField DataField="longitude" HeaderText="longitude" SortExpression="longitude" />
                    <asp:BoundField DataField="worker name" HeaderText="worker name" SortExpression="worker name" />
                    <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                    <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_A49337_homeeserviceeConnectionString %>" DeleteCommand="DELETE FROM [request] WHERE [req no] = @req_no" InsertCommand="INSERT INTO [request] ([date], [notes], [latitude], [longitude], [worker name], [username], [time]) VALUES (@date, @notes, @latitude, @longitude, @worker_name, @username, @time)" SelectCommand="SELECT * FROM [request]" UpdateCommand="UPDATE [request] SET [date] = @date, [notes] = @notes, [latitude] = @latitude, [longitude] = @longitude, [worker name] = @worker_name, [username] = @username, [time] = @time WHERE [req no] = @req_no">
                <DeleteParameters>
                    <asp:Parameter Name="req_no" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Date" Name="date" />
                    <asp:Parameter Name="notes" Type="String" />
                    <asp:Parameter Name="latitude" Type="String" />
                    <asp:Parameter Name="longitude" Type="String" />
                    <asp:Parameter Name="worker_name" Type="String" />
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter DbType="Time" Name="time" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Date" Name="date" />
                    <asp:Parameter Name="notes" Type="String" />
                    <asp:Parameter Name="latitude" Type="String" />
                    <asp:Parameter Name="longitude" Type="String" />
                    <asp:Parameter Name="worker_name" Type="String" />
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter DbType="Time" Name="time" />
                    <asp:Parameter Name="req_no" Type="Int32" />
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

