<%-- 
    Document   : signUp
    Created on : Jul 1, 2023, 4:52:17 AM
    Author     : Cicca
--%>
<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/signUpStyle.css">
    </head>
    <body>
        <style>
            html {
                background-image: url(img/background.jpg);
                background-position: center;
                background-size: cover;
            }
        </style>
        <div class="container">
            <div class="grid">
                <div class="row">
                    <h1>Create New Account</h1>
                </div>

                <div class="main row">
                    <form action="MainController" method="POST">
                        <c:set var="errors" value="${requestScope.USER_ERROR}" />

                        <div class="item">
                            <div class="title">
                                User ID * 
                                <span class="guide">
                                    {e.g. 2 - 10 chars}
                                </span>  
                            </div>
                            <input type="text" name="userID"  class="text-box"/>

                            <c:if test="${errors.userIDError!=null}">
                                <h4 style="color: red">
                                    ${errors.userIDError}
                                </h4>
                            </c:if>


                        </div>
                        <div class="item">
                            <div class="title">
                                Full name * 
                                <span class="guide">
                                    {e.g. 5 - 20 chars}
                                </span> 
                            </div>
                            <input type="text" name="fullName" class="text-box" />

                            <c:if test="${errors.fullNameError!=null}">
                                <h4 style="color: red">
                                    ${errors.fullNameError}
                                </h4>
                            </c:if>
                        </div>
                        <div class="item">
                            <div class="title">
                                Role ID* 
                            </div>
                            <input type="text" name="roleID" value="US" class="text-box" readonly="" />
                        </div>
                        <div class="item">
                            <div class="title">
                                Password * 
                                <span class="guide">
                                    {e.g. 2 - 10 chars}
                                </span> 
                            </div>
                            <input type="password" name="password" value="" class="text-box" /> 


                        </div>

                        <div class="item">
                            <div class="title">
                                Confirm *
                            </div>
                            <input type="password" name="confirm" class="text-box" /> </br>
                            <c:if test="${errors.confirmError!=null}">
                                <h4 style="color: red">
                                    ${errors.confirmError}
                                </h4>
                            </c:if>
                        </div>




                        <div class="footer">
                            <div class="button">
                                <input type="submit" name="action" value="Create" class="btn" />
                                <input type="reset" value="Reset" class="btn" />
                            </div>

                        </div>
                    </form>
                    <div class="login">
                        <span class="text">Have already an account?</span>
                        <a href="login.html">Login here</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
