<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="goalProject.user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <meta charset="utf-8" />
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/a8b56cb52b.js" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
        height: 40px;
    }

#Button1 {
    background-color: #F24726;
}

    #Button1:hover {
        color: #F24726;
        background-color: white;
    }
* {
    margin: 0px;
    padding: 0px;
    box-sizing: border-box;
}
        #Button2{
             position: absolute;
    top:74%;
    background-color:#F24726;
    color: #fff;
    border:none;
    border-radius:10px;
    box-shadow: 0px 0px 2px 2px #F24726;
        }
        #hello{

            top : 80px ;
            margin-top : -80px ;
        }
        @media screen and (min-device-width: 0px) and (max-device-width : 480px) {
            body{
                padding-top:50%;
            }

        }
        .main-message2 {
    display: flex;
    justify-content: center;
}

.inner-message2 {
    width: 73%;
}

    .inner-message2 div {
        /*border:1px solid black;hghhjhjkkkk*/
        margin-bottom: 10px;
    }

.details {
    color: #5E6977;
        width: 25%; 
}
.details2 {
    color: #5E6977;
        width: 5%; 
}
.details1 {
    color: #5E6977;
    background-color: white;
    border: 2px solid red;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
            width: 80px;

}
    .details1:hover {
        background-color: red;
        color: white;
    }
    .cartBox {
    display: flex;
justify-content: space-between;
    align-items: center;
    box-shadow: 1px 2px 3px 0px rgba(0,0,0,0.10);
    margin-bottom:10px;
}
    .shopping-cart {
    width: 80%;
    background: #FFFFFF;
    /*box-shadow: 1px 2px 3px 0px rgba(0,0,0,0.10);*/
    border-radius: 6px;
    display: flex;
    flex-direction: column;
    padding: 30px;
}
    .shopping-container{
        display:flex;
        justify-content:center;
    }

    #orders-label{
        font-size:3rem;
        /*font-weight*/:bold;
        color:#F24726;
    }
    </style>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   </head>
    <body >
        <form id="form" runat="server">
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
           <a id="userName" class="nav-link" runat="server" href="user.aspx"></a>
           <a id="dashboard" class="nav-link" runat="server" href="dashboard.aspx"></a>
         <asp:Button class="nav-link" ID="Button1" runat="server" Text="Logout" OnClick="Button1_Click" BorderStyle="None" />
      </li>
    </ul>
      </div>
    </div>
  </div>
</nav>

  <section style="background-color: #fff; padding:11%; padding-bottom:0;" >
  <div class="container py-5" "border border-danger" "col-sm-8" > 
   <h1 id="hello" runat="server"></h1>
     <br />
    <div class="row"  "border border-danger">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
              
              <div id="img" runat="server"     > </div>
           <%-- <img id="img" src="" alt="avatar" 
              class="rounded-circle img-fluid" style="width: 150px;"/>--%>
           <%-- <p id="name1"  runat="server" class="my-3"> </p>
            <p class="text-muted mb-1">Full Stack Developer</p>
            <p class="text-muted mb-4">Bay Orange , San Francisco, CA</p>--%>
               


            <%-- <div id="userContainer" runat="server"></div>
              <a id="userName" runat="server" href="userEDIT.aspx"></a>--%>



          </div>
        </div>
        
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-8">
                <p class="mb-0">Full Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0" id="name2" runat="server" > </p>
              </div>
            </div>
            <hr/>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0" id="email"  runat="server" ></p>
              </div>
            </div>
            <hr/>
           <%-- <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Phone</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">(097) 234-5678</p>
              </div>
            </div>
            <hr>--%>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Mobile</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0" id="phone" runat="server"></p>
              </div>
            </div>
            <hr/>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Address</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">Jordan, Amman, CA</p>
              </div>
            </div>
              
          </div>
        </div>
        
      </div>
        <span style="justify-content:right" ;  class="row"  >
  
            <asp:Button ID="Button2" runat="server" Text="Edit Profile" OnClick="Button2_Click" class="col-sm-1"  />
             </span>
  </div>
    </div>
</section>
<div class="shopping-container">
            <div class="shopping-cart">

               <p id="orders-label">Orders</p>
                <div id="cartContainer" runat="server">
                    

                
                </div>
                
            </div>
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