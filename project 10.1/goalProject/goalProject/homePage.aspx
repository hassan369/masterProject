<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="goalProject.homePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title></title>
    <script src="https://kit.fontawesome.com/a8b56cb52b.js" crossorigin="anonymous"></script>
    <link href="home.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
  rel="stylesheet"
/>
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.1/mdb.min.css"/>
<script  type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.1/mdb.min.js"></script>

    <style>

          .cardmayyas{
            width: 20rem;
        }

        .mb-3{
            width:88%;
        }


        @media (min-width: 481px ) and (max-width: 768px) {

    .card-text1 {
           font-size: 30px;
    }

    .card-text2 {

        font-size: 30px;
        padding-right: 14%;

    }

    .dis {

        font-size: 30px;

    }

    .button {

    width: 90%;
}

    .cards{
        gap:30px;
    }


}

        @media (min-width: 0px ) and (max-width: 480px) {


    .navbar {
    height: 60px;
    }
    .card-text1 {
    padding-right: 20%;
    font-size: 30px;

    }
    .card-text2 {

        font-size: 25px;
        padding-right: 5%;

    }

    .dis {

        font-size: 25px;

    }

    .button {

    width: 100%;
        padding-left: 50%;
}


     .cardmayyas{
            width: 15rem;
        }

     .mb-3{
                     width: 15rem;

    padding: 0;
        }


     .cards{
         gap:15px;
     }

     .mayyas2{
         background-image:url(discount2.jpg);
             height: 212px;
             background-size:cover;

     }

     #catname{
             padding-top: 40px;
     }
     .card-img{
         display:none;
     }

     .card-img-overlay{
         padding:0;
     }
     .brs{
         display:none;
     }

}
    </style>

</head>
<body>
    <form runat="server">
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
          
             <li>
             <a id="cart" runat="server" href="acart.aspx?category=clothes"><i  class=" fa-solid fa-cart-shopping" style="color:white; font-size:20px; margin-right:20px;"><span id="cartNum" runat="server" style="display:inline-block; text-align:center; font-weight:bold; color:#f24726; background-color:white; width:24px; height:28px; padding-top:6px; font-size:16px;  border-radius:50%;"></span></i></a>
           <a id="userName" class="nav-link" runat="server" ></a>
           <a id="dashboard" class="nav-link" runat="server" href="homePage.aspx?category=clothes"></a>
         <asp:Button class="nav-link" ID="Button1" runat="server" Text="Logout" OnClick="Button1_Click" BorderStyle="None" />
      </li>

                 <li class="nav-item" id="regis"> 
        <a id="register" class="nav-link"  href="about.aspx"  runat="server">About Us</a>
          </li>
      <li class="nav-item active">
          <a class="nav-link"  id="signin" runat="server" href="login.aspx">Sign In</a>
      </li>
    </ul>
      </div>
    </div>
  </div>
</nav>
   
    
<%--    <div id="carouselExampleCaptions" class="carousel slide" data-mdb-ride="carousel">
  <div class="carousel-indicators">
    <button
      type="button"
      data-mdb-target="#carouselExampleCaptions"
      data-mdb-slide-to="0"
      class="active"
      aria-current="true"
      aria-label="Slide 1"
    ></button>
    <button
      type="button"
      data-mdb-target="#carouselExampleCaptions"
      data-mdb-slide-to="1"
      aria-label="Slide 2"
    ></button>
    <button
      type="button"
      data-mdb-target="#carouselExampleCaptions"
      data-mdb-slide-to="2"
      aria-label="Slide 3"
    ></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/images/firstimg.png" class="d-block w-100" alt="Wild Landscape"/>
      <div class="carousel-caption d-none d-md-block">
        <h5><button class="cta">
    <span class="hover-underline-animation"><a style="color:black" href="#categoryID" > Shop now </a></span>
    <svg viewBox="0 0 46 16" height="10" width="30" xmlns="http://www.w3.org/2000/svg" id="arrow-horizontal">
        <path transform="translate(30)" d="M8,0,6.545,1.455l5.506,5.506H-30V9.039H12.052L6.545,14.545,8,16l8-8Z" data-name="Path 10" id="Path_10"></path>
    </svg>
</button></h5>
        <p></p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/images/secimg.png" class="d-block w-100" alt="Camera"/>
      <div class="carousel-caption d-none d-md-block">
        <h5><button class="cta">
    <span class="hover-underline-animation"><a style="color:black" href="homePage.aspx#categoryID" > Shop now</a> </span>
    <svg viewBox="0 0 46 16" height="10" width="30" xmlns="http://www.w3.org/2000/svg" id="arrow-horizontal">
        <path transform="translate(30)" d="M8,0,6.545,1.455l5.506,5.506H-30V9.039H12.052L6.545,14.545,8,16l8-8Z" data-name="Path 10" id="Path_10"></path>
    </svg>
</button></h5>
        <p></p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/images/lastimg.png" class="d-block w-100" alt="Exotic Fruits"/>
      <div class="carousel-caption d-none d-md-block">
        <h5><button class="cta">
   <span class="hover-underline-animation"> <a style="color:black" href="homePage.aspx#categoryID" > Shop now </a></span>
    <svg viewBox="0 0 46 16" height="10" width="30" xmlns="http://www.w3.org/2000/svg" id="arrow-horizontal">
        <path transform="translate(30)" d="M8,0,6.545,1.455l5.506,5.506H-30V9.039H12.052L6.545,14.545,8,16l8-8Z" data-name="Path 10" id="Path_10"></path>
    </svg>
</button></h5>
        <p></p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>--%>
        
   
        <br />
        <br />
        <h1 id="categoryID" style="text-align:center;"><span style="color:#F24726; ">OUR&nbsp;</span>CATEGORIES</h1>
        <br />
    

     <section class="cards">
         <a href="homePage.aspx?category=clothes#productsContainer">
         <div class="card cardmayyas">
  <img class="card-img-top" src="/images/cat.jpg" alt="Card image cap" />
  <div class="card-body">
    <p class="card-text">Category1</p>
  </div>
</div></a>

        <a href="homePage.aspx?category=shoes#productsContainer">
         <div class="card cardmayyas" >
  <img class="card-img-top" src="/images/ca3.png" alt="Card image cap" />
  <div class="card-body">
    <p class="card-text">Category2</p>
  </div>
</div></a>

        <a href="homePage.aspx?category=tools#productsContainer">
         <div class="card cardmayyas">
  <img class="card-img-top" src="/images/cat.jpg" alt="Card image cap" />
  <div class="card-body">
    <p class="card-text">Category3</p>
  </div>
</div></a>

     </section>
        <br />
                 <br />
      <a href="allproduct.aspx">    <section class="cards" runat="server">
               <div class="card mb-3" style="width:88%;">
  <img class="card-img-top" src="/images/uu.png" alt="Card image cap" style="height:250px;"/>
  <div class="card-body"> 

   
    <p class="card-text">All Products</p>
    
  </div>
</div>
</section></a>
      
        <br />
        <br />

 
           


            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <br class="brs" />
            <br class="brs" />

<div class="mayyas2">

   
                           <div class="card bg-dark text-white container-fluied"> <a href="homePage.aspx?category=discount#productsContainer">
  <img class="card-img " src="/images/discoun.jpg" alt="Card image"/>
  <div class="card-img-overlay">
   
    <p class="card-text1">SALE</p>
    <p class="card-text2">UP TO<span class="dis">50%</span>             <h5 class="disbtn"><div class="button">
    <div class="box">S</div>
    <div class="box">H</div>
    <div class="box">O</div>
    <div class="box">P</div>
    <div class="box">E</div>
   <div class="box">N</div>
                   <div class="box">O</div>
                   <div class="box">W</div> 
</div></h5></p>

  
  </div></a>
</div>

             <br />
         <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                     <br />

</div>



        <h1 style="text-align:center;" id="catname"><span style="color:#F24726; ">OUR</span>&nbsp;PRODUCTS</h1>
        <br />
       
        <span class="card"><div id="productsContainer"  class="container" runat="server" ></div></span>
           
        <br />


    
   <div  style="background-color: #4D4848">
            <!-- Remove the container if you want to extend the Footer to full width. -->
<div class="container my-5"  >
  <!-- Footer -->
  <footer id="footer" class="text-center text-lg-start text-white">
    <!-- Grid container -->
 
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
           <a href="contactus.aspx" style="text-decoration:none" runat="server"> <p style="color:white;"><i  class="fas fa-envelope mr-3"></i> goalshop@gmail.com</p></a>
            <p><i class="fas fa-phone mr-3"></i> + 962 777 567 88</p>
            <p><i class="fas fa-print mr-3"></i> + 962 234 567 89</p>
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
               <h6 class="text-uppercase mb-4 font-weight-bold">About Us</h6>
          <a href="about.aspx" runat="server"><img src="images/footerimg.jpg" style="height:200PX; margin-right:30px; width:200PX; " /></a> 

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

    <script type="text/javascript" src="HOME.js"></script>

</body>
</html>



    
 
           

          
       



  

      