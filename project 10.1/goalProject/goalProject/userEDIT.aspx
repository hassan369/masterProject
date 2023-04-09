<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userEDIT.aspx.cs" Inherits="goalProject.userEDIT" %>

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
    	body {
    margin: 0;
    color: #2e323c;
    background: #ffffff;
    position: relative;
    height: 100%;
}
.account-settings .user-profile {
    margin: 0 0 1rem 0;
    padding-bottom: 1rem;
    text-align: center;
}
.account-settings .user-profile .user-avatar {
    margin: 0 0 1rem 0;
}
.account-settings .user-profile .user-avatar img {
    width: 90px;
    height: 90px;
    -webkit-border-radius: 100px;
    -moz-border-radius: 100px;
    border-radius: 100px;
}
.account-settings .user-profile h5.user-name {
    margin: 0 0 0.5rem 0;
}
.account-settings .user-profile h6.user-email {
    margin: 0;
    font-size: 0.8rem;
    font-weight: 400;
    color: #F24726;
}
.account-settings .about {
    margin: 2rem 0 0 0;
    text-align: center;
}
.account-settings .about h5 {
    margin: 0 0 15px 0;
    color: #F24726;
}
.account-settings .about p {
    font-size: 0.825rem;
}
.form-control {
    border: 1px solid #cfd1d8;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    font-size: .825rem;
    background: #ffffff;
    color: #2e323c;
}
/*col-sm-8  col-lg-8 col-md-8*/
.card {
    background: #ffffff;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    border: 0;
    margin-bottom: 1rem;
}
.text-primary {
    color: #F24726!important;
}
  #Button2{
             /*position: absolute;
    top:112%;*/
    background-color:#F24726;
    color: #fff;
    border:none;
    border-radius:10px;
    box-shadow: 0px 0px 2px 2px #F24726;
/*margin : 0 700PX ;*/
        }
  #divahmad {
          margin-top: 150px;
          margin-bottom: 150px;
      }

  #imgFooter{
      height:220px; 
      margin-right:30px;
  }
      @media screen and (min-device-width: 0px) and (max-device-width : 480px) {
          #divahmad {
              margin-top: 0px;
              margin-bottom: 0px;
          }

          #Button2 {
              width: 295px;
          }

          #imgFooter {
              height: 170px;
              margin-right: 0px;
          }
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
           <a id="userName" class="nav-link" runat="server" href="homePage.aspx?category=clothes"></a>
           <a id="dashboard" class="nav-link" runat="server" href="homePage.aspx?category=clothes"></a>
         <asp:Button class="nav-link" ID="Button1" runat="server" Text="Logout" OnClick="Button1_Click" BorderStyle="None" />
      </li>
    </ul>
      </div>
    </div>
  </div>
</nav>

  <div id="divahmad" >
			 
            <div class="container">
				
<div class="row gutters">
	
<div class="col-xl-3 col-lg-3 col-md-14 col-sm-18 col-14">
<div class="card h-100">
<%--	<h1 id="hello" runat="server"></h1>--%>
	<div class="card-body">
		<div class="account-settings">
			<div class="user-profile">
				<div class="user-avatar">
					<div id="img" runat="server"></div> 
				</div>
				<h5 id="name" class="user-name" runat="server"></h5>
				<h6 id="email" class="user-email" runat="server" ></h6>
				<br />
				<hr />
						 <asp:FileUpload ID="FileUpload1" runat="server" />
			</div>
				 
		</div>

	</div>
</div>
</div>
	 <%----------------------------------------------------------------------------%>
<div class="col-xl-9 col-lg-9 col-md-12 col-sm-14 col-12">
<div class="card h-150">
	<div class="card-body">
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<h6 class="mb-2 text-primary">Personal Details</h6>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label style=" margin:10px  " for="fullName">First Name</label>
				<br />
					
					<asp:TextBox ID="TextBox1" runat="server" class="form-control"  placeholder="Enter first name" ></asp:TextBox>

				</div>
			</div>

			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-68col-12">
				<div class="form-group">
					<label for="eMail"  style=" margin:10px  " >Last Name</label>
					
								<asp:TextBox ID="TextBox2" runat="server" class="form-control"  placeholder="Enter Last name" ></asp:TextBox>
				</div>
			</div>
			<br /><br /><br /><br /><br />
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="phone"  style=" margin:10px  " >Password</label>
								<asp:TextBox ID="TextBox3" runat="server" class="form-control"  placeholder="Enter Password " TextMode="Password" ></asp:TextBox>
				</div>
			</div>

			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-68col-12">
				<div class="form-group">
					<label for="eMail"  style=" margin:10px  " >Confirm Password</label>
					
								<asp:TextBox ID="TextBox6" runat="server" class="form-control"  placeholder="Confirm Password" TextMode="Password" ></asp:TextBox>
				</div>
			</div>
			<br /><br /><br /><br /><br />
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                <div class="form-group">
					<label style=" margin:10px  " for="fullName">Phone number</label>
				<br />
					
					<asp:TextBox ID="TextBox5" runat="server" class="form-control"  placeholder="Phone Number" ></asp:TextBox>

				</div>
				
			</div>
			
			</div>
			 <%-- <asp:Button ID="Button3" runat="server" Text="Edit Profile" OnClick="Button2_Click" class="col-sm-1"  />--%>
       
		</div>
		
</div>
                               <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Button2_Click"  class="col-sm-1" /> &nbsp &nbsp<asp:Label ID="Label1" runat="server" Text=""></asp:Label>

</div>

</div>

</div>
			
        </div>
      </div>
 <div  style="background-color: #4D4848">
            <!-- Remove the container if you want to extend the Footer to full width. -->
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
           <img src="images/footerimg.jpg" id="imgFooter" />

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
        </form>  
</body>
</html>
