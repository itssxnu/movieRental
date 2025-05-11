package com.app.movierental.controller;

import com.app.movierental.dao.MovieDAO;
import com.app.movierental.model.Movie;
import com.app.movierental.util.WatchedStackUtil;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/mark-watched")
public class MarkWatchedServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String movieId = req.getParameter("movieId");
        Movie movie = MovieDAO.getMovieById(movieId);

        if (movie != null) {
            WatchedStackUtil.push(movie);
        }

        resp.sendRedirect(req.getContextPath() + "/rented-movies");
    }
}
