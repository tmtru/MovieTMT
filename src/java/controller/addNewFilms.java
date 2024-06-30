/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.MovieDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.movie;

/**
 *
 * @author Admin
 */
public class addNewFilms extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addNewFilms</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addNewFilms at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        String releaseDate = request.getParameter("releaseDate");
//        releaseDate=convertDateFormat(releaseDate);
        String content = request.getParameter("content");
        String posterLink = request.getParameter("posterLink");
        String country = request.getParameter("country");
        int eps = Integer.parseInt(request.getParameter("numberOfEps"));
        String genre1 = request.getParameter("genre1");
        String genre2 = request.getParameter("genre2");
        String genre3 = request.getParameter("genre3");
        String genre4 = request.getParameter("genre4");
        ArrayList<String> genre=new ArrayList<>();
        if (genre1 != null && !genre1.isEmpty()) {
            genre.add(genre1);
        }
        if (genre2 != null && !genre2.isEmpty()) {
            genre.add(genre2);
        }
        if (genre3 != null && !genre3.isEmpty()) {
            genre.add(genre3);
        }
        if (genre4 != null && !genre4.isEmpty()) {
            genre.add(genre4);
        }
        String actor = request.getParameter("actor");
        String director = request.getParameter("director");
        String mess = "";
        int viewers = Integer.parseInt(request.getParameter("viewers"));
        float rating = Float.parseFloat(request.getParameter("rating"));
        movie m=new movie("",title, releaseDate, content, country, posterLink, actor, director,eps, viewers, rating, genre);
        MovieDAO dao=new MovieDAO();
        if (!dao.isDuplicatedTitle(title)) dao.addNewMovie(m);
        request.setAttribute("messf", m);
        response.sendRedirect("search");

    }


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
