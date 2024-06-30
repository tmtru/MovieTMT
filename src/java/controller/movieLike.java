/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.account;
import model.movie;

/**
 *
 * @author Admin
 */
public class movieLike extends HttpServlet {

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
            out.println("<title>Servlet movieAction</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet movieAction at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        movie movie = (movie) session.getAttribute("watchingmovie");
        account user = (account) session.getAttribute("account");
        String action = request.getParameter("action");
        AccountDAO daoa = new AccountDAO();
        String userid = String.valueOf(daoa.getIDbyEmail(user.getEmail()));
        String movieid = movie.getId();
        String epid = request.getParameter("ep");
        Cookie[] cookies = request.getCookies();
        List<String> likedMovies = new ArrayList<>();
        List<String> savedMovies = new ArrayList<>();
        boolean isLikeExisted = false;
        boolean isSaveExisted = false;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(userid + "like") && action.equals("like")) {
                    isLikeExisted = true;
                    likedMovies = new ArrayList<>(Arrays.asList(cookie.getValue().split("\\.")));
                    boolean isLiked = false; // Biến để kiểm tra xem phim đã được thích chưa
                    if (likedMovies.contains(String.valueOf(movieid))) {
                        isLiked = true;
                    }
                    if (!isLiked) {
                        likedMovies.add(movieid);
                    } else {
                        likedMovies.remove(movieid);
                    }
                    Cookie newCookie = new Cookie(userid + "like", String.join(".", likedMovies));

                    // Update the cookie with the modified list of liked movies
                    newCookie.setMaxAge(60 * 60 * 24 * 30 * 6); // Cookie expires in 30 days
                    response.addCookie(newCookie);

                    break;
                }
                if (cookie.getName().equals(userid + "save")&& action.equals("save")) {
                    isSaveExisted = true;
                    savedMovies = new ArrayList<>(Arrays.asList(cookie.getValue().split("\\.")));
                    boolean isSaved = false; 
                    if (savedMovies.contains(String.valueOf(movieid))) {
                        isSaved = true;
                    }
                    if (!isSaved) {
                        savedMovies.add(movieid);
                    } else {
                        savedMovies.remove(movieid);
                    }
                    Cookie newCookie = new Cookie(userid + "save", String.join(".", savedMovies));

                    newCookie.setMaxAge(60 * 60 * 24 * 30 * 6); 
                    response.addCookie(newCookie);

                    break;
                }
            }
        }
        if (!isLikeExisted && action.equals("like")) {
            if (action.equals("like")) {
                Cookie likeCookie = new Cookie(userid+"like", movieid);
                likeCookie.setMaxAge(60 * 60 * 24 * 30); // Cookie expires in 30 days
                response.addCookie(likeCookie);
            }  
        }
        if (!isSaveExisted && action.equals("save")) {
                Cookie saveCookie = new Cookie(userid+"save", movieid);
                saveCookie.setMaxAge(60 * 60 * 24 * 30); // Cookie expires in 30 days
                response.addCookie(saveCookie);
            }

        response.sendRedirect("movieload");

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
