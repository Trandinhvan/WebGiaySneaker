<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="slide.css" />
    <marquee behavior="scroll">
            <br />
            <%--<h2 style="color:red"><strong style="font-family:Gigi;font-size:15px">VALORANT SNEAKER KÍNH CHÀO QUÝ KHÁCH</strong> </h2>--%>
        <asp:Label ID="xinchao" runat="server" Text="Label" Font-Bold="True" Font-Size="15" Font-Strikeout="False" ForeColor="Red"></asp:Label>
        </marquee>
    <div class="div1">
           <div class="slideshow-container">
           <div class="mySlides fade">
             <img src="image/bigsale3.jpg" style="width:1200px;height:350px">
           </div>
 
          <div class="mySlides fade">
             <img src="image/bgnike.jpg" style="width:1200px;height:350px">
          </div>
 
          <div class="mySlides fade">
            <img src="image/jordan.jpg" style="width:1200px;height:350px">
          </div>

          <div class="mySlides fade">
            <img src="image/adidasbg.jpg" style="width:1200px;height:350px">
          </div>

          <div class="mySlides fade">
            <img src="image/bgnewbalance.jpg" style="width:1200px;height:350px">
          </div>
        </div>
           <div style="text-align:center">
             <span class="dot" onclick="currentSlide(0)"></span> 
             <span class="dot" onclick="currentSlide(1)"></span> 
             <span class="dot" onclick="currentSlide(2)"></span> 
             <span class="dot" onclick="currentSlide(3)"></span>
             <span class="dot" onclick="currentSlide(4)"></span>
            </div>
        <script>
            //khai báo biến slideIndex đại diện cho slide hiện tại
            var slideIndex;
            // KHai bào hàm hiển thị slide
            function showSlides() {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("dot");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }

                slides[slideIndex].style.display = "block";
                dots[slideIndex].className += " active";
                //chuyển đến slide tiếp theo
                slideIndex++;
                //nếu đang ở slide cuối cùng thì chuyển về slide đầu
                if (slideIndex > slides.length - 1) {
                    slideIndex = 0
                }
                //tự động chuyển đổi slide sau 4s
                setTimeout(showSlides, 4000);
            }
            //mặc định hiển thị slide đầu tiên 
            showSlides(slideIndex = 0);


            function currentSlide(n) {
                showSlides(slideIndex = n);
            }
        </script>
        </div>
         <table class="table" >
           <tr>
               <td style="border-spacing:30px">
                   <img class="bg2" src="image/backgroundjordan4.jpg " />
                   
               </td>
               <td>
                   <img class="bg3" src="image/jordan1.jpg" />

             </td>
           </tr>
       </table>
</asp:Content>

