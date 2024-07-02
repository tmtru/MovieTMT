/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.BannerDAO;
import dal.HistoryDAO;
import dal.MovieDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.account;
import model.banner;
import model.history;
import model.movie;

/**
 *
 * @author Admin
 */
public class homeFilms extends HttpServlet {

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
            out.println("<title>Servlet listFilms</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet listFilms at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        MovieDAO daom = new MovieDAO();
        ArrayList<movie> movies = daom.getAllMovie("Viewers", 0);
        ArrayList<movie> moviesR = daom.getAllMovie("Rating", 0);
        ArrayList<movie> moviesN = daom.getAllMovie("ReleaseYear", 0);
        BannerDAO daob = new BannerDAO();
        List<banner> banners0 = daob.getAllBanner("0");
        List<banner> banners1 = daob.getAllBanner("1");
        List<movie> moviesBanners0 = new ArrayList<>();
        List<movie> moviesBanners1 = new ArrayList<>();
        for (int i = 0; i < banners0.size(); i++) {
            movie m = daom.getMovieById(String.valueOf(banners0.get(i).getMovieID()));
            moviesBanners0.add(m);
        }
        if (movies.size() > 15) {
            movies.subList(15, movies.size()).clear();
        }
        if (moviesR.size() > 15) {
            moviesR.subList(15, moviesR.size()).clear();
        }
        if (moviesN.size() > 15) {
            moviesN.subList(15, moviesN.size()).clear();
        }
        for (int i = 0; i < banners1.size(); i++) {
            movie m = daom.getMovieById(String.valueOf(banners1.get(i).getMovieID()));
            moviesBanners1.add(m);
        }
        HttpSession session = request.getSession();
        HistoryDAO daoh = new HistoryDAO();
        AccountDAO daoa = new AccountDAO();
        account a = (account) session.getAttribute("account");
        List<history> hs = null;
        try {
            if (a != null) {
                hs = daoh.getHistoryByUserID(daoa.getIDbyEmail(a.getEmail()));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        Map<Integer, history> latestHistoryMap = new LinkedHashMap<>();
        if (hs != null) {
            for (history h : hs) {
                int movieID = h.getMovieID();           
                latestHistoryMap.put(movieID, h);
            }
        }
        List<history> orderedHistoryList = new ArrayList<>(latestHistoryMap.values());
        Collections.reverse(orderedHistoryList);

        List<movie> moviesFollow = new ArrayList<>();
        for (history h : orderedHistoryList) {
            movie m = daom.getMovieById(String.valueOf(h.getMovieID()));
            moviesFollow.add(m);
        }
        session.setAttribute("moviesFollow", moviesFollow);
        session.setAttribute("hmoviesView", movies);
        session.setAttribute("hmoviesRating", moviesR);
        session.setAttribute("hmoviesTime", moviesN);
        session.setAttribute("hbanners0", banners0);
        session.setAttribute("hbanners1", banners1);
        session.setAttribute("hmoviesBanners0", moviesBanners0);
        session.setAttribute("hmoviesBanners1", moviesBanners1);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
        processRequest(request, response);
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
