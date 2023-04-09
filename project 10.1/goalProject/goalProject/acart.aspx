<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="acart.aspx.cs" Inherits="goalProject.cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://kit.fontawesome.com/a8b56cb52b.js" crossorigin="anonymous"></script>
<%--    <link rel="stylesheet" href="home.css"/>--%>
     <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
     <style>
 .navbar {
    background-color: #F24726;
}
.navbar .navbar-nav .nav-link {
    color: #fff;
    font-size: 1.1em;
}

    .navbar .navbar-nav .nav-link:hover {
        background-color: white;
        color: #F24726;
    }
.navbar img {
    height:40px;
}
#Button1{
    background-color:#F24726;
}
#Button1:hover{
    color:#F24726;
    background-color:white;
}
body {
    height: 100vh;
    width: 100%;
   

}

.shopping-cart {
    width: 80%;
    margin: 80px auto;
    background: #FFFFFF;
    box-shadow: 1px 2px 3px 0px rgba(0,0,0,0.10);
    border-radius: 6px;
    display: flex;
    flex-direction: column;
    padding: 30px;
}

.title {
    border-bottom: 1px solid #E1E8EE;
    padding: 20px 30px;
    color: #5E6977;
    font-size: 20px;
    font-weight: 400;
}


.cartBox {
    display: flex;
    justify-content: space-around;
    align-items: center;
    box-shadow: 1px 2px 3px 0px rgba(0,0,0,0.10);
}

.productIMG {
    width: 20%;
    padding: 10px;
}

.details {
    font-size: 20px;
    color: #5E6977;
    width:120px;

}

.endBox {
    box-shadow: 1px 2px 3px 0px rgba(0,0,0,0.10);
    padding: 25px;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 20px;
}

.Allprice {
    font-size: 30px;
    color: #5E6977;
}

.Button2 {
    width: 20%;
    height: 45px;
    background-color: #F24726;
    color: white;
    font-size: 18px;
    border-radius: 5px;
    border: 0px;
    align-content: center;
}
         .label1 {
             text-align:center;
             color:orangered;
             font-size:20px;
         }


@media screen and (min-device-width: 0px) and (max-device-width : 480px) {

    .cartBox {
        flex-direction: column;
        gap: 30px;
    }

    .productIMG {
        width: 40%;
    }

    .details {
        font-size: 50px;
    }

    #btnUpload {
        height: 70px;
        font-size: 30px;
    }

    .Allprice {
        font-size: 55px;
    }

    .Button2 {
        width: 40%;
        height: 73px;
        font-size: 40px;
    }

    .title {
        padding: 50px 30px;
        font-size: 66px;
        text-align: center;
    }
}

@media screen and (min-device-width: 481px) and (max-device-width : 768px) {
    .shopping-cart {
        height: auto;
        overflow: hidden;

    }

    .title {
        font-size: 30px;
    }
}

    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <nav class="navbar navbar-expand-lg ">
  <!-- Container wrapper -->
  <div class="container">
    <!-- Navbar brand -->
    <a class="navbar-brand me-2" href="homePage.aspx" runat="server">
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
             <a id="cart" runat="server" href="acart.aspx?category=clothes"><i  class=" fa-solid fa-cart-shopping" style="color:white; font-size:20px; margin-right:20px;"><span id="cartNum" runat="server" style="display:inline-block; text-align:center; font-weight:bold; color:#f24726; background-color:white; width:24px; height:28px; padding-top:6px; font-size:16px;  border-radius:50%;">23</span></i></a>
           <a id="userName" class="nav-link" runat="server" ></a>
           <a id="dashboard" class="nav-link" runat="server" href="homePage.aspx?category=clothes"></a>
         <asp:Button class="nav-link" ID="Button1" runat="server" Text="Logout" OnClick="Button1_Click" BorderStyle="None" />
      </li>
    </ul>
      </div>
    </div>
  </div>
</nav>
            <div>
            <div class="shopping-cart">
                <!-- Title -->
                <div class="title">Shopping Bag</div>
                <div id="cartContainer" runat="server"></div>
                <div class="endBox">
                <span class="Allprice">Sup Total : <span id="totalPrice" runat="server"></span>$</span>
                    <asp:Button ID="Button2" runat="server" Text="Checkout"  CssClass="Button2" OnClick="Button2_Click"/>
                </div>
            </div>
                <asp:Label ID="Label1" runat="server" Text="" CssClass="label1"></asp:Label>

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
