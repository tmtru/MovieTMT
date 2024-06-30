/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class episode {
    private int chapterID;
    private String name;
    private int chapterLength;
    private String accessType;
    private int movieID;
    private String linkEp;
    private String thumbnail;

    public episode() {
    }
    

    public episode(int chapterID, String name, int chapterLength, String accessType, int movieID, String linkEp,String thumbnail) {
        this.chapterID = chapterID;
        this.name = name;
        this.chapterLength = chapterLength;
        this.accessType = accessType;
        this.movieID = movieID;
        this.linkEp = linkEp;
        this.thumbnail=thumbnail;
    }
    

    public int getChapterID() {
        return chapterID;
    }

    public void setChapterID(int chapterID) {
        this.chapterID = chapterID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getChapterLength() {
        return chapterLength;
    }

    public void setChapterLength(int chapterLength) {
        this.chapterLength = chapterLength;
    }

    public String getAccessType() {
        return accessType;
    }

    public void setAccessType(String accessType) {
        this.accessType = accessType;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public String getLinkEp() {
        return linkEp;
    }

    public void setLinkEp(String linkEp) {
        this.linkEp = linkEp;
    }

    public String getThumbnail() {
        return thumbnail;
    }
    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }
    
}

