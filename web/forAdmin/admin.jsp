<%-- 
    Document   : admin
    Created on : Jun 18, 2024, 4:42:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script src="https://kit.fontawesome.com/aab0c35bef.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/admin.css">

    </head>

    <body>

        
        <div class="container-fluid main-body">
            <div class="sidebar">
                <ul class="sidebar--items">
                    <li>
                        <a href="dashboard.jsp" class="${pageContext.request.servletPath== '/forAdmin/dashboard.jsp' ? 'active':'' }">
                            <span class="icon icon-1"><i class="fa-solid fa-table-cells"></i></span>
                            <span class="sidebar--item">Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="search" class="${(pageContext.request.servletPath== '/forAdmin/films.jsp' || pageContext.request.servletPath== '/forAdmin/filmDetail.jsp') ? 'active':'' }">
                            <span class="icon icon-2"><i class="fa-solid fa-clapperboard"></i></span>
                            <span class="sidebar--item">Movies</span>
                        </a>
                    </li>
                    <li>
                        <a href="banner.jsp" class="${pageContext.request.servletPath== '/forAdmin/banner.jsp' ? 'active':'' }">
                            <span class="icon icon-2"><i class="fa-solid fa-images"></i></span>
                            <span class="sidebar--item" style="white-space: nowrap;">Banner</span>
                        </a>
                    </li>
                    <li>
                        <a href="user.jsp" class="${pageContext.request.servletPath== '/forAdmin/user.jsp' ? 'active':'' }">
                            <span class="icon icon-4"><i class="fa-solid fa-user"></i></span>
                            <span class="sidebar--item">Users</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="icon icon-5"><i class="fa-solid fa-clock-rotate-left"></i></span>
                            <span class="sidebar--item">Activity</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="icon icon-6"><i class="fa-solid fa-circle-info"></i></i></span>
                            <span class="sidebar--item">Support</span>
                        </a>
                    </li>
                </ul>
                <ul class="sidebar--bottom-items">
                    <li>
                        <a href="../home">
                            <span class="icon icon-8"><i class="ri-logout-box-r-line"></i></span>
                            <span class="sidebar--item">Exit</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </body>

</html>
