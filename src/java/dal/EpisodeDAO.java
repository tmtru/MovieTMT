/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

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
public class EpisodeDAO extends DBContext {

    public List<episode> getAllEpsByMovieID(int movieID) {
        List<episode> episodes = new ArrayList<>();
        String sql = "SELECT ChapterID, Name, Chapter_Length, Access_Type, MovieID, link_ep, Thumbnail FROM Episodes WHERE MovieID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, movieID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                episode episode = new episode();
                episode.setChapterID(rs.getInt("ChapterID"));
                episode.setName(rs.getString("Name"));
                episode.setChapterLength(rs.getInt("Chapter_Length"));
                episode.setAccessType(rs.getString("Access_Type"));
                episode.setMovieID(rs.getInt("MovieID"));
                episode.setLinkEp(rs.getString("link_ep"));
                episode.setThumbnail(rs.getString("Thumbnail"));
                episodes.add(episode);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return episodes;
    }

    // Method to add a new episode
    public boolean addEps(episode episode) {
        String sql = "INSERT INTO Episodes (ChapterID, Name, Chapter_Length, Access_Type, MovieID, link_ep,Thumbnail) VALUES (?, ?, ?, ?, ?, ?,?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, episode.getChapterID());
            st.setString(2, episode.getName());
            st.setInt(3, episode.getChapterLength());
            st.setString(4, episode.getAccessType());
            st.setInt(5, episode.getMovieID());
            st.setString(6, episode.getLinkEp());
            st.setString(7, episode.getThumbnail());
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to edit an existing episode
    public boolean editEps(episode episode) {
        String sql = "UPDATE Episodes SET Name = ?, Chapter_Length = ?, Access_Type = ?, link_ep = ?, Thumbnail=? WHERE MovieID = ? AND ChapterID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, episode.getName());
            st.setInt(2, episode.getChapterLength());
            st.setString(3, episode.getAccessType());
            st.setString(4, episode.getLinkEp());
            st.setString(5, episode.getThumbnail());
            st.setInt(6, episode.getMovieID());
            st.setInt(7, episode.getChapterID());
            
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to delete an episode
    public boolean deleteEps(int movieID, int chapterID) {
        String sql = "DELETE FROM Episodes WHERE MovieID = ? AND ChapterID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, movieID);
            st.setInt(2, chapterID);
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
