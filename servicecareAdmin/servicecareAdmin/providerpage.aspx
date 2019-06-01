<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="providerpage.aspx.cs" Inherits="providerpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="5" cellspacing="5" style="width: 100%; border: 1px solid #000000">
    <tr>
        <td style="text-align: center; font-size: x-large">
            <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: x-large; text-align: center" Text="Provider Page Control"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="workerno" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="1159px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="workerno" HeaderText="workerno" InsertVisible="False" ReadOnly="True" SortExpression="workerno" />
                    <asp:BoundField DataField="workername" HeaderText="workername" SortExpression="workername" />
                    <asp:BoundField DataField="feedback" HeaderText="feedback" SortExpression="feedback" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="img" HeaderText="img" SortExpression="img" />
                    <asp:BoundField DataField="sectionno" HeaderText="sectionno" SortExpression="sectionno" />
                    <asp:BoundField DataField="cv" HeaderText="cv" SortExpression="cv" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_A49337_homeeserviceeConnectionString %>" DeleteCommand="DELETE FROM [worker] WHERE [workerno] = @workerno" InsertCommand="INSERT INTO [worker] ([workername], [feedback], [price], [img], [sectionno], [cv], [Email], [password]) VALUES (@workername, @feedback, @price, @img, @sectionno, @cv, @Email, @password)" SelectCommand="SELECT * FROM [worker]" UpdateCommand="UPDATE [worker] SET [workername] = @workername, [feedback] = @feedback, [price] = @price, [img] = @img, [sectionno] = @sectionno, [cv] = @cv, [Email] = @Email, [password] = @password WHERE [workerno] = @workerno">
                <DeleteParameters>
                    <asp:Parameter Name="workerno" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="workername" Type="String" />
                    <asp:Parameter Name="feedback" Type="String" />
                    <asp:Parameter Name="price" Type="Decimal" />
                    <asp:Parameter Name="img" Type="String" />
                    <asp:Parameter Name="sectionno" Type="Int32" />
                    <asp:Parameter Name="cv" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="workername" Type="String" />
                    <asp:Parameter Name="feedback" Type="String" />
                    <asp:Parameter Name="price" Type="Decimal" />
                    <asp:Parameter Name="img" Type="String" />
                    <asp:Parameter Name="sectionno" Type="Int32" />
                    <asp:Parameter Name="cv" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="workerno" Type="Int32" />
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

