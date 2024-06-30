<%-- 
    Document   : Home
    Created on : Jun 2, 2024, 2:23:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List, java.util.ArrayList, model.movie,model.genre,model.episode, dal.MovieDAO, dal.GenreDAO, dal.EpisodeDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/aab0c35bef.js" crossorigin="anonymous"></script>
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css">

    </head>

    <body>
        <jsp:include page="header.jsp" /> 
        <!-- Slide section -->
        <div id="carouselExampleCaptions" class="carousel slide movie-slide" data-bs-ride="carousel" >
            <div class="carousel-indicators">
                <c:set var="carouselSlide" value="0" />
                <c:forEach items="${sessionScope.hbanners0}" var="hb0">
                    <c:set var="activeBar" value="${carouselSlide == 0 ? 1 : 0}" />
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${carouselSlide}"
                            <c:if test="${activeBar == 1}">
                                class="active" aria-current="true"
                            </c:if> aria-label="Slide ${carouselSlide + 1}">
                    </button>
                    <c:set var="carouselSlide" value="${carouselSlide + 1}" />
                </c:forEach>
            </div>

            <%  int carouselActive = 0;
                request.setAttribute("carouselActive", carouselActive);
            %>
            <div class="carousel-inner">
                <c:forEach items="${sessionScope.hbanners0}" var="hb0">
                    <%  int active = (carouselActive == 0) ? 1 : 0;
                        request.setAttribute("active", active);
                        carouselActive++;
                    %>
                    <div class="carousel-item ${active == 1 ? 'active' : ''}">
                        <div class="mask-image">

                            <img src="${hb0.linkImg}" class="d-block w-100" alt="..."
                                 style="max-height: 100vh; min-height: 70vh;"/>

                        </div>

                        <div class="carousel-caption d-none d-md-block movie-detail">
                            <c:forEach items="${sessionScope.hmoviesBanners0}" var="hmb0">
                                <c:if test="${hb0.movieID==hmb0.id}">
                                    <div class="title-movie">${hmb0.title}</div>
                                    <ul class="genre-menu">
                                        <c:forEach items="${hmb0.genre}" var="g">
                                            <li class="genre-item"><a href="#">${g}</a></li>
                                            </c:forEach>

                                    </ul>
                                    <p class="content-movie">${hmb0.content}</p>
                                    <a href="movieload?movieid=${hmb0.id}" class="watch-button">
                                        <i class="fa-solid fa-play"></i>
                                        <span>Watch Now</span>
                                    </a>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>

                </c:forEach>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>


        <div class="movie-popular slide-movie container-fluid">
            <h3>Phổ biến</h3>
            <button class="handle left-handle">
                <div class="text">&#8249;</div>
            </button>
            <div class="movie-menu movie-popular-menu">

                <div class="slider">
                    <c:forEach items="${sessionScope.hmoviesView}" var="hmv">
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
            <button class="handle right-handle">
                <div class="text">&#8250;</div>
            </button>
        </div>


        <div class="movie-follow slide-movie container-fluid">
            <h3>Đang theo dõi</h3>
            <button class="handle left-handle">
                <div class="text">&#8249;</div>
            </button>
            <div class="movie-menu movie-popular-menu">

                <div class="slider">
                    <div class="movie-item">
                        <div class="iq-card mb-3" >

                            <div class="movie-poster">
                                <img src="assets/img/mv-birdbox.jpg" class="img-fluid rounded" alt="...">
                            </div>
                            <div class="movie-infor">
                                <div class="iq-card-body">
                                    <h5 class="iq-card-title">Card title</h5>
                                    <p class="iq-card-text">This is a wider card with supporting text below as a natural
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
                        <div class="iq-card mb-3" >

                            <div class="movie-poster">
                                <img src="assets/img/mv-godzillavskong.jpg" class="img-fluid rounded" alt="...">
                            </div>
                            <div class="movie-infor">
                                <div class="iq-card-body">
                                    <h5 class="iq-card-title">Card title</h5>
                                    <p class="iq-card-text">This is a wider card with supporting text below as a natural
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
                        <div class="iq-card mb-3" >

                            <div class="movie-poster">
                                <img src="assets/img/mv-starwars.webp" class="img-fluid rounded" alt="...">
                            </div>
                            <div class="movie-infor">
                                <div class="iq-card-body">
                                    <h5 class="iq-card-title">Card title</h5>
                                    <p class="iq-card-text">This is a wider card with supporting text below as a natural
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

                </div>

            </div>
            <button class="handle right-handle">
                <div class="text">&#8250;</div>
            </button>
        </div>
        <div id="carouselMovieBanner" class="carousel slide movie-banner" data-bs-ride="carousel" style="margin-top: 20px;">
            <div class="carousel-indicators">
                <c:set var="carouselSlide1" value="0" />
                <c:forEach items="${sessionScope.hbanners1}" var="hb1">
                    <c:set var="activeBar1" value="${carouselSlide1 == 0 ? 1 : 0}" />
                    <button type="button" data-bs-target="#carouselMovieBanner" data-bs-slide-to="${carouselSlide1}"
                            <c:if test="${activeBar1 == 1}">
                                class="active" aria-current="true"
                            </c:if> aria-label="Slide ${carouselSlide1 + 1}">
                    </button>
                    <c:set var="carouselSlide1" value="${carouselSlide1 + 1}" />
                </c:forEach>
            </div>
            <%  int carouselActive1 = 0;
            
            %>
            <div class="carousel-inner banner1">
                <c:forEach items="${sessionScope.hbanners1}" var="hb1">
                    <%  int active1 = (carouselActive1 == 0) ? 1 : 0;
                        request.setAttribute("active1", active1);
                        carouselActive1++;
                    %>
                    <div class="carousel-item ${active1 == 1 ? 'active' : ''}">
                        <div class="mask-image">
                            <c:forEach items="${sessionScope.hmoviesBanners1}" var="hmb1">
                                <c:if test="${hb1.movieID==hmb1.id}">
                                    <a href="movieload?movieid=${hb1.movieID}">
                                        <img src="${hb1.linkImg}" class="d-block" alt="...">
                                    </a>

                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselMovieBanner" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselMovieBanner" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <div class="movie slide-movie container-fluid">
            <h3>Đánh giá cao</h3>
            <button class="handle left-handle">
                <div class="text">&#8249;</div>
            </button>
            <div class="movie-menu movie-menu">

                <div class="slider">
                    <c:forEach items="${sessionScope.hmoviesRating}" var="hmr">
                        <div class="movie-item">
                            <div class="iq-card mb-3" >

                                <a href="movieload?movieid=${hmr.id}" class="movie-poster">
                                    <img src="${hmr.posterLink}" class="img-fluid rounded" alt="${hmr.title}">
                                </a>
                                <div class="movie-infor">
                                    <div class="iq-card-body">
                                        <h5 class="iq-card-title">${hmr.title}</h5>
                                        <h7 class="iq-card-text">| Người xem: ${hmr.viewers}</h7><br/>
                                        <h7 class="iq-card-text">| Rating: ${hmr.rating}</h7><br/>


                                    </div>
                                </div>
                                <a href="movieload?movieid=${hmr.id}" class="watch-button">
                                    <i class="fa-solid fa-play"></i>
                                    <span>Watch Now</span>
                                </a>
                                <div class="title">
                                    <h6>${hmr.title}</h6>
                                    <span>${hmr.releaseTime}</span>
                                </div>

                            </div>
                        </div>
                    </c:forEach>

                </div>

            </div>
            <button class="handle right-handle">
                <div class="text">&#8250;</div>
            </button>
        </div>
        <div class="movie slide-movie container-fluid">
            <h3>Mới nhất</h3>
            <button class="handle left-handle">
                <div class="text">&#8249;</div>
            </button>
            <div class="movie-menu movie-menu">

                <div class="slider">
                    <c:forEach items="${sessionScope.hmoviesTime}" var="hmt">
                        <div class="movie-item">
                            <div class="iq-card mb-3" >

                                <a href="movieload?movieid=${hmt.id}" class="movie-poster">
                                    <img src="${hmt.posterLink}" class="img-fluid rounded" alt="${hmt.title}">
                                </a>
                                <div class="movie-infor">
                                    <div class="iq-card-body">
                                        <h5 class="iq-card-title">${hmt.title}</h5>
                                        <h7 class="iq-card-text">| Người xem: ${hmt.viewers}</h7><br/>
                                        <h7 class="iq-card-text">| Rating: ${hmt.rating}</h7><br/>


                                    </div>
                                </div>
                                <a href="movieload?movieid=${hmt.id}" class="watch-button">
                                    <i class="fa-solid fa-play"></i>
                                    <span>Watch Now</span>
                                </a>
                                <div class="title">
                                    <h6>${hmt.title}</h6>
                                    <span>${hmt.releaseTime}</span>
                                </div>

                            </div>
                        </div>
                    </c:forEach>

                </div>

            </div>
            <button class="handle right-handle">
                <div class="text">&#8250;</div>
            </button>
        </div>
        <jsp:include page="footer.jsp" /> 
    </body>
    <script src="js/main.js"></script>
</html>
