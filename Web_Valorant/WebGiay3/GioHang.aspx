<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="GioHang.aspx.cs" Inherits="GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="Grid1.css" />
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"/>
    <div class="gridview1">
    <asp:GridView ID="grdContent" Width="100%" CssClass="mygrdContent" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDeleting="grdContent_RowDeleting">
        <Columns>
            <asp:BoundField DataField="MAGIAY" HeaderText="Mã Giày" />
            <asp:BoundField DataField="TENGIAY" HeaderText="Tên Giày"/>
            <asp:BoundField DataField="SOLUONG" HeaderText="Số lượng" />
            <asp:BoundField DataField="GIABAN" HeaderText="Đơn Giá" />
            <asp:BoundField DataField="TongDON" HeaderText="Thành Tiền" />
            <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/image/1.png"  />
        </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
        </div>
    <div style="height:10px"></div>
    <div class="thanhToan">
        <asp:Button ID="Button1" runat="server" Text="Thanh Toán" Width="177px" />
    </div>
</asp:Content>

