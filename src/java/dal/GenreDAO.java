/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.genre;

/**
 *
 * @author Admin
 */
public class GenreDAO extends DBContext{
    public ArrayList<genre> getAllGenres() {
        String sql = "SELECT * FROM Genre";
        ArrayList<genre> g=new ArrayList<>();
        
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                int genreID=rs.getInt("GenreID");
                String name=rs.getNString("GenreName");
                g.add(new genre(genreID, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return g;
    }
    private int getGenreIdByName(String genreName) {
        String sql = "SELECT GenreID FROM Genre WHERE GenreName = ?";
        int genreId = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, genreName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                genreId = rs.getInt("GenreID");
            } else {
                // If genre doesn't exist, insert it and get the new ID
                String insertGenreSQL = "INSERT INTO Genre (GenreName) VALUES (?)";
                PreparedStatement psInsertGenre = connection.prepareStatement(insertGenreSQL, PreparedStatement.RETURN_GENERATED_KEYS);
                psInsertGenre.setNString(1, genreName);
                psInsertGenre.executeUpdate();
                ResultSet rsGenre = psInsertGenre.getGeneratedKeys();
                if (rsGenre.next()) {
                    genreId = rsGenre.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genreId;
    }
}
