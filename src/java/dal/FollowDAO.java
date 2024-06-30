/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.follow;
import java.util.ArrayList;
import java.util.List;
import model.episode;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author Admin
 */
public class FollowDAO extends DBContext {

    public boolean addFollow(follow follow) {
        String sql = "INSERT INTO Follow (Action, ChapterID, MovieID, UserID) VALUES (?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, follow.getAction());
            st.setInt(2, follow.getChapterID());
            st.setInt(3, follow.getMovieID());
            st.setInt(4, follow.getUserID());
            int rowsInserted = st.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteFollow(int userID, int chapterID, int movieID) {
        String sql = "DELETE FROM Follow WHERE UserID = ? AND ChapterID = ? AND MovieID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userID);
            st.setInt(2, chapterID);
            st.setInt(3, movieID);
            int rowsDeleted = st.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public follow getFollow(int userID, int chapterID, int movieID) {
        String sql = "SELECT * FROM Follow WHERE UserID = ? AND ChapterID = ? AND MovieID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userID);
            st.setInt(2, chapterID);
            st.setInt(3, movieID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String action = rs.getString("Action");
                return new follow(action, chapterID, movieID, userID);
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<follow> getAllFollowsByUserID(int userID) {
        String sql = "SELECT * FROM Follow WHERE UserID = ?";
        List<follow> follows = new ArrayList<>();
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String action = rs.getString("Action");
                int chapterID = rs.getInt("ChapterID");
                int movieID = rs.getInt("MovieID");
                follows.add(new follow(action, chapterID, movieID, userID));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return follows;
    }

    public boolean updateFollow(follow follow) {
        String sql = "UPDATE Follow SET Action = ? WHERE UserID = ? AND ChapterID = ? AND MovieID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, follow.getAction());
            st.setInt(2, follow.getUserID());
            st.setInt(3, follow.getChapterID());
            st.setInt(4, follow.getMovieID());
            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
