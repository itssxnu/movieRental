package com.app.movierental.controller;

import com.app.movierental.dao.MovieDAO;
import com.app.movierental.model.RentedMovie;
import com.app.movierental.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDate;


@WebServlet("/rent")
public class RentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            String action = req.getParameter("action"); // either "rent" or "return"
            String movieId = req.getParameter("movieId");

            if ("rent".equals(action)) {
                String rentDate = LocalDate.now().toString();
                MovieDAO.rentMovie(movieId, user.getUsername(), rentDate);
            } else if ("return".equals(action)) {
                MovieDAO.removeRentedMovie(user.getUsername(), movieId);
            }
        }

        resp.sendRedirect(req.getContextPath() + "/dashboard");
    }
}

