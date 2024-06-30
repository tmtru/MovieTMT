/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.banner;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class BannerDAO extends DBContext{
    public List<banner> getAllBanner() {
        List<banner> banners = new ArrayList<>();
        String sql = "SELECT BannerID, Link_img, Role, MovieID FROM Banner";

        try (
            PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                banner banner = new banner();
                banner.setBannerID(rs.getInt("BannerID"));
                banner.setLinkImg(rs.getString("Link_img"));
                banner.setRole(rs.getString("Role"));
                banner.setMovieID(rs.getInt("MovieID"));
                banners.add(banner);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return banners;
    }
    public List<banner> getAllBanner(String role) {
        List<banner> banners = new ArrayList<>();
        String sql = "SELECT BannerID, Link_img, Role, MovieID FROM Banner WHERE Role = ?";

        try (
            PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, role);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    banner banner = new banner();
                    banner.setBannerID(rs.getInt("BannerID"));
                    banner.setLinkImg(rs.getString("Link_img"));
                    banner.setRole(rs.getString("Role"));
                    banner.setMovieID(rs.getInt("MovieID"));
                    banners.add(banner);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return banners;
    }
    public boolean addNewBanner(banner banner) {
        String sql = "INSERT INTO Banner (Link_img, Role, MovieID) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, banner.getLinkImg());
            stmt.setString(2, banner.getRole());
            stmt.setInt(3, banner.getMovieID());
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to update an existing banner
    public boolean updateBanner(banner banner) {
        String sql = "UPDATE Banner SET Link_img = ?, Role = ?, MovieID = ? WHERE BannerID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, banner.getLinkImg());
            stmt.setString(2, banner.getRole());
            stmt.setInt(3, banner.getMovieID());
            stmt.setInt(4, banner.getBannerID());
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean deleteBanner(int bannerID) {
        String sql = "DELETE FROM Banner WHERE BannerID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, bannerID);
            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static void main(String[] args) {
        BannerDAO dao = new BannerDAO();
        System.out.println(dao.getAllBanner("0"));
    }
}
