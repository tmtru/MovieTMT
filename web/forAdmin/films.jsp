<%-- 
    Document   : films
    Created on : Jun 18, 2024, 10:58:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/admin.css">
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
            <div class="container-fluid movies">
                <div class="title">
                    <h2 class="section--title">Danh sách phim</h2>
                    <a href="#" class="add">Thêm phim mới</a>
                </div>
                
                
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
</html>
