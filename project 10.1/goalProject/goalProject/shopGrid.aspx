<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="shopGrid.aspx.cs" Inherits="goalProject.shopGrid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
    .alert {
    display: none;
    position: fixed;
    top: 20px;
    left: 50%;
    transform: translateX(-50%);
    background-color: #4CAF50;
    color: white;
    padding: 15px;
    border-radius: 4px;
    z-index: 1000;
    opacity: 1;
    transition: opacity 1s;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div id="alertBox" class="alert">Item added to cart!</div>
    <asp:HiddenField ID="scrollPositionHiddenField" runat="server" />
    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <%--<div class="hero__categories">
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
                    </div>--%>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                         <div class="hero__search__form">
                            <div action="#" class="form1">
                                <%--<div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>--%>
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

    

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Department</h4>
                            <ul>
                                <li><a href="shopGrid.aspx?category=Dairy and Eggs">Dairy & Eggs</a></li>
                                <li><a href="shopGrid.aspx?category=Tins and Jars">Tins & Jars</a></li>
                                <li><a href="shopGrid.aspx?category=Baby Products">Baby Products</a></li>
                                <li><a href="shopGrid.aspx?category=Rice, Pasta & Pulses">Rice, Pasta & Pulses</a></li>
                                <li><a href="shopGrid.aspx?category=Snacks">Snacks</a></li>
                                <li><a href="shopGrid.aspx?category=Beverages">Beverages</a></li>
                                <li><a href="shopGrid.aspx?category=Meat and Poultry">Meat & Poultry</a></li>
                                <li><a href="shopGrid.aspx?category=Cleaning and Household">Cleaning & Household</a></li>
                                <li><a href="shopGrid.aspx?category=Beauty and Personal Care">Beauty & Personal Care</a></li>
                                <li><a href="shopGrid.aspx?category=Frozen Food">Frozen Food</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
                <div class="col-lg-9 col-md-7">

                    <div class="filter__item">
                        <div class="row" id="productsContainer" runat="server">

                        </div>
                    </div>
                
                    <div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        
    </section>
    <!-- Product Section End -->
     <script>
        window.onload = function () {
            var urlParams = new URLSearchParams(window.location.search);
            var scrollPosition = urlParams.get('scrollPosition');
            if (scrollPosition) {
                window.scrollTo(0, scrollPosition);
            }

            var addToCartLinks = document.querySelectorAll("a[href*='otherpage.aspx']");
            addToCartLinks.forEach(function (link) {
                link.addEventListener('click', function (event) {
                    link.href = link.href.replace("{scrollPosition}", getScrollPosition());
                });
            });
        }

        function getScrollPosition() {
            return window.pageYOffset || document.documentElement.scrollTop;
        }
        function showAlert() {
            var alertBox = document.getElementById('alertBox');
            alertBox.style.opacity = '1';
            alertBox.style.display = 'block';
            setTimeout(function () {
                alertBox.style.opacity = '0';
                setTimeout(function () {
                    alertBox.style.display = 'none';
                }, 1000);
            }, 1500);
        }

     </script>
</asp:Content>
