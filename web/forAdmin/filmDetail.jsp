<%-- 
    Document   : filmDetail
    Created on : Jun 23, 2024, 11:18:14 AM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List, java.util.ArrayList, model.movie,model.genre, dal.MovieDAO, dal.GenreDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/admin.css">
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
                <button type="button" class="btn btn-primary add mb-3" data-bs-toggle="modal" data-bs-target="#exampleModal">
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
                                        <input id="title" type="text" class="form-control" name="title" value="${currentFilm.title}" placeholder="Viết hoa hết chữ cái đầu" required>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label for="inputPassword4" class="form-label">Ngày phát sóng</label>
                                        <input id="releaseDate" type="date" class="form-control" name="releaseDate" value="${currentFilm.releaseTime}" placeholder="YYYY-MM-DD" >
                                    </div>
                                    <div class="col-12">
                                        <label for="inputAddress" class="form-label">Nội dung phim</label>
                                        <textarea class="form-control" name="content" rows="5" required>${currentFilm.content}</textarea>
                                    </div>
                                    <div class="col-12">
                                        <label for="inputAddress2" class="form-label">Đường dẫn đến ảnh</label>
                                        <input type="text" class="form-control" value="${currentFilm.posterLink}" name="posterLink" placeholder="https://drive.google.com/file/d/1_m8idOUZSfzOq_B4F7V6zQ5HPon1deL4/view?usp=sharing" required>
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
                                            <input class="form-check-input" type="checkbox" id="gridCheck" required>
                                            <label class="form-check-label" for="gridCheck" style="color:red">
                                                Xin vui lòng kiểm tra lại thông tin cẩn thận để tránh bị lỗi.
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" >Thêm phim</button>
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
                                        <td class="label" style="font-weight: bold;color: red;width: 180px">ID</td>
                                        <td>${currentFilm.id}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: red;width: 180px">Tiêu đề</td>
                                        <td>${currentFilm.title}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: red">Ngày ra mắt</td>
                                        <td>${currentFilm.releaseTime}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: red">Thể loại</td>
                                        <td>${currentFilm.genre}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: red">Nội dung</td>
                                        <td>${currentFilm.content}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: red">Quốc gia</td>
                                        <td>${currentFilm.country}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: red">Số tập</td>
                                        <td>${currentFilm.movieLength}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: red">Diễn viên</td>
                                        <td>${currentFilm.actor}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: red">Đạo diễn</td>
                                        <td>${currentFilm.director}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: red">Số lượng người xem</td>
                                        <td>${currentFilm.viewers}</td>
                                    </tr>
                                    <tr>
                                        <td class="label" style="font-weight: bold;color: red">Rating</td>
                                        <td>${currentFilm.rating}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </body>
    <script src="../js/addNewFilms.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

