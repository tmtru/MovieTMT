<%-- 
    Document   : dashboard
    Created on : Jun 18, 2024, 10:43:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List, java.util.ArrayList, model.movie,model.genre,model.episode,model.account, dal.MovieDAO, dal.GenreDAO, dal.EpisodeDAO,dal.AccountDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/admin.css">
        <script src="../js/main.js"></script>
        <script src="../js/admin.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <jsp:include page="./admin.jsp" /> 
        <div class="main--content">
            <div class="overview">
                <div class="title">
                    <h2 class="section--title">Overview</h2>
                </div>
                <%  MovieDAO daom = new MovieDAO();
                    int numberOfFilms=daom.numberOfFilms();
                    int allViews=daom.allViews();
                    request.setAttribute("nbfilms", numberOfFilms);
                    request.setAttribute("allviews", allViews);

                %>
                <% 
                AccountDAO daoa=new AccountDAO();
                List<account> accounts = daoa.getAllAccounts();
                request.setAttribute("accounts", accounts);
                
                %>
                <div class="cards">
                    <div class="card card-1">
                        <div class="card--data">
                            <div class="card--content">
                                <h5 class="card--title">Tổng số phim</h5>

                                <h1>${nbfilms}</h1>
                            </div>
                            <i class="fa-solid fa-film card--icon--lg"></i>
                        </div>
                    </div>
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
                                <h1>${allviews}</h1>
                            </div>

                            <i class="fa-solid fa-eye card--icon--lg"></i>
                        </div>
                    </div>
                    <div class="card card-4">
                        <div class="card--data">
                            <div class="card--content">
                                <h5 class="card--title">Lợi nhuận</h5>
                                <h1>15</h1>
                            </div>
                            <i class="fa-solid fa-coins card--icon--lg"></i>
                        </div>
                        <div class="card--stats">
                            <span><i class="ri-bar-chart-fill card--icon stat--icon"></i>8%</span>
                            <span><i class="ri-arrow-up-s-fill card--icon up--arrow"></i>11</span>
                            <span><i class="ri-arrow-down-s-fill card--icon down--arrow"></i>2</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="chart">
                <canvas id="myChart"></canvas>
            </div>

            <div class="recent--patients">
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
