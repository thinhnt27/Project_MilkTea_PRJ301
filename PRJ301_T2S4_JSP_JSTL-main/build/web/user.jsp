<%-- 
    Document   : user
    Created on : May 29, 2023, 4:44:10 PM
    Author     : Cicca
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/searchStyle.css">
    </head>
    <body>
        
        
    <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
        <c:redirect url="login.html"></c:redirect>
    </c:if>

    <div class="container grid">
        <div class="header row">
            <div class="welcome">
                Welcome: ${sessionScope.LOGIN_USER.fullName}
            </div>
            
            <a href="MainController?action=Logout">Logout</a>
        </div>
        <div class="header row">
            <h1>Your Profile</h1>
        </div>

        <div class="profile row">

            <div class="info">
                <div>
                    Username: ${sessionScope.LOGIN_USER.userID}
                </div>
                <div>
                    Full Name: ${sessionScope.LOGIN_USER.fullName}
                </div>
                <div>
                    Role ID: ${sessionScope.LOGIN_USER.roleID}
                </div>
                <div>
                    Password: ${sessionScope.LOGIN_USER.password}
                </div>
            </div>
            <div>
                <img src="img/avatar.jpg" alt="Avatar">
            </div>
        </div>
                <a href="MainController?action=ShoppingPage"><button type="button" class="btn btn-primary" style="margin-left: 200px; background-color: #241f4d">Back to home</button>
    </div>
</body>
</html>
