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
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.regex.Pattern;
import model.movie;

/**
 *
 * @author Admin
 */
public class search extends HttpServlet {

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
            out.println("<title>Servlet search</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet search at " + request.getContextPath() + "</h1>");
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
        String text = request.getParameter("search");
        String by = request.getParameter("by");
        String genre=request.getParameter("genre");
        MovieDAO dao = new MovieDAO();
        int numberOfFilms=dao.numberOfFilms();
        ArrayList<movie> m;
        if (text == null) {
            text = "";
        }
        if (by == null) {
            by = "";
        }
        ArrayList<movie> m0;

        switch (by) {
            case "title":
                m0 = dao.getAllMovie("Title", 1);
                break;
            case "date":
                m0 = dao.getAllMovie("ReleaseYear", 0);
                break;
            case "view":
                m0 = dao.getAllMovie("Viewers", 0);
                break;
            case "rating":
                m0 = dao.getAllMovie("Rating", 0);
                break;
            default:
                m0 = dao.getAllMovie("MovieID", 0);
        }
        m = new ArrayList<>();
        for (movie item : m0) {
            boolean isGenre;
            boolean containName=normalizeVietnamese(item.getTitle().toLowerCase()).contains(normalizeVietnamese(text.toLowerCase()));
            if (genre==null || genre=="") isGenre=true;
            else isGenre=item.getGenre().contains(genre);
            if (containName && isGenre) {
                m.add(item);
            }
        }
        request.setAttribute("genre", genre);
        request.setAttribute("by", by);
        request.setAttribute("search", text);
        request.setAttribute("movies", m);
        request.getRequestDispatcher("films.jsp").forward(request, response);

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
    public static void main(String[] args) {
        // Tạo kết nối tới database
        MovieDAO movieDAO = new MovieDAO();
        ArrayList<movie> movies = movieDAO.getAllMovie("Title",0);
        
        // Xử lý các bộ phim lấy được
        
            System.out.println(normalizeVietnamese("Đýng cung"));
        
    }

}
