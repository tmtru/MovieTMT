<%-- 
    Document   : signup
    Created on : Jun 18, 2024, 11:09:01 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/login.css">
        <script src="https://kit.fontawesome.com/aab0c35bef.js" crossorigin="anonymous"></script>

    </head>

    <body>


        <!-- Signup Form -->

        <div class="form signup">
            <div class="form-content">
                <div class="logo">
                    <img src="./img/Screenshot 2024-05-19 224637.png" alt="" />

                </div>
                <br/>
                <header>Signup</header>
                <p class="error-login" style="color: red">${requestScope.messError}</p>
                <form action="signup" method="post">
                    <div class="field input-field name">
                        <input type="text" name="firstname" placeholder="First Name" value="${requestScope.fname}" class="input" style="width: 47%;" required/>
                        <input type="text" name="lastname" placeholder="Last Name" value="${requestScope.lname}" class="input" style="width: 47%;" required/>
                    </div>
                    <div class="field input-field">
                        <input type="email" name="email" placeholder="Email" value="${requestScope.email}" class="input" required/>
                    </div>

                    <div class="field input-field">
                        <input type="password" name="password" placeholder="Create password" class="password" required/>
                    </div>

                    <div class="field input-field">
                        <input type="password" name="password1" placeholder="Confirm password" class="password" required/>
                        <i class='fa-solid fa-eye-slash eye-icon'></i>
                    </div>

                    <div class="field button-field">
                        <button>Signup</button>
                    </div>
                </form>

                <div class="form-link">
                    <span>Already have an account? <a href="./login.jsp" class="link login-link">Login</a></span>
                </div>
            </div>

            <div class="line"></div>

            <div class="media-options">
                <a href="#" class="field facebook">
                    <i class="fa-brands fa-facebook-f"></i>
                    <span>Login with Facebook</span>
                </a>
            </div>

            <div class="media-options">
                <a href="#" class="field google">
                    <i class="fa-brands fa-google "></i>
                    <span>Login with Google</span>
                </a>
            </div>
        </div>
        <!-- JavaScript -->
        <script src="./js/login.js"></script>
    </body>
</html>
