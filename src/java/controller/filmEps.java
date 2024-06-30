/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.EpisodeDAO;
import dal.MovieDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.episode;

/**
 *
 * @author Admin
 */
public class filmEps extends HttpServlet {

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
            out.println("<title>Servlet filmEps</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet filmEps at " + request.getContextPath() + "</h1>");
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
        String messError = "";
        MovieDAO daom = new MovieDAO();
        EpisodeDAO daoep = new EpisodeDAO();
        int movieid = Integer.parseInt(request.getParameter("movieid"));
        int id = Integer.parseInt(request.getParameter("chapid"));
        String action = request.getParameter("action");
        switch (action) {
            case "delete":
                daoep.deleteEps(movieid, id);
                response.sendRedirect("filmDetail.jsp?id=" + movieid);
                break;

            default:
                response.sendRedirect("filmDetail.jsp?id=" + movieid);
                break;
        }

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
        //xu li add new eps
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String messError = "";
        MovieDAO daom = new MovieDAO();
        EpisodeDAO daoep = new EpisodeDAO();
        int movieid = Integer.parseInt(request.getParameter("movieid"));
        int id = Integer.parseInt(request.getParameter("chapid"));
        String action = request.getParameter("action");
        String name = request.getParameter("chapname");
        int length = Integer.parseInt(request.getParameter("length"));
        String access = request.getParameter("access");
        String thumbnail=request.getParameter("thumbnail");

        String link = request.getParameter("link");
        episode ep = new episode(id, name, length, access, movieid, link,thumbnail);
        switch (action) {
            case "add":
                List<episode> eps = daoep.getAllEpsByMovieID(movieid);
                boolean isExist = false;
                for (episode e : eps) {
                    if (e.getChapterID() == id) {
                        messError = "Không thể thêm vì tập phim này đã tồn tại!!";
                        isExist = true;
                        request.setAttribute("error", messError);
                        request.getRequestDispatcher("filmDetail.jsp?id=" + movieid).forward(request, response);
                    }
                }
                if (!isExist) {
                    daoep.addEps(ep);
                    response.sendRedirect("filmDetail.jsp?id=" + movieid);
                }
                break;

            case "edit":
                daoep.editEps(ep);
                response.sendRedirect("filmDetail.jsp?id=" + movieid);
                break;
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
