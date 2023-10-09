<%-- 
    Document   : Menu
    Created on : Jul 3, 2023, 8:48:26 PM
    Author     : Cicca
--%>
<%@page import="sample.shopping.Tea"%>
<%@page import="sample.shopping.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="pre-header">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 additional-nav">
                <div class="list-unstyled list-inline pull-right">
                    <c:if test="${sessionScope.LOGIN_USER.roleID == 'AD'}">
                        <a href="MainController?action=ManageAccount" style="margin: 10px; text-decoration: none">Manager Account</a>
                        <a href="MainController?action=ManageProduct" style="margin: 10px; text-decoration: none">Manager Product</a>
                    </c:if>
                    <c:if test="${sessionScope.LOGIN_USER != null}">
                        <a href="MainController?action=ManageProfile" style="margin: 10px; text-decoration: none">Hello ${sessionScope.LOGIN_USER.fullName}</a>
                        <c:url var="logoutLink" value="MainController">
                            <c:param name="action" value="Logout"></c:param>
                        </c:url>
                        <a href="${logoutLink}" style="margin: 10px; text-decoration: none">Logout</a>
                    </c:if>
                    <c:if test="${sessionScope.LOGIN_USER == null}">
                        <a href="MainController?action=login.html" style="margin: 10px; text-decoration: none">Login</a>
                    </c:if>
                        <c:if test="${sessionScope.LOGIN_USER.roleID == 'US'}">
                            
                            <a href="MainController?action=Checkout" style="margin: 10px; text-decoration: none">Check out</a>
                        </c:if>

                </div>
            </div>
            <!-- END TOP BAR MENU -->
        </div>
    </div>        
</div>
<!-- END TOP BAR -->

<!-- BEGIN HEADER -->
<div class="header">
    <div class="container">
        <a class="site-logo" href="#"><img src="css/corporate/img/logos/logo.png" alt="MilkTea" style="width: 250px; height: 90px; margin-top: -20px;"></a>

        <a href="javascript:void(0);" class="mobi-toggler"><i class="fa fa-bars"></i></a>

        <!-- BEGIN CART -->
        <c:if test="${sessionScope.LOGIN_USER.roleID != 'AD' && sessionScope.LOGIN_USER != null}">
            <div class="top-cart-block" style="margin-left: 20px">
                <div class="top-cart-info" style="visibility: hidden">


                </div>
                <i class="fa fa-shopping-cart" style="background-color: #241f4d"></i>

                <div class="top-cart-content-wrapper">
                    <div class="top-cart-content">
                        <ul class="scroller" style="height: 250px;">

                            <li>
                                <c:if test="${sessionScope.CART_SIZE > 0}">
                                <%
                                    Cart cart = (Cart) session.getAttribute("CART");
                                    if (cart != null) {
                                        if (cart.getCart().size() >= 0) {
                                            int count = 1;
                                            double total = 0;
                                            for (Tea tea : cart.getCart().values()) {
                                                total += tea.getPrice() * tea.getQuantity();

                                %>
                                <strong><a href="#"><%= tea.getName()%></a></strong>
                                <span class="cart-content-count">x <%= tea.getQuantity()%></span>
                                <em><%= tea.getPrice() * tea.getQuantity()%>$</em>
                            </li>
                            <%
                                        }
                                    }
                                }
                            %>

                            </c:if>


                        </ul>
                        <div class="text-right">
                            <c:if test="${sessionScope.LOGIN_USER.roleID == 'US'}">
                                <a href="MainController?action=View" class="btn btn-default" >View Cart</a>
                            </c:if>



                        </div>
                    </div>
                </div>            
            </div>
        </c:if>
        <!--END CART -->
        <!--                BEGIN TOP SEARCH -->
        <div class="menu-search">
            <span class="sep"></span>
            <!--                    <i class="fa fa-search search-btn"></i>-->
            <div class="search-box" style="margin-top: 30px;">
                <form action="MainController">
                    <div class="input-group" >
                        <input type="text" name="search" value="${param.search}" placeholder="Search" class="form-control">
                        <span class="input-group-btn">
                            <input type="submit" name="action" value="search" class="btn btn-primary" style="background-color: #241f4d" />

                        </span>
                    </div>
                </form>
            </div> 
        </div><!--
         END TOP SEARCH 
        -->      
    </div>
</div>
<!-- Header END -->