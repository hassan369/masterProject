<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="masterProject.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            <li><a href="#">Fresh Meat</a></li>
                            <li><a href="#">Vegetables</a></li>
                            <li><a href="#">Fruit & Nut Gifts</a></li>
                            <li><a href="#">Fresh Berries</a></li>
                            <li><a href="#">Ocean Foods</a></li>
                            <li><a href="#">Butter & Eggs</a></li>
                            <li><a href="#">Fastfood</a></li>
                            <li><a href="#">Fresh Onion</a></li>
                            <li><a href="#">Papayaya & Crisps</a></li>
                            <li><a href="#">Oatmeal</a></li>
                            <li><a href="#">Fresh Bananas</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <div class="form1" action="#">
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </div>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>0778871942</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="Images/Capture.PNG" style="background-image:url(Images/Capture2.PNG)">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="homePage1.aspx">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click here</a> to enter your code
                    </h6>
                </div>
            </div>
            <div class="checkout__form">
    <h4>Billing Details</h4>
    <div class="row">
        <div class="col-lg-8 col-md-6">
            <div class="checkout__input">
                <p>Full Name<span>*</span></p>
                <asp:TextBox ID="txtFullName" runat="server" />

            </div>
            <div class="checkout__input">
                <p>Contact Number<span>*</span></p>
                <asp:TextBox ID="txtContactNumber" runat="server" />
            </div>
            <div class="checkout__input">
                <p>Email<span>*</span></p>
               <asp:TextBox ID="txtEmail" runat="server" />
            </div>
            <div class="checkout__input">
                <p>Complete Address<span>*</span></p>
                <asp:TextBox ID="txtAddress" runat="server" />

            </div>
            <div class="checkout__input">
                <p>Delivery Instructions (optional)</p>
                <asp:TextBox ID="txtDeliveryInstructions" runat="server" />
            </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="checkout__order">
                <h4>Your Order</h4>
                <div class="checkout__order__products">Products <span>Total</span></div>
                <ul id="productList" runat="server">
                </ul>
                <div class="checkout__order__total">Total <span id="totalPrice" runat="server"></span></div>
                <asp:Button ID="Button2" runat="server" Text="PLACE ORDER" CssClass="site-btn" OnClick="Button2_Click" style="font-size: 18px; letter-spacing: 2px; width: 100%; margin-top: 10px;" />
            </div>
        </div>
    </div>
</div>






        </div>
    </section>
    <!-- Checkout Section End -->
</asp:Content>
