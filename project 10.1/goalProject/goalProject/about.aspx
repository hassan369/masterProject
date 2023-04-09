<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="goalProject.about" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="about.css" />
      <link href="home.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/a8b56cb52b.js" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


    <title></title>

</head>
<body>
    <form id="form1" runat="server">
       
                      <nav class="navbar navbar-expand-lg ">
  <!-- Container wrapper -->
  <div class="container">
    <!-- Navbar brand -->
    <a class="navbar-brand me-2" href="homepage.aspx" runat="server">
      <img src="images/lgo.png" alt=" Logo" />
    </a>

      <button
      class="navbar-toggler"
      type="button"
      data-mdb-toggle="collapse"
      data-mdb-target="#navbarButtonsExample"
      aria-controls="navbarButtonsExample"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <i class="fas fa-bars"></i>
    </button>


    <div class="collapse navbar-collapse" id="navbarButtonsExample">
      <!-- Left links -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
        </li>
      </ul>
      <!-- Left links -->

      <div class="d-flex align-items-center">
         <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link"  id="signin" runat="server" href="login.aspx">SignIN</a>
      </li>
      <li class="nav-item" id="regis"> 
        <a id="register" class="nav-link"  href="register.aspx"  runat="server">Register</a>
             <a id="cart" runat="server" href="acart.aspx?category=clothes"> <i  class=" fa-solid fa-cart-shopping" style="color:white; font-size:20px; margin-right:20px;"></i></a>
           <a id="userName" class="nav-link" runat="server" href="homePage.aspx?category=clothes"></a>
           <a id="dashboard" class="nav-link" runat="server" href="homePage.aspx?category=clothes"></a>
         <asp:Button class="nav-link" ID="Button1" runat="server" Text="Logout" OnClick="Button1_Click" BorderStyle="None" />
      </li>
    </ul>
      </div>
    </div>
  </div>
</nav>

    <!-- Navbar -->



    <div class="container1">
        <div class="boxs">
            <h1 class="titleAbout">Who are we?</h1>
            <p class="midTitle">Goal company</p>
            <p class="paragraphs">A store specialized in sports and household items. We offer you all sports-related products, and the relationship of our quest from the beginning to the beginning and the effort to obtain distinctive products and the highest international quality standards.</p>
            <p class="midTitle">Our vision: </p>
            <p class="paragraphs">To be pioneers in the world of sports equipment and clothing.</p>
        </div>
        
        <img src="1.jpg"/>
        
        <div class="boxs">
            <p class="midTitle">Our message:</p>
            <p class="paragraphs"> We seek a sports community.</p>
            <p class="paragraphs">  We always strive to serve you to the fullest, our motto is customer satisfaction.</p>
            <p class="paragraphs"> If we do well, then talk about us, and if we fail, then talk to us.</p>
            <p class="paragraphs">We seek to be the pioneers in providing delivery services. We are keen on our customers, partners, and employees to always be the best and pioneers in our field always with the help of God Almighty. Our motto has always been speed, care, honesty, and credibility.</p>
            <h2 class="titleAbout">Call .. we will come</h2>
        </div>


        <div class="boxs">
            <p class="paragraphs">We work 24 hours a day to meet your requests and needs. We offer you our services, which are: receiving, delivery, gift delivery, packaging, and delivery throughout the Kingdom.</p>
        </div>

        <img src="2.png">
    
    </div>

      
   <div  style="background-color: #4D4848">
            <!-- Remove the container if you want to extend the Footer to full width. -->
<div class="container my-5"  >
  <!-- Footer -->
  <footer id="footer" class="text-center text-lg-start text-white">
    <!-- Grid container -->
    <div class="container p-4 pb-0">
      <!-- Section: Links -->
      <section class="">
        <!--Grid row-->
        <div class="row">
          <!-- Grid column -->
          <div id="social" class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-2">
            <h6 class="text-uppercase mb-4 font-weight-bold">
SOCIAL            </h6>
            <p>
         <a href="https://www.facebook.com"  ><img style="height:30px;" src="images/insta.png" /></a>Instagram
            </p>
                <p>
      <a  >  <img  style="height:30px;"  src="images/facebook.png" />  Facebook </a>
            </p>
       <p>
     <a  >   <img  style="height:30px;"  src="images/linkedin.png" />  LinkedIN </a>
            </p>
  <p>
      <a  >  <img  style="height:30px;"  src="images/twitter.png" />  Twitter </a>
            </p>
          </div>
          <!-- Grid column -->

          <hr class="w-100 clearfix d-md-none" />

          <!-- Grid column -->
          <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3" style="text-align :center;">
            <h6 class="text-uppercase mb-4 font-weight-bold">Products</h6>
           <img src="images/img.png"  style="height:170px;"/>
          </div>
          <!-- Grid column -->

          <hr class="w-100 clearfix d-md-none" />

          <!-- Grid column -->
          <hr class="w-100 clearfix d-md-none" />

          <!-- Grid column -->
          <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
            <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
            <p><i class="fas fa-home mr-3"></i> Irbid / Jordan </p>
            <p><i class="fas fa-envelope mr-3"></i> goalshop@gmail.com</p>
            <p><i class="fas fa-phone mr-3"></i> + 962 777 567 88</p>
            <p><i class="fas fa-print mr-3"></i> + 962 234 567 89</p>
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
           <img src="images/footerimg.jpg" style="height:220px; margin-right:30px;" />

          </div>
        </div>
        <!--Grid row-->
      </section>
      <!-- Section: Links -->
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div
         class="text-center p-3"
         style="background-color:#4D4848;">
       ©2020 Copyright: Goal shop
     
    </div>
    <!-- Copyright -->
  </footer>
  <!-- Footer -->
</div>
             </div>
    </form>
</body>
</html>
