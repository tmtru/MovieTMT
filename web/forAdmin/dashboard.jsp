<%-- 
    Document   : dashboard
    Created on : Jun 18, 2024, 10:43:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List,java.util.Map,java.util.HashMap , java.util.ArrayList, model.movie,model.genre,model.episode,model.account,model.history, dal.MovieDAO, dal.GenreDAO, dal.EpisodeDAO,dal.AccountDAO,java.util.Map.Entry,dal.HistoryDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/admin.css">
        <link rel="stylesheet" href="../css/rankboard.css">
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
                List<account> vipaccounts = daoa.getAllVipUsers();
                request.setAttribute("accounts", accounts);
                request.setAttribute("vip",vipaccounts);
                
                %>
                <c:set var="totalvipmoney" value="${63000*vip.size()}"/>
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
                                <h1>${totalvipmoney} VND</h1>
                            </div>
                            <i class="fa-solid fa-coins card--icon--lg"></i>
                        </div>
                        <div class="card--stats">
                            <span><i class="ri-bar-chart-fill card--icon stat--icon"></i>Với ${vip.size()} người dùng đăng kí Vip</span>

                        </div>
                    </div>
                </div>
            </div>
            <%
            HistoryDAO historyDAO = new HistoryDAO();
            MovieDAO movieDAO = new MovieDAO();
            Map<Integer, Integer> weeklyViews = historyDAO.getWeeklyViews();
            List<Entry<Integer, Integer>> rankFilms = new ArrayList<>(weeklyViews.entrySet());
            request.setAttribute("rankFilms", rankFilms);
            request.setAttribute("movieDAO",movieDAO);
            %>

            <div class="main">
                <div id="header-rank">
                    <h3 style="color: #000000b8">Top Lượt Xem Trong Tuần</h3>
                </div>
                <div id="leaderboard">
                    <div class="ribbon"></div>
                    <table class="table-rank">
                        <tbody>
                            <c:forEach var="rankEntry" items="${rankFilms}" varStatus="status">
                                <tr>
                                    
                                    <c:choose>
                                        <c:when test="${status.index == 0}">
                                            <td class="number" style="color: white; font-size: 18px;">${status.index + 1}</td> <!-- Use status.index to get current index -->
                                    <td class="name" style="color: white; font-size: 18px;">${movieDAO.getMovieTitleByID(rankEntry.key)}</td>
                                    <td class="points" style="color:#cccccc; font-size: 18px;">${rankEntry.value} Views<img class="gold-medal" src="https://github.com/malunaridev/Challenges-iCodeThis/blob/master/4-leaderboard/assets/gold-medal.png?raw=true" alt="gold medal"/></td>
                                            </c:when>
                                            <c:otherwise>
                                            <td class="number">${status.index + 1}</td> <!-- Use status.index to get current index -->
                                    <td class="name" style="color: #000000b8; font-size: 18px;">${movieDAO.getMovieTitleByID(rankEntry.key)}</td>
                                            <td class="points">${rankEntry.value} Views</td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
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
            type: 'line',
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
