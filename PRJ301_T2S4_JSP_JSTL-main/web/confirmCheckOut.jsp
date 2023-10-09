<%-- 
    Document   : confirmCheckOut
    Created on : Oct 20, 2021, 4:12:10 PM
    Author     : Huynh Le Thuy Tien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Check Out</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            crossorigin="anonymous"
            />
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap");
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Roboto", sans-serif;
            }
            .cart_layout_box {
                background-color: white;
                padding: 2rem 3rem;
            }
        </style>
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/confirmCheckOutStyle.css">
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
        <c:if test="${requestScope.MESSAGE_SUCCESS == null && requestScope.ERROR == null}">        
            <form action="MainController" method="POST">
                <div class="container grid" style="padding: 30px">
                    <c:set var="list" value="${sessionScope.CART}" />

                    <!-- NOT EMPTY LIST OF SELECTED ITEMS FOR CHECK-OUT -->
                    <c:if test="${not empty list}">
                        <div class="main row">
                            <h1>Check Out Your Cart</h1>
                            <div class="user-info">
                                <div class="item">
                                    <div class="title">
                                        Name *
                                    </div>
                                    <div class="box">
                                        <input type="text" name="Name" value=""
                                               class="text-box" required/> 
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="title">
                                        Address *
                                    </div>
                                    <div class="box">
                                        <input type="text" name="Adress" value="" 
                                               class="text-box" required/> 
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="title">
                                        Phone *
                                    </div>
                                    <div class="box">
                                        <input type="text" name="Phone" value="" 
                                               class="text-box" pattern="[0-9]{10}" maxlength="10" required/> 
                                    </div>
                                </div>

                            </div>


                        </c:if>
                        <div class="container grid">
                            <c:set var="size" value="${sessionScope.CART.cart.size()}"/>
                            <c:set var="cart" value="${sessionScope.CART.cart}"/>

                            <c:if test="${cart != null}">
                                <c:if test="${size > 0}">
                                    <div class="row">
                                        <h1> Confirm Order</h1>
                                    </div>
                                    <table border="1">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="count" value="0"/>
                                            <c:forEach var="tea" items="${cart.values()}" > 
                                                <c:set var="count" value="${count + 1}"/>

                                                <tr>
                                                    <td>${count}</td>
                                                    <td>
                                                        ${tea.id}
                                                    </td>
                                                    <td>${tea.name}</td>
                                                    <td>${tea.price}$</td>
                                                    <td>
                                                        ${tea.quantity}
                                                    </td>


                                                    <td>${tea.price * tea.quantity}$</td>

                                                </tr>
                                            </c:forEach>

                                            <tr>
                                                <td colspan="7">
                                                    <a href="MainController?action=View" class="btn" style="color: white">
                                                        View card again
                                                    </a>
                                                </td>
                                                <c:set var="total" value="${sessionScope.CART.getTotal()}" />
                                                <td >
                                                    <input type="hidden" name="total" value="${total}" />
                                                    <h3 style="margin: 0 10px">${sessionScope.CART.getTotal()}$</h3>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </c:if>

                            </div>
                        </div>
                    </c:if>
                    <input name="action" type="submit" value="Checkout" class="btn" />
                </div>
            </form>
        </c:if>

        <c:if test="${requestScope.MESSAGE_SUCCESS != null}">
            <div class="d-flex flex-column mt-4 align-items-center"
                 style="width: 100%">
                <h2>Checkout Successfully!</h2>
                <p>Your orderID: ${requestScope.ORDER_ID}</p>

                <a href="MainController?action=ShoppingPage"><button type="button" class="btn btn-primary" style="margin-left: 200px; background-color: #241f4d;    margin-right: 190px;">Back to home</button>
            </div>
        </c:if>
        <c:if test="${requestScope.ERROR != null}">
            <div class="d-flex flex-column mt-4 align-items-center">
                <h2>Checkout ERROR!</h2>
                <p>${requestScope.ERROR}</p>

                <a href="MainController?action=View" class="btn btn-default" style="color: red" >CHECK AGAIN</a>
            </div>
        </c:if>
        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div id="toastSuccess" class="toast bg-success" role="status" aria-live="polite" aria-atomic="true">
                <div class="toast-header">
                    <strong class="me-auto">Checkout Success</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body">
                    <p>${requestScope.MESSAGE_SUCCESS}</p>
                </div>
            </div>
        </div>
        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div id="toastFail" class="toast bg-danger" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <strong class="me-auto">Checkout Failed</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body">
                    <p>${requestScope.ERROR}</p>
                </div>
            </div>
        </div>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"
        ></script>
        <script>
            const toastSuccess = document.getElementById('toastSuccess');
            const toastFail = document.getElementById('toastFail');
            const message = '${requestScope.MESSAGE_SUCCESS}';
            const error = '${requestScope.ERROR}';
            if (message) {
                console.log(1);
                const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastSuccess);
                toastBootstrap.show();
            }
            if (error) {
                console.log(0);
                const toastBootstrapFail = bootstrap.Toast.getOrCreateInstance(toastFail);
                toastBootstrapFail.show();
            }
        </script>

    </body>
</html>
