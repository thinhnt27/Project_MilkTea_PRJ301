<%-- 
    Document   : ManagerProduct
    Created on : Jul 3, 2023, 7:48:32 PM
    Author     : Cicca
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="pre-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 additional-nav">
                        <div class="list-unstyled list-inline pull-right">
                            <c:if test="${sessionScope.LOGIN_USER.roleID == 'AD'}">
                                <a href="admin.jsp" style="margin: 10px; text-decoration: none">Manager Account</a>
                                <a href="MainController?action=ManageProduct" style="margin: 10px; text-decoration: none">Manager Product</a>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_USER != null}">
                                <a href="user.jsp" style="margin: 10px; text-decoration: none">Hello ${sessionScope.LOGIN_USER.fullName}</a>
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
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
                <c:redirect url="login.html"></c:redirect>
            </c:if>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>					
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr style="color: black">

                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${LIST_PADDING}" var="o" varStatus="counter">
                            <c:set var="countPD" value="${countPD +1}"/>
                            <tr >

                                <td>${o.id}</td>
                                <td>${o.name}</td>
                                <td>
                                    <img src="${o.image}">
                                </td>
                                <td>${o.price} $</td>
                                <td>${o.quantity}</td>
                                <td>
                                    <a href="LoadProductController?pid=${o.id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="DeleteProductController?pid=${o.id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                    <ul class="pagination">
                        <c:if test="${tag != 1}">
                            <li class="page-item"><a href="ManagerProductController?index=${tag - 1}">Previous</a></li>
                            </c:if>
                            <c:forEach begin="1" end="${LAST_PAGE}" var="i">
                            <li class="page-item ${tag == i?"active":""}"><a href="ManagerProductController?index=${i}" class="page-link">${i}</a></li>
                            </c:forEach>
                            <c:if test="${tag != LAST_PAGE}">
                            <li class="page-item"><a href="ManagerProductController?index=${tag + 1}" class="page-link">Next</a></li>
                            </c:if>
                    </ul>
                </div>
            </div>

            <!--            <a href="#"><button type="button" class="btn btn-primary">Back to home</button>-->

        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="AddProductController" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title" style="color: black">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">

                            <label >Product ID</label>


                            <c:if test="${SIZE_LIST + 1 >= 10}">
                                <input name="productID" type="text" value="T${SIZE_LIST + 1}" class="form-control" readonly="">
                            </c:if>
                            <c:if test="${SIZE_LIST + 1  < 10}">
                                <input name="productID" type="text" value="T0${SIZE_LIST  + 1}" class="form-control" readonly="">
                            </c:if>
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>


                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add" style="    background-color: #44cd38;">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script src="js/manager.js" type="text/javascript"></script>
        <a href="MainController?action=ShoppingPage"><button type="button" class="btn btn-primary" style="margin-left: 200px; background-color: #241f4d">Back to home</button>
    </body>
</html>