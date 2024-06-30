/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
import java.sql.Timestamp;

public class history {
    private int id;
    private String time;
    private Timestamp watchedAt;
    private int userID;
    private int movieID;
    private int chapterID;
    private String comment;

    public history() {
    }

    public history(int id, String time, Timestamp watchedAt, int userID, int movieID, int chapterID, String comment) {
        this.id = id;
        this.time = time;
        this.watchedAt = watchedAt;
        this.userID = userID;
        this.movieID = movieID;
        this.chapterID = chapterID;
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    

    // Getters and Setters
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Timestamp getWatchedAt() {
        return watchedAt;
    }

    public void setWatchedAt(Timestamp watchedAt) {
        this.watchedAt = watchedAt;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public int getChapterID() {
        return chapterID;
    }

    public void setChapterID(int chapterID) {
        this.chapterID = chapterID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "history{" + "time=" + time + ", watchedAt=" + watchedAt + ", userID=" + userID + ", movieID=" + movieID + ", chapterID=" + chapterID + ", comment=" + comment + '}';
    }
    
}