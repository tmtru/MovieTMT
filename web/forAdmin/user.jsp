<%-- 
    Document   : user
    Created on : Jun 23, 2024, 8:31:22 PM
    Author     : Admin
--%>
<%-- 
    Document   : dashboard
    Created on : Jun 18, 2024, 10:43:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List, java.util.ArrayList,model.account, model.movie,model.genre,model.banner, dal.MovieDAO,dal.AccountDAO, dal.GenreDAO,dal.BannerDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/admin.css">
        <script src="../js/main.js"></script>
        <script src="../js/admin.js"></script>
    </head>
    <body>
        <jsp:include page="./admin.jsp" /> 
        <div class="main--content">
            <% 
                AccountDAO dao=new AccountDAO();
                List<account> accounts = dao.getAllAccounts();
                request.setAttribute("accounts", accounts);
                
                %>
            <div class="overview">
                <div class="title">
                    <h2 class="section--title">Overview</h2>
                </div>
                <div class="cards">

                    <div class="card card-2">
                        <div class="card--data">
                            <div class="card--content">
                                <h5 class="card--title">Người dùng</h5>
                                <h1>${accounts.size()}</h1>
                            </div>
                            <i class="fa-solid fa-users card--icon--lg"></i>
                        </div>
                    </div>
                    <div class="card card-3">
                        <div class="card--data">
                            <div class="card--content">
                                <h5 class="card--title">Lượt truy cập</h5>
                                <h1>102</h1>
                            </div>

                            <i class="fa-solid fa-eye card--icon--lg"></i>
                        </div>
                    </div>

                </div>
            </div>
            <div class="recent--patients">
                
                <div class="title">
                    <h2 class="section--title">Quản lí</h2>
                </div>
                <div class="table">
                    <table>
                        <thead>
                            <tr>
                                <th>Ảnh đại diện</th>
                                <th>Tên</th>
                                <th>Email</th>
                                <th>Giới tính</th>
                                <th>Số điện thoại</th>
                                <th>Số thẻ</th>
                                <th>Quyền truy cập</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${accounts}" var="a">
                                <c:if test="${a.role=='Admin'}">
                                    <tr>
                                        <td><img src=".${a.avatar}" class="img-fluid" style="max-width: 150px"></td>
                                        <td>${a.name}</td>
                                        <td>${a.email}</td>
                                        <td>${a.gender}</td>
                                        <td>${a.phoneNumber}</td>
                                        <td>${a.cardNumber}</td>
                                        <td>${a.accessRight}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
                <div class="title">
                    <h2 class="section--title">Người dùng</h2>
                </div>
                <div class="table">
                    <table>
                        <thead>
                            <tr>
                                <th>Ảnh đại diện</th>
                                <th>Tên</th>
                                <th>Email</th>
                                <th>Giới tính</th>
                                <th>Số điện thoại</th>
                                <th>Số thẻ</th>
                                <th>Quyền truy cập</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${accounts}" var="a">
                                <c:if test="${a.role=='User'}">
                                    <tr>
                                        <td><img src=".${a.avatar}" class="img-fluid" style="max-width: 150px"></td>
                                        <td>${a.name}</td>
                                        <td>${a.email}</td>
                                        <td>${a.gender}</td>
                                        <td>${a.phoneNumber}</td>
                                        <td>${a.cardNumber}</td>
                                        <td>${a.accessRight}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%
    int[] message = {1, 2, 3,4,5,6,7};

        %>
    </body>
    <script>
        const ctx = document.getElementById('myChart');

        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                datasets: [{
                        label: 'Tổng số phim',
                        data: [<%= java.util.Arrays.toString(message).replaceAll("\\[|\\]|\\s", "") %>], // Thay đổi dữ liệu tại đây
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
</html>

