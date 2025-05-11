<%@ page import="java.util.List" %>
<%@ page import="com.app.movierental.model.Payment" %>
<%@ page import="com.app.movierental.model.Movie" %>
<%@ page import="com.app.movierental.dao.MovieDAO" %>
<%@ page import="com.app.movierental.model.User" %>
<%@ page import="com.app.movierental.dao.PaymentDAO" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Payment History | CINEMAX</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Roboto:wght@300;400;500&display=swap');
    body {
      font-family: 'Roboto', sans-serif;
    }
    .futuristic-text {
      font-family: 'Orbitron', sans-serif;
    }
  </style>
</head>
<body class="min-h-screen bg-[#1D1616] text-[#EEEEEE]">
<div class="container mx-auto px-4 py-8">
  <div class="flex justify-between items-center mb-8 border-b border-[#8E1616] pb-4">
    <h1 class="futuristic-text text-2xl text-[#D84040]">Payment History</h1>
    <a href="dashboard" class="text-[#EEEEEE] hover:text-[#D84040] transition-colors">Back to Dashboard</a>
  </div>

  <%
    User user = (User) request.getAttribute("user");
    List<Payment> payments = PaymentDAO.getPaymentsByUser(user.getUsername());
    if (payments != null && !payments.isEmpty()) {
  %>
  <div class="space-y-4">
    <%
      for (Payment p : payments) {
        Movie m = MovieDAO.getMovieById(p.getMovieId());
        if (m != null) {
    %>
    <div class="bg-[#1D1616] border border-[#8E1616] rounded-lg p-4 hover:border-[#D84040] transition-colors">
      <div class="flex justify-between items-start">
        <div>
          <h3 class="futuristic-text text-lg text-[#D84040]"><%= m.getTitle() %></h3>
          <p class="text-sm text-[#EEEEEE] opacity-80"><%= p.getTimestamp() %></p>
        </div>
        <span class="futuristic-text bg-[#8E1616] bg-opacity-30 px-3 py-1 rounded-full text-[#EEEEEE]">
            <%= p.getAmount() %> LKR
          </span>
      </div>
    </div>
    <%
        }
      }
    %>
  </div>
  <%
  } else {
  %>
  <div class="text-center py-12">
    <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 mx-auto text-[#8E1616]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
    </svg>
    <h3 class="futuristic-text text-xl mt-4">No payment history yet</h3>
    <p class="text-[#EEEEEE] opacity-70 mt-2">Your transactions will appear here</p>
  </div>
  <%
    }
  %>
</div>
</body>
</html>