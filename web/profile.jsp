<%-- 
    Document   : profile
    Created on : Jun 18, 2024, 2:14:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/profile.css">
        <script src="js/main.js"></script>
    </head>

    <body>
        <jsp:include page="header.jsp" /> 
        <!-- Profile section -->
        <c:set var="a" value="${sessionScope.account}"></c:set>
            <div class="profile" style="margin-top:150px">
                <form active="#" method="post">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="profile-img">
                                <img src=${sessionScope.account.avatar} alt="" />
                                <div class="file btn btn-lg ">
                                    Change Photo
                                    <input type="file" name="file" />
                                </div>
                            </div>
                        </div>
                        <div class="profile-details col-md-9">
                            <div class="profile-head">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab"
                                                data-bs-target="#home" type="button" role="tab" aria-controls="home"
                                                aria-selected="true">Hồ sơ</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile"
                                                type="button" role="tab" aria-controls="profile" aria-selected="false">Danh sách
                                            theo dõi</button>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content profile-tab" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="show-profile">

                                        <div class="row row-profile">
                                            <div class="col-4">
                                                <label>Name :</label>

                                            </div>
                                            <div class="col-8">
                                                <p>${a.name}</p>
                                        </div>
                                    </div>
                                    <div class="row row-profile">
                                        <div class="col-4">
                                            <label>Email :</label>
                                        </div>
                                        <div class="col-8">
                                            <p>${a.email}</p>
                                        </div>
                                    </div>
                                    <div class="row row-profile">
                                        <div class="col-4">
                                            <label>Phone Number :</label>
                                        </div>
                                        <div class="col-8">
                                            <c:if test="${a.phoneNumber!=null}"><p>${a.phoneNumber}</p></c:if>
                                            <c:if test="${a.phoneNumber==null}"><p style="font-weight: lighter ">none</p></c:if>
                                            </div>
                                        </div>
                                        <div class="row row-profile">
                                            <div class="col-4">
                                                <label>Gender :</label>
                                            </div>
                                            <div class="col-8">
                                            <c:if test="${a.gender!=null}"><p>${a.gender}</p></c:if>
                                            <c:if test="${a.gender==null}"><p style="font-weight: lighter ">none</p></c:if>
                                            </div>
                                        </div>
                                        <div class="row row-profile">
                                            <div class="col-4">
                                                <label>Card Number :</label>
                                            </div>
                                            <div class="col-8">
                                            <c:if test="${a.cardNumber!=null}"><p>${a.cardNumber}</p></c:if>
                                            <c:if test="${a.cardNumber==null}"><p style="font-weight: lighter ">none</p></c:if>

                                            </div>
                                        </div>
                                        <div class="row row-profile">
                                            <div class="col-4">
                                                <label>Cấp thành viên :</label>
                                            </div>
                                            <div class="col-8">
                                                <p>${a.accessRight}</p>
                                        </div>
                                    </div>

                                </div>
                                <div class="edit-profile">
                                    <form action="#" method="post">
                                        <div class="row row-profile">
                                            <div class="col-4">
                                                <label>User Id :</label>
                                            </div>
                                            <div class="col-8">
                                                <input type="text" placeholder="?" name="username">
                                            </div>
                                        </div>
                                        <div class="row row-profile">
                                            <div class="col-4">
                                                <label>Name :</label>

                                            </div>
                                            <div class="col-8">
                                                <input type="text" placeholder="?" name="firstname">
                                                <input type="text" placeholder="?" name="lastname">
                                            </div>
                                        </div>
                                        <div class="row row-profile">
                                            <div class="col-4">
                                                <label>Email :</label>
                                            </div>
                                            <div class="col-8">
                                                <input type="email" placeholder="?" name="email">
                                            </div>
                                        </div>
                                        <div class="row row-profile">
                                            <div class="col-4">
                                                <label>Phone Number :</label>
                                            </div>
                                            <div class="col-8">
                                                <input type="text" placeholder="?" name="phone">
                                            </div>
                                        </div>
                                        <div class="row row-profile">
                                            <div class="col-4">
                                                <label>Gender :</label>
                                            </div>
                                            <div class="col-8">
                                                <div class="row">
                                                    <div class="col-4">
                                                        <input type="radio" id="html" name="gender" value="male">
                                                        <label for="html">Male</label>
                                                    </div>
                                                    <div class="col-4">
                                                        <input type="radio" id="css" name="gender" value="female">
                                                        <label for="css">Female</label>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <button type="submit"  class="btn">Save</button>

                                    </form>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <div class="movie-menu movie-no-scroll">
                                    <div class="d-flex flex-wrap">
                                        <div class="movie-item">
                                            <div class="iq-card mb-3">

                                                <div class="movie-poster">
                                                    <img src="assets/img/mv-birdbox.jpg" class="img-fluid rounded"
                                                         alt="...">
                                                </div>
                                                <div class="movie-infor">
                                                    <div class="iq-card-body">
                                                        <h6 class="iq-card-title">Card title</h6>
                                                        <p class="iq-card-text">
                                                            content. This content is a little bit longer.</p>

                                                        <a href="#" class="review-button">
                                                            <i class="fa-solid fa-comment"></i>
                                                            <span>Review</span>
                                                        </a>
                                                        <a href="#" class="watch-button">
                                                            <i class="fa-solid fa-play"></i>
                                                            <span>Watch Now</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="title">
                                                    <h6>Bird Box</h6>
                                                    <span>Oc 5 2024</span>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="movie-item">
                                            <div class="iq-card mb-3">

                                                <div class="movie-poster">
                                                    <img src="assets/img/mv-godzillavskong.jpg" class="img-fluid rounded"
                                                         alt="...">
                                                </div>
                                                <div class="movie-infor">
                                                    <div class="iq-card-body">
                                                        <h6 class="iq-card-title">Card title</h6>
                                                        <p class="iq-card-text">This is a wider card with supporting text
                                                            below as a natural
                                                            lead-in to additional
                                                            content. This content is a little bit longer.</p>

                                                        <a href="#" class="review-button">
                                                            <i class="fa-solid fa-comment"></i>
                                                            <span>Review</span>
                                                        </a>
                                                        <a href="#" class="watch-button">
                                                            <i class="fa-solid fa-play"></i>
                                                            <span>Watch Now</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="title">
                                                    <h6>Godzilla VS Kong</h6>
                                                    <span>Oc 5 2024</span>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="movie-item">
                                            <div class="iq-card mb-3">

                                                <div class="movie-poster">
                                                    <img src="assets/img/mv-starwars.webp" class="img-fluid rounded"
                                                         alt="...">
                                                </div>
                                                <div class="movie-infor">
                                                    <div class="iq-card-body">
                                                        <h6 class="iq-card-title">Card title</h6>
                                                        <p class="iq-card-text">This is a wider card with supporting text
                                                            below as a natural
                                                            lead-in to additional
                                                            content. This content is a little bit longer.</p>

                                                        <a href="#" class="review-button">
                                                            <i class="fa-solid fa-comment"></i>
                                                            <span>Review</span>
                                                        </a>
                                                        <a href="#" class="watch-button">
                                                            <i class="fa-solid fa-play"></i>
                                                            <span>Watch Now</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="title">
                                                    <h6>Godzilla VS Kong</h6>
                                                    <span>Oc 5 2024</span>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="movie-item">
                                            <div class="iq-card mb-3">

                                                <div class="movie-poster">
                                                    <img src="assets/img/vd-minhlantruyen.jpg" class="img-fluid rounded"
                                                         alt="...">
                                                </div>
                                                <div class="movie-infor">
                                                    <div class="iq-card-body">
                                                        <h6 class="iq-card-title">Card title</h6>
                                                        <p class="iq-card-text">This is a wider card with supporting text
                                                            below as a natural
                                                            lead-in to additional
                                                            content. This content is a little bit longer.</p>

                                                        <a href="#" class="review-button">
                                                            <i class="fa-solid fa-comment"></i>
                                                            <span>Review</span>
                                                        </a>
                                                        <a href="#" class="watch-button">
                                                            <i class="fa-solid fa-play"></i>
                                                            <span>Watch Now</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="title">
                                                    <h6>Godzilla VS Kong</h6>
                                                    <span>Oc 5 2024</span>
                                                </div>


                                            </div>
                                        </div>
                                        <div class="movie-item">
                                            <div class="iq-card mb-3">

                                                <div class="movie-poster">
                                                    <img src="assets/img/mv-strangerthings.jpg" class="img-fluid rounded"
                                                         alt="...">
                                                </div>
                                                <div class="movie-infor">
                                                    <div class="iq-card-body">
                                                        <h6 class="iq-card-title">Card title</h6>
                                                        <p class="iq-card-text">This is a wider card with supporting text
                                                            below as a natural
                                                            lead-in to additional
                                                            content. This content is a little bit longer.</p>

                                                        <a href="#" class="review-button">
                                                            <i class="fa-solid fa-comment"></i>
                                                            <span>Review</span>
                                                        </a>
                                                        <a href="#" class="watch-button">
                                                            <i class="fa-solid fa-play"></i>
                                                            <span>Watch Now</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="title">
                                                    <h6>Godzilla VS Kong</h6>
                                                    <span>Oc 5 2024</span>
                                                </div>


                                            </div>
                                        </div>
                                        <div class="movie-item">
                                            <div class="iq-card mb-3">

                                                <div class="movie-poster">
                                                    <img src="assets/img/mv-birdbox.jpg" class="img-fluid rounded"
                                                         alt="...">
                                                </div>
                                                <div class="movie-infor">
                                                    <div class="iq-card-body">
                                                        <h6 class="iq-card-title">Card title</h6>
                                                        <p class="iq-card-text">This is a wider card with supporting text
                                                            below as a natural
                                                            lead-in to additional
                                                            content. This content is a little bit longer.</p>

                                                        <a href="#" class="review-button">
                                                            <i class="fa-solid fa-comment"></i>
                                                            <span>Review</span>
                                                        </a>
                                                        <a href="#" class="watch-button">
                                                            <i class="fa-solid fa-play"></i>
                                                            <span>Watch Now</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="title">
                                                    <h6>Bird Box</h6>
                                                    <span>Oc 5 2024</span>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="movie-item">
                                            <div class="iq-card mb-3">

                                                <div class="movie-poster">
                                                    <img src="assets/img/mv-godzillavskong.jpg" class="img-fluid rounded"
                                                         alt="...">
                                                </div>
                                                <div class="movie-infor">
                                                    <div class="iq-card-body">
                                                        <h6 class="iq-card-title">Card title</h6>
                                                        <p class="iq-card-text">This is a wider card with supporting text
                                                            below as a natural
                                                            lead-in to additional
                                                            content. This content is a little bit longer.</p>

                                                        <a href="#" class="review-button">
                                                            <i class="fa-solid fa-comment"></i>
                                                            <span>Review</span>
                                                        </a>
                                                        <a href="#" class="watch-button">
                                                            <i class="fa-solid fa-play"></i>
                                                            <span>Watch Now</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="title">
                                                    <h6>Bird Box</h6>
                                                    <span>Oc 5 2024</span>
                                                </div>

                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>

                    </div>

                </div>


            </form>
        </div>

        <!-- footer -->
        <jsp:include page="footer.jsp" /> 



    </body>
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap.min.js"></script>
</html>
