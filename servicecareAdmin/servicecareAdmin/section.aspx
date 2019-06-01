<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="section.aspx.cs" Inherits="section" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <table cellpadding="5" cellspacing="5" style="width: 100%; border: 1px solid #000000">
    <tr>
        <td style="text-align: center">
            <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: x-large" Text="Service page control"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" DataKeyNames="sectionno" DataSourceID="SqlDataSource1" ForeColor="#333333" Width="100%">
                <EditItemTemplate>
                    sectionno:
                    <asp:Label ID="sectionnoLabel1" runat="server" Text='<%# Eval("sectionno") %>' />
                    <br />
                    serivcename:
                    <asp:TextBox ID="serivcenameTextBox" runat="server" Text='<%# Bind("serivcename") %>' />
                    <br />
                    logo:
                    <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    serivcename:
                    <asp:TextBox ID="serivcenameTextBox" runat="server" Text='<%# Bind("serivcename") %>' />
                    <br />
                    logo:
                    <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    sectionno:
                    <asp:Label ID="sectionnoLabel" runat="server" Text='<%# Eval("sectionno") %>' />
                    <br />
                    serivcename:
                    <asp:Label ID="serivcenameLabel" runat="server" Text='<%# Bind("serivcename") %>' />
                    <br />
                    logo:
                    <asp:Label ID="logoLabel" runat="server" Text='<%# Bind("logo") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_A49337_homeeserviceeConnectionString %>" DeleteCommand="DELETE FROM [servicesection] WHERE [sectionno] = @sectionno" InsertCommand="INSERT INTO [servicesection] ([serivcename], [logo]) VALUES (@serivcename, @logo)" SelectCommand="SELECT * FROM [servicesection]" UpdateCommand="UPDATE [servicesection] SET [serivcename] = @serivcename, [logo] = @logo WHERE [sectionno] = @sectionno">
                <DeleteParameters>
                    <asp:Parameter Name="sectionno" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="serivcename" Type="String" />
                    <asp:Parameter Name="logo" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="serivcename" Type="String" />
                    <asp:Parameter Name="logo" Type="String" />
                    <asp:Parameter Name="sectionno" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sectionno" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="sectionno" HeaderText="sectionno" InsertVisible="False" ReadOnly="True" SortExpression="sectionno" />
                    <asp:BoundField DataField="serivcename" HeaderText="serivcename" SortExpression="serivcename" />
                    <asp:BoundField DataField="logo" HeaderText="logo" SortExpression="logo" />
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

