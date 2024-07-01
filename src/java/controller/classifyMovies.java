/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static controller.search.normalizeVietnamese;
import dal.MovieDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.regex.Pattern;
import model.genre;
import model.movie;

/**
 *
 * @author Admin
 */
public class classifyMovies extends HttpServlet {

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
            out.println("<title>Servlet classifyMovies</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet classifyMovies at " + request.getContextPath() + "</h1>");
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
        String genre = request.getParameter("genre");
        String country = request.getParameter("country");
        //0 tu lon den nho
        //1 tu nho den lon
        int sort = -1;
        if (request.getParameter("sort") != null && request.getParameter("sort") != "") {
            sort = Integer.parseInt(request.getParameter("sort"));
        }
        ArrayList<movie> m0;
        MovieDAO dao = new MovieDAO();
        ArrayList<movie> m;
        m0 = dao.getAllMovie("ReleaseYear", 0);
        m = new ArrayList<>();
        if (text != null) {
            for (movie item : m0) {
                boolean containName = normalizeVietnamese(item.getTitle().toLowerCase()).contains(normalizeVietnamese(text.toLowerCase()));
                if (containName) {
                    m.add(item);
                }
            }
            m0 = m;
        }
        if (genre != null) {
            m = new ArrayList<>();
            for (movie item : m0) {
                boolean isGenre;
                if (genre == null || genre == "") {
                    isGenre = true;
                } else {
                    isGenre = item.getGenre().contains(genre);
                }
                if (isGenre) {
                    m.add(item);
                }
                m0 = m;
            }
        }
        if (country != null) {
            m = new ArrayList<>();
            for (movie item : m0) {
                boolean isCountry;
                if (country == null || country == "") {
                    isCountry = true;
                } else {
                    isCountry = normalizeVietnamese(item.getCountry().toLowerCase()).contains(country);
                }
                if (isCountry) {
                    m.add(item);
                }
                m0 = m;
            }
        }
        if (by == null) {
            by = "";
        }
        switch (by) {
            case "title":
                m0 = sortMoviesBy("name", m0);
                break;
            case "date":
                m0 = sortMoviesBy("date", m0);
                break;
            case "view":
                m0 = sortMoviesBy("views", m0);
                break;
            case "rating":
                m0 = sortMoviesBy("rating", m0);
                break;
            default:
                break;
        }
        if (sort == 1) {
            Collections.reverse(m0);
        } else sort=0;

        request.setAttribute("genre", genre);
        request.setAttribute("by", by);
        request.setAttribute("search", text);
        request.setAttribute("country", country);
        request.setAttribute("sort", sort);
        request.setAttribute("movies", m0);
        request.getRequestDispatcher("genre.jsp").forward(request, response);
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

    //tim nhung bo phim trong array thuoc genre nay
    private static ArrayList<movie> getMoviesByGenre(String genreName, ArrayList<movie> ms) {
        MovieDAO daom = new MovieDAO();
        if (ms == null) {
            return daom.getMovieByGenre(genreName);
        } else {
            ArrayList<movie> moviesByGenre = new ArrayList<>();
            for (movie m : ms) {
                if (m.getGenre().contains(genreName)) {
                    moviesByGenre.add(m);
                }
            }
            return moviesByGenre;
        }
    }

    // sortBy may be in the list(name,date,rating,views)
    private static ArrayList<movie> sortMoviesBy(String sortBy, ArrayList<movie> ms) {
        MovieDAO daom = new MovieDAO();
        if (ms == null) {
            return null;
        } else {
            switch (sortBy) {
                case "name":
                    Collections.sort(ms, Comparator.comparing(movie::getTitle));
                    break;
                case "date":
                    // Assuming date is in a comparable format, otherwise, parse it accordingly
                    Collections.sort(ms, Comparator.comparing(movie::getReleaseTime).reversed());
                    break;
                case "rating":
                    Collections.sort(ms, Comparator.comparingDouble(movie::getRating).reversed());
                    break;
                case "views":
                    Collections.sort(ms, Comparator.comparingInt(movie::getViewers).reversed());
                    break;
                default:
                    return null;
            }
            return ms;
        }
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

    private static ArrayList<movie> getMoviesByCountry(String country, ArrayList<movie> ms) {
        MovieDAO daom = new MovieDAO();
        if (ms == null) {
            return daom.getAllMoviesByCountry(country);
        } else {
            ArrayList<movie> moviesByCountry = new ArrayList<>();
            for (movie m : ms) {
                if (normalizeVietnamese(m.getCountry()).equalsIgnoreCase(normalizeVietnamese(country))) {
                    moviesByCountry.add(m);
                }
            }
            return moviesByCountry;
        }
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
