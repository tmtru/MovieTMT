<%-- 
    Document   : Home
    Created on : Jun 2, 2024, 2:23:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/aab0c35bef.js" crossorigin="anonymous"></script>
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css">
        <script src="js/main.js"></script>
    </head>

    <body>
        <jsp:include page="header.jsp" /> 
        <!-- Slide section -->
        <div id="carouselExampleCaptions" class="carousel slide movie-slide" data-bs-ride="carousel" >
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="mask-image">
                        <img src="./assets/img/mv-birdbox.jpg" class="d-block w-100" alt="..."
                             style="max-height: 100vh; min-height: 70vh;">
                    </div>

                    <div class="carousel-caption d-none d-md-block movie-detail">
                        <div class="title-movie">Bird Box</div>
                        <ul class="genre-menu">
                            <li class="genre-item"><a href="#">Kinh dị</a></li>
                            <li class="genre-item"><a href="#">Khoa học viễn tưởng</a></li>
                            <li class="genre-item"><a href="#">Tận thế</a></li>
                        </ul>
                        <p class="content-movie">Five years after an ominous unseen presence drives most of society to
                            suicide, a mother and her two children make a
                            desperate bid to reach safety. svsdvd sdfvds sfdsfgds fsdsdg
                            Five years after an ominous unseen presence drives most of society to suicide, a mother and her
                            two children make a
                            desperate bid to reach safety. svsdvd sdfvds sfdsfgds fsdsdg</p>
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
                <div class="carousel-item">
                    <div class="mask-image">

                        <img src="./assets/img/mv-strangerthings.jpg" class="d-block w-100" alt="..."
                             style="max-height: 100vh; min-height: 70vh;">
                    </div>

                    <div class="carousel-caption d-none d-md-block movie-detail">
                        <h1 class="title-movie">Stranger Things</h1>
                        <ul class="genre-menu">
                            <li class="genre-item"><a href="#">Kinh dị</a></li>
                            <li class="genre-item"><a href="#">Khoa học viễn tưởng</a></li>
                            <li class="genre-item"><a href="#">Tận thế</a></li>
                        </ul>
                        <p class="content-movie">Five years after an ominous unseen presence drives most of society to
                            suicide, a mother and her two children make a
                            desperate bid to reach safety.
                        </p>
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
                <div class="carousel-item">
                    <div class="mask-image">
                        <img src="./assets/img/Screenshot 2024-06-09 004025.png" class="d-block w-100" alt="..."
                             style="max-height: 100vh; min-height: 70vh;">
                    </div>

                    <div class="carousel-caption d-none d-md-block movie-detail">
                        <h1 class="title-movie">Minh Lan Truyện</h1>
                        <ul class="genre-menu">
                            <li class="genre-item"><a href="#">Kinh dị</a></li>
                            <li class="genre-item"><a href="#">Khoa học viễn tưởng</a></li>
                            <li class="genre-item"><a href="#">Tận thế</a></li>
                        </ul>
                        <p class="content-movie">Five years after an ominous unseen presence drives most of society to
                            suicide, a mother and her two children make a
                            desperate bid to reach safety.
                        </p>
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
            <h3>Thịnh hành</h3>
            <button class="handle left-handle">
                <div class="text">&#8249;</div>
            </button>
            <div class="movie-menu movie-popular-menu">

                <div class="slider">
                    <div class="movie-item">
                        <div class="iq-card mb-3" >

                            <a href="#" class="movie-poster">
                                <img src="assets/img/mv-birdbox.jpg" class="img-fluid rounded" alt="...">
                            </a>
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
                    <div class="movie-item">
                        <div class="iq-card mb-3" >

                            <div class="movie-poster">
                                <img src="assets/img/vd-minhlantruyen.jpg" class="img-fluid rounded" alt="...">
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
                                <img src="assets/img/mv-strangerthings.jpg" class="img-fluid rounded" alt="...">
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
                                <h6>Bird Box</h6>
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


        <div class="movie-follow slide-movie container-fluid">
            <h3>Thịnh hành</h3>
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
                <button type="button" data-bs-target="#carouselMovieBanner" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselMovieBanner" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselMovieBanner" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="mask-image">
                        <img src="./assets/img/Screenshot 2024-06-09 001841.png" class="d-block" alt="...">
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="mask-image">
                        <img src="./assets/img/Screenshot 2024-06-09 001852.png" class="d-block" alt="...">
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="mask-image">
                        <img src="./assets/img/Screenshot 2024-06-09 001900.png" class="d-block" alt="...">
                    </div>
                </div>
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
            <h3>Thịnh hành</h3>
            <button class="handle left-handle">
                <div class="text">&#8249;</div>
            </button>
            <div class="movie-menu movie-menu">

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
                    <div class="movie-item">
                        <div class="iq-card mb-3" >

                            <div class="movie-poster">
                                <img src="assets/img/vd-minhlantruyen.jpg" class="img-fluid rounded" alt="...">
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
                                <img src="assets/img/mv-strangerthings.jpg" class="img-fluid rounded" alt="...">
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
                                <h6>Bird Box</h6>
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
        <jsp:include page="footer.jsp" /> 




    </body>
<script src="js/main.js"></script>
</html>
