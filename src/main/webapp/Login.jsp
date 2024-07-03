<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Weather App</title>
<link rel="stylesheet" href="Login.css">
<link rel="icon" href="images/favicon.ico">
</head>
<body>

<%
session.removeAttribute("name");
session.invalidate();
%>

<div class="container">
    <h1>Welcome to Taapmaan!!</h1>
    <a href="login-form" id="login-link">Login to get Taapmaan</a>
    
    <form id="login-form" class="hidden" method="POST" action="LoginServelt">
        <input type="text" id="username" name="username" placeholder="Enter your name" required>
        <input type="password" id="password" name="password" placeholder="Enter password" required>
        <button type="submit">login</button>
    </form>
  </div>

<script src="script.js"></script>
</body>
</html>
