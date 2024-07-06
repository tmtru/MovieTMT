<%-- 
    Document   : movie
    Created on : Jun 26, 2024, 10:58:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page import="jakarta.servlet.http.Cookie,java.util.List, java.util.ArrayList,java.util.Arrays,jakarta.servlet.http.HttpSession, model.movie,model.genre,model.episode, model.account, dal.AccountDAO, dal.MovieDAO, dal.GenreDAO, dal.EpisodeDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/aab0c35bef.js" crossorigin="anonymous"></script>
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/movie.css">

    </head>

    <body>
        <jsp:include page="header.jsp" /> 
        <!-- Movie video section -->
        <c:set var="m" value="${sessionScope.watchingmovie}"/>
        <c:set var="weps" value="${sessionScope.watchingeps}"/>
        <c:choose>
            <c:when test="${empty weps || weps eq ''}">
                <c:set var="wep" value=""/>
            </c:when>
            <c:otherwise>
                <c:set var="wep" value="${weps.get(param.ep)}"/>
            </c:otherwise>
        </c:choose>

        <c:set var="cms" value="${sessionScope.watchingmoviecomment}"/>
        <c:set var="acc" value="${sessionScope.account}"/>
        <div class="container-fluid movie">
            <div class="movie-video">
                <c:choose>
                    <c:when test="${empty wep || wep eq ''}">
                        <img src="${m.posterLink}" class="img-fluid"/>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${wep.accessType eq 'Free'}">
                        <iframe src="${wep.linkEp}${!wep.linkEp.contains('youtube') ? '?&loop=1&autoplay=1&muted=1' : ''}"
                                allow="autoplay; fullscreen" allowfullscreen></iframe>
                                </c:if>
                        <c:if test="${wep.accessType eq 'Paid' && (acc.accessRight eq 'Vip' || acc.accessRight eq 'Full')}">
                        <iframe src="${wep.linkEp}${!wep.linkEp.contains('youtube') ? '?&loop=1&autoplay=1&muted=1' : ''}"
                                allow="autoplay; fullscreen" allowfullscreen></iframe>
                                </c:if>
                        <c:if test="${wep.accessType eq 'Paid' && acc.accessRight eq 'Normal'}">
                            
                            <div class="message-for-vip-ep">
                                <p>Vui lòng đăng kí thành viên VIP để có thể xem tiếp</p>
                                <a href="payment.jsp" class="payment" data-toggle="search-toggle">
                                                        Đăng kí VIP <i class="fa-solid fa-crown"></i>
                                                        <span class="bg-danger dots"></span>
                                                    </a>
                            
                            </div>
                        
                        </c:if>
                        </c:otherwise>
                    </c:choose>

            </div>
            <div class="movie-details">
                <div class="movie-title">
                    <c:if test="${wep !=null}"><h4 class="mb-3">${wep.name}</h4></c:if>
                    <h3>${m.title}</h3>
                    <span class="views me-5" style="color: #cccccc">${m.viewers} lượt xem</span>
                    <span class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </span>
                    <p class="content mt-4">
                        ${m.content}
                    </p>


                </div>
                <%
                    HttpSession session2 = request.getSession();
                    movie movie2 = (movie) session2.getAttribute("watchingmovie");
                    account user2 = (account) session2.getAttribute("account");
                    AccountDAO daoa = new AccountDAO();
                    String userid2 = String.valueOf(daoa.getIDbyEmail(user2.getEmail()));
                    String movieid2 = movie2.getId();
                    Cookie[] cookies = request.getCookies();
                    List<String> followedMovies = new ArrayList<>();
                    boolean isLiked = false;
                    boolean isSaved = false;
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals(userid2+"like")) {
                                followedMovies = new ArrayList<>(Arrays.asList(cookie.getValue().split("\\.")));
                                
                                if (followedMovies.contains(String.valueOf(movieid2))) {
                                    isLiked = true;
                                }
                            }
                            if (cookie.getName().equals(userid2+"save")) {
                                followedMovies = new ArrayList<>(Arrays.asList(cookie.getValue().split("\\.")));
                                
                                if (followedMovies.contains(String.valueOf(movieid2))) {
                                    isSaved = true;
                                }
                            }
                        }
                    }
                    request.setAttribute("isLiked", isLiked); 
                    request.setAttribute("isSaved", isSaved);     
                %>
                <c:set var="like" value="${isLiked == false ? 'select' : ''}"/>
                <c:set var="unlike" value="${isLiked == true? 'select' : ''}"/>
                <c:set var="save" value="${isSaved == false ? 'select' : ''}"/>
                <c:set var="unsave" value="${isSaved == true? 'select' : ''}"/>
                <div class="more-infor mt-5">
                    <div class="actions d-flex ">

                        <a href="movielike?action=like" class="icons like"><i class="fa-regular fa-heart ${unlike}"></i><i class="fa-solid fa-heart ${like}"
                                                                                                                           style="color:rgb(98, 136, 218)"></i><span>Thích</span></a>

                        <a href="movielike?action=save" class="icons save"><i class="fa-regular fa-clock ${unsave}"></i><i class="fa-solid fa-clock ${save}"
                                                                                                                           style="color:rgb(98, 136, 218)"></i><span>Xem sau</span></a> 
                        <div class="icons non-action share"><i class="fa fa-share"></i><span>Chia sẻ</span></div>
                    </div>
                    <p class="actor">
                        <span style="font-weight: bold;">Diễn viên:</span> ${m.actor}
                    </p>
                    <p class="director">
                        <span style="font-weight: bold;">Đạo diễn:</span> ${m.director}
                    </p>
                    <p class="genres">
                        <span style="font-weight: bold;">Thể loại:</span> 
                        <c:forEach var="genre" items="${m.genre}" varStatus="status">
                            ${genre}<c:if test="${!status.last}">, </c:if><c:if test="${status.last}">.</c:if>
                        </c:forEach>
                    </p>
                </div>

            </div>


        </div>



        <div class="movie-eps slide-movie container-fluid">
            <h3>Danh sách tập</h3>
            <button class="handle left-handle">
                <div class="text">&#8249;</div>
            </button>
            <div class="movie-menu movie-eps-menu">
                <div class="slider">
                    <c:forEach var="e" items="${weps}">
                        <c:set var="query" value="${pageContext.request.queryString}"/>
                        <c:set var="queryep" value="${fn:substringAfter(query,'ep=')}"/>

                        <c:choose>
                            <c:when test="${e.chapterID==queryep}">
                                <div class="movie-item active">
                                </c:when>
                                <c:otherwise>
                                    <div class="movie-item">
                                    </c:otherwise>
                                </c:choose>
                                <div class="iq-card mb-3">
                                    <a href="movieload?ep=${e.chapterID}" class="movie-poster">
                                        <img src="${e.thumbnail}" class="img-fluid"/>
                                        <c:if test="${e.accessType eq 'Paid'}"><div class="vip-ep">VIP</div></c:if>
                                    </a>
                                    <div class="movie-infor">
                                        <div class="iq-card-body">
                                            <a href="movieload?ep=${e.chapterID}" class="play-button">
                                                <i class="fa-solid fa-play"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="title mt-2">
                                        <p class="" style="font-size: 17px">${e.name}</p>
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
            <div class="container-fluid mt-5 mb-5 comment-section">

                <div class="row d-flex ">

                    <div class="col-lg-7">

                        <div class="comment-card">

                            <div class="">

                                <h4>Comments</h4>

                            </div>
                            <form id="commentForm" action="historyload?movieid=${m.id}" method="post">
                                <div class="mt-3 d-flex flex-row p-3 form-color input-comment">
                                    <img src="${acc.avatar}" width="50" class="rounded-circle mr-2">
                                    <input type="text" class="form-control" name="comment" placeholder="Enter your comment...">
                                    <button type="submit" class="btn btn-primary" style="display:none;">Submit</button>

                                </div>
                            </form>
                            <div class="mt-2">
                                <c:forEach var="cm" items="${historyAccountMap}">
                                    <c:set var="history" value="${cm.key}" />
                                    <c:set var="account" value="${cm.value}" />
                                    <div class="d-flex flex-row p-3 commented">

                                        <img src="${account.avatar}" width="40" height="40" class="rounded-circle mr-3">

                                        <div class="w-100">

                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="d-flex flex-row ">
                                                    <span class="mr-2">${account.name}</span>
                                                </div>
                                                <small>${history.time}</small>
                                            </div>
                                            <p class="text-justify comment-text mb-0">${history.comment}</p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% MovieDAO daom1= new MovieDAO();
            HttpSession session1 = request.getSession();
            movie mv1=(movie)session1.getAttribute("watchingmovie");
            ArrayList<movie> ms1= daom1.getMovieByGenre(mv1.getGenre().get(0));
            request.setAttribute("moviesamegenre",ms1);
        
            %>


            <div class="movie slide-movie container-fluid">
                <h3>Có thể bạn sẽ thích</h3>
                <button class="handle left-handle">
                    <div class="text">&#8249;</div>
                </button>
                <div class="movie-menu movie-menu">

                    <div class="slider">
                        <c:forEach items="${moviesamegenre}" var="msg">
                            <div class="movie-item">
                                <div class="iq-card mb-3" >

                                    <a href="movieload?movieid=${msg.id}" class="movie-poster">
                                        <img src="${msg.posterLink}" class="img-fluid rounded" alt="${hmr.title}">
                                    </a>
                                    <div class="movie-infor">
                                        <div class="iq-card-body">
                                            <h5 class="iq-card-title">${msg.title}</h5>
                                            <h7 class="iq-card-text">| Người xem: ${msg.viewers}</h7><br/>
                                            <h7 class="iq-card-text">| Rating: ${msg.rating}</h7><br/>


                                        </div>
                                    </div>
                                    <a href="movieload?movieid=${msg.id}" class="watch-button">
                                        <i class="fa-solid fa-play"></i>
                                        <span>Watch Now</span>
                                    </a>
                                    <div class="title">
                                        <h6>${msg.title}</h6>
                                        <span>${msg.releaseTime}</span>
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

            <script>
                document.getElementById('commentInput').addEventListener('keydown', function (event) {
                    if (event.key === 'Enter') {
                        // Prevent default behavior (form submission)
                        event.preventDefault();
                        document.getElementById('commentForm').submit();
                    }
                });
            </script>
    </body>
</html>
