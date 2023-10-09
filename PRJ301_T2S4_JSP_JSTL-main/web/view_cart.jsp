<%-- 
    Document   : view_cart
    Created on : Jun 15, 2023, 4:25:50 PM
    Author     : Cicca
--%>

<%@page import="sample.shopping.Tea"%>
<%@page import="sample.shopping.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart of Tien's Farm</title>
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/viewCartStyle.css">
    </head>
    <body>
        <div class="pre-header" style="margin-right: -600px;">
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
        <div class="container grid">
            <c:set var="size" value="${sessionScope.CART.cart.size()}"/>
            <c:set var="cart" value="${sessionScope.CART.cart}"/>

            <%
//                Cart cart = (Cart) session.getAttribute("CART");
//                if (cart != null) {
//                    if (cart.getCart().size() > 0) {
            %>
            <c:if test="${cart != null}">
                <c:if test="${size > 0}">
            <div class="row">
                <h1> Your cart is here !</h1>
            </div>
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>

                        <th>Edit</th>
                        <th>Remove</th>
                        <th>Total</th>
                        <th>Check out</th>
                    </tr>
                </thead>
                <tbody>
                    <%
//                        int count = 1;
//                        double total = 0;
//                        for (Tea tea : cart.getCart().values()) {
//                            total += tea.getPrice() * tea.getQuantity();
                    %>
                    <c:set var="count" value="0"/>
                    <c:forEach var="tea" items="${cart.values()}" > 
                        <c:set var="count" value="${count + 1}"/>

                <form action="MainController" method="POST">
                    <tr>
                        <td>${count}</td>
                        <td>
                            <input type="text" name="id" value="${tea.id}" />
                        </td>
                        <td>${tea.name}</td>
                        <td>${tea.price}$</td>
                        <td>
                            <input type="number" value="${tea.quantity}" min="1" name="quantity" required />
                        </td>

                        <td>
                            <input type="submit" name="action" value="Edit" class="btn"/>
                        </td>
                        <td>
                            <input type="submit" name="action" value="Remove" class="btn"/>
                        </td>
                        <td>${tea.price * tea.quantity}$</td>

                    </tr>
                </form>
                <%
//                    }
                %>
                </c:forEach>
                    
                <tr>
                    <td colspan="7">
                        <a href="shop-index.jsp">
                            Add More to Your Cart
                        </a>
                    </td>
                <form action="MainController" method="POST">
                    <td>
                        <h3>Total: ${sessionScope.CART.getTotal()}$</h3>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Checkout" class="btn"/>
                    </td>
                </form>
                </tr>
                </tbody>
            </table>




                    </c:if>
            <%
//            } else {
            %>
            <c:if test="${size <= 0}">
            <h1>Your cart is empty! Buy something, please</h1>
            <a href="shop-index.jsp">
                Add More to Your Cart
            </a></c:if>
            </c:if>
            <%
//                }
//            } else {
            %>
            <c:if test="${cart == null}">
            <h1>No cart is existed!</h1>
            <a href="shop-index.jsp">Click Here To Go Shopping</a>
            <%
//                }
            %>
            </c:if>
        </div>
    </body>
</html>
