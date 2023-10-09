<%-- 
    Document   : login
    Created on : Jun 28, 2023, 10:39:08 AM
    Author     : Cicca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/grid.css">  
        <link rel="stylesheet" href="css/login.css" >
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
                    <h1>Login</h1>
                </div>

                <div class="main row">
                    <form action="MainController" method="POST" id="form">
                        <div class="title">Username</div> 
                        <input type="text" name="userID"  class="text-box"/> <br/>
                        <div class="title">Password</div> 
                        <input type="password" name="password"  class="text-box"/> <br/>
                        <div class="button">
                            <div class="card_button_google"
                                 onclick="location.href = 'https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8084/PRJ301_T2S4_JSP_JSTL/GoogleController&response_type=code&client_id=438135152455-blfregrglgj23rm6r3u6adqk1b6sl15q.apps.googleusercontent.com&approval_prompt=force'">

<!--                                <span style="font-size: 13px; background-color: #241f4d; color: white; padding: 10px; border-radius: 5px;"
                                      >Login with Google</span>-->
<!--                                <input type="submit" value="Login with Google" class="btn" />-->
                                    <button type="button" class="btn btnn" >Login with Google</button>
                            </div>
                            <input type="submit" name="action" value="Login" class="btn" />
                            <input type="reset" value="Reset" class="btn" />

                        </div>
                        <div class="recapcha">
                            <div class="g-recaptcha" data-sitekey="6LdzJv8mAAAAAPCPEzh_rOcYSv7eyjHGqJC1Eyxv"></div>

                        </div>
                    </form>

                </div>
                <div class="main row" style="color: red">
                    ${requestScope.ERROR}
                </div>

                <div class="footer row">
                    <a href="MainController?action=CreatePage">Don't have account? Sign Up!</a>
                </div>
            </div>
        </div>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            const $ = document.querySelector.bind(document);
            const form = $("#form");
            form.addEventListener("submit", (event) => {
                const res = grecaptcha.getResponse();
                if (res) {
                    window.open(MainController);
                } else {
                    event.preventDefault();
                }
            })
        </script>
    </body>
</html>