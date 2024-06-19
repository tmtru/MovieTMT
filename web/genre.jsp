<%-- 
    Document   : genre
    Created on : Jun 16, 2024, 4:34:41 PM
    Author     : Admin
--%>

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
                        <h3 class="sg-title">Categories</h3>
                        <input type="checkbox" id="adventure" name="adventure" value="adventure">
                        <label for="adventure">Adventure</label><br>
                        <input type="checkbox" id="action" name="action" value="action">
                        <label for="action">Action</label><br>
                        <input type="checkbox" id="animation" name="animation" value="animation">
                        <label for="animation">Animation</label><br>
                        <input type="checkbox" id="comedy" name="comedy" value="comedy">
                        <label for="comedy">Comedy</label><br>
                        <input type="checkbox" id="science" name="science" value="science">
                        <label for="science">Science Fiction</label><br>
                        <input type="checkbox" id="thriller" name="thriller" value="thriller">
                        <label for="thriller">Thriller</label><br>
                        <input type="checkbox" id="history" name="history" value="history">
                        <label for="history">History</label><br>
                        <input type="checkbox" id="documentary" name="documentary" value="documentary">
                        <label for="documentary">Documentary</label><br>
                        <input type="checkbox" id="fantasy" name="fantasy" value="fantasy">
                        <label for="fantasy">Fantasy</label><br>
                    </div>
                    <div class="sidebar-groups">
                        <h3 class="sg-title">Language</h3>
                        <input type="checkbox" id="english" name="english" value="english">
                        <label for="english">English</label><br>
                        <input type="checkbox" id="spanish" name="spanish" value="spanish">
                        <label for="spanish">Spanish</label><br>
                        <input type="checkbox" id="hindi" name="hindi" value="hindi">
                        <label for="hindi">Hindi</label><br>
                    </div>
                    <div class="sidebar-groups">
                        <h3 class="sg-title">Time</h3>
                        <input type="radio" id="morning" name="time" value="morning">
                        <label for="morning">Morning</label><br>
                        <input type="radio" id="night" name="time" value="night">
                        <label for="night">Night</label><br>
                    </div>
                    <div class="sidebar-groups">
                        <a href="#" class="btn-l btn">Apply Filters</a>
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
