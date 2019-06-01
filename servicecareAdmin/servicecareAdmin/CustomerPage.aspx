<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerPage.aspx.cs" Inherits="CustomerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table cellpadding="5" cellspacing="5" style="width: 100%; border: 1px solid #000000">
    <tr>
        <td style="text-align: center">
            <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: x-large; text-align: center" Text="Customer Page Control"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="c national id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" style="margin-left: 0px" Width="100%" AllowPaging="True" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="full name" HeaderText="full name" SortExpression="full name" />
                    <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="c national id" HeaderText="c national id" ReadOnly="True" SortExpression="c national id" />
                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                    <asp:BoundField DataField="adress" HeaderText="adress" SortExpression="adress" />
                    <asp:BoundField DataField="longtitude" HeaderText="longtitude" SortExpression="longtitude" />
                    <asp:BoundField DataField="latitude" HeaderText="latitude" SortExpression="latitude" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_A49337_homeeserviceeConnectionString %>" DeleteCommand="DELETE FROM [customer] WHERE [c national id] = @c_national_id" InsertCommand="INSERT INTO [customer] ([full name], [username], [password], [Email], [c national id], [phone], [adress], [longtitude], [latitude]) VALUES (@full_name, @username, @password, @Email, @c_national_id, @phone, @adress, @longtitude, @latitude)" SelectCommand="SELECT * FROM [customer]" UpdateCommand="UPDATE [customer] SET [full name] = @full_name, [username] = @username, [password] = @password, [Email] = @Email, [phone] = @phone, [adress] = @adress, [longtitude] = @longtitude, [latitude] = @latitude WHERE [c national id] = @c_national_id">
                <DeleteParameters>
                    <asp:Parameter Name="c_national_id" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="full_name" Type="String" />
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="c_national_id" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="adress" Type="String" />
                    <asp:Parameter Name="longtitude" Type="Decimal" />
                    <asp:Parameter Name="latitude" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="full_name" Type="String" />
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="adress" Type="String" />
                    <asp:Parameter Name="longtitude" Type="Decimal" />
                    <asp:Parameter Name="latitude" Type="Decimal" />
                    <asp:Parameter Name="c_national_id" Type="String" />
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

