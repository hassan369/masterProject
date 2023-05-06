<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homePage1.aspx.cs" Inherits="masterProject.homePage1" %>
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
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
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
                    <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
                        <div class="hero__text">
                            <span>FRUIT FRESH</span>
                            <h2>Vegetable
                                <br />
                                100% Organic</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="#" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="https://www.thedailymeal.com/img/gallery/are-eggs-actually-considered-dairy/l-intro-1664905977.jpg">
                            <h5><a href="shopGrid.aspx?category=Dairy & Eggs">Dairy & Eggs</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="https://m.media-amazon.com/images/I/81MKujcFjfL._UL1500_.jpg">
                            <h5><a href="shopGrid.aspx?category=Baby Products">Baby Products</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="https://www.foodbusinessnews.net/ext/resources/images/e/b/r/o/m/d/e/d/d/d/12/EbroMerger_Embedded.jpg">
                            <h5><a href="shopGrid.aspx?category=Rice, Pasta & Pulses">Rice, Pasta & Pulses</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="https://m.media-amazon.com/images/I/81dROkl2pKL.jpg">
                            <h5><a href="shopGrid.aspx?category=Snacks">Snacks</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="https://www.breaktimebeverage.com/dynamic-media/assets/images/product-categories/cold-beverages-2.png?gravity=center&v=masthead&k=j82MwQRSVci%2B9Hcvh9A0lw">
                            <h5><a href="shopGrid.aspx?category=Beverages">Beverages</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="https://media.istockphoto.com/id/1190365824/vector/big-vector-set-with-meat-poultry-seafood-on-plastic-trays-covered-with-kitchen-saran-film.jpg?s=612x612&w=0&k=20&c=BhPMWFKNeCSMFq42O6dZYhebc8ynF4Oy0diA8z1oTTo=">
                            <h5><a href="shopGrid.aspx?category=Meat & Poultry">Meat & Poultry</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="https://www.smallstarter.com/wp-content/uploads/2013/08/1.cosmetics_business_africa_3.jpg">
                            <h5><a href="shopGrid.aspx?category=Beauty & Personal Care">Beauty & Personal Care</a></h5>
                        </div>
                    </div>
                </div>
            </div>

        </div>


    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Sale Off</h2>
                    </div>
                    <%--<div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".oranges">Oranges</li>
                            <li data-filter=".fresh-meat">Fresh Meat</li>
                            <li data-filter=".vegetables">Vegetables</li>
                            <li data-filter=".fastfood">Fastfood</li>
                        </ul>
                    </div>--%>
                </div>
            </div>
            <div class="row featured__filter" id="productsContainer" runat="server">
                
            </div>
        </div>
    </section>
    <!-- Featured Section End -->
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
