<%-- 
    Document   : films
    Created on : Jun 18, 2024, 10:58:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List, java.util.ArrayList, model.movie, dal.MovieDAO"%>
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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <jsp:include page="./admin.jsp" /> 
        <div class="main--content ">
            <div class="title">
                <h2 class="section--title">Overview</h2>
            </div>
            <div class="overview col-xl-6">
                <div class="cards">
                    <div class="card card-1">
                        <div class="card--data">
                            <div class="card--content">
                                <h5 class="card--title">Tổng số phim</h5>
                                <h1>152</h1>
                            </div>
                            <i class="fa-solid fa-film card--icon--lg"></i>
                        </div>
                    </div>

                </div>
                <select name="date" id="date" class="dropdown mt-3">
                    <option value="today">Today</option>
                    <option value="lastweek">Last Week</option>
                    <option value="lastmonth">Last Month</option>
                    <option value="lastyear">Last Year</option>
                    <option value="alltime">All Time</option>
                </select>

                <div class="chart">
                    <canvas id="myChart"></canvas>
                </div>
            </div>
            <!--            <div class="recent--patients">
                            <div class="title">
                                <h2 class="section--title">Hoạt động gần đây</h2>
                                <a href="#" class="add">Xem chi tiết</a>
                            </div>
                            <div class="table">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Tên</th>
                                            <th>Mục tiêu</th>
                                            <th>Thời gian</th>
                                            <th>Ghi chú</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="delete">DELETE</td>
                                            <td>Phim: ???</td>
                                            <td>30/07/2022</td>
                                            <td>None</td>
            
                                        </tr>
                                        <tr>
                                            <td class="add-a">ADD</td>
                                            <td>Phim: ???</td>
                                            <td>31/07/2022</td>
                                            <td>None</td>
            
                                        </tr>
            
                                    </tbody>
                                </table>
                            </div>
                        </div>-->
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
                            <div class="modal-body">
                                <form class="row g-3" action="addMovies" method="post">
                                    <div class="col-md-6">
                                        <label for="inputEmail4" class="form-label">Title</label>
                                        <input type="email" class="form-control" name="title" placeholder="Viết hoa hết chữ cái đầu" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputPassword4" class="form-label">Ngày phát sóng</label>
                                        <input type="password" class="form-control" name="realeaseDate" placeholder="YYYY-MM-DD" >
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
                                        <input type="number" class="form-control" name="numberOfEps">
                                    </div>
                                    <div class="col-md-12">
                                        <label for="inputState" class="form-label">Genre</label>
                                        <select id="inputState" class="form-select mb-1">
                                            <option selected>Choose...</option>
                                            <option>...</option>
                                        </select>
                                        <select id="inputState" class="form-select mb-1">
                                            <option selected>Choose...</option>
                                            <option>...</option>
                                        </select>
                                        <select id="inputState" class="form-select mb-1">
                                            <option selected>Choose...</option>
                                            <option>...</option>
                                        </select>
                                        <select id="inputState" class="form-select mb-1">
                                            <option selected>Choose...</option>
                                            <option>...</option>
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
                                        <input type="number" class="form-control" name="rating" placeholder="8">
                                    </div>
                                    <div class="col-12">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="gridCheck" required>
                                            <label class="form-check-label" for="gridCheck" style="color:red">
                                                Xin vui lòng kiểm tra lại thông tin cẩn thận để tránh bị lỗi.
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary">Sign in</button>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
                <form class="search mb-3">
                    <input type="text" class="searchTerm" placeholder="Search theo tên phim">
                    <button type="submit" class="searchButton">
                        <i class="fa fa-search"></i>
                    </button>
                </form>
                <div class="table table-movies">
                    <% 
                        MovieDAO dao=new MovieDAO();
                        ArrayList<movie> movies=dao.getAllMovieEach50();
                        request.setAttribute("movies", movies);
                    %>

                    <table>
                        <thead>
                            <tr>
                                <th>Tên</th>
                                <th>Thể loại</th>
                                <th colspan="3">Nội dung</th>
                                <th >Ảnh</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>

                        <tbody >
                            <c:forEach items="${movies}" var="m">
                                <tr>
                                    <td>${m.title}</td>
                                    <td>${m.genre}</td>
                                    <td id="content" colspan="3"><p>${m.content}</p></td>
                                    <td id="poster-link">
                                        <div>
                                            <img style="max-width: 100%" src="${m.posterLink}" />
                                        </div>
                                    </td>

                                    <td><a href="" class="edit-film">Detail</a></td>

                                </tr>
                                <tr>
                                    <td>${m.title}</td>
                                    <td>${m.genre}</td>
                                    <td id="content" colspan="3"><p>${m.content}</p></td>
                                    <td id="poster-link">
                                        <div>
                                            <img style="max-width: 100%" src="${m.posterLink}" />
                                        </div>
                                    </td>

                                    <td><a href="" class="edit-film">Detail</a></td>

                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <script>
        const ctx = document.getElementById('myChart');

        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                datasets: [{
                        label: 'Tổng số phim',
                        data: [10, 20, 30, 25, 35, 45, 50], // Thay đổi dữ liệu tại đây
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
