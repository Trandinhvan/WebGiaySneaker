<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="NewBalance.aspx.cs" Inherits="NewBalance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script src="js/jquery.min.js"></script>
    <marquee behavior="alternate">
            <h2 style="color:#4cff00"><strong>NEW BALANCE</strong> </h2></marquee> 
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" >
        <ItemTemplate>
            <table>
                <tr>
                    <td>
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
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="image/addtocart.png" Width="40px" Height="40px" CommandArgument='<%# Eval("MAGIAY") %>' OnClientClick = " return confirm('Đã thêm vào giỏ hàng!');" OnCommand="ImageButton1_Command1"/>
                        </td>
                </tr>
            </table>
        </ItemTemplate>
        </asp:DataList>
</asp:Content>

