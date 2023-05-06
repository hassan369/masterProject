<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="masterProject.product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Single E-commerce Product Page</title>
    <!-- Stylesheet -->
    <link rel="stylesheet" href="product.css"/>
    <!---Boxicons CDN Setup for icons-->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'/></head>
    <script src="https://kit.fontawesome.com/a8b56cb52b.js" crossorigin="anonymous"></script>

<body>
   
    <form id="form1" runat="server">
        <nav style="background-color:#F24726; height:50px; display:flex; flex-wrap:wrap; justify-content:space-around; "><a href="homePage.aspx" style="text-decoration:none;"><img src="images/loo.png" style="height:50px; width:100px; align-items:center; margin-top:5px;" /></a> 
          <a id="cart" runat="server" href="acart.aspx?category=clothes"><i  class=" fa-solid fa-cart-shopping" style="color:white; font-size:20px; margin-right:20px;padding-top:15px;"><span id="cartNum" runat="server" style="display:inline-block; text-align:center; font-weight:bold; color:#f24726; background-color:white; width:24px; height:28px; padding-top:6px; font-size:16px;  border-radius:50%;"></span></i></a>


        </nav>
        <div aria-multiline="True">

            
    <div class="container">
        <div class="single-product">
            <div class="row">
                <div class="col-6">
                    <div class="product-image">
                        <div class="product-image-main">
                             <div id="productimg" runat="server"></div>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="breadcrumb">
                        <span><a href="homePage.aspx">Home Page</a></span>
                        <span id="categoryName" runat="server"></span>
                        <span id="titleProduct2" runat="server"></span>
                    </div>

                    <div class="product">
                        <div class="product-title">
                            <h2 id="titleProduct"  runat="server"></h2>
                        </div>
                        <div class="product-rating">
                            <span><i class="bx bxs-star"></i></span>
                            <span><i class="bx bxs-star"></i></span>
                            <span><i class="bx bxs-star"></i></span>
                            <span><i class="bx bxs-star"></i></span>
                            <span><i class="bx bxs-star"></i></span>
                            <span class="review">(47 Review)</span>
                        </div>
                        <div class="product-price">
                            <span class="offer-price" id="priceDiscount" runat="server"></span>
                            <span class="sale-price" id="price" runat="server"></span>
                        </div>

                        <div class="product-details">
                            <h3>Description</h3>
                            <p id="descriPtionProduct" runat="server"></p>
                             <h3>Count In Stock</h3>
                            <p id="countInStock" runat="server"></p>
                        </div>

                        <span class="divider"></span>
                        
                        <div class="product-btn-group">
                            <div class="button add-cart"><i class='bx bxs-cart' ></i> 
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" >Add To Cart</asp:LinkButton>
                            </div>
                            
                                                        <div class="button heart">
                                                            <asp:DropDownList ID="DropDownList1" runat="server" style="height:25px;"></asp:DropDownList></div>
                                                        <div class="button heart"><i class='bx bxs-heart' ></i> Add to Wishlist</div><br />


                        </div>
                        
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

                    </div>
                </div>
            </div>
        </div>
    </div>
            
            

               <div class="comments">
                <asp:TextBox ID="TextBox1" runat="server" rows="5" TextMode="MultiLine" placeholder=" Write your comment.." Width="70%"></asp:TextBox>
                 <asp:Button ID="Button2" runat="server" Text="+" Width="50px" CssClass="addButt" OnClick="Button2_Click" />
               </div>
            <br /><br />
            <div class="main-message">
                
                <div class="inner-message" id="innerMessage" runat="server"><p style="font-size:2rem;font-weight:bold; text-align:center;">Comments</p></div>
            </div>
        </div>
    </form>
</body>
</html>
