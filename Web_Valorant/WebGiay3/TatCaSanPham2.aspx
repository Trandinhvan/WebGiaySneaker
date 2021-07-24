<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="TatCaSanPham2.aspx.cs" Inherits="TatCaSanPham2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <link rel="stylesheet" type="text/css" href="zoomanh.css" />
      <div >
    <asp:DataList ID="DataList1"  runat="server" RepeatColumns="8">
        
        <ItemTemplate>
            

            
          <table  align="center">
                <tr>
                    <td >
                        <asp:Image ID="Image1" class="rangoliPic" runat="server" ImageUrl='<%# Eval("HINH") %>' Width="155px" Height="210px" />
 
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
         
    </div> <br />
    
               
    <h3 align="center">Trang:
    <asp:Button ID="Button1" runat="server" Text="1" ForeColor="Red" Width="30px" align="center" BorderColor="Black" OnClick="Button1_Click"/>
        
                <asp:Button ID="Button2" runat="server" Text="2" ForeColor="Red" Width="30px" align="center" BorderColor="Black"/>
    </h3>
</asp:Content>

