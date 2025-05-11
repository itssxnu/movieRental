<%@ page import="com.app.movierental.model.Movie" %>
<%@ page import="com.app.movierental.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Confirmation | CINEMAX</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Roboto:wght@300;400;500&display=swap');
        body {
            font-family: 'Roboto', sans-serif;
        }
        .futuristic-text {
            font-family: 'Orbitron', sans-serif;
        }
        .glass-effect {
            backdrop-filter: blur(10px);
            background: rgba(29, 22, 22, 0.85);
        }
        .card-input:focus {
            box-shadow: 0 0 0 2px #D84040;
        }
    </style>
</head>
<body class="min-h-screen bg-[#1D1616] bg-[url('https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=1925&auto=format&fit=crop')] bg-cover bg-center flex items-center justify-center">
<div class="glass-effect border border-[#8E1616] rounded-xl p-8 w-full max-w-md mx-4">
    <%
        Movie movie = (Movie) request.getAttribute("movie");
        User user = (User) request.getAttribute("user");
        if (movie == null || user == null) {
    %>
    <div class="text-center">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 mx-auto text-[#D84040]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
        </svg>
        <h2 class="futuristic-text text-xl text-[#EEEEEE] mt-4">Invalid Request</h2>
        <p class="text-[#EEEEEE] opacity-80 mt-2">Please go back and try again</p>
        <a href="dashboard" class="inline-block mt-4 px-4 py-2 bg-[#8E1616] text-[#EEEEEE] rounded-lg hover:bg-[#D84040] transition-colors">
            Back to Dashboard
        </a>
    </div>
    <%
    } else {
    %>
    <div class="text-center mb-6">
        <h1 class="futuristic-text text-2xl text-[#D84040]">Payment Confirmation</h1>
        <p class="text-[#EEEEEE] opacity-80">Complete your rental</p>
    </div>

    <div class="mb-6 p-4 bg-[#1D1616] border border-[#8E1616] rounded-lg">
        <h3 class="futuristic-text text-lg text-[#EEEEEE] mb-2"><%= movie.getTitle() %></h3>
        <p class="text-sm text-[#EEEEEE] opacity-80 mb-1"><%= movie.getGenre() %></p>
        <p class="text-sm text-[#EEEEEE] mb-3"><%= movie.getDescription() %></p>
        <div class="flex justify-between items-center">
            <span class="futuristic-text text-[#D84040]">Price</span>
            <span class="futuristic-text text-lg text-[#EEEEEE]"><%= movie.getPrice() %> LKR</span>
        </div>
    </div>

    <form action="<%= request.getContextPath() %>/pay" method="post" class="space-y-4">
        <div class="bg-[#1D1616] border border-[#8E1616] rounded-lg p-4">
            <h3 class="futuristic-text text-[#EEEEEE] mb-3">Payment Details</h3>

            <div class="mb-3">
                <label class="block text-[#EEEEEE] text-sm mb-1">Card Number</label>
                <input type="text" placeholder="4242 4242 4242 4242"
                       class="card-input w-full px-3 py-2 bg-[#1D1616] border border-[#8E1616] rounded text-[#EEEEEE] focus:outline-none">
            </div>

            <div class="grid grid-cols-2 gap-3 mb-3">
                <div>
                    <label class="block text-[#EEEEEE] text-sm mb-1">Expiry Date</label>
                    <input type="text" placeholder="MM/YY"
                           class="card-input w-full px-3 py-2 bg-[#1D1616] border border-[#8E1616] rounded text-[#EEEEEE] focus:outline-none">
                </div>
                <div>
                    <label class="block text-[#EEEEEE] text-sm mb-1">CVC</label>
                    <input type="text" placeholder="123"
                           class="card-input w-full px-3 py-2 bg-[#1D1616] border border-[#8E1616] rounded text-[#EEEEEE] focus:outline-none">
                </div>
            </div>

            <div>
                <label class="block text-[#EEEEEE] text-sm mb-1">Name on Card</label>
                <input type="text" placeholder="<%= user.getFullName() %>"
                       class="card-input w-full px-3 py-2 bg-[#1D1616] border border-[#8E1616] rounded text-[#EEEEEE] focus:outline-none">
            </div>
        </div>

        <input type="hidden" name="movieId" value="<%= movie.getId() %>">
        <input type="hidden" name="confirm" value="yes">

        <div class="flex space-x-3">
            <button type="submit"
                    class="flex-1 futuristic-text py-3 px-4 bg-gradient-to-r from-[#8E1616] to-[#D84040] text-[#EEEEEE] rounded-lg hover:opacity-90 transition-opacity">
                Confirm & Rent
            </button>
            <a href="dashboard"
               class="flex-1 text-center py-3 px-4 border border-[#8E1616] text-[#EEEEEE] rounded-lg hover:bg-[#8E1616] hover:bg-opacity-30 transition-colors">
                Cancel
            </a>
        </div>
    </form>
    <%
        }
    %>
</div>
</body>
</html>