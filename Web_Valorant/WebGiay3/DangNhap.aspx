<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="DangNhap.aspx.cs" Inherits="DangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link type="text/css" rel="stylesheet" href="DangNhap.css" />
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"/>
     <div class="loginbox">
        <h1>Đăng Nhập</h1>
        <form>
            <p>Username</p>
            <asp:TextBox ID="text_user" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="text_user" Text="Vui lòng điền UserName"></asp:RequiredFieldValidator>
            <p>Password</p>
            <asp:TextBox ID="text_pass" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="text_pass" Text="Vui lòng điền mật khẩu!"></asp:RequiredFieldValidator>
            <asp:Button ID="btn_dangNhap" runat="server" Text="Đăng Nhập" OnClick="btn_dangNhap_Click" />
            <a href="#">Quên mật khẩu</a><br>
            <a href="DangKy.aspx">Tôi chưa có tài khoản</a><br />
            <asp:Label ID="lb_thongbao" runat="server"></asp:Label>
        </form>
        
    </div>
</asp:Content>


