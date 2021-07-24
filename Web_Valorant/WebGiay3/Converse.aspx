<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Converse.aspx.cs" Inherits="Converse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <marquee behavior="alternate">
            <h2 style="color:#4cff00"><strong>CONVERSE</strong> </h2></marquee> 
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="5">
        <ItemTemplate>
            <table>
                <tr>
                    <td >
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("HINH") %>' Width="250px" Height="250px" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("TENGIAY") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("GIABAN") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="image/addtocart.png" Width="40px" Height="40px" CommandArgument='<%# Eval("MAGIAY") %>' OnCommand="ImageButton1_Command" OnClientClick = " return confirm('Đã thêm vào giỏ hàng!');"/>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        </asp:DataList>
</asp:Content>

