/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.history;
import java.sql.Timestamp;
/**
 *
 * @author Admin
 */
public class HistoryDAO extends DBContext{


    // Thêm lịch sử xem phim
    public void addHistory(int userID, int movieID, int chapterID, String comment) throws SQLException {
        String sql = "INSERT INTO History (Time, Watched_at, UserID, MovieID, ChapterID, Comment) VALUES (GETDATE(), GETDATE(), ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userID);
            ps.setInt(2, movieID);
            ps.setInt(3, chapterID);
            ps.setString(4, comment);
            ps.executeUpdate();
        } catch (SQLException e){
            System.out.println(e);
        }
    }

    // Lấy lịch sử xem phim của một người dùng
    public List<history> getHistoryByUserID(int userID) throws SQLException {
        List<history> historyList = new ArrayList<>();
        String sql = "SELECT * FROM History WHERE UserID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    history history = new history();
                    history.setId(rs.getInt("HistoryID"));
                    history.setTime(formatDateTime(rs.getTimestamp("Time")));
                    history.setWatchedAt(rs.getTimestamp("Watched_at"));
                    history.setUserID(rs.getInt("UserID"));
                    history.setMovieID(rs.getInt("MovieID"));
                    history.setChapterID(rs.getInt("ChapterID"));
                    history.setComment(rs.getString("Comment"));
                    historyList.add(history);
                }
            }
        }
        return historyList;
    }
    public List<history> getHistoryCommentByMovieID(int movieID) throws SQLException {
        List<history> historyCommentList = new ArrayList<>();
        String sql = "SELECT * FROM History WHERE MovieID = ? AND Comment IS NOT NULL ORDER BY Time DESC;";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, movieID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    history history = new history();
                    history.setId(rs.getInt("HistoryID"));
                    history.setTime(formatDateTime(rs.getTimestamp("Time")));
                    history.setWatchedAt(rs.getTimestamp("Watched_at"));
                    history.setUserID(rs.getInt("UserID"));
                    history.setMovieID(rs.getInt("MovieID"));
                    history.setChapterID(rs.getInt("ChapterID"));
                    history.setComment(rs.getString("Comment"));
                    historyCommentList.add(history);
                }
            }
        }
        return historyCommentList;
    }
    public String formatDateTime(Timestamp timestamp) {
        if (timestamp == null) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(timestamp);
    }

    // Cập nhật nhận xét trong lịch sử
    public void updateComment(int historyID, String comment) throws SQLException {
    String sql = "UPDATE History SET Comment = ? WHERE HistoryID = ?";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setString(1, comment);
        ps.setInt(2, historyID);
        ps.executeUpdate();
    }
}

    // Xóa lịch sử xem phim
    public void deleteHistory(int historyID) throws SQLException {
    String sql = "DELETE FROM History WHERE HistoryID = ?";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, historyID);
        ps.executeUpdate();
    }
}
    public static void main(String[] args) throws SQLException {
        // Tạo kết nối tới database
        HistoryDAO DAO = new HistoryDAO();
        List<history> hs=DAO.getHistoryCommentByMovieID(2);
        

        // Xử lý các bộ phim lấy được
        
            System.out.println(hs);
        
        
    }
}


