/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class banner {
    private int bannerID;
    private String linkImg;
    private String role;
    private int movieID;

    // Constructors
    public banner() {
    }

    public banner(int bannerID, String linkImg, String role, int movieID) {
        this.bannerID = bannerID;
        this.linkImg = linkImg;
        this.role = role;
        this.movieID = movieID;
    }

    // Getters and Setters
    public int getBannerID() {
        return bannerID;
    }

    public void setBannerID(int bannerID) {
        this.bannerID = bannerID;
    }

    public String getLinkImg() {
        return linkImg;
    }

    public void setLinkImg(String linkImg) {
        this.linkImg = linkImg;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }
}

