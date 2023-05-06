<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="product1.aspx.cs" Inherits="masterProject.product1" %>

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


    
    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item" id="productimg" runat="server">
                            
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3 id="titleProduct"  runat="server"></h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div>
                        <div class="product__details__price" id="price" runat="server"></div>
                        <p id="descriPtionProduct" runat="server"></p>
                        <div class="product__details__quantity">
                            <div class="quantity" style="width:50px;">
                                <asp:DropDownList ID="DropDownList1" runat="server" style="height:50px;"></asp:DropDownList>
                            </div>
                        </div>
                        <asp:LinkButton CssClass="primary-btn" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" >Add To Cart</asp:LinkButton>
                        <%--<h3>Count In Stock</h3>
                            <p id="countInStock" runat="server"></p>--%>
                    </div>
                </div>
               




            </div>
        </div>
    </section>

       <div class="comments">
                <asp:TextBox ID="TextBox1" runat="server" rows="5" TextMode="MultiLine" placeholder=" Write your comment.." Width="70%"></asp:TextBox>
                 <asp:Button ID="Button2" runat="server" Text="+" Width="50px" CssClass="addButt" OnClick="Button2_Click" />
               </div>
            <br /><br />
            <div class="main-message">
                
                <div class="inner-message" id="innerMessage" runat="server"><p style="font-size:2rem;font-weight:bold; text-align:center;">Comments</p></div>
            </div>
    <!-- Product Details Section End -->
</asp:Content>
