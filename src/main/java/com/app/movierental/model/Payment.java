package com.app.movierental.model;

public class Payment {
    private String movieId;
    private String username;
    private double amount;
    private String timestamp;

    public Payment(String movieId, String username, double amount, String timestamp) {
        this.movieId = movieId;
        this.username = username;
        this.amount = amount;
        this.timestamp = timestamp;
    }

    public String getMovieId() {
        return movieId;
    }

    public void setMovieId(String movieId) {
        this.movieId = movieId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }
}
