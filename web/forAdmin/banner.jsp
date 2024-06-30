<%-- 
    Document   : banner
    Created on : Jun 23, 2024, 2:02:46 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List, java.util.ArrayList, model.movie,model.genre,model.banner, dal.MovieDAO, dal.GenreDAO,dal.BannerDAO"%>
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
                BannerDAO dao=new BannerDAO();
                List<banner> banners = dao.getAllBanner();
                request.setAttribute("banners", banners);       
            %>


            <div class="recent--patients mt-5">
                <button type="button" class="btn btn-primary add mb-3" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Thêm Ảnh
                </button>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm Ảnh quảng bá</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                            </div>

                            <form id="movieForm" action="banner" method="post">
                                <div class="modal-body row g-3">

                                    <div class="col-md-12">
                                        <label for="inputEmail4" class="form-label">Nhập ID phim tương ứng với ảnh</label>
                                        <input id="title" type="text" class="form-control" name="id" value="" required>
                                    </div>
                                    <div class="col-12">
                                        <label for="inputAddress2" class="form-label">Đường dẫn đến ảnh</label>
                                        <input type="text" class="form-control" name="linkImg" placeholder="https://drive.google.com/file/d/1_m8idOUZSfzOq_B4F7V6zQ5HPon1deL4/view?usp=sharing" required>
                                    </div>
                                    <div class="col-md-12">
                                        <label for="inputState" class="form-label">Loại ảnh</label>
                                        <select name="role" id="inputState" class="form-select mb-1">
                                            <option value="0">Ảnh Quảng Bá Phim Đầu Trang</option>
                                            <option value="1">Ảnh Quảng Cáo Banner Dài</option>
                                        </select>
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
                <div class="title">
                    <h2 class="section--title">Ảnh Quảng Bá Phim Đầu Trang</h2>
                </div>
                <div class="detail detail-infor">
                    <div class="" style="color: white;">
                        <div class="table table-movies" style="max-width: 100vw">
                            <table>
                                <thead style=" background-color: rgb(146 150 255 / 13%); ">
                                    <tr>
                                        <th>Ảnh</th>
                                        <th style="max-width: 100px">Đường dẫn</th>
                                        <th>Phim</th>
                                    </tr>
                                </thead>
                                <tbody >
                                    <c:forEach items="${banners}" var="b">
                                        <c:if test="${b.role=='0'}">
                                            <tr>
                                                <td><image src="${b.linkImg}" class="img-fluid" style="max-width: 25vw"/></td>
                                                <td style="word-break: break-all; overflow:hidden;font-size:small ;">${b.linkImg}</td>
                                                
                                                <td style="width: 150px; color: blue;margin-right: 10px;">
                                                    <a style="color: #bcbcff !important;" href="filmDetail.jsp?id=${b.movieID}&pre=banner">| Chi tiết phim </a><br/><br/>
                                                    <!-- Button HTML (to Trigger Modal) -->
                                                    <a href="#myModal${b.bannerID}" style="color: red !important;" data-bs-toggle="modal" data-bs-target="#myModal${b.bannerID}">| Xóa Ảnh</a>
                                                    <!-- Modal HTML -->
                                                    <div id="myModal${b.bannerID}" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-confirm">
                                                            <div class="modal-content">
                                                                <div class="modal-header flex-column">
                                                                    <div class="icon-box">
                                                                        <i class="material-icons"><i class="fa-solid fa-circle-xmark"></i></i>
                                                                    </div>						
                                                                    <h4 class="modal-title w-100">Are you sure?</h4>	
                                                                </div>
                                                                <div class="modal-body">
                                                                    <p>Bạn có chắc chắn bạn muốn xóa ảnh </p>
                                                                    <img src="${b.linkImg}" class="img-fluid"/>
                                                                </div>
                                                                <div class="modal-footer justify-content-center">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                                    <button type="button" class="btn btn-danger">
                                                                        <a href="banner?action=delete&id=${b.bannerID}" class="edit-film" style="color: white !important;">Xóa Ảnh</a>
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
                    </div>
                </div>
                <div class="title">
                    <h2 class="section--title">Ảnh Quảng Cáo Banner Dài</h2>
                </div>
                <div class="detail detail-infor">
                    <div class="" style="color: white;">
                        <div class="table table-movies" style="max-width: 100vw">
                            <table>
                                <thead style=" background-color: rgb(146 150 255 / 13%); ">
                                    <tr>
                                        
                                        <th>Ảnh</th>
                                        <th style="max-width: 100px">Đường dẫn</th>
                                        <th>Phim</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${banners}" var="b">
                                        <c:if test="${b.role=='1'}">
                                            <tr>
                                                <td><img src="${b.linkImg}" class="img-fluid"/></td>
                                                <td style="max-width: 70vw; word-break: break-all; overflow:hidden;font-size:small ;">${b.linkImg}</td>
                                                
                                                <td style="width: 150px; color: blue;margin-right: 10px;">
                                                    <a style="color: #bcbcff !important;" href="filmDetail.jsp?id=${b.movieID}&pre=banner">| Chi tiết phim </a><br/><br/>
                                                    <!-- Button HTML (to Trigger Modal) -->
                                                    <a href="#myModal${b.bannerID}" style="color: red !important;" data-bs-toggle="modal" data-bs-target="#myModal${b.bannerID}">| Xóa Ảnh</a>
                                                    <!-- Modal HTML -->
                                                    <div id="myModal${b.bannerID}" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-confirm">
                                                            <div class="modal-content">
                                                                <div class="modal-header flex-column">
                                                                    <div class="icon-box">
                                                                        <i class="material-icons"><i class="fa-solid fa-circle-xmark"></i></i>
                                                                    </div>						
                                                                    <h4 class="modal-title w-100">Are you sure?</h4>	
                                                                </div>
                                                                <div class="modal-body">
                                                                    <p>Bạn có chắc chắn bạn muốn xóa ảnh </p>
                                                                    <img src="${b.linkImg}" class="img-fluid"/>
                                                                </div>
                                                                <div class="modal-footer justify-content-center">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                                    <button type="button" class="btn btn-danger">
                                                                        <a href="banner?action=delete&id=${b.bannerID}" class="edit-film" style="color: white !important;">Xóa Ảnh</a>
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
                    </div>
                </div>

            </div>
        </div>
    </body>
    <script src="../js/addNewFilms.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

