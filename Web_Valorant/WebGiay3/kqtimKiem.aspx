<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="kqtimKiem.aspx.cs" Inherits="kqtimKiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <marquee behavior="alternate">
            <h2 style="color:#4cff00"><strong>KẾT QUẢ TÌM KIẾM</strong> </h2></marquee> 
    <asp:DataList ID="DataList1" runat="server"  RepeatColumns="5">
        <ItemTemplate>
            <table>
                <tr>
                    <td >
                        <asp:Image CssClass="im1" runat="server" ImageUrl='<%# Eval("HINH") %>' Width="250px" Height="250px" />
                        
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
                        <asp:Button ID="Button1" runat="server" Text="Button" />
                       <a href="javacript:void(0);" class="btn-buy-now"><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="image/addtocart.png" Width="40px" Height="40px" /></a>
                        
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

