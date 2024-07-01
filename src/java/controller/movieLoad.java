/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.EpisodeDAO;
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
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import model.account;
import model.episode;
import model.history;
import model.movie;
import model.movie;

/**
 *
 * @author Admin
 */
public class movieLoad extends HttpServlet {

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
            out.println("<title>Servlet movie</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet movie at " + request.getContextPath() + "</h1>");
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
         AccountDAO accountDAO = new AccountDAO();
        HttpSession session = request.getSession();
        account a=(account) session.getAttribute("account");
        int userID=accountDAO.getIDbyEmail(a.getEmail());
        MovieDAO daom = new MovieDAO();
        movie currentMovie;
        String id = request.getParameter("movieid");
        if (id == null) {
            currentMovie = (movie) session.getAttribute("watchingmovie");
            id = currentMovie.getId();
        }
        String ep = request.getParameter("ep");
        if (ep == null || ep.equals("")) {
            ep = "0";
        }
        movie m = daom.getMovieById(id);
        session.setAttribute("watchingmovie", m);
        //load ep
        EpisodeDAO daoep = new EpisodeDAO();
        List<episode> eps = daoep.getAllEpsByMovieID(Integer.parseInt(m.getId()));

        session.setAttribute("watchingeps", eps);
        
        //load comment
        HistoryDAO historyDAO = new HistoryDAO();
       
        List<history> historyList = null;
        Map<history, account> historyAccountMap = new LinkedHashMap<>();

        try {
            historyList = historyDAO.getHistoryCommentByMovieID(Integer.parseInt(m.getId()));

            // Fetch account information for each user who commented
            for (history h : historyList) {
                account account = accountDAO.getAccountByID(h.getUserID());
                historyAccountMap.put(h, account);
            }

            // Set the map in session attribute
            session.setAttribute("historyAccountMap", historyAccountMap);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        //save history view of user
        boolean isViewed=historyDAO.userViewedMovie(userID, Integer.parseInt(id), Integer.parseInt(ep));
        if (!isViewed) {
            daom.increaseView(1,Integer.parseInt(id));
            try {
                historyDAO.addHistory(userID,Integer.parseInt(id) , Integer.parseInt(ep), null);
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        }

        String title = normalizeVietnamese(m.getTitle());
        response.sendRedirect("movie.jsp?title=" + title + "&ep=" + ep);
    }

    public static String normalizeVietnamese(String value) {
        // Chuẩn hóa chuỗi để tách các ký tự tổ hợp
        String normalized = Normalizer.normalize(value, Normalizer.Form.NFD);
        // Tạo biểu thức chính quy để khớp với các ký tự tổ hợp
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        // Loại bỏ tất cả các ký tự tổ hợp
        String withoutDiacritics = pattern.matcher(normalized).replaceAll("");
        // Replace specific Vietnamese characters
        withoutDiacritics = withoutDiacritics.replace('Đ', 'D').replace('đ', 'd');
        return withoutDiacritics;
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
