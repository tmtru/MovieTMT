<%-- 
    Document   : genre
    Created on : Jun 16, 2024, 4:34:41 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page import="jakarta.servlet.http.Cookie,java.util.List, java.util.ArrayList,java.util.Arrays,jakarta.servlet.http.HttpSession, model.movie,model.genre,model.episode, model.account, dal.AccountDAO, dal.MovieDAO, dal.GenreDAO, dal.EpisodeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://kit.fontawesome.com/aab0c35bef.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/genre.css">
        <script src="js/main.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <section class="main-container">

                <div class="sidebar">
                    <form action="#">
                        <div class="sidebar-groups">
                        <% 
                            GenreDAO dao1=new GenreDAO();
                            ArrayList<genre> genres=dao1.getAllGenres();
                            request.setAttribute("genres", genres);
                        %>
                        <h3 class="sg-title">Bạn muốn xem...</h3>
                        <div class="search-box">
                            <div class="form-group position-relative d-flex justify-content-end">
                                <input type="text" class="text search-input font-size-12"
                                       placeholder="Type here to search..." />
                                <button type="submit" class="search-toggle device-search ">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                        <div class="accordion" id="accordionPanelsStayOpenExample" data-bs-theme="dark">
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                                        Thể loại
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse">
                                    <div class="accordion-body">
                                        <div class="sidebar-groups-content d-flex flex-wrap">
                                            <c:forEach var="genre" items="${genres}">
                                                <p class="genre-item" style="font-size: 14px;"><a href="#">${genre.genreName}</a></p>
                                                </c:forEach>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                                        Quốc gia
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
                                    <div class="accordion-body">
                                        <div class="sidebar-groups-content d-flex flex-wrap">
                                            <p class="genre-item" style="font-size: 14px;"><a href="#">Việt Nam</a></p>
                                            <p class="genre-item" style="font-size: 14px;"><a href="#">Hàn Quốc</a></p>
                                            <p class="genre-item" style="font-size: 14px;"><a href="#">Trung Quốc</a></p>
                                            <p class="genre-item" style="font-size: 14px;"><a href="#">Nhật Bản</a></p>
                                            <p class="genre-item" style="font-size: 14px;"><a href="#">Âu Mỹ</a></p>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                                        Accordion Item #3
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse">
                                    <div class="accordion-body">
                                        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </form>
            </div>

            <div class="movies-container">
                <div class="more-choice-genre d-flex">
                    <select class="form-select me-5" aria-label="Default select example">
                        <option selected>Language</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                    <select class="form-select me-5" aria-label="Default select example">
                        <option selected>Year</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>

                </div>

                <div class="container-fluid">
                    <div class="top-movie row">
                        <div class="left-bar-movie col-lg-8">
                            <div class="upcoming-img-box">
                                <img class="" src="./assets/img/vd-minhlantruyen.jpg" alt="" />
                                <p class="upcoming-title">Top 1 Rating</p>
                                <div class="buttons">
                                    <a href="#" class="btn">Review</a>
                                    <a href="#" class="btn-alt btn">Play Trailer</a>
                                </div>
                            </div>
                        </div>
                        <div class="right-bar-movie col-lg-4">
                            <div class="current-movies row">
                                <div class="upcoming-img-box">
                                    <img class="" src="./assets/img/mv-godzillavskong.jpg" alt="" />
                                    <p class="upcoming-title">Top 2</p>
                                    <div class="buttons">
                                        <a href="#" class="xbtn">Detail</a>
                                        <a href="#" class="xbtn-alt xbtn"><i class="fa-solid fa-play"></i>
                                            <span>Play</span></a>
                                    </div>
                                </div>
                            </div>
                            <div class="current-movies row">
                                <div class="upcoming-img-box">
                                    <img class="" src="./assets/img/mv-godzillavskong.jpg" alt="" />
                                    <p class="upcoming-title">Top 3</p>
                                    <div class="buttons">
                                        <a href="#" class="xbtn">Detail</a>
                                        <a href="#" class="xbtn-alt xbtn"><i class="fa-solid fa-play"></i>
                                            <span>Play</span></a>
                                    </div>
                                </div>

                            </div>

                        </div>


                    </div>
                </div>
                <div class="movie-menu movie-no-scroll">
                    <div class="d-flex">
                        <div class="movie-item">
                            <div class="iq-card mb-3">

                                <div class="movie-poster">
                                    <img src="assets/img/mv-birdbox.jpg" class="img-fluid rounded" alt="...">
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
                                    <img src="assets/img/mv-godzillavskong.jpg" class="img-fluid rounded" alt="...">
                                </div>
                                <div class="movie-infor">
                                    <div class="iq-card-body">
                                        <h6 class="iq-card-title">Card title</h6>
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
                            <div class="iq-card mb-3">

                                <div class="movie-poster">
                                    <img src="assets/img/mv-starwars.webp" class="img-fluid rounded" alt="...">
                                </div>
                                <div class="movie-infor">
                                    <div class="iq-card-body">
                                        <h6 class="iq-card-title">Card title</h6>
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
                            <div class="iq-card mb-3">

                                <div class="movie-poster">
                                    <img src="assets/img/vd-minhlantruyen.jpg" class="img-fluid rounded" alt="...">
                                </div>
                                <div class="movie-infor">
                                    <div class="iq-card-body">
                                        <h6 class="iq-card-title">Card title</h6>
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
                            <div class="iq-card mb-3">

                                <div class="movie-poster">
                                    <img src="assets/img/mv-strangerthings.jpg" class="img-fluid rounded" alt="...">
                                </div>
                                <div class="movie-infor">
                                    <div class="iq-card-body">
                                        <h6 class="iq-card-title">Card title</h6>
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
                            <div class="iq-card mb-3">

                                <div class="movie-poster">
                                    <img src="assets/img/mv-birdbox.jpg" class="img-fluid rounded" alt="...">
                                </div>
                                <div class="movie-infor">
                                    <div class="iq-card-body">
                                        <h6 class="iq-card-title">Card title</h6>
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
                            <div class="iq-card mb-3">

                                <div class="movie-poster">
                                    <img src="assets/img/mv-godzillavskong.jpg" class="img-fluid rounded" alt="...">
                                </div>
                                <div class="movie-infor">
                                    <div class="iq-card-body">
                                        <h6 class="iq-card-title">Card title</h6>
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

                    </div>

                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"/>
    </body>
    <script src="js/main.js"></script>
</html>
