package com.app.movierental.model;

public class WatchListItem {
    private String username;
    private String movieId;

    public WatchListItem(String username, String movieId) {
        this.username = username;
        this.movieId = movieId;
    }

    public String getUsername() { return username; }
    public String getMovieId() { return movieId; }
}
