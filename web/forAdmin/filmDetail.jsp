<%-- 
    Document   : filmDetail
    Created on : Jun 23, 2024, 11:18:14 AM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page import="java.util.List, java.util.ArrayList, model.movie,model.genre,model.episode, dal.MovieDAO, dal.GenreDAO, dal.EpisodeDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/admin.css">
        <link rel="stylesheet" href="../css/modelDelete.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <script src="https://kit.fontawesome.com/aab0c35bef.js" crossorigin="anonymous"></script>
        <script src="../js/main.js"></script>
        <script src="../js/admin.js"></script>
    </head>
    <body>
        <jsp:include page="./admin.jsp" /> 
        <div class="main--content ">
            <% 
                String id = (String) request.getParameter("id");
                MovieDAO dao=new MovieDAO();
                movie currentFilm = dao.getMovieById(id);
                request.setAttribute("currentFilm", currentFilm);
                
            %>

            <div class="recent--patients">

                <div class="title">
                    <nav aria-label="breadcrumb" style="color: white;">
                        <ol class="breadcrumb">
                            <c:if test="${param.pre=='banner'}"><li class="breadcrumb-item"><a href="banner.jsp">Banner</a></li></c:if>
                                <li class="breadcrumb-item"><a href="search">Movies</a></li>
                                <li class="breadcrumb-item active" aria-current="page">${currentFilm.title}</li>
                        </ol>
                    </nav>
                </div>

                <div class="title">

                    <h2 class="section--title">Thông Tin Chi Tiết</h2>
                </div>
                <button type="button" class="btn btn-primary add mb-3 me-4" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Chỉnh sửa thông tin
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Chỉnh sửa thông tin phim</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                            </div>

                            <form id="movieForm" action="filmedit" method="post" onsubmit="return validateForm(event)">
                                <div class="modal-body row g-3">
                                    <div class="col-md-0">
                                        <input id="id" type="text" class="form-control" name="id" value="${currentFilm.id}" hidden>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputEmail4" class="form-label">Title</label>
                                        <input id="title" type="text" class="form-control" name="title" value="${currentFilm.title}" placeholder="Viết hoa hết chữ cái đầu" #ccc7ff>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="inputPassword4" class="form-label">Ngày phát sóng</label>
                                        <input id="releaseDate" type="date" class="form-control" name="releaseDate" value="${currentFilm.releaseTime}" placeholder="YYYY-MM-DD" >
                                    </div>
                                    <div class="col-12">
                                        <label for="inputAddress" class="form-label">Nội dung phim</label>
                                        <textarea class="form-control" name="content" rows="5" #ccc7ff>${currentFilm.content}</textarea>
                                    </div>
                                    <div class="col-12">
                                        <label for="inputAddress2" class="form-label">Đường dẫn đến ảnh</label>
                                        <input type="text" class="form-control" value="${currentFilm.posterLink}" name="posterLink" placeholder="https://drive.google.com/file/d/1_m8idOUZSfzOq_B4F7V6zQ5HPon1deL4/view?usp=sharing" #ccc7ff>
                                    </div>
                                    <div class="col-md-8">
                                        <label for="inputCity" class="form-label">Quốc gia</label>
                                        <input type="text" class="form-control"  value="${currentFilm.country}" name="country" placeholder="VD: Việt Nam">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="inputZip" class="form-label">Số tập</label>
                                        <input type="number" class="form-control" name="numberOfEps" value="${currentFilm.movieLength}" >
                                    </div>
                                    <% 
                                        GenreDAO dao1=new GenreDAO();
                                        ArrayList<genre> genres=dao1.getAllGenres();
                                        request.setAttribute("genres", genres);
                                    %>
                                    <div class="col-md-12">
                                        <label for="inputState" class="form-label">Genre</label>
                                        <select name="genre1" id="inputState" class="form-select mb-1">
                                            <option value="${currentFilm.genre.get(0)}" selected>${currentFilm.genre.get(0)}</option>
                                            <option></option>
                                            <c:forEach items="${genres}" var="g">
                                                <option value="${g.genreName}">${g.genreName}</option>
                                            </c:forEach>
                                        </select>
                                        <select name="genre2" id="inputState" class="form-select mb-1">
                                            <c:if test="${currentFilm.genre.size() > 1}">
                                                <option value="${currentFilm.genre.get(1)}" selected>
                                                    ${currentFilm.genre.get(1)}
                                                </option>
                                            </c:if>

                                            <option></option>

                                            <c:forEach items="${genres}" var="g">
                                                <option value="${g.genreName}">
                                                    ${g.genreName}
                                                </option>
                                            </c:forEach>
                                        </select>

                                        <select name="genre3" id="inputState" class="form-select mb-1">
                                            <c:if test="${currentFilm.genre.size() > 2}">
                                                <option value="${currentFilm.genre.get(2)}" selected>
                                                    ${currentFilm.genre.get(2)}
                                                </option>
                                            </c:if>

                                            <option></option>

                                            <c:forEach items="${genres}" var="g">
                                                <option value="${g.genreName}">
                                                    ${g.genreName}
                                                </option>
                                            </c:forEach>
                                        </select>

                                        <select name="genre4" id="inputState" class="form-select mb-1">
                                            <c:if test="${currentFilm.genre.size() > 3}">
                                                <option value="${currentFilm.genre.get(3)}" selected>
                                                    ${currentFilm.genre.get(3)}
                                                </option>
                                            </c:if>
                                            <option></option>
                                            <c:forEach items="${genres}" var="g">
                                                <option value="${g.genreName}">
                                                    ${g.genreName}
                                                </option>
                                            </c:forEach>
                                        </select>

                                    </div>
                                    <div class="col-12">
                                        <label for="inputAddress" class="form-label">Diễn viên</label>
                                        <textarea class="form-control" name="actor"  rows="2">${currentFilm.actor}</textarea>
                                    </div>
                                    <div class="col-12">
                                        <label for="inputAddress2" class="form-label">Đạo diễn</label>
                                        <input type="text" class="form-control" name="director" value="${currentFilm.director}"
                                               >
                                    </div>
                                    <div class="col-md-8">
                                        <label for="inputCity" class="form-label">Số lượng người xem khởi điểm</label>
                                        <input type="text" class="form-control" name="viewers" value="${currentFilm.viewers}" placeholder="120">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="inputZip" class="form-label">Rating khởi điểm</label>
                                        <input id="rating" type="text" class="form-control" name="rating" value="${currentFilm.rating}" placeholder="8" value="">
                                    </div>
                                    <div class="col-12">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="gridCheck" #ccc7ff>
                                            <label class="form-check-label" for="gridCheck" #ccc7ff">
                                                Xin vui lòng kiểm tra lại thông tin cẩn thận để tránh bị lỗi.
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" >Chỉnh sửa</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="detail detail-infor d-flex flex-wrap">
                    <div class="me-5 mb-3">
                        <img class="img-fluid" src="${currentFilm.posterLink}" alt="alt" style="max-width: 200px"/>
                    </div>
                    <div class="" style="color: white;">
                        <div class="table table-movies" style="max-width: 60vw">
                            <table>
                                <tbody >
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: #ccc7ff;width: 180px">ID</td>
                                        <td>${currentFilm.id}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: #ccc7ff;width: 180px">Tiêu đề</td>
                                        <td>${currentFilm.title}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: #ccc7ff">Ngày ra mắt</td>
                                        <td>${currentFilm.releaseTime}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: #ccc7ff">Thể loại</td>
                                        <td>${currentFilm.genre}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: #ccc7ff">Nội dung</td>
                                        <td>${currentFilm.content}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: #ccc7ff">Quốc gia</td>
                                        <td>${currentFilm.country}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: #ccc7ff">Số tập</td>
                                        <td>${currentFilm.movieLength}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: #ccc7ff">Diễn viên</td>
                                        <td>${currentFilm.actor}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: #ccc7ff">Đạo diễn</td>
                                        <td>${currentFilm.director}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: #ccc7ff">Số lượng người xem</td>
                                        <td>${currentFilm.viewers}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: #ccc7ff">Rating</td>
                                        <td>${currentFilm.rating}</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="d-flex mt-4 justify-content-end">

                                <button type="button" class="btn btn-danger mb-3" data-bs-toggle="modal" data-bs-target="#myModal${currentFilm.id}">
                                    Xóa phim
                                </button>

                                <!-- Modal HTML -->
                                <div id="myModal${currentFilm.id}" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-confirm">
                                        <div class="modal-content">
                                            <div class="modal-header flex-column">
                                                <div class="icon-box">
                                                    <i class="material-icons"><i class="fa-solid fa-circle-xmark"></i></i>
                                                </div>						
                                                <h4 class="modal-title w-100">Are you sure?</h4>	

                                            </div>
                                            <div class="modal-body">
                                                <p>Bạn có chắc chắn bạn muốn xóa dữ liệu về bộ phim </p>
                                                <h5>"${currentFilm.title}"</h5>
                                            </div>
                                            <div class="modal-footer justify-content-center">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                <button type="button" class="btn btn-danger">
                                                    <a href="filmdelete?id=${currentFilm.id}" style="color: white !important;">Xóa Phim</a>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Episodes -->          
                <%
                    EpisodeDAO daoep= new EpisodeDAO();
                    List<episode> eps = daoep.getAllEpsByMovieID(Integer.parseInt(currentFilm.getId()));
                    request.setAttribute("episodes",eps);
                        
                %>
                <div class="title">

                    <h2 class="section--title">Danh sách tập phim</h2>
                </div>
                <div class="d-flex justify-content-between flex-wrap">
                    <div class="">
                        <button type="button" class="btn btn-primary add mb-3" data-bs-toggle="modal" data-bs-target="#epModal">
                            Thêm tập phim
                        </button>
                        <p style="color: red;">${error}</p>
                        <!-- Modal -->
                        <div class="modal fade" id="epModal" tabindex="-1" aria-labelledby="epModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm tập phim</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                                    </div>

                                    <form id="movieForm" action="filmeps?action=add" method="post">
                                        <div class="modal-body row g-3">
                                            <div class="col-md-12 d-none">

                                                <input id="movie" type="number" class="form-control" name="movieid" value="${currentFilm.id}">
                                            </div>

                                            <div class="col-md-12">
                                                <label for="inputEmail4" class="form-label">Số tập:</label>
                                                <input id="ep" type="number" class="form-control" name="chapid" value="" required>
                                            </div>
                                            <div class="col-md-12">
                                                <label for="inputEmail4" class="form-label">Tên của tập phim (nếu có):</label>
                                                <input id="epName" type="text" class="form-control" name="chapname" value="" required>
                                            </div>

                                            <div class="col-12">
                                                <label for="inputAddress2" class="form-label">Link video:</label>
                                                <input type="text" class="form-control" name="link" placeholder="" required>
                                            </div>

                                            <div class="col-md-12">

                                                <p>Quyền truy cập:</p>
                                                <div class="row ms-4">
                                                    <div class="col-sm-3">
                                                        <input type="radio" id="free" name="access" value="Free">
                                                        <label for="free" style="color:gray;">Free</label><br>
                                                    </div>
                                                     <div class="col-sm-3">
                                                        <input type="radio" id="paid" name="access" value="Paid">
                                                        <label for="paid" style="color:gray;">Trả phí</label><br>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <label for="inputAddress2" class="form-label">Link ảnh Thumbnail:</label>
                                                <input type="text" class="form-control" name="thumbnail" value="${e.thumbnail}" required>
                                            </div>
                                            <div class="col-12">
                                                <label for="inputAddress2" class="form-label">Thời lượng phim (phút):</label>
                                                <input type="number" class="form-control" name="length" placeholder="VD: 125" required>
                                            </div>

                                            <div class="col-12">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="gridCheck" required>
                                                    <label class="form-check-label" for="gridCheck" style="color:red">
                                                        Xin vui lòng kiểm tra lại thông tin cẩn thận để tránh bị lỗi.
                                                    </label>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary" >Thêm tập phim</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>


                <div class="table table-episodes">

                    <table>
                        <thead>
                            <tr>
                                <th>Số tập</th>
                                <th>Thời lượng</th>
                                <th>Loại truy cập</th>
                                <th>Link</th>
                                <th>Link ảnh thumbnail</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>

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
                            request.setAttribute("queryString", queryString);
                        %>

                        <tbody>
                            <c:set var="page" value="${param.page != null ? param.page : 0}" />
                            <c:set var="items" value="0" />
                            <c:set var="limitItems" value="10" />
                            <c:set var="startItem" value="${page * limitItems}" />
                            <c:set var="endItem" value="${startItem + limitItems}" />
                            <c:set var="numOfPages" value="${(episodes.size() + limitItems - 1) / limitItems}" />

                            <c:forEach var="e" items="${episodes}" varStatus="status">
                                <c:if test="${status.index >= startItem && status.index < endItem}">
                                    <tr>
                                        <td>${e.name}</td>
                                        <td>${e.chapterLength}</td>
                                        <td>${e.accessType}</td>
                                        <td><a href="${e.linkEp}" target="_blank">${e.linkEp}</a></td>
                                        <td><c:choose>
                                                <c:when test="${fn:contains(e.thumbnail, 'assets')}">
                                                    <img src="../${e.thumbnail}" class="img-fluid" style="max-width: 150px;" />
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${e.thumbnail}" class="img-fluid" style="max-width: 150px;" />
                                                </c:otherwise>
                                            </c:choose></td>
                                        <td>
                                            <div class="">
                                                <a href="#myEpModalEdit${e.chapterID}" class="edit-episode" style="color: #bcbcff !important;" data-bs-toggle="modal" data-bs-target="#myEpModalEdit${e.chapterID}">| Chỉnh sửa</a><br/><br/>

                                                <!-- Modal -->
                                                <div class="modal fade" id="myEpModalEdit${e.chapterID}"" tabindex="-1" aria-labelledby="epModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="color: black !important;">
                                                            <div class="modal-header">
                                                                <h1 class="modal-title fs-5">Chỉnh sửa tập phim</h1>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                                                            </div>

                                                            <form id="movieForm" action="filmeps?action=edit" method="post">
                                                                <div class="modal-body row g-3">
                                                                    <div class="col-md-12 d-none">

                                                                        <input id="movie" type="number" class="form-control" name="movieid" value="${currentFilm.id}">
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <label for="ep" class="form-label">Số tập:</label>
                                                                        <input id="ep" type="number" class="form-control" name="chapid" value="${e.chapterID}" required>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <label for="inputEmail4" class="form-label">Tên của tập phim (nếu có):</label>
                                                                        <input id="epName" type="text" class="form-control" name="chapname" value="${e.name}" required>
                                                                    </div>

                                                                    <div class="col-12">
                                                                        <label for="inputAddress2" class="form-label">Link video:</label>
                                                                        <input type="text" class="form-control" name="link" value="${e.linkEp}" required>
                                                                    </div>

                                                                    <div class="col-md-12">

                                                                        <p>Quyền truy cập:</p>
                                                                        <div class="row ms-4">
                                                                            <div class="col-sm-3">
                                                                                <input type="radio" id="free" name="access" value="Free" <c:if test="${e.accessType eq 'Free'}">checked</c:if>>
                                                                                    <label for="free" style="color:gray;" >Free</label>
                                                                                </div>
                                                                                 <div class="col-sm-3">
                                                                                    <input type="radio" id="paid" name="access" value="Paid" <c:if test="${e.accessType eq 'Paid'}">checked</c:if>>
                                                                                    <label for="paid" style="color:gray;" >Trả phí</label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <label for="inputAddress2" class="form-label">Link ảnh Thumbnail:</label>
                                                                            <input type="text" class="form-control" name="thumbnail" value="${e.thumbnail}" required>
                                                                    </div>           
                                                                    <div class="col-12">
                                                                        <label for="inputAddress2" class="form-label">Thời lượng phim (phút):</label>
                                                                        <input type="number" class="form-control" name="length" value="${e.chapterLength}" required>
                                                                    </div>

                                                                    <div class="col-12">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="gridCheck" required>
                                                                            <label class="form-check-label" for="gridCheck" style="color:red">
                                                                                Xin vui lòng kiểm tra lại thông tin cẩn thận để tránh bị lỗi.
                                                                            </label>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                    <button type="submit" class="btn btn-primary" >Chỉnh sửa</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="">
                                                <!-- Button HTML (to Trigger Modal) -->
                                                <a href="#myEpModal${e.chapterID}" style="color: red !important;" data-bs-toggle="modal" data-bs-target="#myEpModal${e.chapterID}">| Xóa tập phim</a>
                                            </div>
                                            <!-- Modal HTML -->
                                            <div id="myEpModal${e.chapterID}" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-confirm">
                                                    <div class="modal-content">
                                                        <div class="modal-header flex-column">
                                                            <div class="icon-box">
                                                                <i class="material-icons"><i class="fa-solid fa-circle-xmark"></i></i>
                                                            </div>
                                                            <h4 class="modal-title w-100">Bạn có chắc không?</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Bạn có chắc chắn bạn muốn xóa dữ liệu về tập phim</p>
                                                            <h5>"${e.name}"</h5>
                                                        </div>
                                                        <div class="modal-footer justify-content-center">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                            <button type="button" class="btn btn-danger">
                                                                <a href="filmeps?chapid=${e.chapterID}&movieid=${currentFilm.id}&action=delete" class="edit-episode" style="color: white !important;">Xóa tập phim</a>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
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
        </div>
    </body>
    <script src="../js/addNewFilms.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

