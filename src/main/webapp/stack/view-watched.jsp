<%@ page import="java.util.Stack" %>
<%@ page import="com.app.movierental.model.Movie" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Watched Movies | CINEMAX</title>
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
    <h1 class="futuristic-text text-2xl text-[#D84040]">Recently Watched</h1>
    <a href="<%= request.getContextPath() %>/dashboard" class="text-[#EEEEEE] hover:text-[#D84040] transition-colors">Back to Dashboard</a>
  </div>

  <%
    Stack<Movie> watchedStack = (Stack<Movie>) request.getAttribute("watchedStack");
    if (watchedStack != null && !watchedStack.isEmpty()) {
  %>
  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
    <%
      // Stack iteration - newest on top
      for (int i = watchedStack.size() - 1; i >= 0; i--) {
        Movie m = watchedStack.get(i);
    %>
    <div class="bg-[#1D1616] border border-[#8E1616] rounded-lg p-4 hover:border-[#D84040] transition-colors">
      <div class="h-40 bg-[#8E1616] bg-opacity-20 flex items-center justify-center mb-3 rounded">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-[#D84040]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 10l4.553-2.276A1 1 0 0121 8.618v6.764a1 1 0 01-1.447.894L15 14M5 18h8a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z" />
        </svg>
      </div>
      <h3 class="futuristic-text text-lg text-[#EEEEEE] mb-1"><%= m.getTitle() %></h3>
      <p class="text-sm text-[#EEEEEE] opacity-80"><%= m.getReleaseDate() %></p>
    </div>
    <%
      }
    %>
  </div>
  <%
  } else {
  %>
  <div class="text-center py-12">
    <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 mx-auto text-[#8E1616]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 10l4.553-2.276A1 1 0 0121 8.618v6.764a1 1 0 01-1.447.894L15 14M5 18h8a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z" />
    </svg>
    <h3 class="futuristic-text text-xl mt-4">No watched movies yet</h3>
    <p class="text-[#EEEEEE] opacity-70 mt-2">Your viewing history will appear here</p>
  </div>
  <%
    }
  %>
</div>
</body>
</html>