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
import model.genre;
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
//z là thứ tự từ lớn đến nhỏ hay nhỏ đến lớn
    // 1 là nhỏ đến lớn dần, 0 là ngược lại

    public ArrayList<movie> getAllMovie(String orderBy, int z) {
        ArrayList<movie> movies = new ArrayList<>();
        String sql;
        if (z == 1) {
            sql = "SELECT * FROM Movie ORDER BY " + orderBy + " OFFSET ? ROWS FETCH NEXT 50 ROWS ONLY";
        } else {
            sql = "SELECT * FROM Movie ORDER BY " + orderBy + " DESC OFFSET ? ROWS FETCH NEXT 50 ROWS ONLY";
        }

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
        String sql = "SELECT Genre.GenreName FROM Genre "
                + "INNER JOIN Movie_Genre ON Genre.GenreID = Movie_Genre.GenreID "
                + "WHERE Movie_Genre.MovieID = ?";

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
                + "LEFT JOIN Movie_Genre ON Movie_Genre.MovieID=Movie.MovieID\n"
                + "LEFT JOIN Genre ON Movie_Genre.GenreID=Genre.GenreID\n"
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
                if (rs.getNString("GenreName")!=null) genre.add(rs.getNString("GenreName"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return m;
    }


    public ArrayList<movie> getAllMoviesByCountry(String country) {
        ArrayList<movie> movies = new ArrayList<>();
        String sql = "SELECT * FROM Movie WHERE Country = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, country);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String id = rs.getString("MovieID");
                String title = rs.getNString("Title");
                String releaseTime = rs.getString("ReleaseYear");
                String content = rs.getNString("Content");
                int movieLength = rs.getInt("MovieLength");
                String posterLink = rs.getString("Poster_link");
                int viewers = rs.getInt("Viewers");
                String actor = rs.getNString("Actor");
                String director = rs.getNString("Director");
                float rating = rs.getFloat("Rating");

                ArrayList<String> genres = getGenresByMovieId(id);

                movie m = new movie(id, title, releaseTime, content, country, posterLink, actor, director, movieLength, viewers, rating, genres);
                movies.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
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
            psMovie.setString(2, m.getReleaseTime());
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

    public movie editMovie(movie m) {
        String updateMovieSQL = "UPDATE Movie SET Title=?, ReleaseYear=?, Content=?, MovieLength=?, Country=?, Poster_link=?, Viewers=?, Actor=?, Director=?, Rating=?\n"
                + "WHERE MovieID=?;";
        String updateGenreSQL = "DELETE FROM Movie_Genre WHERE MovieID=?";
        String insertGenreSQL = "INSERT INTO Movie_Genre (MovieID, GenreID) VALUES (?, ?)";

        try {
            // Disable auto-commit mode
            connection.setAutoCommit(false);

            // Insert the new movie
            PreparedStatement psMovie = connection.prepareStatement(updateMovieSQL);
            psMovie.setNString(1, m.getTitle());
            psMovie.setString(2, m.getReleaseTime());
            psMovie.setNString(3, m.getContent());
            psMovie.setInt(4, m.getMovieLength());
            psMovie.setNString(5, m.getCountry());
            psMovie.setString(6, m.getPosterLink());
            psMovie.setInt(7, m.getViewers());
            psMovie.setNString(8, m.getActor());
            psMovie.setNString(9, m.getDirector());
            psMovie.setFloat(10, m.getRating());
            psMovie.setInt(11, Integer.parseInt(m.getId()));
            psMovie.executeUpdate();

            // Get the  MovieID
            int movieId = Integer.parseInt(m.getId());
            //delete the old genre
            PreparedStatement psGenreDele = connection.prepareStatement(updateGenreSQL);
            psGenreDele.setInt(1, movieId);
            psGenreDele.executeUpdate();

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

    public boolean deleteMovie(int movieID) {
        String deleteHistorySQL = "DELETE FROM History WHERE MovieID = ?";
        String deleteFollowSQL = "DELETE FROM Follow WHERE MovieID = ?";
        String deleteRatingsSQL = "DELETE FROM Ratings WHERE MovieID = ?";
        String deleteMovieLanguageSQL = "DELETE FROM Movie_Language WHERE MovieID = ?";
        String deleteMovieGenreSQL = "DELETE FROM Movie_Genre WHERE MovieID = ?";
        String deleteEpisodesSQL = "DELETE FROM Episodes WHERE MovieID = ?";
        String deleteBannerSQL = "DELETE FROM Banner WHERE MovieID = ?";
        String deleteMovieSQL = "DELETE FROM Movie WHERE MovieID = ?";

        try {
            connection.setAutoCommit(false); // Start transaction

            try (PreparedStatement psHistory = connection.prepareStatement(deleteHistorySQL); PreparedStatement psFollow = connection.prepareStatement(deleteFollowSQL); PreparedStatement psRatings = connection.prepareStatement(deleteRatingsSQL); PreparedStatement psMovieLanguage = connection.prepareStatement(deleteMovieLanguageSQL); PreparedStatement psMovieGenre = connection.prepareStatement(deleteMovieGenreSQL); PreparedStatement psEpisodes = connection.prepareStatement(deleteEpisodesSQL); PreparedStatement psBanner = connection.prepareStatement(deleteBannerSQL); PreparedStatement psMovie = connection.prepareStatement(deleteMovieSQL)) {

                // Delete from History
                psHistory.setInt(1, movieID);
                psHistory.executeUpdate();

                // Delete from Follow
                psFollow.setInt(1, movieID);
                psFollow.executeUpdate();

                // Delete from Ratings
                psRatings.setInt(1, movieID);
                psRatings.executeUpdate();

                // Delete from Movie_Language
                psMovieLanguage.setInt(1, movieID);
                psMovieLanguage.executeUpdate();

                // Delete from Movie_Genre
                psMovieGenre.setInt(1, movieID);
                psMovieGenre.executeUpdate();

                // Delete from Episodes
                psEpisodes.setInt(1, movieID);
                psEpisodes.executeUpdate();

                // Delete from Banner
                psBanner.setInt(1, movieID);
                psBanner.executeUpdate();

                // Delete from Movie
                psMovie.setInt(1, movieID);
                psMovie.executeUpdate();

                connection.commit(); // Commit transaction
                connection.setAutoCommit(true);
                return true;

            } catch (SQLException e) {
                connection.rollback(); // Rollback transaction on error
                e.printStackTrace();
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<movie> getMovieByGenre(String genreName) {
        ArrayList<movie> movies = new ArrayList<>();
        String sql = "SELECT m.MovieID, m.Title, m.ReleaseYear, m.Content, m.MovieLength, m.Country, m.Poster_link, m.Viewers, m.Actor, m.Director, m.Rating "
                + "FROM Movie m "
                + "INNER JOIN Movie_Genre mg ON m.MovieID = mg.MovieID "
                + "INNER JOIN Genre g ON mg.GenreID = g.GenreID "
                + "WHERE g.GenreName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, genreName);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }
    public void increaseView(int i, int movieID) {
        String sql = "UPDATE Movie SET Viewers = Viewers + ? WHERE MovieID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, i);
            pstmt.setInt(2, movieID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     public int allViews() {
        String sql = "SELECT SUM(Viewers) AS totalViews FROM Movie";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("totalViews");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Trả về 0 nếu có lỗi
    }

    public static void main(String[] args) {
        // Tạo kết nối tới database
        MovieDAO dao=new MovieDAO();
                movie currentFilm = dao.getMovieById("23");

        // Xử lý các bộ phim lấy được
        System.out.println(currentFilm);

    }

}
