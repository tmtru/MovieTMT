<%-- 
    Document   : header
    Created on : Jun 15, 2024, 4:05:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/aab0c35bef.js" crossorigin="anonymous"></script>
        <title>Document</title>
        <link rel="stylesheet" href="./css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="./js/main.js"></script>
    </head>
    <body>
        <c:set var="a" value="${sessionScope.account}"></c:set>
            <header id="main-header">
                <div class="main-header">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <nav class="navbar navbar-expand-lg navbar-light">
                                    <i class="fa-solid fa-bars navbar-toggler c-toggler" data-bs-toggle="offcanvas"
                                       data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                       aria-expanded="false" aria-label="Toggle navigation"></i>
                                    <a href="home" class="navbar-brand">
                                        <img src="./assets/img/logo.png" class="img-fluid logo" alt="" />
                                    </a>
                                    <div class="offcanvas offcanvas-start" style="background-color: rgb(17, 29, 82);"
                                         tabindex="-1" id="navbarSupportedContent">
                                        <div class="offcanvas-header">
                                            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"
                                                    aria-label="Close" style="background-color: rgb(250, 250, 250);"></button>
                                        </div>
                                        <div class="menu-main-menu-container offcanvas-body">
                                            <ul id="top-menu" class="navbar-nav ml-auto">
                                                <li class="menu-item ${pageContext.request.servletPath == '/home.jsp' ? 'active' : ''}"><a href="home">Trang chủ</a></li>

                                            <li class="menu-item ${pageContext.request.servletPath == '/genre.jsp' ? 'active' : ''}"><a href="classifymovies">Thể loại</a></li>
                                            <li class="menu-item"><a href="#">Shows</a></li>
                                            <li class="menu-item">
                                                <a href="#">Contact Us</a>
                                                <ul class="sub-menu">
                                                    <li class="menu-item"><a href="#">About Us</a></li>
                                                    <li class="menu-item"><a href="#">Contact</a></li>
                                                    <li class="menu-item"><a href="#">FAQ</a></li>
                                                    <li class="menu-item">
                                                        <a href="#">Privacy-Policy</a>
                                                    </li>
                                                    <li class="menu-item">
                                                        <a href="#">Pricing</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <c:if test="${sessionScope.role==1}">
                                                <li class="menu-item"><a href="./forAdmin/dashboard.jsp" style="color: orange!important;font-weight: bolder;">| For Admin</a></li>
                                                </c:if> 

                                        </ul>
                                    </div>
                                </div>
                                <div class="mobile-more-menu">
                                    <i class="fa-solid fa-ellipsis-vertical navbar-toggler c-toggler"
                                       data-bs-toggle="offcanvas" data-bs-target="#navbarMobileRight"
                                       aria-controls="navbarMobileRight" aria-expanded="false"
                                       aria-label="Toggle navigation"></i>
                                    <div class="offcanvas offcanvas-end" style="background-color: rgb(17, 29, 82);"
                                         tabindex="-1" id="navbarMobileRight">
                                        <div class="offcanvas-header">
                                            <c:if test="${a!=null}">
                                                <a href="profile.jsp" class="search-toggle user d-flex align-items-center">
                                                    <img src="${sessionScope.account.avatar}" class="img-fluid user-m rounded-circle" alt=""
                                                         style="width: 50px" />
                                                </a>
                                            </c:if>

                                            <span class="user-name" style="color:white">${sessionScope.account.name}</span>
                                            <c:if test="${a!=null && a.accessRight eq 'Normal'}">
                                                <div><a href="payment.jsp" class="payment ms-2" data-toggle="search-toggle">
                                                        Đăng kí VIP <i class="fa-solid fa-crown"></i>
                                                        <span class="bg-danger dots"></span>
                                                    </a></div>
                                                </c:if>
                                                <c:if test="${a!=null && a.accessRight eq 'Vip'}">
                                                <div class="payment ms-1">
                                                    VIP <i class="fa-solid fa-crown"></i>
                                                    <span class="bg-danger dots"></span>
                                                </div>
                                            </c:if>
                                            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"
                                                    aria-label="Close" style="background-color: rgb(250, 250, 250);"></button>

                                        </div>

                                        <div class="more-menu offcanvas-body" aria-labelledby="dropdownMenuButton">

                                            <ul class="d-flex align-items-center justify-content-end list-inline m-0">
                                                <li>

                                                    <div class="search-box iq-search-bar">
                                                        <form action="classifymovies" class="searchbox">
                                                            <div class="form-group position-relative">
                                                                <input type="text" class="text search-input font-size-12"
                                                                       name="search" placeholder="Type here to search..." />
                                                                <div class="device-search">
                                                                    <i class="search-link fa fa-search"></i>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </li>

                                                <li class="user">

                                                    <div class="iq-sub-dropdown iq-user-dropdown">
                                                        <div class="iq-card shadow-none m-0">
                                                            <div class="iq-card-body p-0 pl-3 pr-3">
                                                                <c:if test="${a!=null}">
                                                                    <a href="profile.jsp" class="iq-sub-card setting-dropdown">
                                                                        <div class="media align-items-center row g-0">
                                                                            <div class="right-icon col-2">
                                                                                <i class="fa fa-user text-primary"></i>
                                                                            </div>
                                                                            <div class="media-body ml-3 col-10">
                                                                                <h6 class="mb-0">Profile</h6>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </c:if>
                                                                <a href="#" class="iq-sub-card setting-dropdown">
                                                                    <div class="media align-items-center row g-0">
                                                                        <div class="right-icon col-2">
                                                                            <i class="fa fa-cog text-primary"></i>
                                                                        </div>
                                                                        <div class="media-body ml-3 col-10">
                                                                            <h6 class="mb-0">Settings</h6>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                                <a href="#" class="iq-sub-card setting-dropdown">
                                                                    <div class="media align-items-center row g-0">
                                                                        <div class="right-icon col-2">
                                                                            <i class="fa fa-inr text-primary"></i>
                                                                        </div>
                                                                        <div class="media-body ml-3 col-10">
                                                                            <h6 class="mb-0">Pricing Plan</h6>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                                <c:if test="${a!=null}">
                                                                    <a href="logout" class="iq-sub-card setting-dropdown">
                                                                        <div class="media align-items-center row g-0">
                                                                            <div class="right-icon col-2">
                                                                                <i class="fa fa-sign-out text-primary"></i>
                                                                            </div>
                                                                            <div class="media-body ml-3 col-10">
                                                                                <h6 class="mb-0">Logout</h6>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${a==null}">
                                                                    <a href="login.jsp" class="iq-sub-card setting-dropdown">
                                                                        <div class="media align-items-center row g-0">
                                                                            <div class="right-icon col-2">
                                                                                <i class="fa-solid fa-right-to-bracket"></i>
                                                                            </div>
                                                                            <div class="media-body ml-3 col-10">
                                                                                <h6 class="mb-0">Login</h6>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="nav-item nav-icon notify">
                                                    <a href="#" class="search-toggle ">
                                                        <i class="fa fa-bell"></i>
                                                        <span class="bg-danger dots"></span>
                                                    </a>
                                                    <div class="iq-sub-dropdown">
                                                        <div class="iq-card shadow-none m-0">
                                                            <div class="iq-card-body">
                                                                <a href="#" class="iq-sub-card">
                                                                    <div class="media row gx-3">
                                                                        <img src="./assets/img/mv-if.jpg" alt=""
                                                                             class="col-4 mr-3" />
                                                                        <div class="col-8">
                                                                            <h6 class="mb-0 mt-2">If</h6>
                                                                            <small class="font-size-12">just now</small>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                                <a href="#" class="iq-sub-card">
                                                                    <div class="media row gx-3">
                                                                        <img src="./assets/img/mv-luca.jpg" alt=""
                                                                             class="img-fluid mr-3 col-4" />
                                                                        <div class="media-body col-8">
                                                                            <h6 class="mb-0 mt-2">
                                                                                Luca
                                                                            </h6>
                                                                            <small class="font-size-12">25 mins ago</small>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                                <a href="#" class="iq-sub-card">
                                                                    <div class="media row gx-3">
                                                                        <img src="./assets/img/mv-theMarvels.jpg" alt=""
                                                                             class="img-fluid mr-3 col-4" />
                                                                        <div class="media-body col-8">
                                                                            <h6 class="mb-0 mt-2">The Marvels</h6>
                                                                            <small class="font-size-12">1h 30 mins
                                                                                ago</small>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="navbar-right menu-right">
                                    <div class="menu-main-menu-container">
                                        <ul class="d-flex align-items-center list-inline m-0">
                                            <li class="nav-item nav-icon">
                                                <form action="classifymovies" class="search-box">
                                                    <div class="form-group position-relative">
                                                        <input type="text" class="text search-input font-size-12"
                                                               name="search" placeholder="Type here to search..." />
                                                        <button type="submit" class="device-search">
                                                            <i class="fa fa-search"></i>
                                                        </button>
                                                    </div>
                                                </form>

                                            </li>
                                            <c:if test="${a!=null &&a.accessRight eq 'Normal'}">
                                                <li class="nav-item nav-icon">
                                                    <a href="payment.jsp" class="payment" data-toggle="search-toggle">
                                                        Đăng kí VIP <i class="fa-solid fa-crown"></i>
                                                        <span class="bg-danger dots"></span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <li class="nav-item nav-icon">
                                                <a href="#" class="search-toggle" data-toggle="search-toggle">
                                                    <i class="fa fa-bell p-2"></i>
                                                    <span class="bg-danger dots"></span>
                                                </a>
                                                <div class="iq-sub-dropdown iq-notify-dropdown">
                                                    <div class="iq-card shadow-none m-0">
                                                        <div class="iq-card-body">
                                                            <a href="#" class="iq-sub-card">
                                                                <div class="media row gx-3">
                                                                    <img src="./assets/img/mv-if.jpg" alt=""
                                                                         class="img-fluid col-md-4 mr-3" />
                                                                    <div class="col-md-8">
                                                                        <h6 class="mb-0 mt-2">If</h6>
                                                                        <small class="font-size-12">just now</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <a href="#" class="iq-sub-card">
                                                                <div class="media row gx-3">
                                                                    <img src="./assets/img/mv-luca.jpg" alt=""
                                                                         class="img-fluid mr-3 col-md-4" />
                                                                    <div class="media-body col-md-8">
                                                                        <h6 class="mb-0 mt-2">
                                                                            Luca
                                                                        </h6>
                                                                        <small class="font-size-12">25 mins ago</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <a href="#" class="iq-sub-card">
                                                                <div class="media row gx-3">
                                                                    <img src="./assets/img/mv-theMarvels.jpg" alt=""
                                                                         class="img-fluid mr-3 col-md-4" />
                                                                    <div class="media-body col-md-8">
                                                                        <h6 class="mb-0 mt-2">The Marvels</h6>
                                                                        <small class="font-size-12">1h 30 mins
                                                                            ago</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <c:if test="${a!=null}">
                                                <li class="nav-item nav-icon account g-4">

                                                    <a href="#" class="search-toggle d-flex align-items-center p-0">
                                                        <img src="${sessionScope.account.avatar}" class="img-fluid user-m rounded-circle"
                                                             alt="" />
                                                    </a>

                                                    <c:if test="${a!=null && a.accessRight eq 'Vip'}">

                                                        <div class="payment">
                                                            <i class="fa-solid fa-crown"></i>
                                                            <span class="bg-danger dots"></span>
                                                        </div>

                                                    </c:if>

                                                    <c:if test="${a!=null}">
                                                        <div class="iq-sub-dropdown iq-user-dropdown">
                                                            <div class="iq-card shadow-none m-0">
                                                                <div class="iq-card-body p-0 pl-3 pr-3">
                                                                    <a href="profile.jsp" class="iq-sub-card setting-dropdown">
                                                                        <div class="media align-items-center p-0 m-0 row ">
                                                                            <div class="right-icon col-sm-2">
                                                                                <i class="fa fa-user text-primary"></i>
                                                                            </div>
                                                                            <div class="media-body ml-3 col-sm-10">
                                                                                <h6 class="mb-0">Profile</h6>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <a href="#" class="iq-sub-card setting-dropdown">
                                                                        <div class="media align-items-center p-0 m-0  row ">
                                                                            <div class="right-icon col-sm-2">
                                                                                <i class="fa fa-cog text-primary"></i>
                                                                            </div>
                                                                            <div class="media-body ml-3 col-sm-10">
                                                                                <h6 class="mb-0">Settings</h6>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <a href="#" class="iq-sub-card setting-dropdown">
                                                                        <div class="media align-items-center p-0 m-0 row">
                                                                            <div class="right-icon col-sm-2">
                                                                                <i class="fa fa-inr text-primary"></i>
                                                                            </div>
                                                                            <div class="media-body ml-3 col-sm-10">
                                                                                <h6 class="mb-0">Pricing Plan</h6>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                    <c:if test="${a!=null}">
                                                                        <a href="logout" class="iq-sub-card setting-dropdown">
                                                                            <div class="media align-items-center p-0 m-0 row">
                                                                                <div class="right-icon col-sm-2">
                                                                                    <i class="fa fa-sign-out text-primary"></i>
                                                                                </div>
                                                                                <div class="media-body ml-3 col-sm-10">
                                                                                    <h6 class="mb-0">Logout</h6>
                                                                                </div>
                                                                            </div>
                                                                        </a>
                                                                    </c:if>
                                                                    <c:if test="${a==null}">
                                                                        <a href="login.jsp" class="iq-sub-card setting-dropdown">
                                                                            <div class="media align-items-center p-0 m-0 row">
                                                                                <div class="right-icon col-sm-2">
                                                                                    <i class="fa-solid fa-right-to-bracket"></i>
                                                                                </div>
                                                                                <div class="media-body ml-3 col-sm-10">
                                                                                    <h6 class="mb-0">Login</h6>
                                                                                </div>
                                                                            </div>
                                                                        </a>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </li>
                                            </c:if>
                                            <c:if test="${a!=null}">

                                                <li class="nav-item nav-icon">
                                                    <a href="logout" class="">
                                                        <i class="fa-solid fa-right-from-bracket"></i>
                                                    </a>

                                                </li>
                                            </c:if>
                                            <c:if test="${a==null}">

                                                <li class="nav-item nav-icon">
                                                    <a href="login.jsp" class="">
                                                        <i class="fa-solid fa-right-to-bracket"></i>
                                                    </a>

                                                </li>
                                            </c:if>

                                        </ul>
                                    </div>
                                </div>
                            </nav>
                            <div class="nav-overlay"></div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>
