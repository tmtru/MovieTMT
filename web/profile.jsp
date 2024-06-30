<%-- 
    Document   : profile
    Created on : Jun 18, 2024, 2:14:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="jakarta.servlet.http.Cookie,java.util.Arrays,java.util.List, java.util.ArrayList, model.movie,model.genre,model.episode,model.account, dal.MovieDAO, dal.GenreDAO, dal.EpisodeDAO, dal.AccountDAO"%>
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

                <div class="row">

                    <div class="col-md-3">
                        <form active="#" method="post">
                            <div class="profile-img">
                                <img src=${sessionScope.account.avatar} alt="" />
                            <div class="file btn btn-lg ">
                                Change Photo
                                <input type="file" name="file" />
                            </div>
                        </div>
                    </form>
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
                                    phim yêu thích</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="save-tab" data-bs-toggle="tab" data-bs-target="#save"
                                        type="button" role="tab" aria-controls="save" aria-selected="false">Xem sau</button>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content profile-tab" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div>
                                <div class="show-profile col-10">

                                    <div class="row row-profile">
                                        <div class="col-4">
                                            <label>Tên :</label>

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
                                            <label>Số điện thoại :</label>
                                        </div>
                                        <div class="col-8">
                                            <c:if test="${a.phoneNumber!=null}"><p>${a.phoneNumber}</p></c:if>
                                            <c:if test="${a.phoneNumber==null}"><p style="font-weight: lighter ">none</p></c:if>
                                            </div>
                                        </div>
                                        <div class="row row-profile">
                                            <div class="col-4">
                                                <label>Giới tính :</label>
                                            </div>
                                            <div class="col-8">
                                            <c:if test="${a.gender!=null}"><p>${a.gender}</p></c:if>
                                            <c:if test="${a.gender==null}"><p style="font-weight: lighter ">none</p></c:if>
                                            </div>
                                        </div>
                                        <div class="row row-profile">
                                            <div class="col-4">
                                                <label>Số thẻ :</label>
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
                                        <div class="d-flex mt-3">
                                            <div class="">
                                                <button class="btn btn-md btn-primary" onclick="showEditProfile()">Chỉnh sửa</button>
                                            </div>
                                        </div>   
                                    </div>
                                </div>
                            </div>
                            <div class="edit-profile">
                                <form action="editprofile" method="post" class="edit-prof col-10">

                                    <div class="row row-profile">
                                        <div class="col-4">
                                            <label>Tên :</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="text" name="name" value="${a.name}"/>
                                        </div>
                                    </div>
                                    <div class="row row-profile">
                                        <div class="col-4">
                                            <label>Email :</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="email" name="email" value="${a.email}"/>
                                        </div>
                                    </div>
                                    <div class="row row-profile">
                                        <div class="col-4">
                                            <label>Số điện thoại :</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="text" name="phone" value="${a.phoneNumber}"/>
                                        </div>
                                    </div>
                                    <div class="row row-profile">
                                        <div class="col-4">
                                            <label>Giới tính :</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="radio" id="male" name="gender" value="male" <c:if test="${a.gender eq 'male'}">checked</c:if> />
                                                <label for="male" class="me-4" >Male</label>
                                                <input type="radio" id="female" name="gender" value="female" <c:if test="${a.gender eq 'female'}">checked</c:if>/>
                                                <label for="female" class="me-4" >Female</label>
                                                <input type="radio" id="other" name="gender" value="other" <c:if test="${a.gender eq 'other'}">checked</c:if>/>
                                                <label for="other" >Khác</label>
                                            </div>
                                        </div>
                                        <div class="row row-profile">
                                            <div class="col-4">
                                                <label>Số thẻ :</label>
                                            </div>
                                            <div class="col-8">
                                                <input type="text" name="card" value="${a.cardNumber}"/>
                                        </div>
                                    </div>
                                    <div class="row row-profile">
                                        <div class="col-4">
                                            <label>Cấp thành viên :</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="text" name="access" value="${a.accessRight}" readonly=""/>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center mt-5">
                                        <div class="col-4">
                                            <button type="submit" class="btn btn-md btn-success">Lưu thay đổi</button>
                                        </div>
                                    </div>
                                </form>

                            </div>

                        </div>
                        <%
                            HttpSession session2 = request.getSession();
                            account user2 = (account) session2.getAttribute("account");
                            AccountDAO daoa = new AccountDAO();
                            String userid2 = String.valueOf(daoa.getIDbyEmail(user2.getEmail()));
                            Cookie[] cookies = request.getCookies();
                            List<String> likedMovies = new ArrayList<>();
                            List<String> savedMovies = new ArrayList<>();
                            MovieDAO daom=new MovieDAO();
                            ArrayList<movie> likedDetailMovies = new ArrayList<>();
                            ArrayList<movie> savedDetailMovies = new ArrayList<>();
                            if (cookies != null) {
                                for (Cookie cookie : cookies) {
                                    if (cookie.getName().equals(userid2+"like")) {
                                        likedMovies = new ArrayList<>(Arrays.asList(cookie.getValue().split("\\.")));
                                    }
                                    if (cookie.getName().equals(userid2+"save")) {
                                        savedMovies = new ArrayList<>(Arrays.asList(cookie.getValue().split("\\.")));
                                    }
                                }
                            }
                            for (int i=likedMovies.size()-1; i>=0;i--){
                                String id=likedMovies.get(i);
                                movie m=daom.getMovieById(id);
                                if (m!=null) likedDetailMovies.add(m);
                            }
                            for (int i=savedMovies.size()-1; i>=0;i--){
                                String id=savedMovies.get(i);
                                movie m=daom.getMovieById(id);
                                if (m!=null) savedDetailMovies.add(m);
                            }
                            request.setAttribute("likedMovies", likedDetailMovies); 
                            request.setAttribute("savedMovies", savedDetailMovies);     
                        %>

                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="movie-menu movie-no-scroll">
                                <div class="d-flex flex-wrap">
                                    <c:forEach items="${likedMovies}" var="hmv">
                                        <div class="movie-item">
                                            <div class="iq-card mb-3" >

                                                <a href="movieload?movieid=${hmv.id}" class="movie-poster">
                                                    <img src="${hmv.posterLink}" class="img-fluid rounded" alt="${hmv.title}">
                                                </a>
                                                <div class="movie-infor">
                                                    <div class="iq-card-body">
                                                        <h5 class="iq-card-title">${hmv.title}</h5>
                                                        <h7 class="iq-card-text">| Người xem: ${hmv.viewers}</h7><br/>
                                                        <h7 class="iq-card-text">| Rating: ${hmv.rating}</h7><br/>


                                                    </div>
                                                </div>
                                                <a href="movieload?movieid=${hmv.id}" class="watch-button">
                                                    <i class="fa-solid fa-play"></i>
                                                    <span>Watch Now</span>
                                                </a>
                                                <div class="title">
                                                    <h6>${hmv.title}</h6>
                                                    <span>${hmv.releaseTime}</span>
                                                </div>

                                            </div>
                                        </div>
                                    </c:forEach>


                                </div>

                            </div>

                        </div>
                        <div class="tab-pane fade" id="save" role="tabpanel" aria-labelledby="save-tab">
                            <div class="movie-menu movie-no-scroll">
                                <div class="d-flex flex-wrap">
                                    <c:forEach items="${savedMovies}" var="smv">
                                        <div class="movie-item">
                                            <div class="iq-card mb-3" >

                                                <a href="movieload?movieid=${smv.id}" class="movie-poster">
                                                    <img src="${smv.posterLink}" class="img-fluid rounded" alt="${smv.title}">
                                                </a>
                                                <div class="movie-infor">
                                                    <div class="iq-card-body">
                                                        <h5 class="iq-card-title">${smv.title}</h5>
                                                        <h7 class="iq-card-text">| Người xem: ${smv.viewers}</h7><br/>
                                                        <h7 class="iq-card-text">| Rating: ${smv.rating}</h7><br/>


                                                    </div>
                                                </div>
                                                <a href="movieload?movieid=${smv.id}" class="watch-button">
                                                    <i class="fa-solid fa-play"></i>
                                                    <span>Watch Now</span>
                                                </a>
                                                <div class="title">
                                                    <h6>${smv.title}</h6>
                                                    <span>${smv.releaseTime}</span>
                                                </div>

                                            </div>
                                        </div>
                                    </c:forEach>


                                </div>

                            </div>

                        </div>
                    </div>


                </div>

            </div>



        </div>

        <!-- footer -->
        <jsp:include page="footer.jsp" /> 



    </body>
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/profile.js"></script>
</html>
