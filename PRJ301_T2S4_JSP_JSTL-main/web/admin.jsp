<%-- 
    Document   : admin
    Created on : Jul 1, 2023, 8:18:54 AM
    Author     : Cicca
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/searchStyle.css">
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER.roleID == 'AD'}">
            <a href="MainController?action=ManageAccount" style="margin: 10px; text-decoration: none; margin-left: 950px; font-size: 14px">Manager Account</a>
            <a href="MainController?action=ManageProduct" style="margin: 10px; text-decoration: none; font-size: 14px">Manager Product</a>
        </c:if>
        <c:if test="${sessionScope.LOGIN_USER != null}">
            <a href="MainController?action=ManageProfile" style="margin: 10px; text-decoration: none; font-size: 14px">Hello ${sessionScope.LOGIN_USER.fullName}</a>
            <c:url var="logoutLink" value="MainController">
                <c:param name="action" value="Logout"></c:param>
            </c:url>
            <a href="${logoutLink}" style="margin: 10px; text-decoration: none; font-size: 14px">Logout</a>
        </c:if>
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <a href="MainController?action=login.html" style="margin: 10px; text-decoration: none; font-size: 14px">Login</a>
        </c:if>
        <c:if test="${sessionScope.LOGIN_USER.roleID == 'US'}">

            <a href="MainController?action=Checkout" style="margin: 10px; text-decoration: none; font-size: 14px">Check out</a>
        </c:if>
        <c:set var="userLogin" value="${sessionScope.USER}" />
        <h1>Admin World! </h1>
        <div class="container grid">
            <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
                <c:redirect url="login.html"></c:redirect>
            </c:if>

            <div class="header row">
                <div class="welcome">
                    Welcome: ${sessionScope.LOGIN_USER.userID}
                </div>
                <!--                <a href="MainController?action=Logout">Logout</a>-->
                <c:url var="logoutLink" value="MainController">
                    <c:param name="action" value="Logout"></c:param>
                </c:url>
                <a href="${logoutLink}">Logout </a>

            </div>

            <div class="search row">
                <h1>Search Account</h1>
                <form action="MainController">
                    <div class="search-content">
                        Search Value
                    </div> 
                    <input type="text" name="search" value="${param.search}" class="text-box search-box" /> 
                    <input type="submit" name="action" value="Search" class="btn" />
                </form> 
            </div>



            <div class="result row">
                <c:if test="${requestScope.LIST_USER != null}">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>User ID</th>
                                <th>Full Name</th>
                                <th>Role ID</th>
                                <th>Password</th>
                                <th>Update</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${requestScope.LIST_USER}" varStatus="counter">
                            <form action="MainController" method="POST">
                                <tr>
                                    <td style="text-align: center">${counter.count}</td>
                                    <td>
                                        <input type="text" name="userID" value="${user.userID}" readonly="" />
                                    </td>
                                    <td>
                                        <input type="text" name="fullName" value="${user.fullName}" required="" />
                                    </td>    
                                    <td>
                                        <input type="text" name="roleID" value="${user.roleID}" required="" />
                                    </td>
                                    <td>${user.password}</td>
                                    <td> 
                                        <c:if test="${userLogin eq 'admin'}">
                                            <input type="submit" name="action" value="Update" class="btn"
                                                   <c:if test="${user.userID eq 'admin'}">
                                                       style="visibility: hidden"
                                                   </c:if>
                                                   />
                                            <input type="hidden" name="search" value="${param.search}"/>

                                        </c:if>
                                        <c:if test="${userLogin ne 'admin'}">
                                            <input type="submit" name="action" value="Update" class="btn" 
                                                   <c:if test="${userLogin ne user.userID}">
                                                       <c:if test="${user.roleID eq 'AD'}">
                                                           style="visibility: hidden" 
                                                       </c:if>
                                                   </c:if>
                                                   />
                                            <input type="hidden" name="search" value="${param.search}" />
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:url var="removeLink" value="MainController">
                                            <c:param name="action" value="Delete"></c:param>
                                            <c:param name="userID" value="${user.userID}"></c:param>
                                            <c:param name="search" value="${param.search}"></c:param>
                                        </c:url>
                                        <c:if test="${userLogin eq 'admin'}">
                                            <c:if test="${user.userID ne 'admin'}">
                                                <a href="${removeLink}" class="delete">Delete</a>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${userLogin ne 'admin'}">
                                            <c:if test="${user.roleID eq 'US'}">
                                                <a href="${removeLink}" class="delete">Delete</a>
                                            </c:if>   
                                        </c:if>

                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>

                </c:if>
                <!--                    <h2>No record is matched!!!</h2>-->

            </div>
            <a href="MainController?action=ShoppingPage"><button type="button" class="btn btn-primary" style="margin: 10px;">Back to home</button>
        </div>

        ${requestScope.ERROR}
    </body>
</html>
