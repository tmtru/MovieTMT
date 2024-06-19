/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.account;
import model.movie;

/**
 *
 * @author Admin
 */
public class MovieDAO extends DBContext {
     public int numberOfFilms() {
        String sql = "SELECT COUNT(*) AS count FROM Movie";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Nếu có lỗi xảy ra hoặc không có bản ghi nào, trả về 0
    }

    public ArrayList<movie> getAllMovieEach50() {
        ArrayList<movie> movies = new ArrayList<>();
        String sql = "SELECT * FROM Movie ORDER BY MovieID OFFSET ? ROWS FETCH NEXT 50 ROWS ONLY";

        try {
            int offset = 0;
            boolean moreRows = true;
            while (moreRows) {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, offset);
                ResultSet rs = st.executeQuery();

                moreRows = false;
                while (rs.next()) {
                    moreRows = true;
                    String id = rs.getString("MovieID");
                    String title = rs.getNString("Title");
                    String releaseTime = rs.getString("ReleaseYear");
                    String content = rs.getNString("Content");
                    int movieLength = rs.getInt("MovieLength");
                    String country = rs.getNString("Country");
                    String posterLink = rs.getString("Poster_link");
                    int viewers = rs.getInt("Viewers");
                    String actor = rs.getNString("Actor");
                    String director = rs.getNString("Director");
                    float rating = rs.getFloat("Rating");

                    ArrayList<String> genres = getGenresByMovieId(id);

                    movie m = new movie(id, title, releaseTime, content, country, posterLink, actor, director, movieLength, viewers, rating, genres);
                    movies.add(m);
                }

                offset += 50;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;

    }
    private ArrayList<String> getGenresByMovieId(String movieId) {
        ArrayList<String> genres = new ArrayList<>();
        String sql = "SELECT Genre.GenreName FROM Genre " +
                     "INNER JOIN Movie_Genre ON Genre.GenreID = Movie_Genre.GenreID " +
                     "WHERE Movie_Genre.MovieID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, movieId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                genres.add(rs.getNString("GenreName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genres;
    }

    public movie getMovieById(String id) {
        movie m = null;
        String sql = "Select Movie.*, Genre.GenreName FROM Movie\n"
                + "INNER JOIN Movie_Genre ON Movie_Genre.MovieID=Movie.MovieID\n"
                + "INNER JOIN Genre ON Movie_Genre.GenreID=Genre.GenreID\n"
                + "Where Movie.MovieID=?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            ArrayList<String> genre = new ArrayList<>();
            while (rs.next()) {
                if (m == null) {
                    String title = rs.getNString("Title");
                    String releaseTime = rs.getString("ReleaseYear");
                    String content = rs.getNString("Content");
                    int movieLength = rs.getInt("MovieLength");
                    String country = rs.getNString("Country");
                    String posterLink = rs.getString("Poster_link");
                    int viewers = rs.getInt("Viewers");
                    String actor = rs.getNString("Actor");
                    String director = rs.getNString("Director");
                    float rating = rs.getFloat("rating");
                    m = new movie(id, title, releaseTime, content, country, posterLink, actor, director, movieLength, viewers, rating, genre);
                }
                genre.add(rs.getNString("GenreName"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return m;
    }
    public movie addNewMovie(movie m) {
        String insertMovieSQL = "INSERT INTO Movie (Title, ReleaseYear, Content, MovieLength, Country, Poster_link, Viewers, Actor, Director, Rating) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String insertGenreSQL = "INSERT INTO Movie_Genre (MovieID, GenreID) VALUES (?, ?)";

        try {
            // Disable auto-commit mode
            connection.setAutoCommit(false);

            // Insert the new movie
            PreparedStatement psMovie = connection.prepareStatement(insertMovieSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            psMovie.setNString(1, m.getTitle());
            psMovie.setInt(2, Integer.parseInt(m.getReleaseTime()));
            psMovie.setNString(3, m.getContent());
            psMovie.setInt(4, m.getMovieLength());
            psMovie.setNString(5, m.getCountry());
            psMovie.setString(6, m.getPosterLink());
            psMovie.setInt(7, m.getViewers());
            psMovie.setNString(8, m.getActor());
            psMovie.setNString(9, m.getDirector());
            psMovie.setFloat(10, m.getRating());
            psMovie.executeUpdate();

            // Get the generated MovieID
            ResultSet rs = psMovie.getGeneratedKeys();
            int movieId = 0;
            if (rs.next()) {
                movieId = rs.getInt(1);
            }

            // Insert the genres for the new movie
            PreparedStatement psGenre = connection.prepareStatement(insertGenreSQL);
            for (String genreName : m.getGenre()) {
                int genreId = getGenreIdByName(genreName);
                psGenre.setInt(1, movieId);
                psGenre.setInt(2, genreId);
                psGenre.addBatch();
            }
            psGenre.executeBatch();

            // Commit the transaction
            connection.commit();

            // Re-enable auto-commit mode
            connection.setAutoCommit(true);

            // Set the generated movie ID back to the movie object
            m.setId(String.valueOf(movieId));
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                // Rollback the transaction in case of error
                connection.rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
        }

        return m;
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
    
    public boolean isDuplicatedTitle(String title) {
        String sql = "SELECT COUNT(*) AS count FROM Movie WHERE Title = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, title);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Nếu có lỗi xảy ra hoặc không có bản ghi nào, trả về false
    }
        
    public static void main(String[] args) {
        // Tạo kết nối tới database
        MovieDAO movieDAO = new MovieDAO();
        ArrayList<movie> movies = movieDAO.getAllMovieEach50();
        
        // Xử lý các bộ phim lấy được
        for (movie m : movies) {
            System.out.println(m);
        }
    }

}
