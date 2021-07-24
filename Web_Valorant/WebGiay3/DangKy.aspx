<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="DangKy.aspx.cs" Inherits="DangKy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script src="js/jquery.min.js"></script>
     <link type="text/css" rel="stylesheet" href="DangNhap.css" />
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"/>
     <div class="loginbox">
        <h1>Đăng ký</h1>
        <form>
            <p>Username</p>
            <asp:TextBox ID="text_user" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="text_user" Text="Vui lòng điền UserName!"></asp:RequiredFieldValidator>
            <p>Password</p>
            <asp:TextBox ID="text_pass" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="text_pass" Text="Vui lòng điền mật khẩu!"></asp:RequiredFieldValidator>
            <p>Confirm</p>
            <asp:TextBox ID="text_confirm" runat="server" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToValidate="text_pass" Operator="Equal" ControlToCompare="text_confirm" Text="Mật khẩu không trùng khớp!"></asp:CompareValidator>
            <asp:Button ID="btn_dangNhap" runat="server" Text="Đăng ký" OnClick="btn_dangNhap_Click" />
        </form>
        
    </div>
</asp:Content>

