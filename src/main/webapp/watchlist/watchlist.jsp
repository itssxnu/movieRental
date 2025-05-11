<%@ page import="java.util.List" %>
<%@ page import="com.app.movierental.model.WatchListItem" %>
<%@ page import="com.app.movierental.model.Movie" %>
<%@ page import="com.app.movierental.dao.MovieDAO" %>
<%@ page import="com.app.movierental.dao.WatchListDAO" %>
<%@ page import="com.app.movierental.model.User" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Watchlist | CINEMAX</title>
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
        <h1 class="futuristic-text text-2xl text-[#D84040]">Your Watchlist</h1>
        <a href="dashboard" class="text-[#EEEEEE] hover:text-[#D84040] transition-colors">Back to Dashboard</a>
    </div>

    <%
        User user = (User) request.getAttribute("user");
        List<WatchListItem> watchList = WatchListDAO.getWatchListByUser(user.getUsername());
        if (watchList != null && !watchList.isEmpty()) {
    %>
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
        <%
            for (WatchListItem item : watchList) {
                Movie m = MovieDAO.getMovieById(item.getMovieId());
                if (m != null) {
        %>
        <div class="bg-[#1D1616] border border-[#8E1616] rounded-lg overflow-hidden hover:border-[#D84040] transition-colors">
            <div class="h-40 bg-[#8E1616] bg-opacity-20 flex items-center justify-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-[#D84040]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15l8-8m0 0l-8-8m8 8H4" />
                </svg>
            </div>
            <div class="p-4">
                <h3 class="futuristic-text text-lg text-[#EEEEEE] mb-3"><%= m.getTitle() %></h3>
                <form action="<%= request.getContextPath() %>/watchlist" method="post">
                    <input type="hidden" name="movieId" value="<%= m.getId() %>">
                    <input type="hidden" name="action" value="remove">
                    <button type="submit" class="w-full py-1 px-3 bg-[#8E1616] text-[#EEEEEE] rounded hover:bg-[#D84040] transition-colors text-sm">
                        Remove from Watchlist
                    </button>
                </form>
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
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15l8-8m0 0l-8-8m8 8H4" />
        </svg>
        <h3 class="futuristic-text text-xl mt-4">Your watchlist is empty</h3>
        <p class="text-[#EEEEEE] opacity-70 mt-2">Add movies to watch later</p>
    </div>
    <%
        }
    %>
</div>
</body>
</html>