<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productsAdmin.aspx.cs" Inherits="goalProject.productsAdmin" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <style>
            body {
    height: 100vh;
    width: 100%;
    background-color: #F24726;
                 }



.shopping-cart {
    width: 90%;
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
justify-content: space-between;
    align-items: center;
    box-shadow: 1px 2px 3px 0px rgba(0,0,0,0.10);
}

.productIMG {
    width: 10%;
    padding: 10px;
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

#Button1 {
    width: 22%;
    height: 59px;
    background-color: #ffffff;
    color: red;
    font-size: 24px;
    border-radius: 5px;
    border: 0px;
}
#butn {
    display: flex;
    justify-content: center;
    margin-top: 56px;
}

#Button2 {
    width: 22%;
    height: 59px;
    background-color: #f93939;
    color: white;
    font-size: 24px;
    border-radius: 5px;
    border: 0px;
}
.cartBox{
    margin:10px 0;
}

@media screen and (min-device-width: 0px) and (max-device-width : 480px) {
    .cartBox {
        flex-direction: column;
        gap: 5px;
        padding: 10px;
    }

    .productIMG {
        width: 100%;
    }

    .details {
    width: 100%;
    text-align: center;
}
            .details1 {
                padding: 2px 0px;
                width: 65px;
                margin: 2px;
            }


    #Button1 {
        width: 100%;
      
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
 <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
             <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="admindash/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
    <form runat="server">
              <nav class="sb-topnav navbar navbar-expand"  style="background-color:#F24726; color:white;">
            <!-- Navbar Brand-->
            <a class="navbar-brand me-2" href="login.aspx" runat="server">
                 <img src="images/loo.png" alt=" Logo" style=" height:40px; margin-left:50px;" />
    </a>
            <!-- Sidebar Toggle-->
           <%-- <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>--%>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color:white; margin-right:50px;"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                   <li><a class="dropdown-item" href="homePage.aspx" runat="server">Logout</a></li>

                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="dashboard.aspx" runat="server">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                           
                          
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="usersadmin.aspx" runat="server">Users</a>
                                            <a class="nav-link" href="addProduct.aspx" runat="server" >Add Pruduct</a>
                                            <a class="nav-link" href="productsAdmin.aspx" runat="server">All Product</a>
                                            <a class="nav-link" href="ordersAdmin.aspx" runat="server">Total Sales</a>
</nav>
<%--navv.............--%>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="admindash/401.html">401 Page</a>
                                            <a class="nav-link" href="admindash/404.html">404 Page</a>
                                            <a class="nav-link" href="admindash/500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                          
                    </div>

                   
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                         </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card  text-white mb-4" style="background-color:#F24726;">
                                    <div class="card-body">Users</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="usersadmin.aspx" runat="server">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card  text-white mb-4" style="background-color:#F24726;">
                                    <div class="card-body"> Add Products</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="addProduct.aspx" runat="server" >View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card  text-white mb-4" style="background-color:#F24726;">
                                    <div class="card-body">All Products</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="productsAdmin.aspx" runat="server" >View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card  text-white mb-4" style="background-color:#F24726;">
                                    <div class="card-body">Total Sales</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="ordersAdmin.aspx" runat="server">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                                <div id ="butn">
            <asp:Button ID="Button1" runat="server" Text="ALL Product" OnClick="Button1_Click" />
            </div>








        <div>
            <div class="shopping-cart">

               
                <div id="cartContainer" runat="server">

                </div>
                
            </div>
        </div>




            <br />
            <br />

        <div id="products_container" runat="server">

        </div>
                     <%--  <div class="container">
        <table class="table table-striped table-light text-center" id="ta">
  <thead>
    <tr>
      <th scope="col">Photo</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Control</th>
    </tr>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </thead>
            

      </table>
    </div>                      --%>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Goal 2022</div>
                         </div>
                    </div>
                </footer>
            </div>
        </div>
        </form>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="admindash/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="admindash/assets/demo/chart-area-demo.js"></script>
        <script src="admindash/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
                <script src="admindash/js/datatables-simple-demo.js"></script>
    </body>
</html>
