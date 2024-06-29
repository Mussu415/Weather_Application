<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Weather App</title>
<link rel="stylesheet" href="login.css">
<link rel="icon" href="images/favicon.ico">
</head>
<body>

<div class="container">
    <h1>Welcome user!!</h1>
    <a href="login-form" id="login-link">Login to get weather updates</a>
    
    <form id="login-form" class="hidden" method="POST" action="/LoginServlet">
        <input type="text" id="username" name="username" placeholder="Enter your name" required>
        <input type="password" id="password" name="password" placeholder="Enter password" required>
        <button type="submit">login</button>
    </form>
  </div>

<div id="welcomeMessage" class="modal">
    <div class="modal-content">
       <span class="close">&times;</span>
           <p>Welcome to the Home Page!</p>
    </div>
</div>

<script src="script.js"></script>
</body>
</html>
