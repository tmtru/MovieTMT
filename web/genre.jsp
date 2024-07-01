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
                    <div class="sidebar-groups">
                    <% 
                        GenreDAO dao1 = new GenreDAO();
                        ArrayList<genre> genres = dao1.getAllGenres();
                        request.setAttribute("genres", genres);
                    %>
                    <h3 class="sg-title">Bạn muốn xem...</h3>
                    <div class="search-box">
                        <div class="form-group position-relative d-flex justify-content-end">
                            <form action="classifymovies">
                                <input type="text" name="search" class="text search-input font-size-12"
                                       placeholder="Type here to search..." value="<c:out value='${param.search}'/>" />
                                <button type="submit" class="device-search ">
                                    <i class="fa fa-search"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="accordion" id="accordionPanelsStayOpenExample" data-bs-theme="dark">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                                    Thể loại
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
                                <div class="accordion-body">
                                    <div class="sidebar-groups-content d-flex flex-wrap">
                                        <c:forEach var="genre" items="${genres}">
                                            <p class="genre-item <c:if test="${genre.genreName eq param.genre}">active</c:if>" style="font-size: 14px;"><a href="classifymovies?search=${fn:escapeXml(param.search)}&by=${fn:escapeXml(param.by)}&genre=${fn:escapeXml(genre.genreName)}&country=${fn:escapeXml(param.country)}&sort=${fn:escapeXml(param.sort)}">${fn:escapeXml(genre.genreName)}</a>
                                            <a href="classifymovies?search=${fn:escapeXml(param.search)}&by=${fn:escapeXml(param.by)}&genre=&country=&sort=${fn:escapeXml(param.sort)}"><i class="fa-solid fa-circle-xmark"></i></a></p></p>
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
                            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show">
                                <div class="accordion-body">
                                    <div class="sidebar-groups-content d-flex flex-wrap">
                                        <p class="genre-item <c:if test="${param.country eq 'viet nam'}">active</c:if>" style="font-size: 14px;"><a href="classifymovies?search=${fn:escapeXml(param.search)}&by=${fn:escapeXml(param.by)}&genre=${fn:escapeXml(param.genre)}&country=viet%20nam&sort=${fn:escapeXml(param.sort)}">Việt Nam</a>
                                            <a href="classifymovies?search=${fn:escapeXml(param.search)}&by=${fn:escapeXml(param.by)}&genre=${fn:escapeXml(param.genre)}&country=&sort=${fn:escapeXml(param.sort)}"><i class="fa-solid fa-circle-xmark"></i></a></p>
                                        <p class="genre-item  <c:if test="${param.country eq 'han quoc'}">active</c:if>" style="font-size: 14px;"><a href="classifymovies?search=${fn:escapeXml(param.search)}&by=${fn:escapeXml(param.by)}&genre=${fn:escapeXml(param.genre)}&country=han%20quoc&sort=${fn:escapeXml(param.sort)}">Hàn Quốc</a> <a href="classifymovies?search=${fn:escapeXml(param.search)}&by=${fn:escapeXml(param.by)}&genre=${fn:escapeXml(param.genre)}&country=&sort=${fn:escapeXml(param.sort)}"><i class="fa-solid fa-circle-xmark"></i></a></p>
                                        <p class="genre-item <c:if test="${param.country eq 'trung quoc'}">active</c:if>" style="font-size: 14px;"><a href="classifymovies?search=${fn:escapeXml(param.search)}&by=${fn:escapeXml(param.by)}&genre=${fn:escapeXml(param.genre)}&country=trung%20quoc&sort=${fn:escapeXml(param.sort)}">Trung Quốc</a> <a href="classifymovies?search=${fn:escapeXml(param.search)}&by=${fn:escapeXml(param.by)}&genre=${fn:escapeXml(param.genre)}&country=&sort=${fn:escapeXml(param.sort)}"><i class="fa-solid fa-circle-xmark"></i></a></p>
                                        <p class="genre-item <c:if test="${param.country eq 'nhat ban'}">active</c:if>" style="font-size: 14px;"><a href="classifymovies?search=${fn:escapeXml(param.search)}&by=${fn:escapeXml(param.by)}&genre=${fn:escapeXml(param.genre)}&country=nhat%20ban&sort=${fn:escapeXml(param.sort)}">Nhật Bản</a> <a href="classifymovies?search=${fn:escapeXml(param.search)}&by=${fn:escapeXml(param.by)}&genre=${fn:escapeXml(param.genre)}&country=&sort=${fn:escapeXml(param.sort)}"><i class="fa-solid fa-circle-xmark"></i></a></p>
                                        <p class="genre-item <c:if test="${param.country eq 'my'}">active</c:if>" style="font-size: 14px;"><a href="classifymovies?search=${fn:escapeXml(param.search)}&by=${fn:escapeXml(param.by)}&genre=${fn:escapeXml(param.genre)}&country=my&sort=${fn:escapeXml(param.sort)}">Âu Mỹ</a> <a href="classifymovies?search=${fn:escapeXml(param.search)}&by=${fn:escapeXml(param.by)}&genre=${fn:escapeXml(param.genre)}&country=&sort=${fn:escapeXml(param.sort)}"><i class="fa-solid fa-circle-xmark"></i></a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="movies-container">
                <div class="more-choice-genre d-flex justify-content-end">
                    <div class="d-flex align-items-start">
                        <p class="align-self-center p-2 d-flex">Sắp xếp theo:</p>
                        <div class="dropdown mb-3 p-2 " style="background-color: transparent !important;">
                            <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="width: 140px">
                                <c:if test="${param.by eq 'date' || param.by==null || param.by eq ''}">Mới nhất</c:if>
                                <c:if test="${param.by eq 'title'}">Tên</c:if>
                                <c:if test="${param.by eq 'view'}">Lượt truy cập</c:if>
                                <c:if test="${param.by eq 'rating'}">Rating</c:if>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-dark">
                                    <li><a class="dropdown-item" href="classifymovies?search=${fn:escapeXml(param.search)}&by=date&genre=${fn:escapeXml(param.genre)}&country=${fn:escapeXml(param.country)}&sort=${fn:escapeXml(param.sort)}">Mới nhất</a></li>
                                <li><a class="dropdown-item" href="classifymovies?search=${fn:escapeXml(param.search)}&by=title&genre=${fn:escapeXml(param.genre)}&country=${fn:escapeXml(param.country)}&sort=${fn:escapeXml(param.sort)}">Tên</a></li>
                                <li><a class="dropdown-item" href="classifymovies?search=${fn:escapeXml(param.search)}&by=view&genre=${fn:escapeXml(param.genre)}&country=${fn:escapeXml(param.country)}&sort=${fn:escapeXml(param.sort)}">Lượt truy cập</a></li>
                                <li><a class="dropdown-item" href="classifymovies?search=${fn:escapeXml(param.search)}&by=rating&genre=${fn:escapeXml(param.genre)}&country=${fn:escapeXml(param.country)}&sort=${fn:escapeXml(param.sort)}">Rating</a></li>
                            </ul>
                        </div>
                        <div class="reverse p-3">
                            <a href="classifymovies?search=${fn:escapeXml(param.search)}&by=${fn:escapeXml(param.by)}&genre=${fn:escapeXml(param.genre)}&country=${fn:escapeXml(param.country)}&sort=1" class="me-2 ${sort eq '0' ? 'active' : 'hide'}"><i class="fa-solid fa-arrow-down-wide-short"></i></a>
                            <a href="classifymovies?search=${fn:escapeXml(param.search)}&by=${fn:escapeXml(param.by)}&genre=${fn:escapeXml(param.genre)}&country=${fn:escapeXml(param.country)}&sort=0" class="me-2 ${sort eq '1' ? 'active' : 'hide'}"><i class="fa-solid fa-arrow-up-wide-short"></i></a>
                        </div>
                    </div>
                </div>
                <% 
                    // Retrieve existing query parameters
                    String queryString = request.getQueryString();
                    if (queryString == null) {
                    queryString = "";
                    } else {
                    // Remove any existing page parameter from the query string
                    queryString = queryString.replaceAll("&?page=\\d*", "");
                    if (!queryString.isEmpty() && !queryString.endsWith("&")) {
                        queryString += "&";
                    }
                    }
                    request.setAttribute("queryString",queryString );
                %>

                <div class="movie-menu movie-no-scroll">
                    <div class="d-flex flex-wrap">
                        <div class="movie-menu movie-no-scroll d-flex flex-wrap">
                            <c:set var="page" value="${param.page != null ? param.page : 0}" />
                            <c:set var="items" value="0" />
                            <c:set var="limitItems" value="18" />
                            <c:set var="startItem" value="${page * limitItems}" />
                            <c:set var="endItem" value="${startItem + limitItems}" />
                            <c:set var="numOfPages" value="${(movies.size() + limitItems - 1) / limitItems}" />
                            <c:forEach items="${movies}" var="smv" varStatus="status">
                                <c:if test="${status.index >= startItem && status.index < endItem}">
                                    <div class="movie-item">
                                        <div class="iq-card mb-3">
                                            <a href="movieload?movieid=${fn:escapeXml(smv.id)}" class="movie-poster">
                                                <img src="${fn:escapeXml(smv.posterLink)}" class="img-fluid rounded" alt="${fn:escapeXml(smv.title)}">
                                            </a>
                                            <div class="movie-infor">
                                                <div class="iq-card-body">
                                                    <h5 class="iq-card-title">${fn:escapeXml(smv.title)}</h5>
                                                    <h7 class="iq-card-text">| Người xem: ${fn:escapeXml(smv.viewers)}</h7><br/>
                                                    <h7 class="iq-card-text">| Rating: ${fn:escapeXml(smv.rating)}</h7><br/>
                                                </div>
                                            </div>
                                            <a href="movieload?movieid=${fn:escapeXml(smv.id)}" class="watch-button">
                                                <i class="fa-solid fa-play"></i>
                                                <span>Watch Now</span>
                                            </a>
                                            <div class="title">
                                                <h6>${fn:escapeXml(smv.title)}</h6>
                                                <span>${fn:escapeXml(smv.releaseTime)}</span>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="pagination-bar">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <c:if test="${page > 0}">
                                <li class="page-item">
                                    <a class="page-link" href="?${queryString}page=${page - 1}">Previous</a>
                                </li>
                            </c:if>
                            <c:forEach begin="0" end="${numOfPages - 1}" var="i">
                                <li class="page-item ${page == i ? 'active' : ''}">
                                    <a class="page-link" href="?${queryString}page=${i}">${i + 1}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${page < numOfPages - 2}">
                                <li class="page-item">
                                    <a class="page-link" href="?${queryString}page=${page + 1}">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>            
            </div>
        </section>
        <jsp:include page="footer.jsp"/>
    </body>
    <script src="js/genre.js"></script>
    <script src="js/main.js"></script>
</html>
