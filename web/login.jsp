<%-- 
    Document   : login
    Created on : Jun 18, 2024, 11:05:46 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link rel="stylesheet" href="./css/login.css">
    <script src="https://kit.fontawesome.com/aab0c35bef.js" crossorigin="anonymous"></script>

</head>
<body>
        <div class="form login">
            <div class="form-content">
                <div class="logo">
                    <img src="./img/Screenshot 2024-05-19 224637.png" alt="" />

                </div>
                <br/>
                <header>Login</header>
                <p class="error-login" style="color: red">${requestScope.key}</p>
                <form action="login" method="post">
                    <div class="field input-field">
                        <input type="email" name="email" placeholder="Email" class="input" value="${cookie.cemail.value}" required/>
                    </div>

                    <div class="field input-field">
                        <input type="password" name="password" placeholder="Password" value="${cookie.cpass.value}" class="password" required/>
                        <i class="fa-solid fa-eye-slash eye-icon"></i>
                    </div>
                    <input type="checkbox" 
                    ${(cookie.crem!=null?'checked':'')}
                    id="rem" name="rem" value="ON" style="margin-top:20px;">
                        <label for="rem">Remember me</label>

                    <div class="form-link">
                        <a href="#" class="forgot-pass">Forgot password?</a>
                    </div>

                    <div class="field button-field">
                        <button>Login</button>
                    </div>
                </form>

                <div class="form-link">
                    <span>Don't have an account? <a href="./signup.jsp" class="link signup-link">Signup</a></span>
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

        <!-- Signup Form -->
    <!-- JavaScript -->
    <script src="./js/login.js"></script>
</body>

</html>
