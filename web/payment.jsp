<%-- 
    Document   : payment
    Created on : Jul 1, 2024, 2:02:43 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page import="jakarta.servlet.http.Cookie,java.util.List, java.util.ArrayList,java.util.Arrays,jakarta.servlet.http.HttpSession, model.movie,model.genre,model.episode, model.account, dal.AccountDAO, dal.MovieDAO, dal.GenreDAO, dal.EpisodeDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/aab0c35bef.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/payment.css">
    </head>
    <body>
    <c:set var="a" value="${sessionScope.account}"></c:set>
    <div class="container bg-light d-md-flex align-items-center">
        <a href="home.jsp" class="back"><i class="fa-solid fa-angle-left"></i> Trở về trang chủ</a>
        <div class="card box1 shadow-sm p-md-5 p-md-5 p-4">
            <div class="d-flex align-items-center justify-content-between ">
                <span class="h5 fw-bold m-0 mb-2" style="color: #ff9966">Đăng kí thành viên VIP</span>
            </div>
            <div class="fw-bolder mb-4">
                <span class="ps-1">70.000 VND</span>
            </div>
            <div class="d-flex flex-column">
                <div class="d-flex align-items-center justify-content-between text">
                    <span>Hàng tháng</span>
                    <span class="ps-1">-10%</span>
                </div>
                <div class="d-flex align-items-center justify-content-between text mb-4">
                    <span>Tổng cộng</span>
                    <span class="ps-1">63.000 VND</span>
                </div>
                <div class="border-bottom mb-4"></div>
                <div class="d-flex flex-column mb-4">
                    <span class="far fa-file-alt text"><span class="ps-2">ID:</span></span>
                    <span class="ps-3">SN8478042099</span>
                </div>
                <div class="d-flex flex-column mb-5">
                    <span class="far fa-calendar-alt text" style="margin-bottom: 10px"><span class="ps-2" style="font-size: 16px;color: #ffffff">Ưu đãi được hưởng :</span></span>
                    <span class="ps-3">> Xem trọn vẹn các tập phim hay nhất </span>
                    <span class="ps-3">> Loại bỏ quảng cáo </span>
                    <span class="ps-3">> Độc quyền phim đỉnh nhất </span>
                </div>
                <div class="d-flex align-items-center justify-content-center logo">
                    <img src="assets/img/logo.png" calss="img-fluid"/>
                </div>
            </div>
        </div>
        <div class="card box2 shadow-sm">
            <div class="d-flex align-items-center justify-content-between p-md-5 p-4">
                <span class="h5 fw-bold m-0">Phương thức thanh toán</span>
            </div>
            <ul class="nav nav-tabs mb-3 px-md-4 px-2">
                <li class="nav-item">
                    <a class="nav-link px-2 active" aria-current="page" href="#">Credit Card</a>
                </li>
            </ul>
            <div class="px-md-5 px-4 mb-4 d-flex align-items-center">
                <div class="btn btn-success me-4"><i class="fa-solid fa-plus"></i></div>
                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                    <label class="btn btn-outline-primary" for="btnradio1"><span class="pe-1">+</span>5949</label>
                    <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                    <label class="btn btn-outline-primary" for="btnradio2"><span class="lpe-1">+</span>3894</label>
                </div>
            </div>
            <form action="pay" method="post">
                <div class="row">
                    <div class="col-12">
                        <div class="d-flex flex-column px-md-5 px-4 mb-4">
                            <span>Số thẻ</span>
                            <div class="inputWithIcon">
                                <input class="form-control" type="text" value="" required="">
                                <span class="">
                                    <img src="https://www.freepnglogos.com/uploads/mastercard-png/mastercard-logo-logok-15.png" alt="">
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="d-flex flex-column ps-md-5 px-md-0 px-4 mb-4">
                            <span>Ngày hết hạn<span class="ps-1"></span></span>
                            <div class="inputWithIcon">
                                <input type="date" class="form-control" value="" required="">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="d-flex flex-column pe-md-5 px-md-0 px-4 mb-4">
                            <span>Code CVV/CVC</span>
                            <div class="inputWithIcon">
                                <input type="password" class="form-control" value="" required="">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="d-flex flex-column px-md-5 px-4 mb-4">
                            <span>Name</span>
                            <div class="inputWithIcon">
                                <input class="form-control text-uppercase" type="text" value="${a.name}" required="">
                                <span class="far fa-user"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 px-md-5 px-4 mt-3">
                        <button type="submit" class="btn btn-primary w-100">Thanh toán 63.000 VND</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
