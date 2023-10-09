<%-- 
    Document   : shop-index
    Created on : Jul 3, 2023, 8:52:17 PM
    Author     : Cicca
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->

    <!-- Head BEGIN -->
    <head>
        <meta charset="utf-8">
        <title>Home Milk Tea</title>

        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">



        <meta property="og:site_name" content="-CUSTOMER VALUE-">
        <meta property="og:title" content="-CUSTOMER VALUE-">
        <meta property="og:description" content="-CUSTOMER VALUE-">
        <meta property="og:type" content="website">
        <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
        <meta property="og:url" content="-CUSTOMER VALUE-">

        <link rel="shortcut icon" href="favicon.ico">

        <!-- Fonts START -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css"><!--- fonts for slider on the index page -->  
        <!-- Fonts END -->

        <!-- Global styles START -->          
        <link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Global styles END --> 

        <!-- Page level plugin styles START -->
        <link href="plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
        <link href="plugins/owl.carousel/assets/owl.carousel.css" rel="stylesheet">
        <!-- Page level plugin styles END -->

        <!-- Theme styles START -->
        <link href="css/pages/css/components.css" rel="stylesheet">
        <link href="css/pages/css/slider.css" rel="stylesheet">
        <link href="css/pages/css/style-shop.css" rel="stylesheet" type="text/css">
        <link href="css/corporate/css/style.css" rel="stylesheet">
        <link href="css/corporate/css/style-responsive.css" rel="stylesheet">
        <link href="css/corporate/css/themes/red.css" rel="stylesheet" id="style-color">
        <!-- Theme styles END -->
    </head>
    <!-- Head END -->

    <!-- Body BEGIN -->
    <body class="ecommerce" >

        <jsp:include page="Menu.jsp"></jsp:include>
            <!-- BEGIN SLIDER -->
            <div class="page-slider margin-bottom-35" >
                <div id="carousel-example-generic" class="carousel slide carousel-slider">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <!-- First slide -->
                        <div class="item carousel-item-four active">

                        </div>
                        <!-- Second slide -->
                        <div class="item carousel-item-five">
                            <div class="container">
                                <div class="carousel-position-four text-center">
                                </div>
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control carousel-control-shop" href="#carousel-example-generic" role="button" data-slide="prev">
                            <i class="fa fa-angle-left" aria-hidden="true"></i>
                        </a>
                        <a class="right carousel-control carousel-control-shop" href="#carousel-example-generic" role="button" data-slide="next">
                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>
            </div>
            <!-- END SLIDER -->

            <div class="main" style="overflow: auto;">
                <div class="container">
                    <!-- BEGIN SALE PRODUCT & NEW ARRIVALS -->
                    <div class="row margin-bottom-40" style="overflow: auto;">
                        <div class="sale-product" >
                            <h2 style="font-weight: 800;">Menu</h2>
                            <div class="owl-carousel owl-carousel5">
                            <c:if test="${sessionScope.LOGIN_USER.roleID == 'US'}">
                                <c:forEach items="${LIST_TEA}" var="o">
                                    <div>
                                        <div class="product-item">

                                            <form action="MainController?action=Add" method="POST">
                                                <div class="pi-img-wrapper">
                                                    <img src="${o.image}" class="img-responsive" alt="Berry Lace Dress" style="height: 200px; width: 200px">
                                                </div>
                                                <h3> ${o.name}</h3>
                                                <input type="hidden" name="cmbTea" value="${o.id}-${o.name}-${o.price}" />
                                                <div class="pi-price">${o.price}$</div>
                                                <select name="cmbQuantity" style="margin-left: 10px;">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="10">10</option>
                                                </select>

                                                <input type="submit" value="Add to card" class="btn btn-default add2cart" style="background-color: #241f4d; color: white;">

                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_USER.roleID == 'AD'}">
                                <c:forEach items="${LIST_TEA}" var="o">
                                    <div>
                                        <div class="product-item">

                                            <form action="MainController" method="POST">
                                                <div class="pi-img-wrapper">
                                                    <img src="${o.image}" class="img-responsive" alt="Berry Lace Dress" style="height: 200px; width: 200px">
                                                </div>
                                                <h3> ${o.name}</h3>
                                                <input type="hidden" name="cmbTea" value="${o.id}-${o.name}-${o.price}" />
                                                <div class="pi-price">${o.price}$</div>
                                                <select name="cmbQuantity" style="margin-left: 10px;">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="10">10</option>
                                                </select>

                                                <input type="submit" value="Add to card" class="btn btn-default add2cart" style="background-color: #241f4d; color: white;">

                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                                <c:if test="${sessionScope.LOGIN_USER == null}">
                                <c:forEach items="${LIST_TEA}" var="o">
                                    <div>
                                        <div class="product-item">

                                            <form action="MainController?action=login.html" method="POST">
                                                <div class="pi-img-wrapper">
                                                    <img src="${o.image}" class="img-responsive" alt="Berry Lace Dress" style="height: 200px; width: 200px">
                                                </div>
                                                <h3> ${o.name}</h3>
                                                <input type="hidden" name="cmbTea" value="${o.id}-${o.name}-${o.price}" />
                                                <div class="pi-price">${o.price}$</div>
                                                <select name="cmbQuantity" style="margin-left: 10px;">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="10">10</option>
                                                </select>

                                                <input type="submit" value="Add to card" class="btn btn-default add2cart" style="background-color: #241f4d; color: white;">

                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>

                        </div>
                    </div>
                    <!-- END SALE PRODUCT -->
                </div>
                <!-- END SALE PRODUCT & NEW ARRIVALS -->



            </div>        
            <!-- END TWO PRODUCTS & PROMO -->
        </div>




        <!-- BEGIN PRE-FOOTER -->
        <div class="pre-footer">
            <div class="container">
                <div class="row">
                    <!-- BEGIN BOTTOM ABOUT BLOCK -->
                    <div class="col-md-6 col-sm-6 pre-footer-col">
                        <h2>About us</h2>
                        <p>We are a website that sells unique and stylish milk tea. With our wide range in the business of providing delicious and attractive milk teas, you are sure to find a cup of milk tea to suit your taste. Here, we are committed to bringing you high quality products, from fresh ingredients and proportion to every detail.</p>
                        <p>Order online today and enjoy relaxing and sweet moments with our wonderful milk tea. Thank you for visiting our website and hope you have a pleasant shopping experience here!</p>
                    </div>
                    <!-- END BOTTOM ABOUT BLOCK -->


                    <!-- BEGIN BOTTOM CONTACTS -->
                    <div class="col-md-6 col-sm-6 pre-footer-col">
                        <h2>Our Contacts</h2>
                        <address class="margin-bottom-40">
                            Lot E2a-7, D1 Street, Hi-Tech Park, Long Thanh My Ward<br>
                            Thu Duc City, Ho Chi Minh<br>
                            Phone: 0909999999<br>
                            Email: <a href="#">tienfarm@gmail.com</a><br>
                        </address>
                    </div>
                    <!-- END BOTTOM CONTACTS -->
                </div>
                <hr>
                <div class="row">
                    <!-- BEGIN SOCIAL ICONS -->
                    <div class="col-md-6 col-sm-6">
                        <ul class="social-icons">
                            <li><a class="rss" data-original-title="rss" href="javascript:;"></a></li>
                            <li><a class="facebook" data-original-title="facebook" href="javascript:;"></a></li>
                            <li><a class="twitter" data-original-title="twitter" href="javascript:;"></a></li>
                            <li><a class="googleplus" data-original-title="googleplus" href="javascript:;"></a></li>
                            <li><a class="linkedin" data-original-title="linkedin" href="javascript:;"></a></li>
                            <li><a class="youtube" data-original-title="youtube" href="javascript:;"></a></li>
                            <li><a class="vimeo" data-original-title="vimeo" href="javascript:;"></a></li>
                            <li><a class="skype" data-original-title="skype" href="javascript:;"></a></li>
                        </ul>
                    </div>
                    <!-- END SOCIAL ICONS -->
                    <!-- BEGIN NEWLETTER -->
                    <div class="col-md-6 col-sm-6">
                        <div class="pre-footer-subscribe-box pull-right">
                            <h2>Newsletter</h2>
                            <form action="#">
                                <div class="input-group">
                                    <input type="text" placeholder="youremail@mail.com" class="form-control">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" type="submit">Subscribe</button>
                                    </span>
                                </div>
                            </form>
                        </div> 
                    </div>
                    <!-- END NEWLETTER -->
                </div>
            </div>
        </div>
        <!-- END PRE-FOOTER -->

        <!-- BEGIN FOOTER -->
        <div class="footer">
            <div class="container">
                <div class="row">
                    <!-- BEGIN COPYRIGHT -->

                    <!-- END COPYRIGHT -->


                </div>
            </div>
        </div>
        <!-- END FOOTER -->

        <!-- BEGIN fast view of a product -->
        <div id="product-pop-up" style="display: none; width: 700px;">
            <div class="product-page product-pop-up">
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-3">
                        <div class="product-main-image">
                            <img src="css/pages/img/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive">
                        </div>
                        <div class="product-other-images">
                            <a href="javascript:;" class="active"><img alt="Berry Lace Dress" src="css/pages/img/products/model3.jpg"></a>
                            <a href="javascript:;"><img alt="Berry Lace Dress" src="css/pages/img/products/model4.jpg"></a>
                            <a href="javascript:;"><img alt="Berry Lace Dress" src="css/pages/img/products/model5.jpg"></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-9">
                        <h2>Cool green dress with red bell</h2>
                        <div class="price-availability-block clearfix">
                            <div class="price">
                                <strong><span>$</span>47.00</strong>
                                <em>$<span>62.00</span></em>
                            </div>
                            <div class="availability">
                                Availability: <strong>In Stock</strong>
                            </div>
                        </div>
                        <div class="description">
                            <p>Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.</p>
                        </div>
                        <div class="product-page-options">
                            <div class="pull-left">
                                <label class="control-label">Size:</label>
                                <select class="form-control input-sm">
                                    <option>L</option>
                                    <option>M</option>
                                    <option>XL</option>
                                </select>
                            </div>
                            <div class="pull-left">
                                <label class="control-label">Color:</label>
                                <select class="form-control input-sm">
                                    <option>Red</option>
                                    <option>Blue</option>
                                    <option>Black</option>
                                </select>
                            </div>
                        </div>
                        <div class="product-page-cart">
                            <div class="product-quantity">
                                <input id="product-quantity" type="text" value="1" readonly name="product-quantity" class="form-control input-sm">
                            </div>
                            <button class="btn btn-primary" type="submit">Add to cart</button>
                            <a href="shop-item.html" class="btn btn-default">More details</a>
                        </div>
                    </div>

                    <div class="sticker sticker-sale"></div>
                </div>
            </div>
        </div>
        <!-- END fast view of a product -->

        <!-- Load javascripts at bottom, this will reduce page load time -->
        <!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
        <!--[if lt IE 9]>
        <script src="assets/plugins/respond.min.js"></script>  
        <![endif]-->
        <script src="plugins/jquery.min.js" type="text/javascript"></script>
        <script src="plugins/jquery-migrate.min.js" type="text/javascript"></script>
        <script src="plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
        <script src="css/corporate/scripts/back-to-top.js" type="text/javascript"></script>
        <script src="plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->

        <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
        <script src="plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
        <script src="plugins/owl.carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
        <script src='plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
        <script src="plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->

        <script src="css/corporate/scripts/layout.js" type="text/javascript"></script>
        <script src="css/pages/scripts/bs-carousel.js" type="text/javascript"></script>
        <script type="text/javascript">
            jQuery(document).ready(function () {
                Layout.init();
                Layout.initOWL();
                Layout.initImageZoom();
                Layout.initTouchspin();
                Layout.initTwitter();
            });
        </script>
        <!-- END PAGE LEVEL JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>
