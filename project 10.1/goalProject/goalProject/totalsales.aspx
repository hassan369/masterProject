<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="totalsales.aspx.cs" Inherits="goalProject.totalsales" %>

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
           <a id="userName" class="nav-link" runat="server" href="homePage.aspx?category=clothes"></a>
           <a id="dashboard" class="nav-link" runat="server" href="homePage.aspx?category=clothes"></a>
         <asp:Button class="nav-link" ID="Button1" runat="server" Text="Logout" OnClick="Button1_Click" BorderStyle="None" />
      </li>
    </ul>
      </div>
    </div>
  </div>
</nav>

      
              
           <%-- <img id="img" src="" alt="avatar" 
              class="rounded-circle img-fluid" style="width: 150px;"/>--%>
           <%-- <p id="name1"  runat="server" class="my-3"> </p>
            <p class="text-muted mb-1">Full Stack Developer</p>
            <p class="text-muted mb-4">Bay Orange , San Francisco, CA</p>--%>
               


            <%-- <div id="userContainer" runat="server"></div>
              <a id="userName" runat="server" href="userEDIT.aspx"></a>--%>


    

               <p id="orders-label">Orders</p>
                <div id="cartContainer" runat="server">
                    

                
                </div>
                
            



            <!-- Remove the container if you want to extend the Footer to full width. -->
             
        </form>  
</body>
</html>
