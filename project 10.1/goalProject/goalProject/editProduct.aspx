<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editProduct.aspx.cs" Inherits="masterProject.editProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
    <link rel="stylesheet" href="addproduct.css" />

        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="admindash/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <style>
        .TextBoxdes{
                width: 85%;
        }

        .TextBoxAll{
            width: 85%;
        }
        #btnUpload{
              width: 85%;
              margin-bottom: 20px;

        }

    #Button1{
          width: 85%;

    }

    h3 {
        font-size:20px;
    }

    .h1After{
        width:100%;
    }

     
    </style>
    </head>
    <body class="sb-nav-fixed">
        <form runat="server">
        <nav class="sb-topnav navbar navbar-expand"  style="background-color:#F24726; color:white;">
            <!-- Navbar Brand-->
            <a class="navbar-brand me-2" href="login.aspx" runat="server">
                 <img src="images/loo.png" alt=" Logo" style=" height:40px; margin-left:50px;" />
    </a>
            <!-- Sidebar Toggle-->
           <%-- <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>--%>
            <!-- Navbar Search-->
            
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
                    <div class="containerAfter" >
                <br />
                          <table class="tableAfter" >
                 <tr>
                    <td colspan="2"><h1 class="h1After" >Edit Product Details</h1></td>
                </tr>
                <tr>
                    <td><h3 style="margin-left:50px;">Title </h3></td>
                    <td><asp:TextBox ID="TextBox1" runat="server" CssClass="TextBoxAll"></asp:TextBox></td>
                </tr>

                <tr>
                    <td  style="display: flex;"><h3 style="margin-left:50px;">Description </h3></td>
                    <td><asp:TextBox ID="TextBox2" runat="server" TextMode="multiline" CssClass="TextBoxdes" ></asp:TextBox></td>
                </tr>

                  <tr>
                    <td><h3 style="margin-left:50px;">Category </h3></td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="TextBoxAll">
                            <asp:ListItem Text= "clothes" Value="clothes"></asp:ListItem>
                            <asp:ListItem Text= "shoes" Value="shoes"></asp:ListItem>
                            <asp:ListItem Text= "tools" Value="tools"></asp:ListItem>
                         </asp:DropDownList>
                    </td>
                  </tr>

                <tr>
                    <td><h3 style="margin-left:50px;">Price </h3></td>
                    <td><asp:TextBox ID="TextBox4" runat="server" CssClass="TextBoxAll"></asp:TextBox></td>
                  </tr>

                

                 <tr>
                    <td><h3 style="margin-left:50px;">Discount </h3></td>
                    <td><asp:TextBox ID="TextBox6" runat="server"  CssClass="TextBoxAll" ></asp:TextBox></td>
                  </tr>

                 <tr>
                    <td><h3 style="margin-left:50px;">Count In Stock </h3></td>
                    <td><asp:TextBox ID="TextBox7" runat="server" CssClass="TextBoxAll"></asp:TextBox ></td>
                  </tr>

                <tr>
                    <td><h3 style="margin-left:50px;">Image </h3></td>
                    <td><asp:FileUpload ID="FileUpload1" runat="server" /></td>
                  </tr>


                 <tr>
                     
                    <td ></td>
                    <td><asp:Button ID="btnUpload" runat="server"  OnClick="UploadFile" Text="Update" /></td>

                  </tr>
                 <tr>
                    <td></td>
                    <td><asp:Label ID="Label1" runat="server" Text="" ></asp:Label></td>
                  </tr>
                              <tr></tr>
  
            </table>
                     
            

            </div>
                        <br />
                        <br />
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

         