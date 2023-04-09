<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="allproduct.aspx.cs" Inherits="goalProject.allproduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <script src="https://kit.fontawesome.com/a8b56cb52b.js" crossorigin="anonymous"></script>
    <link href="home.css" rel="stylesheet" />
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
      <img src="images/loo.png" alt=" Logo" />
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
         <asp:Button class="nav-link" ID="Button1" runat="server" Text="Logout" BorderStyle="None" OnClick="Button1_Click" />
      </li>
    </ul>
      </div>
    </div>
  </div>
</nav>

        
        <br />
        <br />
        <h1 style="text-align:center;"><span style="color:#F24726; ">OUR&nbsp;</span>PRODUCTS</h1>
        <br />
        <div>
               <span class="card"><div id="productsContainer"  class="container" runat="server" ></div></span>
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
      <a  href="https://www.facebook.com"  >  <img  style="height:30px;"  src="images/facebook.png" />  </a> Facebook
            </p>
       <p>
     <a  href="https://www.facebook.com"  >   <img  style="height:30px;"  src="images/linkedin.png" />   </a>LinkedIN
            </p>
  <p>
      <a  href="https://www.facebook.com"  >  <img  style="height:30px;"  src="images/twitter.png" />  </a> Twitter
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
