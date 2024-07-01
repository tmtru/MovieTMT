<%-- 
    Document   : films
    Created on : Jun 18, 2024, 10:58:30 PM
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
        <link rel="stylesheet" href="../css/modelDelete.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <script src="https://kit.fontawesome.com/aab0c35bef.js" crossorigin="anonymous"></script>
        <script src="../js/main.js"></script>
        <script src="../js/admin.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <jsp:include page="./admin.jsp" /> 
        <div class="main--content ">
            <div class="title">
                <h2 class="section--title">Overview</h2>
            </div>
            <div class="overview d-flex">
                <div class="cards">
                    <div class="card card-1">
                        <div class="card--data">
                            <div class="card--content">
                                <h5 class="card--title">Tổng số phim</h5>
                                <% MovieDAO dao = new MovieDAO();
                                int numberOfFilms=dao.numberOfFilms();
                                request.setAttribute("nbfilms", numberOfFilms);

                                %>
                                <h1>${nbfilms}</h1>
                            </div>
                            <i class="fa-solid fa-film card--icon--lg"></i>
                        </div>
                    </div>


                </div>
            </div>
            <div class="recent--patients">
                <div class="title">
                    <h2 class="section--title">Danh sách phim</h2>
                </div>
                <button type="button" class="btn btn-primary add mb-3" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Thêm phim mới

                </button>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm Phim mới</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                            </div>

                            <form id="movieForm" action="addfilm" method="post" onsubmit="return validateForm(event)">
                                <div class="modal-body row g-3">
                                    <div class="col-md-6">
                                        <label for="inputEmail4" class="form-label">Title</label>
                                        <input id="title" type="text" class="form-control" name="title" value="" placeholder="Viết hoa hết chữ cái đầu" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputPassword4" class="form-label">Ngày phát sóng</label>
                                        <input id="releaseDate" type="date" class="form-control" name="releaseDate" placeholder="YYYY-MM-DD" >
                                    </div>
                                    <div class="col-12">
                                        <label for="inputAddress" class="form-label">Nội dung phim</label>
                                        <textarea class="form-control" name="content" rows="5" required></textarea>
                                    </div>
                                    <div class="col-12">
                                        <label for="inputAddress2" class="form-label">Đường dẫn đến ảnh</label>
                                        <input type="text" class="form-control" name="posterLink" placeholder="https://drive.google.com/file/d/1_m8idOUZSfzOq_B4F7V6zQ5HPon1deL4/view?usp=sharing" required>
                                    </div>
                                    <div class="col-md-8">
                                        <label for="inputCity" class="form-label">Quốc gia</label>
                                        <input type="text" class="form-control" name="country" placeholder="VD: Việt Nam">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="inputZip" class="form-label">Số tập</label>
                                        <input type="number" class="form-control" name="numberOfEps" >
                                    </div>
                                    <% 
                                        GenreDAO dao1=new GenreDAO();
                                        ArrayList<genre> genres=dao1.getAllGenres();
                                        request.setAttribute("genres", genres);
                                    %>
                                    <div class="col-md-12">
                                        <label for="inputState" class="form-label">Genre</label>
                                        <select name="genre1" id="inputState" class="form-select mb-1">
                                            <option selected></option>
                                            <c:forEach items="${genres}" var="g">
                                                <option value="${g.genreName}">${g.genreName}</option>
                                            </c:forEach>
                                        </select>
                                        <select name="genre2" id="inputState" class="form-select mb-1">
                                            <option selected></option>
                                            <c:forEach items="${genres}" var="g">
                                                <option value="${g.genreName}">${g.genreName}</option>
                                            </c:forEach>
                                        </select>
                                        <select name="genre3" id="inputState" class="form-select mb-1">
                                            <option selected></option>
                                            <c:forEach items="${genres}" var="g">
                                                <option value="${g.genreName}">${g.genreName}</option>
                                            </c:forEach>
                                        </select>
                                        <select name="genre4" id="inputState" class="form-select mb-1">
                                            <option selected></option>
                                            <c:forEach items="${genres}" var="g">
                                                <option value="${g.genreName}">${g.genreName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-12">
                                        <label for="inputAddress" class="form-label">Diễn viên</label>
                                        <textarea class="form-control" name="actor" rows="2"></textarea>
                                    </div>
                                    <div class="col-12">
                                        <label for="inputAddress2" class="form-label">Đạo diễn</label>
                                        <input type="text" class="form-control" name="director"
                                               >
                                    </div>
                                    <div class="col-md-8">
                                        <label for="inputCity" class="form-label">Số lượng người xem khởi điểm</label>
                                        <input type="text" class="form-control" name="viewers" placeholder="120">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="inputZip" class="form-label">Rating khởi điểm</label>
                                        <input id="rating" type="text" class="form-control" name="rating" placeholder="8" value="">
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
                <div class="d-flex justify-content-between flex-wrap">
                    <form action="search" class="search mb-3 mt-1" style="max-height: 45px">
                        <input type="text" name="search" class="searchTerm" placeholder="Search theo tên phim" value="${search}">
                        <button type="submit" class="searchButton">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                    <div class="row">
                        <div class="dropdown mb-3 mr-5" style="background-color: transparent !important;">
                            <a class="btn btn-secondary dropdown-toggle" href="search?search=${search}&by=${by}&genre=" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="width: 150px">
                                <c:if test="${param.genre==null || param.genre eq ''}">Thể loại</c:if>
                                <c:if test="${param.genre!=null}">${param.genre}</c:if>

                                </a>


                                <ul class="dropdown-menu dropdown-menu-dark">
                                    <li><a class="dropdown-item" href="search?search=${search}&by=${by}">Tất cả</a></li>
                                    <c:forEach items="${genres}" var="g">
                                    <li><a class="dropdown-item" href="search?search=${search}&by=${by}&genre=${g.genreName}">${g.genreName}</a></li>
                                    </c:forEach>
                            </ul>
                        </div>
                        <div class="dropdown mb-3 ms-5" style="background-color: transparent !important;">
                            <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="width: 140px">
                                <c:if test="${param.by==null || param.by eq ''}">Sắp xếp theo</c:if>
                                <c:if test="${param.by eq 'new'}">Mới thêm nhất</c:if>
                                <c:if test="${param.by eq 'title'}">Tên</c:if>
                                <c:if test="${param.by eq 'date'}">Ngày ra mắt</c:if>
                                <c:if test="${param.by eq 'view'}">Lượt truy cập</c:if>
                                <c:if test="${param.by eq 'rating'}">Rating</c:if>

                                </a>

                                <ul class="dropdown-menu dropdown-menu-dark">
                                    <li><a class="dropdown-item" href="search?search=${search}&by=new&genre=${genre}">Mới thêm nhất</a></li>
                                <li><a class="dropdown-item" href="search?search=${search}&by=title&genre=${genre}">Tên</a></li>
                                <li><a class="dropdown-item" href="search?search=${search}&by=date&genre=${genre}">Ngày ra mắt</a></li>
                                <li><a class="dropdown-item" href="search?search=${search}&by=view&genre=${genre}">Lượt truy cập</a></li>
                                <li><a class="dropdown-item" href="search?search=${search}&by=rating&genre=${genre}">Rating</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
                <div class="table table-movies">
                    <table>
                        <thead style=" background-color: rgb(146 150 255 / 13%); ">
                            <tr>
                                <th>Tên</th>
                                <th>Thể loại</th>
                                <th colspan="3">Nội dung</th>
                                <th >Ảnh</th>
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
                            request.setAttribute("queryString",queryString );
                        %>

                        <tbody>
                            <c:set var="page" value="${param.page != null ? param.page : 0}" />
                            <c:set var="items" value="0" />
                            <c:set var="limitItems" value="5" />
                            <c:set var="startItem" value="${page * limitItems}" />
                            <c:set var="endItem" value="${startItem + limitItems}" />
                            <c:set var="numOfPages" value="${(movies.size() + limitItems - 1) / limitItems}" />

                            <c:forEach var="m" items="${movies}" varStatus="status">
                                <c:if test="${status.index >= startItem && status.index < endItem}">
                                    <tr>
                                        <td>${m.title}</td>
                                        <td>${m.genre}</td>
                                        <td id="content" colspan="3"><p>${m.content}</p></td>
                                        <td id="poster-link">
                                            <div>
                                                <img style="max-width: 100%" src="${m.posterLink}" />
                                            </div>
                                        </td>
                                        <td>
                                            <a href="filmDetail.jsp?id=${m.id}" class="edit-film" style="color: #bcbcff !important;">| Chi tiết</a><br/><br/>
                                            <div class="">
                                                <!-- Button HTML (to Trigger Modal) -->
                                                <a href="#myModal${m.id}" style="color: red !important;" data-bs-toggle="modal" data-bs-target="#myModal${m.id}">| Xóa Phim</a>
                                            </div>
                                            <!-- Modal HTML -->
                                            <div id="myModal${m.id}" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                                            <h5>"${m.title}"</h5>
                                                        </div>
                                                        <div class="modal-footer justify-content-center">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                            <button type="button" class="btn btn-danger">
                                                                <a href="filmdelete?id=${m.id}" class="edit-film" style="color: white !important;">Xóa Phim</a>
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
