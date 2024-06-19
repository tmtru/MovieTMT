/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class movie {
    
    String id, title, releaseTime, content, country,posterLink, actor, director;
    int movieLength,viewers;
    float rating;
    ArrayList<String> genre;

    public movie() {
    }

    public movie(String id, String title, String releaseTime, String content, String country, String posterLink, String actor, String director, int movieLength, int viewers, float rating,ArrayList<String> genre) {
        this.id = id;
        this.title = title;
        this.releaseTime = releaseTime;
        this.content = content;
        this.country = country;
        this.posterLink = posterLink;
        this.actor = actor;
        this.director = director;
        this.movieLength = movieLength;
        this.viewers = viewers;
        this.rating = rating;
        this.genre=genre;
    }

    public ArrayList<String> getGenre() {
        return genre;
    }

    public void setGenre(ArrayList<String> genre) {
        this.genre = genre;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    public int getMovieLength() {
        return movieLength;
    }

    public void setMovieLength(int movieLength) {
        this.movieLength = movieLength;
    }

    public int getViewers() {
        return viewers;
    }

    public void setViewers(int viewers) {
        this.viewers = viewers;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(String releaseTime) {
        this.releaseTime = releaseTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPosterLink() {
        return posterLink;
    }

    public void setPosterLink(String posterLink) {
        this.posterLink = posterLink;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "movie{" + "id=" + id + ", title=" + title + ", releaseTime=" + releaseTime + ", content=" + content + ", country=" + country + ", posterLink=" + posterLink + ", actor=" + actor + ", director=" + director + ", movieLength=" + movieLength + ", viewers=" + viewers + ", rating=" + rating + ", genre=" + genre + '}';
    }



    
    
    
}
