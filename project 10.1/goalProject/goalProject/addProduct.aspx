<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addProduct.aspx.cs" Inherits="goalProject.addProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="addproduct.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/a8b56cb52b.js" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <title></title>
    <style>
        .containerAfter {
   
}

.h1After {
  
}


#Button1 {
    width: 100%;
    height: 45px;
    background-color: #F24726;
    color: white;
    font-size: 18px;
    border-radius: 5px;
    border: 0px;
    margin-top: 4px;
    align-content: center;
    margin: 5px 0px 5px 5px;
}

#btnUpload {
    width: 70%;
    height: 45px;
    background-color: #F24726;
    color: white;
    font-size: 18px;
    border-radius: 5px;
    border: 0px;
    margin-top: 50px;
    align-content: center;
    margin: 5px 0px 5px 5px;
}

.TextBoxAll {
    width: 70%;
    height: 50px;
    border-radius: 5px;
    border: 1px solid gray;
    margin: 5px 0px 5px 5px;
    padding: 10px;
}

#FileUpload1 {
    margin: 5px 0px 5px 5px;
}

.tableAfter {
  

}

.TextBoxdes {
    Height: 100px;
    Width: 70%;
    border-radius: 5px;
    border: 1px solid gray;
    margin: 5px 0px 5px 5px;
    resize: none;
    padding: 10px;
}

.hhh{
    font-size:20px;
}
#FileUpload1 {
    font-size: 13px;
}
td{
    padding-top:25px;
    padding-left:50px;
}
.adminNav{
    display:inline; 
    text-decoration:none; 
    color:white;
    font-size: 25px;
}

.spaces{
    width:72%;
}
@media screen and (min-device-width: 481px) and (max-device-width : 768px) {
    .tableAfter {
        width: 70%;
        padding: 66px;
    }
}


@media screen and (min-device-width: 0px) and (max-device-width : 480px) {

   
    .h1After {
        font-size: 70px;
        padding: 280px 0 140px 0;
    }

    .tableAfter {
        width: 95%;
        padding: 80px 30px;
    }


    .TextBoxAll {
        width: 100%;
        height: 70px;
        margin: 15px 0;
    }

    .TextBoxdes {
        Height: 200px;
        margin: 15px 0;
    }

    #btnUpload {
        height: 70px;
        font-size: 30px;
    }

    #FileUpload1 {
        font-size: 30px;
    }

    #Button1 {
        height: 70px;
        font-size: 30px;
    }
}

    </style>
</head>
<body style="background-image:url(images/3.png);background-size:cover; background-repeat:no-repeat;">
    <form id="form1" runat="server">

           <nav class="sb-topnav navbar navbar-expand"  style="background-color:#F24726; color:white;">
            <!-- Navbar Brand-->
            <a class="navbar-brand me-2" href="homePage.aspx" runat="server">
                 <img src="images/lgo.png" alt=" Logo" style=" height:40px; margin-left:50px;" />
    </a>
            <!-- Sidebar Toggle-->
           <%-- <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>--%>
            <!-- Navbar Search-->

            <!-- Navbar-->
            <div class="spaces"></div>
            <a href="dashboard.aspx" class="adminNav">Admin Page</a>&nbsp;

            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color:white; margin-right:50px;"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                   <li><a class="dropdown-item" href="homePage.aspx" runat="server">Logout</a></li>

                    </ul>
                </li>
            </ul>
        </nav>

     <div class="containerAfter" style=" display: flex;
    flex-direction: column;
    align-items: center;" >
            <br />
            <table class="tableAfter" style="  width: 60%;
    background-color: white;
    padding: 50px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                <tr>
                    <td colspan="2"><h1 class="h1After" style="  text-align: center;
    padding: 50px;">Add Product</h1></td>
                </tr>

                <tr>
                    <td><h3 class="hhh">Title </h3></td>
                    <td><asp:TextBox ID="TextBox1" runat="server" CssClass="TextBoxAll"></asp:TextBox></td>
                </tr>

                <tr>
                    <td  style="display: flex;"><h3 class="hhh"> Description </h3></td>
                    <td><asp:TextBox ID="TextBox2" runat="server" TextMode="multiline" CssClass="TextBoxdes"  ></asp:TextBox></td>
                </tr>

                  <tr>
                    <td><h3 class="hhh" >Category </h3></td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="TextBoxAll">
                            <asp:ListItem Text= "Category1" Value="Category1"></asp:ListItem>
                            <asp:ListItem Text= "Category2" Value="Category2"></asp:ListItem>
                            <asp:ListItem Text= "Category3" Value="Category3"></asp:ListItem>
                         </asp:DropDownList>
                      </td>
                  </tr>

                <tr>
                    <td><h3 class="hhh">Price </h3></td>
                    <td><asp:TextBox ID="TextBox4" runat="server" CssClass="TextBoxAll"></asp:TextBox></td>
                  </tr>

                

                 <tr>
                    <td><h3 class="hhh">Discount </h3></td>
                    <td><asp:TextBox ID="TextBox6" runat="server"  CssClass="TextBoxAll" ></asp:TextBox></td>
                  </tr>

                 <tr>
                    <td><h3 class="hhh">Count In Stock </h3></td>
                    <td><asp:TextBox ID="TextBox7" runat="server" CssClass="TextBoxAll"></asp:TextBox ></td>
                  </tr>

                <tr>
                    <td><h3 class="hhh">Image </h3></td>
                    <td><asp:FileUpload ID="FileUpload1" runat="server" /></td>
                  </tr>


                 <tr>
                     <td></td>
                    <td ><asp:Button ID="btnUpload" runat="server" OnClick="UploadFile" Text="Add Product"  /></td>
                  </tr>
                 <tr>
                    <td></td>
                    <td><asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
                  </tr>

            </table>
        </div>
    
      

    </form>
</body>
</html>
