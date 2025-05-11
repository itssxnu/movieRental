package com.app.movierental.controller;

import com.app.movierental.dao.MovieDAO;
import com.app.movierental.dao.PaymentDAO;
import com.app.movierental.model.Movie;
import com.app.movierental.model.Payment;
import com.app.movierental.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.util.UUID;

@WebServlet("/pay")
public class PayServlet extends HttpServlet {
    @Override
    // PayAndRentServlet.java (URL: /pay)
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect("login");
            return;
        }

        String movieId = req.getParameter("movieId");
        String confirm = req.getParameter("confirm");

        if (confirm == null) {
            // Stage 1: Show payment page
            Movie movie = MovieDAO.getMovieById(movieId);
            if (movie == null) {
                resp.sendRedirect("dashboard");
                return;
            }

            req.setAttribute("movie", movie);
            req.setAttribute("user", user);
            req.getRequestDispatcher("/payment/payment.jsp").forward(req, resp);
        } else {
            // Stage 2: Confirmed payment, process logic
            Movie movie = MovieDAO.getMovieById(movieId);
            if (movie == null) {
                resp.sendRedirect("dashboard");
                return;
            }

            double amount = movie.getPrice();

            PaymentDAO.savePayment(new Payment(movieId, user.getUsername(), amount, LocalDate.now().toString()));
            MovieDAO.rentMovie(movieId, user.getUsername(), LocalDate.now().toString());

            resp.sendRedirect("dashboard");
        }
    }

}

